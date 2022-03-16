// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TimetableService extends TimetableService {
  _$TimetableService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TimetableService;

  @override
  Future<Response<Timetable>> getEvents(String from, String to) {
    final $url = '/timetable/events';
    final $params = <String, dynamic>{'from': from, 'to': to};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Timetable, Timetable>($request);
  }
}
