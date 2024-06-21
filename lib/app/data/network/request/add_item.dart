import 'dart:convert';
import 'dart:io';

AddItem addItemFromMap(String str) => AddItem.fromMap(json.decode(str));

String addItemToMap(AddItem data) => json.encode(data.toMap());

class AddItem {
  AddItem({
    required this.itemid,
    required this.weight,
    this.picture,
  });

  int itemid;
  String weight;
  File? picture;

  factory AddItem.empty() => AddItem(itemid: 0, weight: '', picture: null);

  factory AddItem.fromMap(Map<String, dynamic> json) => AddItem(
        itemid: json["name"] == null ? '' : json["name"],
        weight: json["weight"] == null ? '' : json["weight"],
        picture: json["picture"] == null ? '' : json["picture"],
      );

  Map<String, dynamic> toMap() => {
        "item_id": itemid,
        "weight": weight,
        "picture": picture,
      };
}
