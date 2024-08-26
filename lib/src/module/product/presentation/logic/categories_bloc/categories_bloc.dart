import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/add_brand.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/add_category.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_categories.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/delete_category.dart';
import '../../../domain/usecases/get_all_categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories getCategories;
  final GetAllCategories getAllCategories;
  final AddCategory addCategory;
  final DaleteCategory daleteCategory;

  CategoriesBloc({
    required this.getCategories,
    required this.getAllCategories,
    required this.addCategory,
    required this.daleteCategory,
  }) : super(InitialState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetAllCategoriesEvent>(_getAllCategories);
    //on<GetDropDownCategoriesEvent>(_getDropDownCategories);
    on<TypedCategoryEvent>(_typedCategory);
    on<SetCategoryEvent>(_setCategory);
    on<DeleteCategoryEvent>(_deleteCategory);
  }

  void _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final categories = await getCategories(GetCategoriesParams(
      type: event.typeName,
      collection: event.collectionName,
    ));
    categories.fold(
      (error) => emit(const CategoriesFailureState('')),
      (categories) => emit(LoadedCategoriesState(categories)),
    );
  }

  void _getAllCategories(
      GetAllCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final allCategories = await getAllCategories.getAllCategories();
    allCategories.fold(
      (error) => emit(const CategoriesFailureState('')),
      (allCategories) => emit(LoadedAllCategoriesState(allCategories)),
    );
  }

  void _setCategory(
      SetCategoryEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final isCreated = await addCategory(SetCategoryParams(
      typeName: event.type,
      collectionName: event.collection,
      categoryName: event.category,
    ));
    isCreated.fold(
      (error) => emit(const CategoriesFailureState('')),
      (isCreated) => emit(CreatedCategoryState(isCreated, event.category)),
    );
  }

  void _deleteCategory(
      DeleteCategoryEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final isDeleted = await daleteCategory(DeleteCategoryParams(
      id: event.id,
    ));
    isDeleted.fold(
      (error) => emit(const CategoriesFailureState('')),
      (isDeleted) => emit(DeletedCategoryState(isDeleted, event.categoryName)),
    );
  }

  void _typedCategory(
      TypedCategoryEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final typedCategory = CategoryEntity(
      typeName: event.type,
      collectionName: event.collection,
      categoryName: event.category,
    );
    emit(TypedCategoryState(typedCategory));
  }

  // void _getDropDownCategories(
  //     GetDropDownCategoriesEvent event, Emitter<CategoriesState> emit) async {
  //   emit(LoadingState());
  //   final dropdownCategories = await getAllCategories(GetCategoriesParams(
  //     typeName: event.typeName,
  //     collectionName: event.collectionName,
  //   ));
  //   dropdownCategories.fold(
  //     (error) => emit(const CategoriesFailureState('')),
  //     (_dropdownCategories) {
  //       final List<String> items = [''];
  //       for (final item in _dropdownCategories) {
  //         items.add(item.category!);
  //       }
  //       log('${_dropdownCategories.length}');
  //       emit(LoadedDropDownCategoriesState(items));
  //     },
  //   );
  // }
}
