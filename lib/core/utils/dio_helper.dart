import 'package:clean_arch_bookly_pp/core/utils/end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static int() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true));
  }

 static Future<Response> getData(
      {required String url,
       Map<String, dynamic>? query,
       }) async {
    return await dio.get(url, queryParameters: query);
  }
  static Future<Response> postData(
      {required String url, 
      Map<String, dynamic>? query,
        Map<String, dynamic>? data,
      }) async {
    return await dio.post(url, queryParameters: query,data: data);
  }
}
