import 'dart:convert';

CacheLogin cacheLoginFromMap(String str) =>
    CacheLogin.fromMap(json.decode(str));

String cacheLoginToMap(CacheLogin data) => json.encode(data.toMap());

class CacheLogin {
  CacheLogin({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  String email;
  String password;
  bool rememberMe;

  factory CacheLogin.fromMap(Map<String, dynamic> json) => CacheLogin(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        rememberMe: json["rememberMe"] == null ? null : json["rememberMe"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "rememberMe": rememberMe,
      };
}
