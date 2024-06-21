import 'dart:convert';

GoogleAuthLogin googleAuthLoginFromMap(String str) =>
    GoogleAuthLogin.fromMap(json.decode(str));

String googleAuthLoginToMap(GoogleAuthLogin data) => json.encode(data.toMap());

class GoogleAuthLogin {
  GoogleAuthLogin({
    required this.token,
    required this.deviceToken,
  });

  String token;
  String deviceToken;

  factory GoogleAuthLogin.fromMap(Map<String, dynamic> json) => GoogleAuthLogin(
        token: json["token"] == null ? '' : json["token"],
        deviceToken: json["device_token"] == null ? '' : json["device_token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "device_token": deviceToken,
      };
}
