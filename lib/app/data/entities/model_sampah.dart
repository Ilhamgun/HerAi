import 'dart:convert';

DataSampahResponse dataSampahResponseFromMap(String str) =>
    DataSampahResponse.fromMap(json.decode(str));

String dataSampahResponseToMap(DataSampahResponse data) =>
    json.encode(data.toMap());

class DataSampahResponse {
  DataSampahResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<TrashResult> data;

  factory DataSampahResponse.empty() =>
      DataSampahResponse(success: false, data: []);

  factory DataSampahResponse.fromMap(Map<String, dynamic> json) =>
      DataSampahResponse(
        success: json["success"] == null ? false : json["success"],
        data: json["data"] == null
            ? []
            : List<TrashResult>.from(
                json["data"].map((x) => TrashResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class TrashCategory {
  TrashCategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory TrashCategory.fromMap(Map<String, dynamic> json) => TrashCategory(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "" : json["name"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class TrashResult {
  TrashResult({
    required this.categoryId,
    required this.category,
    required this.trashs,
  });

  int categoryId;
  String category;
  List<Trash> trashs;

  factory TrashResult.empty() =>
      TrashResult(categoryId: 0, category: '', trashs: []);

  factory TrashResult.fromMap(Map<String, dynamic> json) => TrashResult(
        categoryId: json["category_id"] == null ? 0 : json["category_id"],
        category: json["category"] == null ? '' : json["category"],
        trashs: json["trashs"] == null
            ? []
            : List<Trash>.from(json["trashs"].map((x) => Trash.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category": category,
        "trashs": List<dynamic>.from(trashs.map((x) => x.toMap())),
      };
}

class Trash {
  Trash({
    required this.id,
    required this.name,
    required this.point,
    required this.price,
    required this.weight,
  });

  int id;
  String name;
  String point;
  String price;
  int weight;

  factory Trash.empty() =>
      Trash(id: 0, name: '', point: '', price: '0', weight: 0);

  factory Trash.fromMap(Map<String, dynamic> json) => Trash(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? '' : json["name"],
        point: json["point"] == null ? '' : json["point"],
        price: json["price"] == null ? '0' : json["price"],
        weight: json["weight"] == null ? 0 : json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "point": point,
        "price": price,
        'weight': weight,
      };
}
