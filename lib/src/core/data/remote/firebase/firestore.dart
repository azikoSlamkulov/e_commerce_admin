import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreCore {
  // Check
  Future<bool> checkDocExists({
    required String docId,
    required String collectionName,
  });
  Future<bool> checkDocExistsFromSecondCollection({
    required String firstDocId,
    required String secondDocId,
    required String firstCollectionName,
    required String secondCollectionName,
  });

  // Get Id
  Future<String> getId({
    required String collectionName,
  });
  Future<String> getDocIdFromSecondCollection({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
  });

  //Get
  Future<T> get<T>({
    required String docId,
    required String collectionName,
    required T Function(Map body) fromJson,
  });
  Future<List<T>> getList<T>({
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<T> getDocFromSecondCollection<T>({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    required String secondDocId,
    required T Function(Map<String, dynamic> body) fromJson,
  });

  Future<List<T>> getListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  });

  //Post
  Future<bool> create({
    required String docId,
    required objectModel,
    required String collection,
  });
  Future<bool> setTwoCollections({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    String? secondDocId,
    required objectModel,
  });
  Future<bool> setProduct({
    //required objectEntity,
    required objectModel,
    // required String collectionName,
    // required String typeName,
    // required String categoryName,
  });
  // Future<bool> createCategory({
  //   required objectModel,
  // });

  //Update
  Future<bool> update({
    required String docId,
    //required objectEntity,
    required objectModel,
    required String collectionName,
  });

  //Delete
  Future<bool> delete({
    required String docId,
    required String collectionName,
  });
  Future<bool> deleteDocFromSecondCollection({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    required String secondDocId,
  });

  // get Categories
  Future<List<T>> getCategoriesList<T>({
    required String typeName,
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  });
}

///////////////////////////////////////////////////////////////////////////////

class FirestoreCoreImpl implements FirestoreCore {
  final FirebaseFirestore firestoreDB;

  FirestoreCoreImpl({required this.firestoreDB});

  // -----  Check  ------------------------------------------------------------------------------------
  @override
  Future<bool> checkDocExists({
    required String docId,
    required String collectionName,
  }) async {
    DocumentSnapshot doc =
        await firestoreDB.collection(collectionName).doc(docId).get();
    return doc.exists;
  }

  @override
  Future<bool> checkDocExistsFromSecondCollection({
    required String firstDocId,
    required String secondDocId,
    required String firstCollectionName,
    required String secondCollectionName,
  }) async {
    DocumentSnapshot doc = await firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc(secondDocId)
        .get();
    return doc.exists;
  }

  // --------  Get id  -----------------------------------------------------------------------------------
  @override
  Future<String> getId({
    required String collectionName,
  }) async {
    return firestoreDB.collection(collectionName).doc().id;
  }

  @override
  Future<String> getDocIdFromSecondCollection({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
  }) async {
    return firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc()
        .id;
  }

  //------- Get ----------------------------------------------------------------------------------------
  @override
  Future<T> get<T>({
    required String docId,
    required String collectionName,
    required T Function(Map body) fromJson,
  }) async {
    DocumentSnapshot response =
        await firestoreDB.collection(collectionName).doc(docId).get();
    final docMap = response.data() as Map<String, dynamic>;
    return fromJson(docMap);
  }

