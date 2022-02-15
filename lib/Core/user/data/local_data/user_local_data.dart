import 'package:shared_preferences/shared_preferences.dart';


import '../../../Consts.dart';

abstract class UserLocatData {
  Future<void> setUserverfiy(bool isbool);
  Future<bool> getIfUserverfiy();
  Future<void> saveToken(String token);
  Future<String> getToken();
}

class UserLocatDataImp implements UserLocatData {
  final SharedPreferences sharedPreferences;

  UserLocatDataImp(this.sharedPreferences);

  @override
  Future<bool> getIfUserverfiy() async {
    return (sharedPreferences.getBool(Con.isVerify) ?? false);
  }

  @override
  Future<void> setUserverfiy(bool isbool) async {
    await sharedPreferences.setBool(Con.isVerify, isbool);
  }

  @override
  Future<String> getToken() async {
    return (sharedPreferences.getString(Con.token));
  }

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(Con.token, token);
  }
}
