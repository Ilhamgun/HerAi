import 'dart:convert';

class Notification {
  Notification({
    required this.id,
    required this.data,
    // required this.readAt,
    required this.createdAt,
  });

  String id;
  NotificationData data;
  // dynamic readAt;
  DateTime createdAt;

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
        id: json["id"] == null ? null : json["id"],
        data: json["data"] == null
            ? NotificationData.empty()
            : NotificationData.fromMap(json["data"]),
        // readAt: json["read_at"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data.toMap(),
        // "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
      };
}

class NotificationData {
  NotificationData({
    required this.title,
    required this.message,
  });

  String title;
  String message;

  factory NotificationData.empty() => NotificationData(title: "", message: "");

  factory NotificationData.fromMap(Map<String, dynamic> json) =>
      NotificationData(
        title: json["title"] == null ? '' : json["title"],
        message: json["message"] == null ? '' : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "message": message,
      };
}

class SimpleNotificationData {
  String type;

  SimpleNotificationData({
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  factory SimpleNotificationData.fromMap(Map<String, dynamic> map) {
    return SimpleNotificationData(
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleNotificationData.fromJson(String source) =>
      SimpleNotificationData.fromMap(json.decode(source));
}
