import 'dart:convert';

BaseResponse baseResponseFromMap<T>(
        String str, Function(Map<String, dynamic>) build) =>
    BaseResponse<T>.fromMap(json.decode(str), (data) => build(data));

class BaseResponse<T> {
  BaseResponse(
      {required this.success,
      required this.message,
      required this.data,
      required this.item});

  bool success;
  String message;
  T? data;
  T? item;

  factory BaseResponse.fromMap(
      Map<String, dynamic> json, Function(Map<String, dynamic>) build) =>
      BaseResponse<T>(
        success: json["success"] == null ? false : json["success"],
        message: json["message"] == null ? '' : json["message"],
        data: json["data"] == null ? null : build(json["data"]),
        item: json["item"] == null ? null : build(json["item"]),
      );

  factory BaseResponse.fromListMap(
      Map<String, dynamic> json, Function(List<dynamic>) build) =>
      BaseResponse<T>(
        success: json["success"] == null ? false : json["success"],
        message: json["message"] == null ? '' : json["message"],
        data: json["data"] == null ? null : build(json["data"]),
        item: json["item"] == null ? null : build(json["item"]),
      );
}
