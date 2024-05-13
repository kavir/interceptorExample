import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptorexample/dio/dio.dart';
import 'package:interceptorexample/model/userDataModel.dart';

class DataStateNotifier extends StateNotifier<List<User>> {
  DataStateNotifier() : super([]);

  // Method to fetch data
  Future<void> fetchData(ref) async {
    List<User> posts = [];
    // Assuming you have a Dio instance
    try {
      final response = await ref.watch(dioProvider).get('/posts');
      if (response.statusCode == 200) {
        // Converting the response to a list of Data objects
        final data = response.data;
        for (var post in data) {
          posts.add(User.fromJson(post));
        }
        // Updating the state
        state = posts;
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to load user data: $e');
    }
  }
}

// Step 2: Create a StateNotifierProvider
final postNotifierProvider =
    StateNotifierProvider<DataStateNotifier, List<User>>(
        (ref) => DataStateNotifier());
