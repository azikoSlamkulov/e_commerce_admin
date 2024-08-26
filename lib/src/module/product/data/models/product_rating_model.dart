import '../../domain/entities/product_rating_entity.dart';

class ProductRatingModel extends ProductRatingEntity {
  const ProductRatingModel({
    final String? productId,
    final String? userId,
    final double? totalRating,
    final int? totalUser,
    final int? one,
    final int? two,
    final int? three,
    final int? four,
    final int? five,
  }) : super(
          productId: productId,
          userId: userId,
          totalRating: totalRating,
          totalUser: totalUser,
          one: one,
          two: two,
          three: three,
          four: four,
          five: five,
        );

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) =>
      ProductRatingModel(
        productId: json['productId'] as String,
        userId: json['userId'] as String,
        totalRating: json['totalRating'] as double,
        totalUser: json['totalUser'] as int,
        one: json['one'] as int,
        two: json['two'] as int,
        three: json['three'] as int,
        four: json['four'] as int,
        five: json['five'] as int,
      );

  Map<String, dynamic> toJson() => {
        "productId": productId ?? '',
        "userId": userId ?? '',
        "totalRating": totalRating ?? 0.0,
        "totalUser": totalUser ?? 0,
        "one": one ?? 0,
        "two": two ?? 0,
        "three": three ?? 0,
        "four": four ?? 0,
        "five": five ?? 0,
      };

  // @override
  // List<Object?> get props => [
  //       totalRating,
  //       totalUser,
  //       one,
  //       two,
  //       three,
  //       four,
  //       five,
  //     ];
}
