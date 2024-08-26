import 'package:e_commerce_admin/src/module/product/data/models/product_datail_model.dart';

import '../../../../core/data/remote/firebase/firestore.dart';
import '../models/product_model.dart';

abstract class RemoteProducts {
  Future<ProductDatailModel> getProductDatails({required String productId});
  Future<bool> setProduct({
    required ProductModel product,
    required ProductDatailModel productDatail,
  });
  Future<String> getProductID();
  //Future<ProductModel> getProduct({required String productID});
  Future<List<ProductModel>> getAllProducts();
  // Future<List<ProductModel>> getAllSortedProductsByQuery({
  //   required String fieldName,
  //   required dynamic query,
  // });
  // Future<bool?> checkProductExist({required productID});
}

class RemoteProductsImpl implements RemoteProducts {
  final FirestoreCore firestore;

  RemoteProductsImpl({required this.firestore});

  @override
  Future<ProductDatailModel> getProductDatails(
      {required String productId}) async {
    return await firestore.getDocFromSecondCollection(
      firstDocId: productId,
      secondDocId: productId,
      firstCollectionName: 'products',
      secondCollectionName: 'productDatails',
      fromJson: productDatailFromJson,
    );
  }

  @override
  Future<String> getProductID() async {
    return await firestore.getId(
      collectionName: 'products',
    );
  }

  @override
  Future<bool> setProduct({
    required ProductModel product,
    required ProductDatailModel productDatail,
  }) async {
    final isProductAdded = await firestore.create(
      docId: product.id!,
      objectModel: product,
      collection: 'products',
    );
    final isProductDatailAdded = await firestore.setTwoCollections(
      firstCollectionName: 'products',
      secondCollectionName: 'productDatails',
      firstDocId: product.id!,
      secondDocId: product.id!,
      objectModel: productDatail,
    );
    return isProductDatailAdded;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return await firestore.getList(
      collectionName: 'products',
      fromJson: productFromJson,
    );
  }
}
