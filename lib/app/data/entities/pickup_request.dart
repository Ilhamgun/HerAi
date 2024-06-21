class PickupRequest {
  PickupRequest({
    required this.pointId,
    required this.locationName,
    required this.note,
    required this.address,
    required this.coordinate,
    required this.items,
  });

  String pointId;
  String locationName;
  String note;
  String address;
  String coordinate;
  List<int> items;

  factory PickupRequest.fromMap(Map<String, dynamic> json) => PickupRequest(
        pointId: json["point_id"] == null ? 0 : json["point_id"],
        address: json["address"] == null ? "" : json["address"],
        locationName:
            json["location_name"] == null ? "" : json["location_name"],
        note: json["note"] == null ? "" : json["note"],
        coordinate: json["coordinate"] == "" ? null : json["coordinate"],
        items: json["items"] == null
            ? []
            : List<int>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "point_id": pointId,
        "address": address,
        "location_name": locationName,
        "note": note,
        "coordinate": coordinate,
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}
