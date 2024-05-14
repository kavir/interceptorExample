import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptorexample/dio/dio.dart';
import 'package:interceptorexample/model/userDataModel.dart';

final futureDataProvider = FutureProvider<Data>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/posts');
  if (response.statusCode == 200) {
    return Data.fromJson(response.data);
  } else {
    throw Exception('failed to load user data');
  }
});
