import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/recommendations_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/trailer_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_recommendation_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_response_model.dart';
import 'package:movie_app/features/movie_details/logic/firebase_logic/firebase_operation_service.dart';

class MovieDetailsRepo{
  final ApiService apiService;
  MovieDetailsRepo({required this.apiService});

  Future<ApiResult<MovieDetailsResponseModel>> getMovieDetails(int movieId)async{
    try{
      final response = await apiService.getMovieDetails(movieId, "b5d4ebf4dae441ad72ca08202d672c15");
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<void>AddToFavorite(int movieId,FirebaseOperationService firebaseOperationService)async{
    await firebaseOperationService.AddToFavorite(movieId);
  }

  Future<void>AddToWatchlist(int movieId,FirebaseOperationService firebaseOperationService)async{
    await firebaseOperationService.AddToWatchlist(movieId);
  }

  Future<void>DeleteFavorite(int movieId,FirebaseOperationService firebaseOperationService)async{
    await firebaseOperationService.DeleteFavorite(movieId);
  }
  Future<void>DeleteWatchlist(int movieId,FirebaseOperationService firebaseOperationService)async{
    await firebaseOperationService.DeleteWatchlist(movieId);
  }

  Future<List<int>> GetFav(FirebaseOperationService firebaseOperationService) async {
    return firebaseOperationService.GetFav();
  }

  Future<List<int>> GetWatchlist(FirebaseOperationService firebaseOperationService) async {
    return firebaseOperationService.GetWatchlist();
  }

  Future<ApiResult<TrailerModel>> getTrailer(int movieId)async{
    try{
      final response = await apiService.getMovieVideos(movieId, "b5d4ebf4dae441ad72ca08202d672c15");
      final trailer = response["results"]
          .firstWhere((video)=>video["type"]=="Trailer"&&  video["site"] == "YouTube",);
      return ApiResult.success(TrailerModel.fromJson(trailer));
    }catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }

  Future<ApiResult<MovieCreditsResponseModel>> getMovieCredits(int movieId)async{
    // try{
      final response = await apiService.getMovieCredits(movieId, "b5d4ebf4dae441ad72ca08202d672c15");

    // }
    // catch(e){
    //   return ApiResult.failure(ErrorHandler.handle(e));
    // }
      if (response == null) {
        return ApiResult.failure(
          ErrorHandler.handle("Credits response is null"),
        );
      }

      return ApiResult.success(response);
  }


  Future<ApiResult<RecommendationsResponseModel>> getRecommendations(int movieId)async{

      final response = await apiService.getRecommendations(movieId, "b5d4ebf4dae441ad72ca08202d672c15");


    if (response == null) {
      return ApiResult.failure(
          ErrorHandler.handle("empty response"));
    }
      return ApiResult.success(response);
  }


  Future<ApiResult<TvDetailsResponseModel>> getTvDetails(int tvId) async {
    try {
      final response = await apiService.getTvDetails(
        tvId,
        "b5d4ebf4dae441ad72ca08202d672c15",
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TvRecommendationsResponseModel>> getTvRecommendations(int tvId) async {
    final response = await apiService.getTvRecommendations(
      tvId,
      "b5d4ebf4dae441ad72ca08202d672c15",
    );

    if (response == null) {
      return ApiResult.failure(
        ErrorHandler.handle("Empty response"),
      );
    }

    return ApiResult.success(response);
  }

  Future<ApiResult<MovieCreditsResponseModel>> getTvCredits(int tvId) async {
    final response = await apiService.getTvCredits(
      tvId,
      "b5d4ebf4dae441ad72ca08202d672c15",
    );

    if (response == null) {
      return ApiResult.failure(
        ErrorHandler.handle("Credits response is null"),
      );
    }

    return ApiResult.success(response);
  }

  Future<ApiResult<TrailerModel>> getTvTrailer(int tvId) async {
    try {
      final response = await apiService.getTvVideos(
        tvId,
        "b5d4ebf4dae441ad72ca08202d672c15",
      );

      final trailer = response["results"].firstWhere(
            (video) =>
        video["type"] == "Trailer" &&
            video["site"] == "YouTube",
      );

      return ApiResult.success(
        TrailerModel.fromJson(trailer),
      );
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }


}
