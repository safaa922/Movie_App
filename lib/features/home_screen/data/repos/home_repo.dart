import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';

class HomeRepo{

  // final FirebaseAuthService authService;
  final ApiService apiService;
  HomeRepo(this.apiService);

  Future<ApiResult<ResponseModel>> getPopular(int page)async{
    try{
      final response = await apiService.getPopMovies("b5d4ebf4dae441ad72ca08202d672c15",page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ResponseModel>> getTrending(int page)async{
    try{
     final response = await apiService.getTrendingMovies("b5d4ebf4dae441ad72ca08202d672c15",page);
     return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ResponseModel>> getPopularTV(int page)async{
    try{
      final response = await apiService.getPopularTvShows("b5d4ebf4dae441ad72ca08202d672c15",page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ResponseModel>> getUpcoming(int page)async{
    try{
      final response = await apiService.getUpcomingMovies("b5d4ebf4dae441ad72ca08202d672c15",page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }


  Future<ApiResult<ResponseModel>> getTopRatedTvShows(int page)async{
    try{
      final response = await apiService.getTopRatedTvShows("b5d4ebf4dae441ad72ca08202d672c15",page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ResponseModel>> getTopRatedMovies(int page)async{
    try{
      final response = await apiService.getTopRatedMovies("b5d4ebf4dae441ad72ca08202d672c15",page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}