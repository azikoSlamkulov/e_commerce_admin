part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class SetProductEvent extends ProductEvent {
  final ProductDatailEntity product;

  const SetProductEvent(this.product);
}

class GetProductEvent extends ProductEvent {
  final ProductEntity product;

  const GetProductEvent(this.product);
}

class GetProductDatailsEvent extends ProductEvent {
  final String productId;
  const GetProductDatailsEvent({required this.productId});
}

class GetAllProductEvent extends ProductEvent {}
