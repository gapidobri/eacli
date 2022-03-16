import 'package:json_annotation/json_annotation.dart';

part 'event.model.g.dart';

@JsonSerializable()
class Event {
  final String classroom;
  final String color;
  final String date;
  final String from;
  final String to;
  final String? lesson;
  final List<String> teachers;
  final String title;
  @JsonKey(name: 'title_short')
  final String titleShort;
  final String type;

  const Event({
    required this.classroom,
    required this.color,
    required this.date,
    required this.from,
    required this.to,
    required this.teachers,
    required this.title,
    required this.titleShort,
    required this.type,
    this.lesson,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
