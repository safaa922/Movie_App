
import 'package:movie_app/features/movie_details/data/models/genre_model.dart';

class MovieDetailsResponseModel{
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int runtime;
  final String releaseDate;
  final String? backdropPath;
  final List<Genre> genres;

  MovieDetailsResponseModel(
       {
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
    required this.genres
  });

  factory MovieDetailsResponseModel.fromJson(Map<String,dynamic>json){
    return MovieDetailsResponseModel(
      id: json["id"],
      title: json["title"],
      overview: json['overview'],
      posterPath: json['poster_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      runtime: json['runtime'],
      releaseDate: json['release_date'],
      backdropPath: json["backdrop_path"],
      genres: (json["genres"] as List).map((e)=>Genre.fromJson(e)).toList()
    );
  }
}

