import 'package:shared_preferences/shared_preferences.dart';

class SharedApi {
  Future<void> addData(String key, dynamic value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  Future<dynamic> getData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<bool> hasKey(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
