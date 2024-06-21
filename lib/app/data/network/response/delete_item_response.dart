import 'dart:convert';

DeleteItem deleteItemFromMap(String str) =>
    DeleteItem.fromMap(json.decode(str));

String deleteItemToMap(DeleteItem data) => json.encode(data.toMap());

class DeleteItem {
  DeleteItem({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;

  factory DeleteItem.fromMap(Map<String, dynamic> json) => DeleteItem(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}
