import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPrefsKeys.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static void setAccessToken({required String accessToken}) {
    prefs!.setString(SharedPrefsKeys.ACCESS_TOKEN, accessToken);
  }

  static Future<String?> getAccessToken() async {
    String? pr = await prefs!.getString(SharedPrefsKeys.ACCESS_TOKEN);
    return pr;
  }

  static void setUserName({required String userName}) {
    prefs!.setString(SharedPrefsKeys.USER_NAME, userName);
  }

  static String? getKeyHash() {
    return prefs!.getString(SharedPrefsKeys.KEY_HASH);
  }

  static void setKeyHash({required String keyhash}) {
    prefs!.setString(SharedPrefsKeys.KEY_HASH, keyhash);
  }

  static String? getUserName() {
    return prefs!.getString(SharedPrefsKeys.USER_NAME);
  }

  static void setGCMToken({required String gcmToken}) {
    prefs!.setString(SharedPrefsKeys.GCM_ID, gcmToken);
  }

  static String? getGCMToken() {
    return prefs!.getString(SharedPrefsKeys.GCM_ID);
  }

  //clear all values from shared preferences
  static void clearMemory() async {
    await prefs!.clear();
  }

  static void setDeviceId({required String deviceID}) {
    prefs!.setString(SharedPrefsKeys.DEVICE_ID, deviceID);
  }

  static String? getDeviceId() {
    return prefs!.getString(SharedPrefsKeys.DEVICE_ID);
  }

  static void setUserInfo({required String userInfo}) {
    prefs!.setString(SharedPrefsKeys.USER_INFO, userInfo);
  }

  static String? getUserInfo() {
    return prefs!.getString(SharedPrefsKeys.USER_INFO);
  }

  static void setUserLoggedIn({required bool isUserLoggedin}) {
    prefs!.setBool(SharedPrefsKeys.IS_USER_LOGGED_IN, isUserLoggedin);
  }

  static bool? getUserLoggedIn() {
    return prefs!.getBool(SharedPrefsKeys.IS_USER_LOGGED_IN);
  }

  static void setMCC({required String mcc}) {
    prefs!.setString(SharedPrefsKeys.USER_MCC, mcc);
  }

  static String? getMCC() {
    return prefs!.getString(SharedPrefsKeys.USER_MCC);
  }

  static void setCarrier({required String carrier}) {
    prefs!.setString(SharedPrefsKeys.USER_CARRIER, carrier);
  }

  static String? getCarrier() {
    return prefs!.getString(SharedPrefsKeys.USER_CARRIER);
  }

  static void setGeo({required String geo}) {
    prefs!.setString(SharedPrefsKeys.USER_GEO, geo);
  }

  static String? getGeo() {
    return prefs!.getString(SharedPrefsKeys.USER_GEO);
  }
}
