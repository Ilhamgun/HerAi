// To parse this JSON data, do
//
//     final registerEmailRequest = registerEmailRequestFromMap(jsonString);

import 'dart:convert';

RegisterEmailRequest registerEmailRequestFromMap(String str) =>
    RegisterEmailRequest.fromMap(json.decode(str));

String registerEmailRequestToMap(RegisterEmailRequest data) =>
    json.encode(data.toMap());

class RegisterEmailRequest {
  RegisterEmailRequest({
    required this.email,
    required this.name,
    required this.password,
    required this.passwordConfirmation,
  });

  String email;
  String name;
  String password;
  String passwordConfirmation;

  factory RegisterEmailRequest.fromMap(Map<String, dynamic> json) =>
      RegisterEmailRequest(
        email: json["email"] == null ? '' : json["email"],
        name: json["name"] == null ? '' : json["name"],
        password: json["password"] == null ? '' : json["password"],
        passwordConfirmation: json["password_confirmation"] == null
            ? ''
            : json["password_confirmation"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
