import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsHelper {
  Future<SharedPreferences> getPrefs();
  Future<void> setfirstvisit();
  Future<bool> getfirstvisit();

  Future<void> savetoken(String token);
  Future<String> getToken();
}
