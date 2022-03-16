// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      supportedUserTypes: (json['supported_user_types'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'supported_user_types':
          instance.supportedUserTypes.map((e) => _$UserTypeEnumMap[e]).toList(),
    };

const _$UserTypeEnumMap = {
  UserType.child: 'child',
  UserType.parent: 'parent',
};
