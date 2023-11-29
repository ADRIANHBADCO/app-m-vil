import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String? id;
  String? name;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? idCategory;
  double? price;
  int? quantity;

  Product({
    this.id,
    this.name,
    this.description,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
    this.idCategory,
    this.price,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
        idCategory: json["id_category"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
      );

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    List<Product> toList = [];

    jsonList.forEach((item) {
      Product product = Product.fromJson(item);
      toList.add(product);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
        "id_category": idCategory,
        "price": price,
        "quantity": quantity,
      };
}
