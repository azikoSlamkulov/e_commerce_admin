import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductRatingAndReviewsEntity extends Equatable {
  final String? productId;
  final ProductRatingEntity? rating;
  final List<ProductReviewEntity>? reviews;

  const ProductRatingAndReviewsEntity({
    this.productId,
    this.rating,
    this.reviews,
  });

  @override
  List<Object?> get props => [
        productId,
        rating,
        reviews,
      ];
}
