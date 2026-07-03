class TvRecommendationsResponseModel {
  final int page;
  final List<RecommendedTv> results;
  final int totalPages;
  final int totalResults;

  TvRecommendationsResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvRecommendationsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return TvRecommendationsResponseModel(
      page: json["page"],
      results: (json["results"] as List)
          .map((e) => RecommendedTv.fromJson(e))
          .toList(),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }
}

class RecommendedTv {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String firstAirDate;

  RecommendedTv({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.firstAirDate,
  });

  factory RecommendedTv.fromJson(Map<String, dynamic> json) {
    return RecommendedTv(
      id: json["id"],
      name: json["name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      voteAverage: (json["vote_average"] as num).toDouble(),
      firstAirDate: json["first_air_date"] ?? "",
    );
  }
}