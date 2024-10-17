import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioDi {
  final Dio _dio = Dio();

  Dio get getDio {
    _dio.options.baseUrl = 'https://api.spoonacular.com';
    _dio.options.queryParameters = {
      'apiKey': '2397ff76e74c41c09c43fb764c5f8f21',
    };
    _dio.interceptors.add(PrettyDioLogger());
    return _dio;
  }
}
