//
// BaseListResponse baseListResponseFromMap<T>(String str,
//     Function(List<Map<String, dynamic>>) build) =>
//     BaseListResponse<T>.fromMap(json.decode(str), (data) => build(data));
//
// class BaseListResponse<T> {
//   BaseListResponse({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   bool success;
//   String? message;
//   List<T>? data;
//
//   factory BaseListResponse.fromMap(Map<String, dynamic> json,
//       Function(List<Map<String, dynamic>>) build) =>
//       BaseListResponse<T>(
//         success: json["success"] == null ? false : json["success"],
//         message: json["message"] == null ? null : json["message"],
//         data: json["data"] == null ? [] : build(json["data"]),
//       );
// }

import 'dart:convert';

BaseListResponse<T> baseListResponseFromMap<T>(
        String str, Function(Map<String, dynamic>) build) =>
    BaseListResponse<T>.fromMap(json.decode(str), build);

class BaseListResponse<T> {
  BaseListResponse(
      {required this.success, required this.data, required this.message});

  bool success;
  List<T> data;
  String message;

  factory BaseListResponse.fromMap(
          Map<String, dynamic> json, Function(Map<String, dynamic>) build) =>
      BaseListResponse<T>(
          success: json["success"] == null ? null : json["success"],
          data: json["data"] == null
              ? []
              : List<T>.from(json["data"].map((x) => build(x))),
          message: json["message"] == null ? "" : json["message"]);

  Map<String, dynamic> toMap(Function(T) build) => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => build(x)))
      };
}
