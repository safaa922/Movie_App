
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState{
  const factory HomeState.initial() = _initial;
  // const factory HomeState.PopularLoading() = PopularLoading;
  const factory HomeState.Loading() = Loading;
  const factory HomeState.PopularPaginationLoading() = PopularPaginationLoading;
  const factory HomeState.TrendingPaginationLoading() = TrendingPaginationLoading;
  const factory HomeState.TopRatedMoviesPaginationLoading() = TopRatedMoviesPaginationLoading;
  const factory HomeState.TopRatedTVPaginationLoading() = TopRatedTVPaginationLoading;
  const factory HomeState.UpcomingPaginationLoading() = UpcomingPaginationLoading;
  const factory HomeState.PopularTVPaginationLoading() = PopularTVPaginationLoading;
  const factory HomeState.Success() = Success;
  const factory HomeState.StateError(ErrorHandler errHandler) = StateError;
}