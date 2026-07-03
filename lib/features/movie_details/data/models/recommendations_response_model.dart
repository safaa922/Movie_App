class RecommendationsResponseModel {
  final int page;
  final List<RecommendedMovie> results;
  final int totalPages;
  final int totalResults;

  RecommendationsResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory RecommendationsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RecommendationsResponseModel(
      page: json['page'],
      results: (json['results'] as List)
          .map((movie) => RecommendedMovie.fromJson(movie))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class RecommendedMovie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  RecommendedMovie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory RecommendedMovie.fromJson(Map<String, dynamic> json) {
    return RecommendedMovie(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] ?? '',
    );
  }
}