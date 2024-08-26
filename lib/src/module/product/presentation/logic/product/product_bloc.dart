import 'package:bloc/bloc.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_products.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_product_datails.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/set_product.dart';

import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final SetProduct setProducts;
  final GetAllProducts getAllProducts;
  final GetProductDatails getProductDatails;
  ProductBloc({
    required this.setProducts,
    required this.getAllProducts,
    required this.getProductDatails,
  }) : super(ProductInitial()) {
    on<SetProductEvent>(_setProduct);
    on<GetAllProductEvent>(_getAllProducts);
    on<GetProductDatailsEvent>(_getProductDatails);
  }

  void _setProduct(SetProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());
    final isCreated =
        await setProducts(SetProductParams(product: event.product));
    isCreated.fold(
      (error) => emit(const ProductFailureState('')),
      (_isCreated) async {
        // if (_isCreated) {
        //   final allProducts = await getAllProducts.getAllProducts();
        //   allProducts.fold(
        //     (error) => emit(const ProductFailureState('')),
        //     (_allProducts) => emit(LoadedAllProductState(_allProducts)),
        //   );
        // }

        emit(CreatedProductState(_isCreated));
      },
    );
  }

  void _getAllProducts(
      GetAllProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());
    final allProducts = await getAllProducts.getAllProducts();
    allProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (_allProducts) => emit(LoadedAllProductState(_allProducts)),
    );
  }

  void _getProductDatails(
      GetProductDatailsEvent event, Emitter<ProductState> emit) async {
    final productDatails = await getProductDatails(
      GetProductDatailsParams(
        productId: event.productId,
      ),
    );
    productDatails.fold(
      (error) => emit(ProductFailureState('')),
      (datails) => emit(LoadedProductDatailsState(datails)),
    );
  }
}
