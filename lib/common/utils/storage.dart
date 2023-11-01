import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// kv离线存储
class Storage {
  // 单例写法
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  late final SharedPreferences _prefs;

  Storage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  Future<void> setString(String key, String value) async {
    _prefs.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    _prefs.setBool(key, value);
  }

  Future<void> setList(String key, List<String> value) async {
    _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
