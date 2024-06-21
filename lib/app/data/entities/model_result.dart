class ModelResult {
  ModelResult({
    required this.confidence,
    required this.index,
    required this.label,
  });

  double confidence;
  int index;
  String label;

  factory ModelResult.fromMap(Map<String, dynamic> json) => ModelResult(
        confidence:
            json["confidence"] == null ? 0 : json["confidence"].toDouble(),
        index: json["index"] == null ? 0 : json["index"],
        label:
            json["label"] == null ? 'camera_result_recyclable' : json["label"],
      );

  Map<String, dynamic> toMap() => {
        "confidence": confidence,
        "index": index,
        "label": label,
      };
}
