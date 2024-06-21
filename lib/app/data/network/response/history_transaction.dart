import 'dart:convert';

HistoryTranscation historyTranscationFromMap(String str) =>
    HistoryTranscation.fromMap(json.decode(str));

String historyTranscationToMap(HistoryTranscation data) =>
    json.encode(data.toMap());

class HistoryTranscation {
  HistoryTranscation({
    required this.success,
    required this.data,
  });

  bool success;
  List<Transaction> data;

  factory HistoryTranscation.fromMap(Map<String, dynamic> json) =>
      HistoryTranscation(
        success: json["success"] == null ? false : json["success"],
        data: json["data"] == null
            ? []
            : List<Transaction>.from(
                json["data"].map((x) => Transaction.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.userId,
    required this.number,
    required this.totalItems,
    required this.totalWeight,
    required this.totalPrice,
    required this.isActive,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String userId;
  String number;
  String totalItems;
  String totalWeight;
  String totalPrice;
  String isActive;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        number: json["number"] == null ? null : json["number"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        totalWeight: json["total_weight"] == null ? null : json["total_weight"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        status: json["status"] == null ? null : json["status"],
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
        "number": number,
        "total_items": totalItems,
        "total_weight": totalWeight,
        "total_price": totalPrice,
        "is_active": isActive,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
