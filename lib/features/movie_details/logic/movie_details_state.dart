import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState{
  const factory MovieDetailsState.initial() = _initial;
  const factory MovieDetailsState.MovieLoading() = MovieLoading;
  const factory MovieDetailsState.MovieSuccess() = MovieSuccess;
  const factory MovieDetailsState.MovieDetailsError(ErrorHandler errHandler) = MovieDetailsError;

  const factory MovieDetailsState.FavoriteLoading() = FavoriteLoading;
  const factory MovieDetailsState.FavoriteSuccess() = FavoriteSuccess;
  const factory MovieDetailsState.FavoriteError(String error) = FavoriteError;

  const factory MovieDetailsState.WatchLoading() = WatchLoading;
  const factory MovieDetailsState.WatchSuccess() = WatchSuccess;
  const factory MovieDetailsState.WatchError(String error) = WatchError;


  const factory MovieDetailsState.GetProfileMoviesLoading() = GetProfileMoviesLoading;
  const factory MovieDetailsState.GetProfileMoviesSuccess() = GetProfileMoviesSuccess;
  const factory MovieDetailsState.GetProfileMoviesError(String error) = GetProfileMoviesError;

}