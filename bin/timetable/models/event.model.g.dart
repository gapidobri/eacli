// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      color: json['color'] as String,
      date: json['date'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      teachers:
          (json['teachers'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      type: json['type'] as String,
      classroom: json['classroom'] as String?,
      lesson: json['lesson'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'classroom': instance.classroom,
      'color': instance.color,
      'date': instance.date,
      'from': instance.from,
      'to': instance.to,
      'lesson': instance.lesson,
      'teachers': instance.teachers,
      'title': instance.title,
      'title_short': instance.titleShort,
      'type': instance.type,
    };
