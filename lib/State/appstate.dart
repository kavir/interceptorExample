import 'package:freezed_annotation/freezed_annotation.dart';

part '../../State/appstate.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.initial() = AppInitial;

  const factory AppState.loading({bool? loading}) = AppLoading;

  const factory AppState.error({T? data}) = AppError<T>;

  const factory AppState.success({T? data}) = AppSuccess<T>;
}
