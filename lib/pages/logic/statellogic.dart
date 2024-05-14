import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptorexample/State/appstate.dart';
import 'package:interceptorexample/dio/dio.dart';
import 'package:interceptorexample/model/userDataModel.dart';

class DataStateNotifier extends StateNotifier<AppState<Data>> {
  final Ref ref;

  DataStateNotifier(this.ref) : super(const AppState.initial());

  void fetchData() async {
    Data posts;

    try {
      state = AppState.loading(loading: true);
      final response = await ref.watch(dioProvider).get('/posts');
      if (response.statusCode == 200) {
        final data = response.data;
        posts = Data.fromJson(data);
        state = AppState.loading(loading: false);
        state = AppState.success(data: posts);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}

final postNotifierProvider =
    StateNotifierProvider<DataStateNotifier, AppState<Data>>(
        (ref) => DataStateNotifier(ref));
