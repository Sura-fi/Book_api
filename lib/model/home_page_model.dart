import 'dart:convert';

List<Books> booksFromJson(String str) => List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

String booksToJson(List<Books> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Books {
    final int? id;
    final String? name;
    final String? type;
    final bool? available;

    Books({
        this.id,
        this.name,
        this.type,
        this.available,
    });

    factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "available": available,
    };
}
