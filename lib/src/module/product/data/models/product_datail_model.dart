import 'dart:convert';

import 'package:e_commerce_admin/src/module/product/data/models/category_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_color_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_rating_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_review_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_size_model.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';

ProductDatailModel productDatailFromJson(Map docMap) =>
    ProductDatailModel.fromJson(docMap as Map<String, dynamic>);

String productDatailToJson(ProductDatailModel data) =>
    json.encode(data.toJson());

class ProductDatailModel extends ProductDatailEntity {
  const ProductDatailModel({
    final String? id,
    final CategoryEntity? category,
    final String? brand,
    final String? color,
    final List<ProductColorEntity>? colorAndSizes,
    //final List<ProductSizeEntity>? sizes,
    final bool? isNew,
    final bool? isSale,
    final int? sale,
    final double? price,
    final double? newPrice,
    final int? quantity,
    final String? description,
    final ProductRatingEntity? rating,
    final double? totalRating,
    final int? totalUser,
    final List<dynamic>? reviews,
    final String? imgUrl,
    final List<String>? imgUrlList,
    final String? createdDate,
  }) : super(
          id: id,
          category: category,
          brand: brand,
          color: color,
          colorAndSizes: colorAndSizes,
          //sizes: sizes,
          isNew: isNew,
          isSale: isSale,
          sale: sale,
          price: price,
          newPrice: newPrice,
          quantity: quantity,
          description: description,
          rating: rating,
          totalRating: totalRating,
          totalUser: totalUser,
          reviews: reviews,
          imgUrl: imgUrl,
          imgUrlList: imgUrlList,
          createdDate: createdDate,
        );

  factory ProductDatailModel.fromJson(Map<String, dynamic> json) =>
      ProductDatailModel(
        id: json['id'] as String,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : const CategoryModel(),
        brand: json['brand'] as String,
        // colors: (json['colors'] as List<dynamic>)
        //     .map((e) => ProductColorModel.fromJson(e))
        //     .toList(),
        color: json['color'] as String,
        colorAndSizes: (json['colorAndSizes'] as List<dynamic>)
            .map((e) => ProductColorModel.fromJson(e))
            .toList(),
        // colorAndSizes: json['colorAndSizes'] != null
        //     ? ProductColorEndSizesModel.fromJson(json['colorAndSizes'])
        //     : const ProductColorEndSizesModel(),
        // sizes: (json['sizes'] as List<dynamic>)
        //     .map((e) => ProductSizeModel.fromJson(e))
        //     .toList(),
        isNew: json['isNew'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        quantity: json['quantity'] as int,
        description: json['description'] as String,
        rating: json['rating'] != null
            ? ProductRatingModel.fromJson(json['rating'])
            : const ProductRatingModel(),
        totalRating: json['totalRating'] as double,
        totalUser: json['totalUser'] as int,
        reviews: (json['reviews'] as List<dynamic>)
            .map((e) => ProductReviewModel.fromJson(e))
            .toList(),
        imgUrl: json['imgUrl'] as String,
        imgUrlList: (json['imgUrlList'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "category": CategoryModel(
          id: '',
          typeName: category!.typeName,
          collectionName: category!.collectionName,
          categoryName: category!.categoryName,
        ).toJson(),
        "brand": brand ?? '',
        "color": color ?? '',
        "colorAndSizes": colorAndSizes!
            .map((item) => ProductColorModel(
                  colorName: item.colorName,
                  colorSizes: ProductSizeModel(
                    xs: item.colorSizes!.xs,
                    s: item.colorSizes!.s,
                    l: item.colorSizes!.l,
                    m: item.colorSizes!.m,
                    xl: item.colorSizes!.xl,
                  ),
                ).toJson())
            .toList(),
        // "colorAndSizes": ProductColorEndSizesModel(
        //   color: colorAndSizes!.color,
        //   colorSizes: SizeModel(
        //     xs: colorAndSizes!.colorSizes!.xs,
        //     s: colorAndSizes!.colorSizes!.s,
        //     l: colorAndSizes!.colorSizes!.l,
        //     m: colorAndSizes!.colorSizes!.m,
        //     xl: colorAndSizes!.colorSizes!.xl,
        //     totalSizes: colorAndSizes!.colorSizes!.totalSizes,
        //   ),
        // ).toJson(),
        // "colorAndSizes": colorAndSizes ??
        //     ProductColorEndSizesModel(
        //       color: '',
        //       colorSizes: const SizeModel().toJson(),
        //       // sizes: sizes!
        //       //     .map((item) => ProductSizeModel(
        //       //           quantity: item.quantity,
        //       //           size: item.size,
        //       //         ).toJson())
        //       //     .toList(),
        //       //totalQuantity: 0,
        //     ).toJson(),
        // "colors": colors!
        //     .map((item) => ProductColorModel(
        //           quantity: item.quantity,
        //           color: item.color,
        //         ).toJson())
        //     .toList(),
        // "sizes": sizes!
        //     .map((item) => ProductSizeModel(
        //           quantity: item.quantity,
        //           size: item.size,
        //         ).toJson())
        //     .toList(),
        "isNew": isNew ?? true,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0.0,
        "quantity": quantity ?? 0,
        "description": description ?? '',
        "rating": rating ??
            const ProductRatingModel(
              totalRating: 0,
              totalUser: 0,
              one: 0,
              two: 0,
              three: 0,
              four: 0,
              five: 0,
            ).toJson(),
        "totalRating": totalRating ?? 0.0,
        "totalUser": totalUser ?? 0,
        "reviews": reviews!
            .map((item) => ProductReviewModel(
                  reviewId: item.reviewId,
                  productId: item.productId,
                  userId: item.userId,
                  userName: item.userName,
                  rate: item.rate,
                  reviewText: item.reviewText,
                  userPhotoUrl: item.userPhotoUrl,
                  imgUrlList: item.imgUrlList,
                  createdDate: createdDate,
                ).toJson())
            .toList(),
        "imgUrl": imgUrl ?? '',
        "imgUrlList": imgUrlList ?? [],
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
