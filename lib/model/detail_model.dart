// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
    final int? id;
    final String? name;
    final String? author;
    final String? isbn;
    final String? type;
    final double? price;
    final int? currentStock;
    final bool? available;

    Detail({
        this.id,
        this.name,
        this.author,
        this.isbn,
        this.type,
        this.price,
        this.currentStock,
        this.available,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        name: json["name"],
        author: json["author"],
        isbn: json["isbn"],
        type: json["type"],
        price: json["price"]?.toDouble(),
        currentStock: json["current-stock"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author,
        "isbn": isbn,
        "type": type,
        "price": price,
        "current-stock": currentStock,
        "available": available,
    };
}
