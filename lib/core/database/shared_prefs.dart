import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static int getInt(String key) {
    int data = sharedPreferences.getInt(key) ?? 0;
    return data;
  }

  static double getDouble(String key) {
    double data = sharedPreferences.getDouble(key) ?? 0.0;
    return data;
  }

  static String getString(String key) {
    String data = sharedPreferences.getString(key) ?? '';
    return data;
  }

  static bool getBool(String key) {
    bool data = sharedPreferences.getBool(key) ?? false;
    return data;
  }

  static Future<bool> save(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      List<String> data = value.map((e) => json.encode(e)).toList();
      print(
          'heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey ${sharedPreferences.setStringList(key, data)}');
      return sharedPreferences.setStringList(key, data);
    }
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future clearData() {
    return sharedPreferences.clear();
  }

  static List<Map> getObjectList(String key) {
    List<String>? dataList = sharedPreferences.getStringList(key);
    return dataList!.map((value) {
      Map dataMap = json.decode(value);
      return dataMap;
    }).toList();
  }
}
