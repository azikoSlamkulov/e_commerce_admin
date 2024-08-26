import 'package:equatable/equatable.dart';

// class ProductSizeEntity extends Equatable {
//   final int? quantity;
//   final String? size;

//   const ProductSizeEntity({
//     this.quantity,
//     this.size,
//   });

//   @override
//   List<Object?> get props => [
//         quantity,
//         size,
//       ];
// }

class ProductSizeEntity extends Equatable {
  final int? xs;
  final int? s;
  final int? l;
  final int? m;
  final int? xl;
  final int? totalSizes;

  const ProductSizeEntity({
    this.xs,
    this.s,
    this.l,
    this.m,
    this.xl,
    this.totalSizes,
  });

  @override
  List<Object?> get props => [
        xs,
        s,
        l,
        m,
        xl,
        totalSizes,
      ];
}
