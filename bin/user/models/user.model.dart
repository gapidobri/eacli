import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String language;
  final String name;
  final UserType type;
  final String username;
  final String? freshPassword;

  const User({
    required this.id,
    required this.language,
    required this.name,
    required this.type,
    required this.username,
    this.freshPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserType {
  @JsonValue('child')
  child,
  @JsonValue('parent')
  parent,
}
