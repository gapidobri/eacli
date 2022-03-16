import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';

import '../login/login.service.dart';
import '../login/models/login_response.model.dart';
import '../storage/storage.service.dart';
import '../timetable/models/timetable.model.dart';
import '../timetable/timetable.service.dart';
import 'models/api_error.model.dart';
import 'utils/json_serializable_converter.dart';

Map<Type, JsonFactory> factories = {
  LoginResponse: LoginResponse.fromJson,
  Timetable: Timetable.fromJson,
};

void initApi() {
  final client = ChopperClient(
    baseUrl: 'https://www.easistent.com/m',
    services: [
      LoginService.create(),
      TimetableService.create(),
    ],
    converter: JsonSerializableConverter(factories),
    interceptors: [
      AutorizationInterceptor(),
    ],
    errorConverter: JsonSerializableConverter(
      {
        ApiError: ApiError.fromJson,
      },
    ),
  );

  GetIt.I.registerSingleton<ChopperClient>(client);
}

class AutorizationInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final storageService = GetIt.I.get<StorageService>();
    final token = storageService.getToken();
    final Map<String, String> headers = {};
    headers.addAll(request.headers);
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    headers.addAll({
      'X-App-Name': 'child',
      'X-Client-Version': '11101',
      'X-Client-Platform': 'android',
    });
    return request.copyWith(headers: headers);
  }
}
