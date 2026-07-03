
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_response_model.freezed.dart';
part 'movies_response_model.g.dart';
@freezed
class ResponseModel with _$ResponseModel{

 const factory ResponseModel({required int page,required List<Movie>results,
  @JsonKey(name: 'total_pages')
  required int totalPages,
    @JsonKey(name: 'total_results')
    required int totalResults,
}) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String,dynamic>json)=>
      _$ResponseModelFromJson(json);
}

// @JsonSerializable()
// class PopularData{
//   final int page;
//   final List<Movie> results;
//   final int totalPages;
//   final int totalResults;
// }

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    String? title,
    String? name,
    String? overview,

    @JsonKey(name: 'poster_path')
    String? posterPath,

    @JsonKey(name: 'backdrop_path')
    String? backdropPath,

    @JsonKey(name: 'release_date')
    String? releaseDate,

    @JsonKey(name: 'vote_average')
    required double voteAverage,
  }) = _Movie;

  factory Movie.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$MovieFromJson(json);
}