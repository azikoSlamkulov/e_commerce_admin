import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/brands_repo.dart';

class AddBrand extends UseCase<bool, AddBrandParams> {
  final BrandsRepo brandRepo;
  AddBrand(this.brandRepo);

  @override
  Future<Either<Failure, bool>> call(AddBrandParams params) async {
    return await brandRepo.addBrand(brandName: params.brandName);
  }
}

class AddBrandParams extends Equatable {
  final String brandName;
  const AddBrandParams({required this.brandName});

  @override
  List<Object?> get props => [
        brandName,
      ];
}
