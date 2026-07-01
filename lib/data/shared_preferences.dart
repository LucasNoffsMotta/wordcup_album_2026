import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences instance;
  static Future<SharedPreferences> init() async => 
      instance = await SharedPreferences.getInstance();

  static void setIntValue(String key, int value) {
    instance.setInt(key, value);
  }
}
