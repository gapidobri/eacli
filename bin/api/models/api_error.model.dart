import 'package:json_annotation/json_annotation.dart';

part 'api_error.model.g.dart';

@JsonSerializable()
class ApiError {
  final int code;
  @JsonKey(name: 'developer_message')
  final String developerMessage;
  @JsonKey(name: 'user_message')
  final String userMessage;

  const ApiError({
    required this.code,
    required this.developerMessage,
    required this.userMessage,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}
