// part of 'brand_cubit.dart';

// abstract class BrandState extends Equatable {
//   const BrandState();

//   @override
//   List<Object> get props => [];
// }

// class BrandInitial extends BrandState {}

// class LoadingBrandsState extends BrandState {}

// class LoadedDropDownBrandState extends BrandState {
//   final List<String> dropdownBrand;
//   const LoadedDropDownBrandState(this.dropdownBrand);
//   @override
//   List<Object> get props => [dropdownBrand];
// }

// class LoadedAllBrandState extends BrandState {
//   final List<BrandEntity> allBrand;
//   final bool isCreated;
//   const LoadedAllBrandState(this.allBrand, this.isCreated);
//   @override
//   List<Object> get props => [allBrand, isCreated];
// }

// class CreatedBrandState extends BrandState {
//   final bool isCreated;
//   const CreatedBrandState(this.isCreated);
//   @override
//   List<Object> get props => [isCreated];
// }

// class DeletedBrandState extends BrandState {
//   final bool isCreated;
//   const DeletedBrandState(this.isCreated);
//   @override
//   List<Object> get props => [isCreated];
// }

// class TypedBrandState extends BrandState {
//   final String typedBrandName;
//   const TypedBrandState(this.typedBrandName);
//   @override
//   List<Object> get props => [typedBrandName];
// }

// class BrandsFailureState extends BrandState {
//   final String message;
//   const BrandsFailureState(this.message);
//   @override
//   List<Object> get props => [message];
// }
