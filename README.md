# eACLI

eAsistent CLI Tool

## What currently works:

- [x] Login
- [x] Logout
- [x] Timetable for this day
- [x] Weekly timetable
- [ ] Grades
- [ ] Messages

## Building

To build, you need to install [Dart SDK](https://dart.dev/get-dart).

```bash
dart compile exe -o eacli bin/eacli_dart.dart
```

## Running

```bash
./eacli login
./eacli logout
./eacli day [offset] # Displays timetable for this day with optional offset in days
./eacli week [offset] # Displays timetable for this week with optional offset in weeks
```
