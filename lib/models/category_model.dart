import 'dart:convert';

List<CategoryModel> categoryFromJson(str) => List<CategoryModel>.from(str.map((x) => CategoryModel.fromJson(x)));

String categoriesToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.title,
    this.parentId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  Title? title;
  int? parentId;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        parentId: json["parent_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "parent_id": parentId,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Title {
  Title({
    this.en,
    this.ar,
  });

  String? en;
  String? ar;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
