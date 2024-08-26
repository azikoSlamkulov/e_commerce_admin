import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:equatable/equatable.dart';

class AdminProductColorEntity extends Equatable {
  final ProductColorEntity? color;
  final List<bool>? isSelectedColorsList;
  final List<bool>? isSelectedSizesList;

  const AdminProductColorEntity({
    this.color,
    this.isSelectedColorsList,
    this.isSelectedSizesList,
  });

  @override
  List<Object?> get props => [
        color,
        isSelectedColorsList,
        isSelectedSizesList,
      ];
}
