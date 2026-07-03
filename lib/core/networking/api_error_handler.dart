

import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/core/networking/api_error_model.dart';

enum DataSource{
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode{
  static const int success =200;
  static const int NO_CONTENT = 204;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage{
  static const String noContent = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTHORIZED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String NOT_FOUND = ApiErrors.notFoundError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.defaultError;
  static const String RECEIVE_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String CACHE_ERROR = ApiErrors.cacheError;
  static const String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource{
  ApiErrorModel getFailure(){
    switch(this){
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
      message: ResponseMessage.noContent,
      code:ResponseCode.NO_CONTENT,
      );
      case DataSource.UNAUTHORIZED:
      return ApiErrorModel(
  code: ResponseCode.UNAUTHORIZED,
  message: ResponseMessage.UNAUTHORIZED,
  );

  case DataSource.FORBIDDEN:
  return ApiErrorModel(
  code: ResponseCode.FORBIDDEN,
  message: ResponseMessage.FORBIDDEN,
  );

  case DataSource.NOT_FOUND:
  return ApiErrorModel(
  code: ResponseCode.NOT_FOUND,
  message: ResponseMessage.NOT_FOUND,
  );

  case DataSource.INTERNAL_SERVER_ERROR:
  return ApiErrorModel(
  code: ResponseCode.INTERNAL_SERVER_ERROR,
  message: ResponseMessage.INTERNAL_SERVER_ERROR,
  );

  case DataSource.CONNECT_TIMEOUT:
  return ApiErrorModel(
  code: ResponseCode.CONNECT_TIMEOUT,
  message: ResponseMessage.CONNECT_TIMEOUT,
  );

  case DataSource.CANCEL:
  return ApiErrorModel(
  code: ResponseCode.CANCEL,
  message: ResponseMessage.CANCEL,
  );

  case DataSource.RECEIVE_TIMEOUT:
  return ApiErrorModel(
  code: ResponseCode.RECEIVE_TIMEOUT,
  message: ResponseMessage.RECEIVE_TIMEOUT,
  );

  case DataSource.SEND_TIMEOUT:
  return ApiErrorModel(
  code: ResponseCode.SEND_TIMEOUT,
  message: ResponseMessage.SEND_TIMEOUT,
  );

  case DataSource.CACHE_ERROR:
  return ApiErrorModel(
  code: ResponseCode.CACHE_ERROR,
  message: ResponseMessage.CACHE_ERROR,
  );

  case DataSource.NO_INTERNET_CONNECTION:
  return ApiErrorModel(
  code: ResponseCode.NO_INTERNET_CONNECTION,
  message: ResponseMessage.NO_INTERNET_CONNECTION,
  );
  case DataSource.DEFAULT:
  return ApiErrorModel(
  code: ResponseCode.DEFAULT,
  message: ResponseMessage.DEFAULT,
  );
  case DataSource.BAD_REQUEST:
  return ApiErrorModel(
  code: ResponseCode.BAD_REQUEST,
  message: ResponseMessage.BAD_REQUEST,
  );
  }
}
}

class ErrorHandler implements Exception{
  late ApiErrorModel ApiErrorHandlerFailure;
  ErrorHandler.handle(dynamic error){
    if(error is DioException){
      ApiErrorHandlerFailure = _HandleError(error);
    }
    else{
      ApiErrorHandlerFailure = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _HandleError(DioException error){
  switch(error.type){
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode){
        case 400:
          return DataSource.BAD_REQUEST.getFailure();
        case 401:
          return DataSource.UNAUTHORIZED.getFailure();

        case 403:
          return DataSource.FORBIDDEN.getFailure();

        case 404:
          return DataSource.NOT_FOUND.getFailure();

        case 500:
          return DataSource.INTERNAL_SERVER_ERROR.getFailure();

        default:
          return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();

    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}
class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}