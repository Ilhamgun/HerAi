// import 'dart:async';

import 'dart:convert';

// import 'package:data/models/others/login_user_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../models/response/cache_login.dart';

abstract class StringSharedPreferences {
  static final onBoarding = "onboardingCache";
  static final userData = "userdata";
  static final cacheLoginUser = "cacheLoginUser";
  static final cacheLoginUserPassword = "cacheLoginUserPassword";
  static final cacheLanguage = "cacheLanguage";
  static final customerMe = "customerMe";
  static final tokenAuth = "tokenAuth";
  static final locationFlag = "locationFlag";
  static final fillAllProfile = "fillAllProfile";
}

class SharedPrefSecureStorage {
  SharedPrefSecureStorage._privateConstructor();

  static FlutterSecureStorage? secureStorage;

  static SharedPrefSecureStorage? _instance;

  static SharedPrefSecureStorage? getInstance() {
    if (_instance == null) {
      _instance = SharedPrefSecureStorage._privateConstructor();
      secureStorage = const FlutterSecureStorage();
    }
    return _instance;
  }

  FlutterSecureStorage? get getSecureStorage => secureStorage == null
      ? secureStorage = const FlutterSecureStorage()
      : secureStorage;

  final AndroidOptions androidOptions =
      const AndroidOptions(encryptedSharedPreferences: false);

  final iosOptions =
      const IOSOptions(accessibility: KeychainAccessibility.unlocked);

  void setLanguage(String language) async {
    await getSecureStorage!.write(
      key: StringSharedPreferences.cacheLanguage,
      value: language,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<String> getLanguage() async {
    String? value = await getSecureStorage!.read(
      key: StringSharedPreferences.cacheLanguage,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return value == null ? 'id' : value;
  }

  void setPrefOnBoarding(int val) async {
    await getSecureStorage!.write(
      key: StringSharedPreferences.onBoarding,
      value: val.toString(),
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<int> getPrefOnBoarding() async {
    String? value = await getSecureStorage!.read(
      key: StringSharedPreferences.onBoarding,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return value == null ? 0 : int.parse(value);
  }

  void setLoginUserCache(CacheLogin valueUser) async {
    await getSecureStorage!.write(
      key: StringSharedPreferences.cacheLoginUser,
      value: json.encode(valueUser.toMap()),
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<CacheLogin> getLoginUserCache() async {
    String? value = await getSecureStorage!.read(
      key: StringSharedPreferences.cacheLoginUser,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return value == null
        ? CacheLogin(email: '', password: '', rememberMe: false)
        : CacheLogin.fromMap(json.decode(value));
  }

  void saveToken(String token) async {
    await getSecureStorage!.write(
      key: StringSharedPreferences.tokenAuth,
      value: token,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<String> getToken() async {
    String? value = await getSecureStorage!.read(
      key: StringSharedPreferences.tokenAuth,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return value == null ? "" : value;
  }

  Future<int> getLocationFlag() async {
    String? value = await getSecureStorage!.read(
      key: StringSharedPreferences.locationFlag,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return value == null ? 0 : int.parse(value);
  }

  void saveLocationFlag(int flag) async {
    await getSecureStorage!.write(
      key: StringSharedPreferences.locationFlag,
      value: flag.toString(),
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<bool> deleteUserData() async {
    await getSecureStorage!.delete(
      key: StringSharedPreferences.cacheLoginUser,
      aOptions: androidOptions,
      iOptions: iosOptions,
    );

    return true;
  }
}
