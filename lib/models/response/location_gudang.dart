import 'dart:convert';

LocationGudang locationGudangFromJson(String str) =>
    LocationGudang.fromJson(json.decode(str));

String locationGudangToJson(LocationGudang data) => json.encode(data.toJson());

class LocationGudang {
  LocationGudang({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory LocationGudang.fromJson(Map<String, dynamic> json) => LocationGudang(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.coordinate,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  String address;
  String phoneNumber;
  String coordinate;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        coordinate: json["coordinate"] == null ? null : json["coordinate"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "coordinate": coordinate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
