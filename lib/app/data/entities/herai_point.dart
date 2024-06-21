// To parse this JSON data, do
//
//     final herAiPoint = herAiPointFromJson(jsonString);

// ignore_for_file: unused_import

import 'dart:convert';

import 'package:meta/meta.dart';

List<HerAiPoint> listHerAiPointFromJson(List<Map<String, dynamic>> json) =>
    List<HerAiPoint>.from(json.map((e) => HerAiPoint.fromMap(e)));

String listHerAiPointToJson(List<HerAiPoint> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

HerAiPoint herAiPointFromJson(String str) =>
    HerAiPoint.fromMap(json.decode(str));

String herAiPointToJson(HerAiPoint data) => json.encode(data.toJson());

class HerAiPoint {
  HerAiPoint({
    required this.pickupService,
    required this.dropPointService,
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.coordinate,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  String name;
  final String address;
  final String phoneNumber;
  final String coordinate;
  final int pickupService;
  final int dropPointService;
  final int isOpen;
  final String openTime;
  final String closeTime;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory HerAiPoint.fromMap(Map<String, dynamic> json) {
    String coordinate = json["coordinate"];
    List<double> coordinateDouble =
        coordinate.split(",").map((e) => double.parse(e)).toList();

    return HerAiPoint(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      address: json["address"] == null ? null : json["address"],
      phoneNumber: json["phone_number"] == null ? "" : json["phone_number"],
      coordinate: json["coordinate"] == null ? null : json["coordinate"],
      latitude: coordinateDouble[0],
      longitude: coordinateDouble[1],
      createdAt: json["created_at"] == null
          ? DateTime.now()
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? DateTime.now()
          : DateTime.parse(json["updated_at"]),
      pickupService:
          json["pickup_service"] == null ? 0 : json["pickup_service"],
      dropPointService:
          json["drop_point_service"] == null ? 0 : json["drop_point_service"],
      isOpen: json["is_open"] == null ? 0 : json["is_open"],
      openTime: json["open_time"] == null ? '' : json["open_time"],
      closeTime: json["close_time"] == null ? '' : json["close_time"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "coordinate": coordinate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pickup_service": pickupService,
        "drop_point_service": dropPointService,
        "is_open": isOpen,
        "open_time": openTime,
        "close_time": closeTime,
      };

  factory HerAiPoint.empty() => HerAiPoint(
        id: 1,
        name: "name",
        address: "address",
        phoneNumber: "phoneNumber",
        coordinate: "1,1",
        latitude: 0.0,
        longitude: 0.0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        pickupService: 0,
        closeTime: '',
        dropPointService: 0,
        isOpen: 0,
        openTime: '',
      );
}
