import 'dart:convert';
import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sentry/io_client.dart';
import 'package:tatsam/constants/constant.dart';

SharedPreferences prefs;

class Session {
  static Session _instance;
  factory Session() => _instance ??= new Session._();
  Session._() {
//    init(null);
  }

  init(SharedPreferences preferences) async {
    print("init ${preferences == null}");
    if (preferences == null && prefs == null)
      prefs = await SharedPreferences.getInstance();
    else
      prefs = preferences;
  }

  bool getBoolean(String key, {bool defaultValue = false}) {
    return prefs.getBool(key) ?? defaultValue;
  }

  bool isLogin() {
    if (prefs.getBool(Constant.LOGIN_STATUS) != null)
      return prefs.getBool(Constant.LOGIN_STATUS);
    return false;
  }

  String getString(String key, {String defaultValue = ""}) {
    return prefs.getString(key) ?? defaultValue;
  }

  getInt(String key) {
    return prefs.getInt(key);
  }

  setValue(String key, dynamic value) {
    print("setValue : $key- $value");
    if (value is String) {
      prefs.setString(key, value);
      return;
    }
    if (value is int) {
      prefs.setInt(key, value);
      return;
    }
    if (value is bool) {
      prefs.setBool(key, value);
      return;
    } else {
      print("other type");
      prefs.setString(key, "${value ?? ''}");
    }
  }

  void logout() {
    setValue(Constant.LOGIN_STATUS, false);
    setValue(Constant.USER_ID, "");
    setValue(Constant.USER_FNAME, "");
    setValue(Constant.USER_LNAME, "");
    setValue(Constant.USER_EMAIL, "");
    setValue(Constant.USER_MOBILE, "");
    setValue(Constant.AUTH_TOKEN, "");
    setValue(Constant.USER_ROLE, "");
    setValue(Constant.USER_PROFILE_ALL_DATA, "");
    setValue(Constant.USER_PROFILE, "");
  }

  isTokenExpire({getDecodedData = false}) {
    String token = getString(Constant.AUTH_TOKEN);
    if (token == null || token == "") return false;
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(getString(Constant.AUTH_TOKEN));
    log("the token data${decodedToken}");

    bool hasExpired = JwtDecoder.isExpired(getString(Constant.AUTH_TOKEN));
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);
    if (getDecodedData) return decodedToken;
    return !expirationDate.isAfter(DateTime.now().add(Duration(minutes: 30)));
  }

  getUserData() {
    var userData = json.decode(getString(Constant.USER_PROFILE_ALL_DATA));
    return userData;
  }
}
