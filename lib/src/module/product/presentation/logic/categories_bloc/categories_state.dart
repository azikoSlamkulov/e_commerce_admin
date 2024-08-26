part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class InitialState extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class LoadedState extends CategoriesState {
  final CategoryEntity type;
  const LoadedState(this.type);
  @override
  List<Object> get props => [type];
}

class LoadedCategoriesState extends CategoriesState {
  //final List<TypeEntity> allTypes;
  final List<CategoryEntity> allCategories;
  const LoadedCategoriesState(this.allCategories);
  @override
  List<Object> get props => [allCategories];
}

class LoadedAllCategoriesState extends CategoriesState {
  //final List<TypeEntity> allTypes;
  final List<CategoryEntity> allCategories;
  const LoadedAllCategoriesState(this.allCategories);
  @override
  List<Object> get props => [allCategories];
}

class LoadedDropDownCategoriesState extends CategoriesState {
  //final List<TypeEntity> allTypes;
  final List<String> dropdownCategories;
  const LoadedDropDownCategoriesState(this.dropdownCategories);
  @override
  List<Object> get props => [dropdownCategories];
}

// class LoadedDropDownBrandState extends CategoriesState {
//   final List<String> dropdownBrand;
//   const LoadedDropDownBrandState(this.dropdownBrand);
//   @override
//   List<Object> get props => [dropdownBrand];
// }

class CreatedCategoryState extends CategoriesState {
  final bool isCreated;
  final String categoryName;
  const CreatedCategoryState(this.isCreated, this.categoryName);
  @override
  List<Object> get props => [isCreated, categoryName];
}

class DeletedCategoryState extends CategoriesState {
  final bool isDeleted;
  final String categoryName;
  const DeletedCategoryState(this.isDeleted, this.categoryName);
  @override
  List<Object> get props => [isDeleted, categoryName];
}

// class CategoryCreatedState extends CategoriesState {
//   final bool isCreated;
//   final CategoriesEntity typedCategory;
//   const CategoryCreatedState(this.isCreated, this.typedCategory);
//   @override
//   List<Object> get props => [isCreated];
// }

class TypedCategoryState extends CategoriesState {
  final CategoryEntity typedCategory;
  const TypedCategoryState(this.typedCategory);
  @override
  List<Object> get props => [typedCategory];
}

// class BrandCreatedState extends CategoriesState {
//   final bool isCreated;
//   const BrandCreatedState(this.isCreated);
//   @override
//   List<Object> get props => [isCreated];
// }

class CategoriesFailureState extends CategoriesState {
  final String message;
  const CategoriesFailureState(this.message);
  @override
  List<Object> get props => [message];
}
