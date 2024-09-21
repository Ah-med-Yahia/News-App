import 'package:dio/dio.dart';
import 'package:news_app/constants/strings.dart';


class NewsApi {

  late Dio dio;

  NewsApi(){
  BaseOptions options = BaseOptions(
    baseUrl: baseURL,
    receiveTimeout:const Duration(seconds:20),
    connectTimeout:const Duration(seconds:20),
  );
  dio=Dio(options);
  }

  DioException? errorRes;

  Future<List<dynamic>> getData({required String endPoint, required  Map<String, dynamic>? queryParam}) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters:queryParam,
      );

        Map<String, dynamic> jsonData = response.data;
        return jsonData["articles"];
    } on DioException catch(ex){
      errorRes=ex;
    }
    return [];
  }

}
