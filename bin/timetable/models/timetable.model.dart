import 'package:json_annotation/json_annotation.dart';

import 'event.model.dart';

part 'timetable.model.g.dart';

@JsonSerializable()
class Timetable {
  final List<Event> events;

  const Timetable({required this.events});

  factory Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson(json);
}
