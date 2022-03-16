import 'package:json_annotation/json_annotation.dart';

import '../../user/models/user.model.dart';

part 'login_request.model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;
  @JsonKey(name: 'supported_user_types')
  final List<UserType> supportedUserTypes;

  const LoginRequest({
    required this.username,
    required this.password,
    required this.supportedUserTypes,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
