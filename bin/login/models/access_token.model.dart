import 'package:json_annotation/json_annotation.dart';

part 'access_token.model.g.dart';

@JsonSerializable()
class AccessToken {
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;
  final String token;

  const AccessToken({
    required this.expirationDate,
    required this.token,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);
}
