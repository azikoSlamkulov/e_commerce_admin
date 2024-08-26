import 'dart:convert';

import '../../domain/entities/product_size_entity.dart';

ProductSizeModel productSizeFromJson(Map docMap) =>
    ProductSizeModel.fromJson(docMap as Map<String, dynamic>);

String productSizeToJson(ProductSizeModel data) => json.encode(data.toJson());

// class ProductSizeModel extends ProductSizeEntity {
//   const ProductSizeModel({
//     final int? quantity,
//     final String? size,
//   }) : super(
//           quantity: quantity,
//           size: size,
//         );

//   factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
//       ProductSizeModel(
//         quantity: json['quantity'] as int,
//         size: json['size'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         "quantity": quantity ?? 0,
//         "size": size ?? '',
//       };
// }

int totalSizes({
  required int xs,
  required int s,
  required int l,
  required int m,
  required int xl,
}) {
  return xs + s + l + m + xl;
}

class ProductSizeModel extends ProductSizeEntity {
  const ProductSizeModel({
    final int? xs,
    final int? s,
    final int? l,
    final int? m,
    final int? xl,
    final int? totalSizes,
  }) : super(
          xs: xs,
          s: s,
          l: l,
          m: m,
          xl: xl,
          totalSizes: totalSizes,
        );

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      ProductSizeModel(
        xs: json['xs'] as int,
        s: json['s'] as int,
        l: json['l'] as int,
        m: json['m'] as int,
        xl: json['xl'] as int,
        totalSizes: json['totalSizes'] as int,
      );

  Map<String, dynamic> toJson() => {
        "xs": xs ?? 0,
        "s": s ?? 0,
        "l": l ?? 0,
        "m": m ?? 0,
        "xl": xl ?? 0,
        "totalSizes": totalSizes(
          xs: xs ?? 0,
          s: s ?? 0,
          l: l ?? 0,
          m: m ?? 0,
          xl: xl ?? 0,
        ),
      };
}
