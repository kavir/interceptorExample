import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => _getdio());

Dio _getdio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
  // dio.interceptors.add(CustomInterceptor());
  dio.interceptors
      .add(LogInterceptor(requestHeader: true, error: true, requestBody: true));
  return dio;
}
