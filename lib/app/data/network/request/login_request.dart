import 'dart:convert';

LoginRequest loginFromMap(String str) => LoginRequest.fromMap(json.decode(str));

String loginToMap(LoginRequest data) => json.encode(data.toMap());

class LoginRequest {
  LoginRequest(
      {required this.email, required this.password, required this.deviceToken});

  String email;
  String password;
  String deviceToken;

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        email: json["email"] == null ? "" : json["email"],
        password: json["password"] == null ? "" : json["password"],
        deviceToken: json["device_token"] == null ? "" : json["device_token"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "device_token": deviceToken,
      };
}
