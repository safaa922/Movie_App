

class ApiConstants{
  static const String baseUrl =  "https://api.themoviedb.org/3/";
  static const String popularMovies = "movie/popular";
  static const String topRatedMovies = "movie/top_rated";
  static const String upcomingMovies = "movie/upcoming";
  static const String trendingMoviesDay = "trending/movie/day";
  static const String trendingMoviesWeek = "trending/movie/week";
  static const String popularTvShows = "tv/popular";
  static const String topRatedTvShows = "tv/top_rated";
  static const String movieDetails = "movie/";
  static const String TVDetails = "tv/";
  static const String searchMovies = "search/movie";
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

}

class ApiErrors{
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";

  static const String unauthorizedError = "unauthorizedError";
  static const String forbiddenError = "forbiddenError";
  static const String notFoundError = "notFoundError";

  static const String internalServerError = "internalServerError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String retryAgainMessage = "retry_again_message";
  static const String loadingMessage = "loading_message";
  static const String ok = "OK";
}