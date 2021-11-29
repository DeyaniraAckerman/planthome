import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class ApplicationPreferences {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Box? _encryptedBox;
  Box? _box;
  final String diffServerTimeKey = 'diffTime';
  final String _boxKey = 'appPreferencesSecure';

  Future<Box> _getEncryptedBox() async {
    if (_encryptedBox == null) {
      var containsEncryptionKey = await secureStorage.containsKey(key: _boxKey);
      if (!containsEncryptionKey) {
        var key = Hive.generateSecureKey();
        await secureStorage.write(key: _boxKey, value: base64UrlEncode(key));
      }

      String? key = await secureStorage.read(key: _boxKey);
      if (key != null) {
        Uint8List encryptionKey = base64Url.decode(key);
        _encryptedBox = await Hive.openBox(_boxKey,
            encryptionCipher: HiveAesCipher(encryptionKey));
      }
    }
    return _encryptedBox!;
  }

  Future<Box> _getBox() async {
    _box ??= await Hive.openBox('appPreferences');
    return _box!;
  }

  saveDiffWithServerTime(int diffWithServerTime) async {
    (await _getBox()).put(diffServerTimeKey, diffWithServerTime);
  }

  Future<int> getDiffWithServerTime() async {
    return (await _getBox()).get(diffServerTimeKey, defaultValue: 0);
  }

  saveCredenciales(String user, String password) async {
    Box box = (await _getEncryptedBox());
    box.put('password', password);
    box.put('user', user);
  }

  clearCredenciales() async {
    Box box = (await _getEncryptedBox());
    box.delete('user');
    box.delete('password');
  }

  Future<String?> getPasswordSaved() async {
    return (await _getEncryptedBox()).get('password');
  }

  Future<String?> getUserSaved() async {
    return (await _getEncryptedBox()).get('user');
  }

  saveTokenUser(String user) async {
    (await _getBox()).put('tokenUser', user);
  }

  Future<String?> getTokenUser() async {
    return (await _getBox()).get('tokenUser');
  }
}
