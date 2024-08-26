import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';
import 'package:equatable/equatable.dart';

class ProductDatailEntity extends Equatable {
  final String? id;
  final CategoryEntity? category;
  final String? brand;
  final String? color;
  final List<ProductColorEntity>? colorAndSizes;
  //final List<ProductSizeEntity>? sizes;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  final int? quantity;
  final String? description;
  final ProductRatingEntity? rating;
  final double? totalRating;
  final int? totalUser;
  final List<dynamic>? reviews;
  final String? imgUrl;
  final List<String>? imgUrlList;
  final String? createdDate;

  const ProductDatailEntity({
    this.id,
    this.category,
    this.brand,
    this.color,
    this.colorAndSizes,
    //this.sizes,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    this.quantity,
    this.description,
    this.rating,
    this.totalRating,
    this.totalUser,
    this.reviews,
    this.imgUrl,
    this.imgUrlList,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        brand,
        price,
        brand,
        color,
        colorAndSizes,
        //sizes,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        quantity,
        description,
        rating,
        totalRating,
        totalUser,
        reviews,
        imgUrl,
        imgUrlList,
        createdDate,
      ];
}
