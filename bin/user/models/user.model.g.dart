// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      language: json['language'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      username: json['username'] as String,
      freshPassword: json['freshPassword'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'name': instance.name,
      'type': _$UserTypeEnumMap[instance.type],
      'username': instance.username,
      'freshPassword': instance.freshPassword,
    };

const _$UserTypeEnumMap = {
  UserType.child: 'child',
  UserType.parent: 'parent',
};
