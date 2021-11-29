import 'package:hive/hive.dart';

class UserPreferences {
  Box? _box;
  final String userPreferencesKey = 'userPreferences-';

  Future<Box> _getBox(String user) async {
    if (_box == null || _box?.name != '$userPreferencesKey$user') {
      _box = await Hive.openBox('$userPreferencesKey$user');
    }
    return _box!;
  }

  saveSemilla(String user, String semilla) async {
    (await _getBox(user)).put('semilla', semilla);
  }

  Future<String?> getSemilla(String user) async {
    return (await _getBox(user)).get('semilla');
  }
}