  @override
  Future<List<T>> getList<T>({
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> list = <T>[];
    final response = await firestoreDB.collection(collectionName).get();
    for (final doc in response.docs) {
      final object = fromJson(doc.data());
      list.add(object);
    }
    return list;
  }

  @override
  Future<T> getDocFromSecondCollection<T>({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    required String secondDocId,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    DocumentSnapshot doc = await firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc(secondDocId)
        .get();
    final docMap = doc.data() as Map<String, dynamic>;
    return fromJson(docMap);
  }

  @override
  Future<List<T>> getListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> list = <T>[];
    final response = await firestoreDB
        .collection(collectionName)
        .where(
          fieldName,
          isEqualTo: query,
        )
        .get();
    for (final doc in response.docs) {
      final object = fromJson(doc.data());
      list.add(object);
    }
    return list;
  }

  // ----- Post ---------------------------------------------------------------------------------
  @override
  Future<bool> create({
    required String docId,
    required objectModel,
    required String collection,
  }) async {
    return await firestoreDB
        .collection(collection)
        .doc(docId)
        .get()
        .then((doc) {
      final newObject = objectModel.toJson();
      if (!doc.exists) {
        firestoreDB
            .collection(collection)
            .doc(objectModel.id)
            .set(newObject, SetOptions(merge: true));
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future<bool> setTwoCollections({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    String? secondDocId,
    required objectModel,
  }) async {
    final secondId = firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc()
        .id;
    return await firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc(secondDocId ?? secondId)
        .get()
        .then((doc) {
      final newObject = objectModel.toJson();
      if (!doc.exists) {
        firestoreDB
            .collection(firstCollectionName)
            .doc(firstDocId)
            .collection(secondCollectionName)
            .doc(secondDocId ?? secondId)
            .set(newObject, SetOptions(merge: true));
      } else {
        firestoreDB
            .collection(firstCollectionName)
            .doc(firstDocId)
            .collection(secondCollectionName)
            .doc(secondDocId ?? secondId)
            .update(newObject);
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future<bool> setProduct({
    //required objectEntity,
    required objectModel,
    //required String typeName,
    // required String collectionName,
    // required String categoryName,
  }) async {
    return await firestoreDB
        .collection('products')
        .doc(objectModel.type)
        .collection(objectModel.type)
        .doc(objectModel.collection)
        .collection(objectModel.collection)
        .doc(objectModel.category)
        .collection(objectModel.category)
        .doc()
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection('products')
            .doc(objectModel.type)
            .collection(objectModel.type)
            .doc(objectModel.collection)
            .collection(objectModel.collection)
            .doc(objectModel.category)
            .collection(objectModel.category)
            .doc()
            .set(newObject, SetOptions(merge: true));
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  // ----  Update  ------------------------------------------------------------------
  @override
  Future<bool> update({
    required String docId,
    //required objectEntity,
    required objectModel,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        .doc(docId)
        .get()
        .then((doc) {
      final newObjectModel = objectModel.toJson();
      if (doc.exists) {
        firestoreDB
            .collection(collectionName)
            .doc(docId)
            .update(newObjectModel);
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  // -------- Delete ------------------------------------------------------------------
  @override
  Future<bool> delete({
    required String docId,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        .doc(docId)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  @override
  Future<bool> deleteDocFromSecondCollection({
    required String firstCollectionName,
    required String secondCollectionName,
    required String firstDocId,
    required String secondDocId,
  }) async {
    return await firestoreDB
        .collection(firstCollectionName)
        .doc(firstDocId)
        .collection(secondCollectionName)
        .doc(secondDocId)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  //  ------ Get categories ----------------------------------------------------
  @override
  Future<List<T>> getCategoriesList<T>({
    required String typeName,
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> list = <T>[];
    final response = await firestoreDB
        .collection('categories')
        .where('type', isEqualTo: typeName)
        .where('collection', isEqualTo: collectionName)
        .get();
    for (final doc in response.docs) {
      final object = fromJson(doc.data());
      list.add(object);
    }
    return list;
  }

  // @override
  // Future<bool?> create({
  //   //required objectEntity,
  //   required objectModel,
  //   required String collectionName,
  // }) async {
  //   await firestoreDB
  //       .collection(collectionName)
  //       .doc(objectModel.uid)
  //       .set(objectModel, SetOptions(merge: true))
  //       .onError((error, stackTrace) => false);
  // }

  // @override
  // Future<bool> create({
  //   //required objectEntity,
  //   required objectModel,
  //   required String collectionName,
  // }) async {
  //   return await firestoreDB
  //       .collection(collectionName)
  //       // .doc(user.userID)
  //       // .collection('profile')
  //       .doc(objectModel.userID)
  //       .get()
  //       .then((_doc) {
  //     final newObject = objectModel.toJson();
  //     if (!_doc.exists) {
  //       firestoreDB
  //           .collection(collectionName)
  //           .doc(objectModel.userID)
  //           .set(newObject, SetOptions(merge: true));
  //     }
  //     return true;
  //   }).onError((error, stackTrace) {
  //     return false;
  //   });
  // }

  // @override
  // Future<bool> createCategory({
  //   required objectModel,
  // }) async {
  //   return await firestoreDB
  //       .collection('categories')
  //       .doc(objectModel.categoryID)
  //       .get()
  //       .then((_doc) {
  //     final newObject = objectModel.toJson();
  //     if (!_doc.exists) {
  //       firestoreDB
  //           .collection('categories')
  //           .doc(objectModel.categoryID)
  //           .set(newObject, SetOptions(merge: true));
  //     }
  //     return true;
  //   }).onError((error, stackTrace) {
  //     return false;
  //   });
  // }

  // @override
  // Future<bool?> createNewUser({required UserEntity user}) async {
  //   return await firestoreDB
  //       .collection("users")
  //       // .doc(user.userID)
  //       // .collection('profile')
  //       .doc(user.userID)
  //       .get()
  //       .then((_userDoc) {
  //     final _newUser = UserModel(
  //       userID: user.userID,
  //       name: user.name,
  //       lastName: user.lastName,
  //       email: user.email,
  //       mainPhoneNumber: user.mainPhoneNumber,
  //       mark: user.mark,
  //       role: _user.role,
  //     ).toJson();
  //     if (!_userDoc.exists) {
  //       firestoreDB
  //           .collection("users")
  //           .doc(user.userID)
  //           .set(_newUser, SetOptions(merge: true));
  //     }
  //     return true;
  //   }).onError((error, stackTrace) {
  //     return false;
  //   });
  // }
}
