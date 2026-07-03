
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';

class SearchRepo{
  final ApiService apiService;
  SearchRepo(this.apiService);

  Future<ApiResult<ResponseModel>> searchMovies(String query, int page)async{
    try{
      final response = await apiService.searchMovies("b5d4ebf4dae441ad72ca08202d672c15",query,page);
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}