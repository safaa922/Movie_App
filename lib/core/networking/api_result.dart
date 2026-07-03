

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';

part 'api_result.freezed.dart';
@freezed
abstract class ApiResult<T> with _$ApiResult<T>{
  const factory ApiResult.success(T data) = success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = failure<T>;
}