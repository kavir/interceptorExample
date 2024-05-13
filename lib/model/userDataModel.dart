import 'package:freezed_annotation/freezed_annotation.dart';
part 'userDataModel.freezed.dart';
part 'userDataModel.g.dart';

@freezed
class Data with _$Data {
  const factory Data({
    @Default([]) List<User> users,
  }) = _Data;

  // factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
  factory Data.fromJson(List<dynamic> json) {
    return Data(
        users: json
            .map((userJson) => User.fromJson(userJson as Map<String, dynamic>))
            .toList());
  }
}

@freezed
class User with _$User {
  const factory User({
    @Default(-1) int userid,
    @Default(-1) int id,
    @Default("") String title,
    @Default("") String body,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
