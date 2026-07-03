import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/data/repos/home_repo.dart';
import 'package:movie_app/features/home_screen/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState>{

  final ScrollController popularScrollController = ScrollController();
  final ScrollController popularTVScrollController = ScrollController();
  final ScrollController topRatedTVScrollController = ScrollController();
  final ScrollController topRatedMoviesScrollController = ScrollController();
  final ScrollController upcomingScrollController = ScrollController();
  final PageController trendingScrollController = PageController();

  final HomeRepo homeRepo;
  int popularPage =1;
  int trendingPage =1;
  int popularTvPage =1;
  int upcomingPage =1;
  int topRatedMoviePage=1;
  int topRatedTVPage =1;

  bool isLoadingMorePopular = false;
  bool isLoadingMoreTrending = false;
  bool isLoadingMoreTopRatedMovies = false;
  bool isLoadingMoreTopRatedTV = false;
  bool isLoadingMoreUpcoming = false;
  bool isLoadingMorePopularTV = false;

  bool hasMorePopular=true;
  bool hasMoreTrending=true;
  bool hasMorePopularTV=true;
  bool hasMoreUpcoming=true;
  bool hasMoreTopRatedTV=true;
  bool hasMoreTopRatedMovies=true;

  HomeCubit(this.homeRepo):super(HomeState.initial());
  List<Movie> popMovieList=[];
  List<Movie> trendingMovieList = [];
  List<Movie> TopRatedMovies=[];
  List<Movie> TopRatedTV=[];
  List<Movie> PopularTV=[];
  List<Movie> upcomingMovies=[];



  Future<void> loadHomeData() async {
    emit(const HomeState.Loading());

    popularPage =1;
    trendingPage =1;
    upcomingPage=1;
    topRatedMoviePage=1;
    topRatedTVPage=1;
    popularTvPage=1;

    popMovieList.clear();
    trendingMovieList.clear();
    upcomingMovies.clear();
    TopRatedMovies.clear();
    TopRatedTV.clear();
    PopularTV.clear();

    final popularResponse = await homeRepo.getPopular(popularPage);
    final trendingResponse = await homeRepo.getTrending(trendingPage);
    final topRatedTVResponse = await homeRepo.getTopRatedTvShows(topRatedTVPage);
    final topRatedMoviesResponse = await homeRepo.getTopRatedMovies(topRatedMoviePage);
    final upcomingResponse = await homeRepo.getUpcoming(upcomingPage);
    final popularTVResponse = await homeRepo.getPopularTV(popularTvPage);


    popularResponse.when(
      success: (data) {
        if(data.results.isEmpty){
          // hasMorePopular = false;
          hasMorePopular = popularPage<data.totalPages;
        }

        else{
          popMovieList.addAll(data.results);
          popularPage++;
        }
      },
      failure: (e) {},
    );

    trendingResponse.when(
      success: (data) {
      if(data.results.isEmpty){
        hasMoreTrending=false;
      }
      else{
        trendingMovieList.addAll(data.results);
        trendingPage++;
      }
        // trendingMovieList = data.results;

      },
      failure: (e) {},
    );

    upcomingResponse.when(
      success: (data){
        if(data.results.isEmpty){
          hasMoreUpcoming = false;
        }

        else{
          upcomingMovies.addAll(data.results);
          upcomingPage++;
        }
      },
        failure: (e) {},
    );


    topRatedMoviesResponse.when(
      success: (data){
        if(data.results.isEmpty){
          hasMoreTopRatedMovies = false;
        }

        else{
          TopRatedMovies.addAll(data.results);
          topRatedMoviePage++;
        }
      },
      failure: (e) {},
    );


    topRatedTVResponse.when(
      success: (data){
        if(data.results.isEmpty){
          hasMoreTopRatedTV = false;
        }

        else{
          TopRatedTV.addAll(data.results);
          topRatedTVPage++;
        }
      },
      failure: (e) {},
    );


    popularTVResponse.when(
      success: (data){
        if(data.results.isEmpty){
          hasMorePopularTV = false;
        }

        else{
          PopularTV.addAll(data.results);
          popularTvPage++;
        }
      },
      failure: (e) {},
    );




    emit(const HomeState.Success());
    isLoadingMorePopular = false;
    isLoadingMoreTrending = false;
    isLoadingMorePopularTV =false;
    isLoadingMoreTopRatedMovies =false;
    isLoadingMoreTopRatedTV = false;
    isLoadingMoreUpcoming =false;
  }


  Future<void> LoadMorePopularMovies()async{
    emit(const HomeState.PopularPaginationLoading());
    if(isLoadingMorePopular || !hasMorePopular ){
      return;
    }
    isLoadingMorePopular =true;
    final response = await homeRepo.getPopular(popularPage);
    response.when(
        success: (data) {
          if (data.results.isEmpty) {
            hasMorePopular = false;
          }
          else {
            popMovieList.addAll(data.results);
            popularPage++;
          }
          emit(const HomeState.Success());
        },
    failure: (e) {
      emit(HomeState.StateError(e));
    }
    );
    isLoadingMorePopular = false;
    }




  Future<void> LoadMoreTrending()async{
    emit(const HomeState.TrendingPaginationLoading());
    if(!hasMoreTrending || isLoadingMoreTrending){
      return;
    }
    isLoadingMoreTrending=true;
    final response = await homeRepo.getTrending(trendingPage);

    response.when(
      success: (data) {
        if (data.results.isEmpty) {
          hasMoreTrending = false;
        } else {
          trendingMovieList.addAll(data.results);
          trendingPage++;
        }

        emit(const HomeState.Success());
      },
      failure: (e) {
        emit(HomeState.StateError(e));
      },
    );

    isLoadingMoreTrending = false;
  }


  Future<void> LoadMoreTopRatedMovies()async{
    emit(const HomeState.TopRatedMoviesPaginationLoading());
    if(!hasMoreTopRatedMovies || isLoadingMoreTopRatedMovies){
      return;
    }
    isLoadingMoreTopRatedMovies=true;
    final response = await homeRepo.getTopRatedMovies(topRatedMoviePage);
    response.when(success: (data){
      if(data.results.isEmpty){
        hasMoreTopRatedMovies =false;
      }
      else{
        TopRatedMovies.addAll(data.results);
        topRatedMoviePage++;
      }
      emit(const HomeState.Success());
    }

    , failure: (e) {
      emit(HomeState.StateError(e));
    },);

    isLoadingMoreTopRatedMovies=false;
  }



  Future<void> LoadMoreTopRatedTV()async{
    emit(HomeState.TopRatedTVPaginationLoading());
    if(!hasMoreTopRatedTV || isLoadingMoreTopRatedTV){
      return;
    }
    isLoadingMoreTopRatedTV = true;
    final response = await homeRepo.getTopRatedTvShows(topRatedTVPage);
    response.when(success: (data){
      if(data.results.isEmpty){
        hasMoreTopRatedTV =false;
      }
      else{
        TopRatedTV.addAll(data.results);
        topRatedTVPage++;
      }
      emit(const HomeState.Success());
    }, failure: (e){
      emit(HomeState.StateError(e));
    });
    isLoadingMoreTopRatedTV = false;
  }
  Future<void> LoadMoreUpcoming() async {
    emit(const HomeState.UpcomingPaginationLoading());

    if (!hasMoreUpcoming || isLoadingMoreUpcoming) {
      return;
    }

    isLoadingMoreUpcoming = true;

    final response = await homeRepo.getUpcoming(upcomingPage);

    response.when(
      success: (data) {
        if (data.results.isEmpty) {
          hasMoreUpcoming = false;
        } else {
          upcomingMovies.addAll(data.results);
          upcomingPage++;
        }

        emit(const HomeState.Success());
      },
      failure: (e) {
        emit(HomeState.StateError(e));
      },
    );

    isLoadingMoreUpcoming = false;
  }

  Future<void> LoadMorePopularTV() async {
    emit(const HomeState.PopularTVPaginationLoading());

    if (!hasMorePopularTV || isLoadingMorePopularTV) {
      return;
    }

    isLoadingMorePopularTV = true;

    final response = await homeRepo.getPopularTV(popularTvPage);

    response.when(
      success: (data) {
        if (data.results.isEmpty) {
          hasMorePopularTV = false;
        } else {
          PopularTV.addAll(data.results);
          popularTvPage++;
        }

        emit(const HomeState.Success());
      },
      failure: (e) {
        emit(HomeState.StateError(e));
      },
    );

    isLoadingMorePopularTV = false;
  }


  @override
  Future<void>close(){
    popularScrollController.dispose();
    trendingScrollController.dispose();
    topRatedTVScrollController.dispose();
    topRatedMoviesScrollController.dispose();
    upcomingScrollController.dispose();
    return super.close();
  }
}