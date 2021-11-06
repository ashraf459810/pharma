import 'package:pharma/Core/Consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> getsupportcontactsaved() async {
    return (await getPrefs()).getBool(Con.savedcontactsforsupport);
  }

  Future<void> setsupportcontactsaved() async {
    return (await getPrefs()).setBool(Con.savedcontactsforsupport, true);
  }

  @override
  Future<bool> getemergencycontactsaved() async {
    return (await getPrefs()).getBool(Con.savedcontactsforemergency);
  }

  @override
  Future<void> setemergencycontactsaved() async {
    return (await getPrefs()).setBool(Con.savedcontactsforemergency, true);
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
