import 'package:e_commerce_admin/src/module/product/domain/entities/product_size_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// class ProductColorEntity extends Equatable {
//   final int? quantity;
//   final String? color;

//   const ProductColorEntity({
//     this.quantity,
//     this.color,
//   });

//   @override
//   List<Object?> get props => [
//         quantity,
//         color,
//       ];
// }

class ProductColorEntity extends Equatable {
  final String? colorName;
  final Color? color;
  final ProductSizeEntity? colorSizes;
  final List<String>? colorImages;

  const ProductColorEntity({
    this.colorName,
    this.color,
    this.colorSizes,
    this.colorImages,
  });

  @override
  List<Object?> get props => [
        colorName,
        color,
        colorSizes,
        colorImages,
      ];
}
