// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:e_commerce_admin/src/module/product/domain/entities/brand_entity.dart';
// import 'package:e_commerce_admin/src/module/product/domain/usecases/add_brand.dart';
// import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_brands.dart';
// import 'package:equatable/equatable.dart';

// import '../../../domain/usecases/delete_brand.dart';

// part 'brand_state.dart';

// class BrandCubit extends Cubit<BrandState> {
//   final GetAllBrands getAllBrands;
//   final AddBrand addBrand;
//   final DaleteBrand daleteBrand;
//   BrandCubit({
//     required this.getAllBrands,
//     required this.addBrand,
//     required this.daleteBrand,
//   }) : super(BrandInitial());

//   void getDropDownBrand() async {
//     emit(LoadingBrandsState());
//     final dropdownBrand = await getAllBrands.getAllBrands();
//     dropdownBrand.fold(
//       (error) => emit(const BrandsFailureState('')),
//       (_dropdownBrand) {
//         final List<String> items = [
//           '',
//         ];
//         for (final item in _dropdownBrand) {
//           items.add(item.name!);
//         }
//         log('${_dropdownBrand.length}');
//         emit(LoadedDropDownBrandState(items));
//       },
//     );
//   }

//   void getAllBrand() async {
//     emit(LoadingBrandsState());
//     final allBrand = await getAllBrands.getAllBrands();
//     allBrand.fold(
//       (error) => emit(const BrandsFailureState('')),
//       (allBrand) {
//         emit(LoadedAllBrandState(allBrand, false));
//       },
//     );
//   }

//   void addBrands({required String brandName}) async {
//     emit(BrandInitial());
//     final isCreated = await addBrand(AddBrandParams(brandName: brandName));
//     isCreated.fold(
//       (error) => emit(const BrandsFailureState('')),
//       (isCreated) => emit(CreatedBrandState(isCreated)),
//     );
//   }

//   void deleteBrand({required String id}) async {
//     emit(BrandInitial());
//     final isDeleted = await daleteBrand(DeleteBrandParams(id: id));
//     isDeleted.fold(
//       (error) => emit(const BrandsFailureState('')),
//       (isDeleted) => emit(DeletedBrandState(isDeleted)),
//     );
//   }

//   void typedBrand(String typedBrandName) async {
//     emit(LoadingBrandsState());
//     emit(TypedBrandState(typedBrandName));
//   }
// }
