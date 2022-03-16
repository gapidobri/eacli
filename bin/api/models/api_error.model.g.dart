// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      code: json['code'] as int,
      developerMessage: json['developer_message'] as String,
      userMessage: json['user_message'] as String,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'code': instance.code,
      'developer_message': instance.developerMessage,
      'user_message': instance.userMessage,
    };
