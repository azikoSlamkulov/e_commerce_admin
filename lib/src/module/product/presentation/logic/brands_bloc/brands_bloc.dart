import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/brand_entity.dart';
import '../../../domain/usecases/add_brand.dart';
import '../../../domain/usecases/delete_brand.dart';
import '../../../domain/usecases/get_all_brands.dart';

part 'brands_event.dart';
part 'brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetAllBrands getAllBrands;
  final AddBrand addBrand;
  final DaleteBrand daleteBrand;

  BrandsBloc({
    required this.getAllBrands,
    required this.addBrand,
    required this.daleteBrand,
  }) : super(InitialState()) {
    on<GetAllBrandsEvent>(_getAllBrand);
    on<TypedBrandsEvent>(_typedBrand);
    on<SetBrandEvent>(_addBrands);
    on<DeleteBrandEvent>(_deleteBrand);
  }

  void _getAllBrand(GetAllBrandsEvent event, Emitter<BrandsState> emit) async {
    emit(LoadingState());
    final allBrand = await getAllBrands.getAllBrands();
    allBrand.fold(
      (error) => emit(const BrandsFailureState('')),
      (_allBrand) {
        emit(LoadedAllBrandsState(_allBrand));
      },
    );
  }

  void _deleteBrand(DeleteBrandEvent event, Emitter<BrandsState> emit) async {
    emit(LoadingState());
    final isDeleted = await daleteBrand(DeleteBrandParams(id: event.id));
    isDeleted.fold(
      (error) => emit(const BrandsFailureState('')),
      (isDeleted) => emit(DeletedBrandState(isDeleted, event.brandName)),
    );
  }

  void _addBrands(SetBrandEvent event, Emitter<BrandsState> emit) async {
    emit(LoadingState());
    final isCreated =
        await addBrand(AddBrandParams(brandName: event.brandName));
    isCreated.fold(
      (error) => emit(const BrandsFailureState('')),
      (isCreated) => emit(CreatedBrandState(isCreated, event.brandName)),
    );
  }

  void _typedBrand(TypedBrandsEvent event, Emitter<BrandsState> emit) async {
    emit(LoadingState());
    emit(TypedBrandState(event.typedBrandName));
  }
}
