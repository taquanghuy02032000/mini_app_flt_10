import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_app/config/dio/dio_di.dart';
import 'package:mini_app/model/products_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  Future<ProductTotalResponse?> fetchRecipes({
    required int currentSize,
    required int skipSize,
  }) async {
    try {
      final response = await DioDi().getDio.get('/recipes/complexSearch', queryParameters: {
        'number': currentSize,
        'offSet': skipSize,
      });
      if (response.statusCode == 200) {
        try {
          return ProductTotalResponse.fromJson(response.data as Map<String, dynamic>);
        } catch (_) {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }
}
