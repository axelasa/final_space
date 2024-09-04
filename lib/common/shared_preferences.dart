import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyCookie = 'cookie';


  static Future init() async {
    _preferences = await SharedPreferences.getInstance();

  }
  static Future<void>delete() async => await _preferences.clear();

  static Future<bool> setCookie(String cookie) async =>
      await _preferences.setString(_keyCookie, cookie);

  static Future<String?> getCookie() async => _preferences.getString(_keyCookie);

}

