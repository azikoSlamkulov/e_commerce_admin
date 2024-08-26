import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/product_repo.dart';

class SetProduct extends UseCase<bool, SetProductParams> {
  final ProductRepo productRepo;
  SetProduct(this.productRepo);

  @override
  Future<Either<Failure, bool>> call(SetProductParams params) async {
    return await productRepo.setProduct(
      product: params.product,
    );
  }
}

class SetProductParams extends Equatable {
  final ProductDatailEntity product;

  const SetProductParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
