import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Private constructor
  SharedPrefsService._internal();

  // Singleton instance
  static final SharedPrefsService _instance =
      SharedPrefsService._internal();

  factory SharedPrefsService() => _instance;

  static SharedPreferences? _prefs;

  /// Must be called once before using any getter/setter
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // -------------------------------
  // Generic helpers
  // -------------------------------
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }
}
