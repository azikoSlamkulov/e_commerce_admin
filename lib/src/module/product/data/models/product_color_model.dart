import 'dart:convert';

import 'package:e_commerce_admin/src/module/product/data/models/product_size_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_color_entity.dart';

ProductColorModel productColorFromJson(Map docMap) =>
    ProductColorModel.fromJson(docMap as Map<String, dynamic>);

String productColorToJson(ProductColorModel data) => json.encode(data.toJson());

// class ProductColorModel extends ProductColorEntity {
//   const ProductColorModel({
//     final int? quantity,
//     final String? color,
//   }) : super(
//           quantity: quantity,
//           color: color,
//         );

//   factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
//       ProductColorModel(
//         quantity: json['quantity'] as int,
//         color: json['color'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         "quantity": quantity ?? 0,
//         "color": color ?? '',
//       };
// }

class ProductColorModel extends ProductColorEntity {
  const ProductColorModel({
    final String? colorName,
    final Color? color,
    final ProductSizeModel? colorSizes,
    final List<String>? colorImages,
  }) : super(
          colorName: colorName,
          color: color,
          colorSizes: colorSizes,
          colorImages: colorImages,
        );

  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      ProductColorModel(
        colorName: json['colorName'] as String,
        color: json['color'] as Color,
        colorSizes: json['colorSizes'] != null
            ? ProductSizeModel.fromJson(json['colorSizes'])
            : const ProductSizeModel(),
        colorImages: (json['colorImages'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "colorName": colorName ?? '',
        "color": color ?? Colors.white,
        "colorSizes": ProductSizeModel(
          xs: colorSizes!.xs,
          s: colorSizes!.s,
          l: colorSizes!.l,
          m: colorSizes!.m,
          xl: colorSizes!.xl,
          totalSizes: colorSizes!.totalSizes,
        ).toJson(),
        "colorImages": colorImages ?? [],
      };
}
