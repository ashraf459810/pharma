import 'package:pharma/Core/Consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> getfirstvisit() async {
    return (await getPrefs()).getBool(Con.isfirstvisit);
  }

  Future<void> setfirstvisit() async {
    return (await getPrefs()).setBool(Con.isfirstvisit, true);
  }

  @override
  Future<void> savetoken(String token) async {
    return (await getPrefs()).setString(Con.token, token);
  }

  @override
  Future<String> getToken() async {
    return (await getPrefs()).getString(Con.token);
  }
}
