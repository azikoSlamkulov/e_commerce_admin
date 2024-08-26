import 'package:equatable/equatable.dart';

class ProductRatingEntity extends Equatable {
  final String? productId;
  final String? userId;
  final double? totalRating;
  final int? totalUser;
  final int? one;
  final int? two;
  final int? three;
  final int? four;
  final int? five;

  const ProductRatingEntity({
    this.productId,
    this.userId,
    this.totalRating,
    this.totalUser,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  @override
  List<Object?> get props => [
        productId,
        userId,
        totalRating,
        totalUser,
        one,
        two,
        three,
        four,
        five,
      ];
}
