import 'dart:convert';

ModelResultCloud modelResultCloudFromMap(String str) =>
    ModelResultCloud.fromMap(json.decode(str));

String modelResultCloudToMap(ModelResultCloud data) =>
    json.encode(data.toMap());

class ModelResultCloud {
  ModelResultCloud({
    required this.classEnum,
    required this.confidenceLevel,
  });

  String classEnum;
  double confidenceLevel;

  factory ModelResultCloud.fromMap(Map<String, dynamic> json) =>
      ModelResultCloud(
        classEnum: json["class_enum"] == null ? null : json["class_enum"],
        confidenceLevel: json["confidence_level"] == null
            ? null
            : json["confidence_level"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "class_enum": classEnum,
        "confidence_level": confidenceLevel,
      };
}
