import 'package:e_commerce_admin/src/config/helper/fake_remote_data/fake_product_rating_and_reviews_data.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_rating_and_reviews_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_rating_model.dart';
import 'package:e_commerce_admin/src/module/product/data/models/product_review_model.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_rating_entity.dart';

class FakeLogic {
  //List<ProductModel> allFakeProducts = FakeProductData().fakeProducts;
  List<ProductRatingAndReviewsModel> allFakeRatingAndReviews =
      FakeProductRatingAndReviewsData().allFakeRatingAndReviews;

  Future<ProductRatingModel> updateProductRating({
    required ProductRatingModel productRating,
    required String productId,
    required int newRate,
  }) async {
    ProductRatingModel? newRating;
    newRating = getNewRating(
      productRating,
      newRate,
      productId,
    );

    return newRating;
  }

  Future<ProductRatingAndReviewsModel> updateRatingAndReviews({
    required ProductRatingAndReviewsModel ratingAndReviews,
    required String productId,
    required int newRate,
    required ProductReviewModel review,
  }) async {
    ProductRatingModel? newRating;
    List<ProductReviewModel>? newReviews;
    newRating = getNewRating(
      ratingAndReviews.rating!,
      newRate,
      productId,
    );
    newReviews = getNewReviews(
      ratingAndReviews.reviews as List<ProductReviewModel>,
      review,
    );

    return ProductRatingAndReviewsModel(
      productId: ratingAndReviews.productId,
      rating: newRating,
      reviews: newReviews,
    );
  }

  List<ProductReviewModel> getNewReviews(
    List<ProductReviewModel> reviews,
    ProductReviewModel newReview,
  ) {
    //List<ProductReviewModel>? newReviews = reviews;
    reviews.add(newReview);
    return reviews;
  }

  ProductRatingModel getNewRating(
    ProductRatingEntity rate,
    int newRate,
    String productId,
  ) {
    ProductRatingModel? newRating;
    switch (newRate) {
      case 0:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser!,
          one: rate.one!,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 1:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one! + 1,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 2:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two! + 1,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 3:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three! + 1,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 4:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three,
          four: rate.four! + 1,
          five: rate.five,
        );
        break;
      case 5:
        newRating = ProductRatingModel(
          productId: productId,
          userId: rate.userId,
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five! + 1,
        );
        break;
    }

    return newRating!;
  }

  Future<ProductRatingAndReviewsModel> getRatingAndReviews(
      String productId) async {
    final ratingAndReviews =
        allFakeRatingAndReviews.where((i) => i.productId == productId).toList();

    return ratingAndReviews.elementAt(0);
  }

  double getTotalRating(ProductRatingEntity rating, int newRate) {
    double rate = 0.0;

    switch (newRate) {
      case 1:
        rate = (((rating.one! + 1) * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 2:
        rate = ((rating.one! * 1).toDouble() +
                ((rating.two! + 1) * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 3:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                ((rating.three! + 1) * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 4:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                ((rating.four! + 1) * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 5:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                ((rating.five! + 1) * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
    }

    return rate;
  }

  // Future<List<ProductModel>> getNewAndSaleProducts() async {
  //   final List<ProductModel> fakeProductsList = [];
  //   final allNewProducts = allFakeProducts
  //       .where(
  //         (i) => i.isNew == true,
  //       )
  //       .toList();
  //   final allSaleProducts =
  //       allFakeProducts.where((i) => i.isSale == true).toList();
  //   fakeProductsList.addAll(allNewProducts);
  //   fakeProductsList.addAll(allSaleProducts);
  //   return fakeProductsList;
  // }

  // Future<List<ProductModel>> getProductsWithTwoValues({
  //   required String type,
  //   required String collection,
  // }) async {
  //   final fakeProductsList = allFakeProducts
  //       .where((i) => i.category!.typeName == type)
  //       .toList()
  //       .where((i) => i.category!.collectionName == collection)
  //       .toList();
  //   return fakeProductsList;
  // }

  // List<ProductModel> getProductsWithThreeValues({
  //   required String type,
  //   required String collection,
  //   required String category,
  // }) {
  //   final fakeProductsList = allFakeProducts
  //       .where((i) => i.category!.typeName == type)
  //       .toList()
  //       .where((i) => i.category!.collectionName == collection)
  //       .toList()
  //       .where((i) => i.category!.categoryName == category)
  //       .toList();
  //   return fakeProductsList;
  // }

  // List<ProductModel> getNewProducts() {
  //   return allFakeProducts.where((i) => i.isNew == true).toList();
  // }
}


// allProducts: allProducts.where((i) => i.isNew == true).toList(),
//                 allProducts: allProducts
//                     .where((i) =>
//                         DateTimeFormatter().isNew(i.createdDate!) == true)
//                     .toList(),

// final allNewProducts =
//     FakeProductData().allFakeProducts.where((i) => i.isNew == true).toList();

// class FakeProductData {
//   // Future<ProductModel> getProduct({required String productID}) async {
//   //   return await firestore.get(
//   //     id: productID,
//   //     collectionName: 'products',
//   //     fromJson: productFromJson,
//   //   );
//   // }

//   Future<List<ProductModel>> getAllProducts() async {
//     // List<ProductModel>? fakeProductsList;
//     // Future.delayed(const Duration(seconds: 2), () {});
//     final fakeProductsList = allFakeProducts.toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsByQuery({
//     required String fieldName,
//     required dynamic query,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == fieldName)
//         .toList()
//         .where((i) => i.collectionName == query)
//         .toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsWithTwoValues({
//     required String type,
//     required String collection,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == type)
//         .toList()
//         .where((i) => i.collectionName == collection)
//         .toList();
//     return fakeProductsList;
//   }
