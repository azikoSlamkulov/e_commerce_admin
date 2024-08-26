import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_small_image_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ProductImageRepo {
  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages();
  Future<Either<Failure, List<String>>> getAllProductBigImages(
      {required String folderName});

  Future<Either<Failure, String>> setProductImage({
    required String filePath,
    required String fileName,
  });
}
