import 'package:json_annotation/json_annotation.dart';

import 'access_token.model.dart';
import '../../user/models/user.model.dart';

part 'login_response.model.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  final AccessToken accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  final User user;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
