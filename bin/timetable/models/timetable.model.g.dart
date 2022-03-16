// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) => Timetable(
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'events': instance.events.map((e) => e.toJson()).toList(),
    };
