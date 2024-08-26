// import 'package:bloc/bloc.dart';
// import 'package:e_commerce_admin/src/module/product/domain/entities/product_entity.dart';
// import 'package:e_commerce_admin/src/module/product/domain/usecases/set_product.dart';

// import 'package:equatable/equatable.dart';

// part 'product_state.dart';

// class ProductCubit extends Cubit<ProductState> {
//   final SetProduct setProducts;
//   ProductCubit({
//     required this.setProducts,
//   }) : super(ProductInitial());

//   void setProduct({required ProductEntity product}) async {
//     emit(LoadingProductState());
//     final isCreated = await setProducts(SetProductParams(product: product));
//     isCreated.fold(
//       (error) => emit(const ProductFailureState('')),
//       (_isCreated) => emit(CreatedProductState(_isCreated)),
//     );
//   }
// }
