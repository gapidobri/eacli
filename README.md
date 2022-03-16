# eACLI

eAsistent CLI Tool

## What currently works:

- [x] Login
- [x] Logout
- [ ] Timetable for this day **(in progress)**
- [ ] Weekly timetable
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
./eacli today # Currently just spits out JSON
```
