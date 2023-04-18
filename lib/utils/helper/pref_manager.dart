import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  String kToken = 'token';
  String kIsLogin = 'false';
  SharedPreferences sharedPreferences;
  PrefManager(this.sharedPreferences);
  set token(String? value) => sharedPreferences.setString(kToken, value ?? "");
  String? get token => sharedPreferences.getString(kToken);
  set isLogin(bool value) => sharedPreferences.setBool(kIsLogin, value);
  bool get isLogin => sharedPreferences.getBool(kIsLogin) ?? false;
  void logout() => sharedPreferences.clear();
}
