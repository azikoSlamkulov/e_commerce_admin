import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_admin/src/module/product/data/models/product_small_image_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageCore {
  Future<String> uploadImages({
    required String collectionName,
    required String filePath,
    required String fileName,
  });
  Future<List<String>> getImagesUrl({
    required String collectionName,
    //required String fileName,
  });
  Future<List<ProductSmallImageModel>> getSmallImages({
    required String collectionName,
    //required String fileName,
  });
  Future<List<String>> getImagesUrlByFolderName({
    required String collectionName,
    required String folderName,
  });
  // Future<T> get<T>({
  //   required String id,
  //   required String collectionName,
  //   required T Function(Map body) fromJson,
  // });
}

class FirebaseStorageCoreImpl implements FirebaseStorageCore {
  final FirebaseStorage fbStorage;

  FirebaseStorageCoreImpl({required this.fbStorage});

  @override
  Future<String> uploadImages({
    required String collectionName,
    required String filePath,
    required String fileName,
  }) async {
    File file = File(filePath);

    log('filePath ==> $filePath');
    log('fileName ==> $fileName');

    try {
      final uploadedFile =
          await fbStorage.ref('$collectionName/$fileName').putFile(file);

      final im = await uploadedFile.ref.getDownloadURL();
      //log(_im);

      return im;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<String>> getImagesUrl({
    required String collectionName,
    //required String fileName,
  }) async {
    //log('fileName ==> $fileName');
    List<String> imagesLIst = [];

    try {
      // final imageUrl =
      //     await fbStorage.ref('$collectionName/$fileName').getDownloadURL();
      final imageUrl = await fbStorage.ref(collectionName).listAll();
      for (var item in imageUrl.items) {
        // The items under storageRef.
        final url = await item.getDownloadURL();
        imagesLIst.add(url);
      }

      return imagesLIst;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ProductSmallImageModel>> getSmallImages({
    required String collectionName,
    //required String fileName,
  }) async {
    //log('fileName ==> $fileName');
    List<ProductSmallImageModel> imagesLIst = [];

    try {
      // final imageUrl =
      //     await fbStorage.ref('$collectionName/$fileName').getDownloadURL();
      final imageUrl = await fbStorage.ref(collectionName).listAll();
      for (var item in imageUrl.items) {
        // The items under storageRef.
        final url = await item.getDownloadURL();
        imagesLIst.add(
          ProductSmallImageModel(
            imageName: item.name,
            imageUrl: url,
          ),
        );
      }

      return imagesLIst;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<String>> getImagesUrlByFolderName({
    required String collectionName,
    required String folderName,
  }) async {
    List<String> imagesLIst = [];
    try {
      final imageUrl = await fbStorage.ref(collectionName).listAll();
      for (var item in imageUrl.prefixes) {
        if (item.name == folderName) {
          final folder = await item.listAll();
          for (var item in folder.items) {
            final url = await item.getDownloadURL();
            imagesLIst.add(url);
          }
        }
      }

      return imagesLIst;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}

//final FirebaseStorage firebaseStorage = FirebaseStorage();
