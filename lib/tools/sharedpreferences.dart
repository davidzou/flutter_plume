import 'package:shared_preferences/shared_preferences.dart';

///
/// SharedPreferences 工具类
///
/// #### 读取数据
///
///   ```
///   RWSharePreferences.getBool(key)
///   ...
///   ```
///
/// #### 写入数据
///
///   ```
///   RWSharePreferences.saveBool(key, value)
///   ...
///   ```
///
class RWSharedPreferences {
  RWSharedPreferences._();

  static saveBool(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setBool(key, value);
  }

  static saveInt(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setInt(key, value);
  }

  static saveDouble(String key, double value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setDouble(key, value);
  }

  static saveString(String key, String value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(key, value);
  }

  static saveStringArray(String key, List<String> value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setStringList(key, value);
  }

  // 获取SharedPreferences

  static Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<List<String>> getStringArray(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

}