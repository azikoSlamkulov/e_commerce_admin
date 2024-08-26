part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

// class GetTypeEvent extends CategoriesEvent {
//   final String? id;

//   const GetTypeEvent(this.id);
// }

class GetCategoriesEvent extends CategoriesEvent {
  final String typeName;
  final String collectionName;

  const GetCategoriesEvent(
    this.typeName,
    this.collectionName,
  );
}

class GetAllCategoriesEvent extends CategoriesEvent {}

// class GetDropDownCategoriesEvent extends CategoriesEvent {
//   final String typeName;
//   final String collectionName;

//   const GetDropDownCategoriesEvent(this.typeName, this.collectionName);
// }

class TypedCategoryEvent extends CategoriesEvent {
  //final CategoriesEntity typedCategory;
  final String type;
  final String collection;
  final String category;

  const TypedCategoryEvent(
    //this.typedCategory,
    this.type,
    this.collection,
    this.category,
  );
}

class GetDropDownBrandEvent extends CategoriesEvent {}

class SetCategoryEvent extends CategoriesEvent {
  final String type;
  final String collection;
  final String category;

  const SetCategoryEvent(
    this.type,
    this.collection,
    this.category,
  );
}

class DeleteCategoryEvent extends CategoriesEvent {
  final String id;
  final String categoryName;

  const DeleteCategoryEvent({required this.id, required this.categoryName});
}
