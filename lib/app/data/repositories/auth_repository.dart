import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/request/googleSign.dart';
import 'package:herai/app/data/network/request/register_email_request.dart';
import 'package:herai/app/data/network/response/base_response.dart';
import 'package:herai/app/data/network/response/delete_item_response.dart';
import 'package:herai/app/data/network/response/login_response.dart';
import 'package:herai/app/utils/log.dart';

import '../entities/user.dart';
import '../network/request/login_request.dart';

abstract class AuthEndpoints {
  static final loginEmail = "/api/auth/login";
  static final registerEmail = "/api/auth/register";
  static final getUserData = "/api/user";
  static final googleAccount = "/api/auth/google";
}

class AuthRepository extends GetxController {
  Rx<UserProfile> user = UserProfile.empty().obs;
  late HerAiApi _api;

  AuthRepository() {
    _api = HerAiApi();
  }

  Future<String> getFCMToken() async {
    return await FirebaseMessaging.instance.getToken() ?? "initokentest";
  }

  Future<UserProfile?> loginEmail(LoginRequest loginRequest) async {
    final response =
        await _api.post(AuthEndpoints.loginEmail, loginToMap(loginRequest));
    LoginResponse data = baseResponseFromMap<LoginResponse>(
        response, (p0) => LoginResponse.fromMap(p0)).data;
    var token = data.token;
    SharedPrefSecureStorage.getInstance()!.saveToken(token);
    return data.user;
  }

  Future<UserProfile?> googleLogin(GoogleAuthLogin authToken) async {
    final response = await _api.post(
        AuthEndpoints.googleAccount, googleAuthLoginToMap(authToken));
    LoginResponse data = baseResponseFromMap<LoginResponse>(
        response, (p0) => LoginResponse.fromMap(p0)).data;
    var token = data.token;
    SharedPrefSecureStorage.getInstance()!.saveToken(token);
    return data.user;
  }

  Future<UserProfile?> registerEmail(
      RegisterEmailRequest registerEmailRequest) async {
    final response = await _api.post(AuthEndpoints.registerEmail,
        registerEmailRequestToMap(registerEmailRequest));
    LoginResponse data = baseResponseFromMap<LoginResponse>(
        response, (p0) => LoginResponse.fromMap(p0)).data;
    var token = data.token;
    SharedPrefSecureStorage.getInstance()!.saveToken(token);
    return data.user;
  }

  Future<UserProfile> getUserData() async {
    final response = await _api.get(AuthEndpoints.getUserData);

    user.value = baseResponseFromMap<UserProfile>(
        response, (p0) => UserProfile.fromMap(p0)).data;
    return user.value;
  }

  Future<bool> postModel(File file) async {
    final response = await _api.sendFile(file);

    final data = baseResponseFromMap<DeleteItem>(
        response, (p0) => DeleteItem.fromMap(p0)).success;
    return data;
  }

  Future<bool> postEditProfile(Map<String, dynamic> profile, File file) async {
    final response = await _api.postEditProfile(profile, file);
    Log.colorGreen(response);

    final success =
        baseResponseFromMap<String>(response, (p0) => p0.toString()).success;

    return success;
    // Log.info('post Add Item success: ${success}');
    // if (success) {
    //   final item =
    //       baseResponseFromMap<Item>(response, (p0) => Item.fromMap(p0)).item;
    //   return item;
    // } else {
    //   final item = Item.empty();
    //   return item;
    // }
  }
}
