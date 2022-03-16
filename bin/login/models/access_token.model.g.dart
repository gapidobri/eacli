// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      expirationDate: DateTime.parse(json['expiration_date'] as String),
      token: json['token'] as String,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'expiration_date': instance.expirationDate.toIso8601String(),
      'token': instance.token,
    };
