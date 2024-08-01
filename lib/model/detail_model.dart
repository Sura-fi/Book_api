// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
    final int? id;
    final String? name;
    final String? author;
    final String? isbn;
    final String? type;
    final double? price;
    final int? currentStock;
    final bool? available;

    Details({
        this.id,
        this.name,
        this.author,
        this.isbn,
        this.type,
        this.price,
        this.currentStock,
        this.available,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
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
