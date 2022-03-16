import 'package:chopper/chopper.dart';

import 'models/timetable.model.dart';

part 'timetable.service.chopper.dart';

@ChopperApi(baseUrl: '/timetable')
abstract class TimetableService extends ChopperService {
  static TimetableService create([ChopperClient? client]) => _$TimetableService(client);

  @Get(path: '/events')
  Future<Response<Timetable>> getEvents(@Query() String from, @Query() String to);
}
