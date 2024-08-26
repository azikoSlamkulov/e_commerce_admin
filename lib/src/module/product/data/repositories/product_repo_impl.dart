import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/src/core/error/exception.dart';
import 'package:e_commerce_admin/src/module/product/data/models/category_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_datail_model.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repo.dart';
import '../data_source/remote_product.dart';
import '../models/product_model.dart';
import '../models/product_rating_model.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProducts remoteProduct;

  @override
  Future<Either<Failure, bool>> setProduct({
    required ProductDatailEntity product,
  }) async {
    try {
      final productID = await remoteProduct.getProductID();
      final isCreated = await remoteProduct.setProduct(
        product: ProductModel(
          id: productID,
          category: product.category,
          brand: product.brand,
          //colors: product.colors,
          color: product.color,
          //sizes: product.sizes,
          //isNew: product.isNew,
          // isSale: product.isSale,
          // sale: product.sale,
          price: product.price,
          //newPrice: product.newPrice,
          //quantity: product.quantity,
          //description: product.description,
          imgUrl: product.imgUrl,
          //imgUrlList: product.imgUrlList,
        ),
        productDatail: ProductDatailModel(
          id: productID,
          category: product.category,
          brand: product.brand,
          color: product.color,
          colorAndSizes: product.colorAndSizes,
          //sizes: product.sizes,
          price: product.price,
          quantity: product.quantity,
          description: product.description,
          rating: product.rating,
          reviews: product.reviews,
          imgUrl: product.imgUrl,
          imgUrlList: product.imgUrlList,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final allProducts = await remoteProduct.getAllProducts();
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDatailEntity>> getProductDatails(
      {required String productId}) async {
    try {
      log('productId ===>>>> $productId');
      final productDatails =
          await remoteProduct.getProductDatails(productId: productId);
      return Right(productDatails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
