import 'dart:convert';

Items cartFromMap(String str) => Items.fromMap(json.decode(str));

String cartToMap(Items data) => json.encode(data.toMap());

class Items {
  Items({
    required this.image,
    required this.name,
    required this.weight,
    required this.hp,
    this.selected = false,
  });
  final String image;
  final String name;
  final int weight;
  final int hp;
  bool selected;

  factory Items.empty() => Items(image: '', name: '', weight: 0, hp: 0);
  factory Items.fromMap(Map<String, dynamic> json) => Items(
        image: json["image"] == null ? '' : json["image"],
        name: json["name"] == null ? '' : json["name"],
        weight: json["weight"] == null ? 0 : json["weight"],
        hp: json["hp"] == null ? 0 : json["hp"],
        selected: json["selected"] == null ? false : json["selected"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "name": name,
        "weight": weight,
        "hp": hp,
      };
}
