import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dcli/dcli.dart';
import 'package:get_it/get_it.dart';

import 'api/api.service.dart';
import 'api/utils/api_error.utils.dart';
import 'login/login.service.dart';
import 'login/models/login_request.model.dart';
import 'storage/storage.service.dart';
import 'timetable/timetable.service.dart';
import 'user/models/user.model.dart';

void main(List<String> arguments) async {
  initApi();
  await StorageService.init();

  switch (arguments.first) {
    case 'login':
      await login();
      break;
    case 'logout':
      await logout();
      break;
    case 'today':
      await today();
      break;
  }

  await StorageService.close();

  exit(0);
}

Future<void> login() async {
  final loginService = GetIt.I.get<ChopperClient>().getService<LoginService>();
  final storageService = GetIt.I.get<StorageService>();

  if (storageService.getRefreshToken() != null) {
    print('You are already logged in, run ${blue('eacli logout')} to logout.');
    return;
  }

  final username = ask('Username:', required: true);
  final password = ask('Password:', required: true, hidden: true);

  final response = await loginService.login(
    LoginRequest(
      username: username,
      password: password,
      supportedUserTypes: [
        UserType.child
      ],
    ),
  );

  if (!response.isSuccessful || response.body == null) {
    showApiError(response.error);
    return;
  }

  storageService.storeToken(response.body!.accessToken.token);
  storageService.storeRefreshToken(response.body!.refreshToken);
  storageService.storeExpirationDate(response.body!.accessToken.expirationDate);

  print('Login successfull, Hello ${response.body?.user.name}');
}

Future<void> logout() async {
  final storageService = GetIt.I.get<StorageService>();

  await storageService.clear();

  print('Successfully logged out');
}

Future<void> today() async {
  final timetableService = GetIt.I.get<ChopperClient>().getService<TimetableService>();

  final response = await timetableService.getEvents('2022-03-16', '2022-03-16');

  if (!response.isSuccessful || response.body == null) {
    showApiError(response.error);
    print(response.error);
    return;
  }

  print(response.body);
}
