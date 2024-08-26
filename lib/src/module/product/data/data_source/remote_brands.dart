import '../../../../core/data/remote/firebase/firestore.dart';
import '../../domain/entities/brand_entity.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';

abstract class RemoteBrands {
  Future<String> getBrandID();
  Future<List<BrandModel>> getAllBrands();
  Future<bool> addBrand({
    required String brandName,
    required String id,
  });
  Future<bool> deleteBrand({
    required String id,
  });
}

class RemoteBrandsImpl implements RemoteBrands {
  final FirestoreCore firestore;

  RemoteBrandsImpl({required this.firestore});

  @override
  Future<String> getBrandID() async {
    return await firestore.getId(
      collectionName: 'brands',
    );
  }

  @override
  Future<List<BrandModel>> getAllBrands() async {
    return await firestore.getList(
      collectionName: 'brands',
      fromJson: brandFromJson,
    );
  }

  @override
  Future<bool> addBrand({required String brandName, required String id}) async {
    final brandModel = BrandModel(
      id: id,
      name: brandName,
    );
    return await firestore.create(
      docId: id,
      objectModel: brandModel,
      collection: 'brands',
    );
  }

  @override
  Future<bool> deleteBrand({
    required String id,
  }) async {
    return await firestore.delete(
      docId: id,
      collectionName: 'brands',
    );
  }
}
