import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/core/error/failure.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_small_image_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/repositories/product_image_repo.dart';

class GetAllProductSmallImages {
  final ProductImageRepo productImageRepo;
  GetAllProductSmallImages(this.productImageRepo);

  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages() async {
    return await productImageRepo.getAllProductSmallImages();
  }
}
