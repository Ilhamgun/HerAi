// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromMap(jsonString);

import 'dart:convert';

GetUserResponse getUserResponseFromMap(String str) =>
    GetUserResponse.fromMap(json.decode(str));

String getUserResponseToMap(GetUserResponse data) => json.encode(data.toMap());

class GetUserResponse {
  GetUserResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Profile> data;

  factory GetUserResponse.fromMap(Map<String, dynamic> json) => GetUserResponse(
        success: json["success"] == null ? false : json["success"],
        message: json["message"] == null ? 'Failed' : json["message"],
        data: json["data"] == null
            ? []
            : List<Profile>.from(json["data"].map((x) => Profile.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Profile {
  Profile({
    required this.userId,
    required this.username,
    required this.userPassword,
    required this.userEmail,
    required this.photoURL,
  });

  int userId;
  String username;
  String userPassword;
  String userEmail;
  String photoURL;

  factory Profile.empty() => Profile(
        userId: 0,
        username: '',
        userPassword: '',
        userEmail: '',
        photoURL: '',
      );

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        userId: json["user_id"] == null ? 0 : json["user_id"],
        username: json["username"] == null ? '' : json["username"],
        userPassword:
            json["user_password"] == null ? '' : json["user_password"],
        userEmail: json["user_email"] == null ? '' : json["user_email"],
        photoURL: json["photo_url"] == null ? '' : json["photo_url"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "username": username,
        "user_password": userPassword,
        "user_email": userEmail,
        "photo_url": photoURL,
      };
}
