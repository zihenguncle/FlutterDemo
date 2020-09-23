
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil{

  static const String KEY_ACCOUNT = "account";


  /// 异步存储
  static Future save(String key, value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value is String){
      prefs.setString(key, value);
    }else if(value is num){
      prefs.setInt(key, value);
    }else if(value is double){
      prefs.setDouble(key, value);
    }else if(value is bool){
      prefs.setBool(key, value);
    }else if(value is List){
      prefs.setStringList(key, value.cast<String>());
    }
  }

  /// 返回数据data -> replace -> null
  static get(String key, Object defaultObj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(defaultObj is String){
      return prefs.getString(key);
    }else if(defaultObj is num){
      return prefs.getInt(key);
    }else if(defaultObj is double){
      return prefs.getDouble(key);
    }else if(defaultObj is bool){
      return prefs.getBool(key);
    }else if(defaultObj is List){
      return prefs.getStringList(key);
    }
    return null;
  }

  /// 移除
  static remove(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  ///清空数据
  static removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}