import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_small_image_entity.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/brand_entity.dart';
import '../../domain/repositories/brands_repo.dart';
import '../../domain/repositories/product_image_repo.dart';
import '../data_source/remote_brands.dart';
import '../data_source/remote_product_image.dart';

class ProductImageRepoImpl implements ProductImageRepo {
  ProductImageRepoImpl({
    required this.remoteProductImage,
  });

  final RemoteProductImage remoteProductImage;

  // @override
  // Future<Either<Failure, List<String>>> getAllImages() async {
  //   try {
  //     final allBrands = await remoteBrand.getAllBrands();
  //     return Right(allBrands);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages() async {
    try {
      final allBrands = await remoteProductImage.getAllProductSmallImages();
      return Right(allBrands);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllProductBigImages({
    required String folderName,
  }) async {
    try {
      final allBrands = await remoteProductImage.getAllProductBigImages(
          folderName: folderName);
      return Right(allBrands);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> setProductImage({
    required String filePath,
    required String fileName,
  }) async {
    try {
      final productImageUrl = await remoteProductImage.setProductImage(
        filePath: filePath,
        fileName: fileName,
      );
      return Right(productImageUrl);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
