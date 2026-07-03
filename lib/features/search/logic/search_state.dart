

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';

part 'search_state.freezed.dart';
@freezed
class SearchState with _$SearchState{
  const factory SearchState.initial()=_initial;
  const factory SearchState.searchLoading() = searchLoading;
  const factory SearchState.SearchSuccess( List<Movie> movies) = SearchSuccess;
  const factory SearchState.SearchError(ErrorHandler e)= SearchError;
}