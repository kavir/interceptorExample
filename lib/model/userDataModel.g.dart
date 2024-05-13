// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userid: (json['userid'] as num?)?.toInt() ?? -1,
      id: (json['id'] as num?)?.toInt() ?? -1,
      title: json['title'] as String? ?? "",
      body: json['body'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
