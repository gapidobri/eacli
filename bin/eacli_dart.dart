import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dcli/dcli.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:tabular/tabular.dart';

import 'api/api.service.dart';
import 'api/utils/api_error.utils.dart';
import 'login/login.service.dart';
import 'login/models/login_request.model.dart';
import 'storage/storage.service.dart';
import 'timetable/timetable.service.dart';
import 'user/models/user.model.dart';

final dateFormat = DateFormat('yyyy-MM-dd');
final displayFormat = DateFormat('dd. M. yyyy');

void main(List<String> arguments) async {
  initApi();
  await StorageService.init();

  final subarg = arguments.length > 1 ? arguments[1] : '';

  switch (arguments.first) {
    case 'login':
      await login();
      break;
    case 'logout':
      await logout();
      break;
    case 'day':
      await day(int.tryParse(subarg));
      break;
    case 'week':
      await week(int.tryParse(subarg));
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

bool isAuthenticated() {
  return GetIt.I.get<StorageService>().getToken() != null;
}

Future<void> day([int? offset]) async {
  if (!isAuthenticated()) {
    print('Please login first');
    return;
  }

  final timetableService = GetIt.I.get<ChopperClient>().getService<TimetableService>();

  final now = DateTime.now().add(Duration(days: offset ?? 0));
  final formatted = dateFormat.format(now);

  final response = await timetableService.getEvents(formatted, formatted);

  if (!response.isSuccessful || response.body == null) {
    showApiError(response.error);
    return;
  }

  final columns = tabular(
    [
      [
        'Start',
        'End',
        'Subject',
        'Teacher',
        'Classroom',
        'Lesson',
      ],
      ...response.body?.events.map((e) => [
                e.from,
                e.to,
                e.title,
                e.teachers.first,
                e.classroom,
                e.lesson,
              ]) ??
          [],
    ],
    border: Border.all,
    style: Style.mysql,
    align: {
      'Classroom': Side.center,
    },
  );

  print('\n${displayFormat.format(now)}\n');
  print(columns);
}

Future<void> week([int? offset]) async {
  if (!isAuthenticated()) {
    print('Please login first');
    return;
  }

  final timetableService = GetIt.I.get<ChopperClient>().getService<TimetableService>();

  final now = DateTime.now().add(Duration(days: offset != null ? offset * 7 : 0));

  final lastMonday = now.subtract(Duration(days: now.weekday - 1));
  final nextFriday = now.add(Duration(days: 4));

  final response = await timetableService.getEvents(
    dateFormat.format(lastMonday),
    dateFormat.format(nextFriday),
  );

  if (!response.isSuccessful || response.body == null) {
    showApiError(response.error);
    return;
  }

  final Map<String, List<String>> dayMap = {};

  for (final event in response.body!.events) {
    if (!dayMap.containsKey(event.date)) {
      dayMap[event.date] = [];
    }
    dayMap[event.date]?.add(event.title);
  }

  final dayMapValues = dayMap.values.toList();

  final dayLength = dayMapValues.fold<int>(0, (max, curr) => curr.length > max ? curr.length : max);

  final List<List<String>> dayList = List.generate(dayLength, (_) => List.generate(5, (_) => ''));
  for (int i = 0; i < dayMapValues.length; i++) {
    for (int j = 0; j < dayMapValues[i].length; j++) {
      dayList[j][i] = dayMapValues[i][j];
    }
  }

  final columns = tabular(
    [
      [
        'Mon',
        'Tue',
        'Wed',
        'Thu',
        'Fri',
      ],
      ...dayList,
    ],
    border: Border.all,
    style: Style.mysql,
  );

  print('\n${displayFormat.format(lastMonday)} - ${displayFormat.format(nextFriday)}\n');
  print(columns);
}
