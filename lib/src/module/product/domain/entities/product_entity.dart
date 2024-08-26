import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_size_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_review_entity.dart';
import 'package:equatable/equatable.dart';

import 'category_entity.dart';

class ProductEntity extends Equatable {
  final String? id;
  final CategoryEntity? category;
  final String? brand;
  final String? color;
  //final List<ProductSizeEntity>? sizes;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  //final int? quantity;
  //final String? description;
  //final ProductRatingEntity? rating;
  final double? totalRating;
  final int? totalUser;
  final String? imgUrl;
  //final List<String>? imgUrlList;
  final String? createdDate;

  const ProductEntity({
    this.id,
    this.category,
    this.brand,
    //this.colors,
    this.color,
    //this.sizes,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    //this.quantity,
    //this.description,
    //this.rating,
    this.totalRating,
    this.totalUser,
    //this.review,
    this.imgUrl,
    //this.imgUrlList,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        brand,
        price,
        brand,
        //colors,
        color,
        //sizes,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        //quantity,
        //description,
        //rating,
        totalRating,
        totalUser,
        //review,
        imgUrl,
        //imgUrlList,
        createdDate,
      ];
}


// class ProductEntity extends Equatable {
//   final String? id;
//   final CategoryEntity? category;
//   final String? brand;
//   final List<ProductColorEntity>? colors;
//   final List<ProductSizeEntity>? sizes;
//   final bool? isNew;
//   final bool? isSale;
//   final int? sale;
//   final double? price;
//   final double? newPrice;
//   final int? quantity;
//   final String? description;
//   final ProductRatingEntity? rating;
//   //final List<ReviewEntity>? review;
//   final String? imgUrl;
//   final String? createdDate;

//   const ProductEntity({
//     this.id,
//     this.category,
//     this.brand,
//     this.colors,
//     this.sizes,
//     this.isNew,
//     this.isSale,
//     this.sale,
//     this.price,
//     this.newPrice,
//     this.quantity,
//     this.description,
//     this.rating,
//     //this.review,
//     this.imgUrl,
//     this.createdDate,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         category,
//         brand,
//         price,
//         brand,
//         colors,
//         sizes,
//         isNew,
//         isSale,
//         sale,
//         price,
//         newPrice,
//         quantity,
//         description,
//         rating,
//         //review,
//         imgUrl,
//         createdDate,
//       ];
// }
