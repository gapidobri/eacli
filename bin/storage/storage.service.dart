import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

const boxKey = 'storage';
const tokenKey = 'token';
const refreshTokenKey = 'refresh_token';
const expirationDateKey = 'expiration_date';

class StorageService {
  final Box _box;

  const StorageService(this._box);

  static Future<void> init() async {
    final box = await Hive.openBox(boxKey, path: join(Platform.environment['HOME'] ?? '', '.config/eacli'));
    GetIt.I.registerSingleton<StorageService>(
      StorageService(box),
      dispose: (param) => box.close(),
    );
  }

  static Future<void> close() async {
    await GetIt.I.unregister<StorageService>();
  }

  void storeToken(String token) {
    _box.put(tokenKey, token);
  }

  String? getToken() {
    return _box.get(tokenKey);
  }

  void storeRefreshToken(String refreshToken) {
    _box.put(refreshTokenKey, refreshToken);
  }

  String? getRefreshToken() {
    return _box.get(refreshTokenKey);
  }

  void storeExpirationDate(DateTime expirationDate) {
    _box.put(
      expirationDateKey,
      expirationDate.millisecondsSinceEpoch,
    );
  }

  DateTime? getExpirationDate() {
    final milli = _box.get(expirationDateKey);
    if (milli == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(milli);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
