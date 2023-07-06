import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static SharedPreferences? _prefsInstance;

  // static Future<SharedPreferences> get _instance async =>
  //     _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static init() async {
    _prefsInstance = await  SharedPreferences.getInstance();
  }

  static String getString(String key) {
    return _prefsInstance?.getString(key) ?? '';
  }

  static Future<bool> storeFieldValue(String key, String value) async {
    return _prefsInstance!.setString(key, value);
  }

  static Future<bool> storeInt(String key, int value) async {
    return _prefsInstance!.setInt(key, value);
  }

  static Future<bool> storeBoolean(String key, bool value) async {
    return _prefsInstance!.setBool(key, value);
  }

  static void setIsLoggedIn(String key, bool isLoggedIn) {
    _prefsInstance!.setBool(key, isLoggedIn);
  }


  static bool isLoggedIn(){
   return  true;
  }

}
