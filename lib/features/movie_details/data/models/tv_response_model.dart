import 'package:movie_app/features/movie_details/data/models/genre_model.dart';

class TvDetailsResponseModel {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int runtime;
  final String firstAirDate;
  final List<Genre> genres;

  TvDetailsResponseModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.runtime,
    required this.firstAirDate,
    required this.genres,
  });

  factory TvDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    final runtimes = json["episode_run_time"] as List?;

    return TvDetailsResponseModel(
      id: json["id"],
      name: json["name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      backdropPath: json["backdrop_path"],
      voteAverage: (json["vote_average"] as num).toDouble(),
      runtime: runtimes != null && runtimes.isNotEmpty ? runtimes.first : 0,
      firstAirDate: json["first_air_date"] ?? "",
      genres: (json["genres"] as List)
          .map((e) => Genre.fromJson(e))
          .toList(),
    );
  }
}