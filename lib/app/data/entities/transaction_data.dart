import 'dart:convert';

TransactionData transactionDataFromMap(String str) =>
    TransactionData.fromMap(json.decode(str));

String transactionDataToMap(TransactionData data) => json.encode(data.toMap());

class TransactionData {
  TransactionData({
    required this.id,
    required this.userId,
    required this.pointId,
    required this.courierId,
    required this.number,
    required this.totalItems,
    required this.totalWeight,
    required this.totalPrice,
    required this.address,
    required this.coordinate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int pointId;
  int courierId;
  String number;
  int totalItems;
  int totalWeight;
  int totalPrice;
  String address;
  String coordinate;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory TransactionData.fromMap(Map<String, dynamic> json) => TransactionData(
        id: json["id"] == null ? 0 : json["id"],
        userId: json["user_id"] == null ? 0 : json["user_id"],
        pointId: json["point_id"] == null ? 0 : json["point_id"],
        courierId: json["courier_id"] == null ? 0 : json["courier_id"],
        number: json["number"] == null ? "" : json["number"],
        totalItems: json["total_items"] == null ? 1 : json["total_items"],
        totalWeight: json["total_weight"] == null ? 1 : json["total_weight"],
        totalPrice: json["total_price"] == null ? 1 : json["total_price"],
        address: json["address"] == null ? "" : json["address"],
        coordinate: json["coordinate"] == null ? "" : json["coordinate"],
        status: json["status"] == null ? "" : json["status"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "point_id": pointId,
        "courier_id": courierId,
        "number": number,
        "total_items": totalItems,
        "total_weight": totalWeight,
        "total_price": totalPrice,
        "address": address,
        "coordinate": coordinate,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
