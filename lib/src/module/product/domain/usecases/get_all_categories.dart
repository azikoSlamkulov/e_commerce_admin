import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../repositories/categories_repo.dart';

class GetAllCategories {
  final CategoriesRepo categoriesRepo;
  GetAllCategories(this.categoriesRepo);

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    return await categoriesRepo.getAllCategories();
  }
}

// class GetAllCategories
//     extends UseCase<List<CategoryEntity>, void> {
//   final CategoriesRepo categoriesRepo;
//   GetAllCategories(this.categoriesRepo);

//   @override
//   Future<Either<Failure, List<CategoryEntity>>> call() async {
//     return await categoriesRepo.getAllCategories(
//     );
//   }
// }

// class GetAllCategoriesParams extends Equatable {
//   final String type;
//   final String collection;
//   const GetAllCategoriesParams({required this.type, required this.collection});

//   @override
//   List<Object?> get props => [
//         type,
//         collection,
//       ];
// }
