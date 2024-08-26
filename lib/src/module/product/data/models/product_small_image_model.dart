import 'dart:convert';

import 'package:e_commerce_admin/src/module/product/domain/entities/product_small_image_entity.dart';

ProductSmallImageModel productSmallImageFromJson(Map docMap) =>
    ProductSmallImageModel.fromJson(docMap as Map<String, dynamic>);

String productSmallImageToJson(ProductSmallImageModel data) =>
    json.encode(data.toJson());

class ProductSmallImageModel extends ProductSmallImageEntity {
  const ProductSmallImageModel({
    final String? imageUrl,
    final String? imageName,
  }) : super(
          imageUrl: imageUrl,
          imageName: imageName,
        );

  factory ProductSmallImageModel.fromJson(Map<String, dynamic> json) =>
      ProductSmallImageModel(
        imageUrl: json['imageUrl'] as String,
        imageName: json['imageName'] as String,
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl ?? '',
        "imageName": imageName ?? '',
      };
}
