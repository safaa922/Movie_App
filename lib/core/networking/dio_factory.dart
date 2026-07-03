
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class DioFactory{
  static Dio? dio;

  static Dio getDio(){
    Duration timeOut = const Duration(seconds: 30);
    if(dio==null){
      dio = Dio();
      dio!..options.connectTimeout = timeOut
      ..options.receiveTimeout=timeOut;

      addDioHeaders();
      addDioInterceptors();

  }
    return dio!;
}

 static void addDioHeaders(){
    dio!.options.headers={
      "Accept": "application/json"
};

}

static void addDioInterceptors(){
    dio?.interceptors.add(
PrettyDioLogger(
requestBody:true,
requestHeader:true,
responseHeader:true
)
);
}


}