import 'dart:convert';

Cart cartFromMap(String str) => Cart.fromMap(json.decode(str));

String cartToMap(Cart data) => json.encode(data.toMap());

class Cart {
  Cart({
    required this.totalItems,
    required this.totalPrice,
    required this.items,
  });

  int totalItems;
  int totalPrice;
  List<CartItem> items;

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        totalItems: json["total_items"] == null ? 0 : json["total_items"],
        totalPrice: json["total_price"] == null ? 0 : json["total_price"],
        items: json["items"] == null
            ? []
            : List<CartItem>.from(
                json["items"].map((x) => CartItem.fromMap(x))),
      );

  factory Cart.empty() => Cart(totalItems: 0, totalPrice: 0, items: []);

  Map<String, dynamic> toMap() => {
        "total_items": totalItems,
        "total_price": totalPrice,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class CartItem {
  CartItem({
    required this.id,
    required this.name,
    required this.weight,
    required this.price,
    required this.picture,
  });

  int id;
  String name;
  int weight;
  int price;
  String picture;
  bool selected = false;

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "" : json["name"],
        weight: json["weight"] == null ? 0 : json["weight"],
        price: json["price"] == null ? 0 : json["price"],
        picture: json["picture"] == null ? "" : json["picture"],
      );

  factory CartItem.empty() =>
      CartItem(id: 0, name: "agus", weight: 0, price: 0, picture: "");

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "weight": weight,
        "price": price,
        "picture": picture,
      };
}
