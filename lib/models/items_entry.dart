// To parse this JSON data, do
//
//     final itemsEntry = itemsEntryFromJson(jsonString);

import 'dart:convert';

List<ItemsEntry> itemsEntryFromJson(String str) => List<ItemsEntry>.from(json.decode(str).map((x) => ItemsEntry.fromJson(x)));

String itemsEntryToJson(List<ItemsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemsEntry {
    String id;
    String title;
    int price;
    String content;
    String category;
    String thumbnail;
    int storeViews;
    DateTime createdAt;
    bool isFeatured;
    int? userId;
    String? username;

    ItemsEntry({
        required this.id,
        required this.title,
        required this.price,
        required this.content,
        required this.category,
        required this.thumbnail,
        required this.storeViews,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
        required this.username,
    });

    factory ItemsEntry.fromJson(Map<String, dynamic> json) => ItemsEntry(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        content: json["content"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        storeViews: json["store_views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "content": content,
        "category": category,
        "thumbnail": thumbnail,
        "store_views": storeViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
        "username": username,
    };
}
