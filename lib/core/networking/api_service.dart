import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/recommendations_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_recommendation_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/tv_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl:ApiConstants.baseUrl)

abstract class ApiService{
  factory ApiService(Dio dio,{String? baseUrl}) = _ApiService;

  @GET(ApiConstants.popularMovies)
  Future<ResponseModel> getPopMovies( @Query("api_key") String ApiKey, @Query("page") int page);

  @GET(ApiConstants.trendingMoviesDay)
  Future<ResponseModel> getTrendingMovies(@Query("api_key")String ApiKey, @Query("page") int page);

  @GET(ApiConstants.upcomingMovies)
  Future<ResponseModel> getUpcomingMovies(@Query("api_key")String ApiKey, @Query("page") int page);

  @GET(ApiConstants.popularTvShows)
  Future<ResponseModel> getPopularTvShows(@Query("api_key")String ApiKey, @Query("page") int page);

  @GET(ApiConstants.topRatedMovies)
  Future<ResponseModel> getTopRatedMovies(@Query("api_key")String ApiKey, @Query("page") int page);

  @GET(ApiConstants.topRatedTvShows)
  Future<ResponseModel> getTopRatedTvShows(@Query("api_key")String ApiKey, @Query("page") int page);


  @GET("${ApiConstants.movieDetails}{movie_id}")
  Future<MovieDetailsResponseModel> getMovieDetails(
      @Path("movie_id") int movieId,
      @Query("api_key") String ApiKey
      );

  @GET("${ApiConstants.TVDetails}{movie_id}")
  Future<MovieDetailsResponseModel> getTVDetails(
      @Path("movie_id") int movieId,
      @Query("api_key") String ApiKey
      );

  @GET("movie/{movie_id}/videos")
  Future<dynamic>getMovieVideos(
      @Path("movie_id")int movieId,
      @Query("api_key") String ApiKey
      );

  @GET("movie/{movie_id}/credits")
  Future<MovieCreditsResponseModel?> getMovieCredits(
      @Path("movie_id") int movieId,
      @Query("api_key") String ApiKey
      );

  @GET("movie/{movie_id}/recommendations")
  Future<RecommendationsResponseModel?> getRecommendations(
      @Path("movie_id") int movieId,
      @Query("api_key") String ApiKey
      );

  @GET(ApiConstants.searchMovies)
  Future<ResponseModel> searchMovies(
      @Query("api_key") String apiKey,
      @Query("query") String query,
      @Query("page") int page,
      );


  @GET("/tv/{id}")
  Future<TvDetailsResponseModel> getTvDetails(
      @Path("id") int id,
      @Query("api_key") String apiKey,
      );

  @GET("/tv/{id}/credits")
  Future<MovieCreditsResponseModel> getTvCredits(
      @Path("id") int id,
      @Query("api_key") String apiKey,
      );

  @GET("tv/{id}/videos")
  Future<dynamic> getTvVideos(
      @Path("id") int id,
      @Query("api_key") String apiKey,
      );

  @GET("/tv/{id}/recommendations")
  Future<TvRecommendationsResponseModel> getTvRecommendations(
      @Path("id") int id,
      @Query("api_key") String apiKey,
      );
}
