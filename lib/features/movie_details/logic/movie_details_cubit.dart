import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/recommendations_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/trailer_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_recommendation_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_response_model.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/logic/firebase_logic/firebase_operation_service.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState>{

  final MovieDetailsRepo movieDetailsRepo;
  MovieCreditsResponseModel? movieCreditsResponseModel;
  List<MovieDetailsResponseModel> FavMovies =[];
  List<MovieDetailsResponseModel> WatchListMovies =[];
  List<CastModel?>? actorsList = [];


  List<int> favoriteIds = [];
  List<int> WatchIds = [];
  MovieDetailsResponseModel? movieDetailsResponseModel;
  TrailerModel? trailerModel;

  TvDetailsResponseModel? tvDetailsResponseModel;
  List<RecommendedMovie> recList = [];
  List<RecommendedTv> tvRecList = [];
  TrailerModel? tvTrailerModel;
  List<CastModel?>? tvActors = [];

  GlobalKey<ScaffoldState> LandingScfState = GlobalKey();
  MovieDetailsCubit(this.movieDetailsRepo):super(MovieDetailsState.initial());

  Future<void> getMovieDetails(int movieId)async{
    // emit(MovieLoading());
    final response = await movieDetailsRepo.getMovieDetails(movieId);

    response.when(
        success: (data){
          movieDetailsResponseModel = data;
      // emit(MovieSuccess());
    },
        failure: (e){
          emit(MovieDetailsError(ErrorHandler.handle(e)));
    });
  }


  Future<void>AddToFavorite(int movieId,FirebaseOperationService firebaseOperationService)async{
    // emit(FavoriteLoading());
   try {
     if(!favoriteIds.contains(movieId)){
       await movieDetailsRepo.AddToFavorite(movieId,firebaseOperationService);
       favoriteIds.add(movieId);
       emit(FavoriteSuccess());
     }

   } on Exception catch (e) {
     emit(FavoriteError(e.toString()));
   }
  }

  Future<void>AddToWatchlist(int movieId,FirebaseOperationService firebaseOperationService)async{
    // emit(WatchLoading());
    try {
      if(!WatchIds.contains(movieId)) {
        await movieDetailsRepo.AddToWatchlist(movieId,firebaseOperationService);
        WatchIds.add(movieId);
        emit(WatchSuccess());
      }
      }

     on Exception catch (e) {
      emit(WatchError(e.toString()));
    }
  }

  Future<void>DeleteWatchlist(int movieId,FirebaseOperationService firebaseOperationService)async{
    // emit(WatchLoading());
    try {
      await movieDetailsRepo.DeleteWatchlist(movieId,firebaseOperationService);
      WatchIds.remove(movieId);
      emit(WatchSuccess());
    } on Exception catch (e) {
      emit(WatchError(e.toString()));
    }
  }

  Future<void>DeleteFavorite(int movieId,FirebaseOperationService firebaseOperationService)async{
    // emit(FavoriteLoading());
    try {
      await movieDetailsRepo.DeleteFavorite(movieId,firebaseOperationService);
      favoriteIds.remove(movieId);
      emit(FavoriteSuccess());
    } on Exception catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<List<int>?> GetFav(FirebaseOperationService firebaseOperationService) async {
    // emit(FavoriteLoading());
    try {
      favoriteIds = await movieDetailsRepo.GetFav(firebaseOperationService);
      emit(FavoriteSuccess());
      return favoriteIds;
    } on Exception catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }


  Future<List<int>?> GetWatchlist(FirebaseOperationService firebaseOperationService) async {
    // emit(WatchLoading());
    try {
      WatchIds = await movieDetailsRepo.GetWatchlist(firebaseOperationService);
      // emit(WatchSuccess());
      return WatchIds;
    } on Exception catch (e) {
      emit(WatchError(e.toString()));
    }
  }


  Future<void> loadProfileMovies(FirebaseOperationService service) async {
    // emit(GetProfileMoviesLoading());

    FavMovies.clear();
    WatchListMovies.clear();

    try {
      final favIds = await movieDetailsRepo.GetFav(service);

      for (final id in favIds) {
        final result = await movieDetailsRepo.getMovieDetails(id);

        result.when(
          success: (movie) => FavMovies.add(movie),
          failure: (_) {},
        );
      }

      final watchIds = await movieDetailsRepo.GetWatchlist(service);

      for (final id in watchIds) {
        final result = await movieDetailsRepo.getMovieDetails(id);

        result.when(
          success: (movie) => WatchListMovies.add(movie),
          failure: (_) {},
        );
      }

      emit(GetProfileMoviesSuccess());
    } catch (e) {
      emit(GetProfileMoviesError(e.toString()));
    }
  }

  Future<void> getTrailer(int movieId)async{
    // emit(GetProfileMoviesLoading());
    final result = await movieDetailsRepo.getTrailer(movieId);
    result.when(
        success: (trailer){
      trailerModel = trailer;
      // emit(MovieSuccess());
    },
        failure: (e){
          emit(
            MovieDetailsError(ErrorHandler.handle(e),));
    });
  }

  Future<void>openTrailer(String key)async{
    final url = Uri.parse( 'https://www.youtube.com/watch?v=$key',);
    await launchUrl(url,mode: LaunchMode.externalNonBrowserApplication);
  }

  Future<void> getCast(int movieId)async{
    // emit(MovieLoading());
    final response = await movieDetailsRepo.getMovieCredits(movieId);
    response.when(
        success: (response){
          actorsList = response.cast;
          print("Actors count: ${actorsList?.length}");
          print("First actor: ${actorsList?.first?.name}");
          emit(MovieSuccess());
    },
        failure: (e){
          emit(MovieDetailsError(ErrorHandler.handle(e)));
        });
  }



  Future<void> loadMoviePage(int movieId) async {
    emit(MovieLoading());

    try {
      final movieResult = await movieDetailsRepo.getMovieDetails(movieId);

      await movieResult.when(
        success: (data) async {
          movieDetailsResponseModel = data;
        },
        failure: (e) {
          emit(MovieDetailsError(ErrorHandler.handle(e)));
          return;
        },
      );

      final creditsResult = await movieDetailsRepo.getMovieCredits(movieId);
      final trailerResult = await movieDetailsRepo.getTrailer(movieId);
      final recommendationResult = await movieDetailsRepo.getRecommendations(movieId);

      creditsResult.when(
        success: (data) {
          final credits = data as MovieCreditsResponseModel;
          actorsList = credits.cast;
        },
        failure: (_) {},
      );

      trailerResult.when(
        success: (data) {
          final trailer = data as TrailerModel;
          trailerModel = trailer;
        },
        failure: (_) {},
      );

      recommendationResult.when(success: (data){
        final recom = data as RecommendationsResponseModel;
        recList = List<RecommendedMovie>.from(recom.results);
      },
          failure: (_){});

      emit(MovieSuccess());
    } catch (e) {
      emit(MovieDetailsError(ErrorHandler.handle(e)));
    }
  }


  Future<void> loadTvPage(int id) async {
    emit(MovieLoading());

    try {

      final tvResult =
      await movieDetailsRepo.getTvDetails(id);

      await tvResult.when(
        success: (data) async {
          tvDetailsResponseModel = data;
        },
        failure: (e) {
          emit(MovieDetailsError(ErrorHandler.handle(e)));
          return;
        },
      );

      final credits =
      await movieDetailsRepo.getTvCredits(id);

      final trailer =
      await movieDetailsRepo.getTvTrailer(id);

      final rec =
      await movieDetailsRepo.getTvRecommendations(id);

      credits.when(
        success: (data) {
          tvActors = data.cast;
        },
        failure: (_) {},
      );

      trailer.when(
        success: (data) {
          tvTrailerModel = data;
        },
        failure: (_) {},
      );

      rec.when(
        success: (data) {
          tvRecList = List<RecommendedTv>.from(data.results);
        },
        failure: (_) {},
      );

      emit(MovieSuccess());

    } catch (e) {
      emit(MovieDetailsError(
        ErrorHandler.handle(e),
      ));
    }
  }
}