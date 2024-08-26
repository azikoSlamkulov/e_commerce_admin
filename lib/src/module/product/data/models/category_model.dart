import 'dart:convert';

import '../../domain/entities/category_entity.dart';

CategoryModel categoryFromJson(Map docMap) =>
    CategoryModel.fromJson(docMap as Map<String, dynamic>);

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    id,
    typeName,
    collectionName,
    categoryName,
    // imageURL,
    // isCheked,
  }) : super(
          id: id,
          typeName: typeName,
          collectionName: collectionName,
          categoryName: categoryName,
          // imageURL: imageURL,
          // isCheked: isCheked,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as String,
        typeName: json['type'] as String,
        collectionName: json['collection'] as String,
        categoryName: json['category'] as String,
        // imageURL: json['imageURL'] as String,
        // isCheked: json['isCheked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "type": typeName ?? '',
        "collection": collectionName ?? '',
        "category": categoryName ?? '',
        // "imageURL": imageURL ?? '',
        // "isCheked": isCheked ?? false,
      };
}
