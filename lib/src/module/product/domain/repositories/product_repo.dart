import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, bool>> setProduct(
      {required ProductDatailEntity product});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, ProductDatailEntity>> getProductDatails({
    required String productId,
  });
}
