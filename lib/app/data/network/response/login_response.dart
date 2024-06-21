import 'dart:convert';

import '../../entities/user.dart';

LoginResponse loginResponseFromMap(String str) =>
    LoginResponse.fromMap(json.decode(str));

String loginResponseToMap(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  LoginResponse({
    required this.user,
    required this.token,
  });

  UserProfile? user;
  String token;

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        user: json["user"] == null ? null : UserProfile.fromMap(json["user"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user?.toMap(),
        "token": token,
      };
}
