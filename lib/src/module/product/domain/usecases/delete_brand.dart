import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/brands_repo.dart';

class DaleteBrand extends UseCase<bool, DeleteBrandParams> {
  final BrandsRepo brandRepo;
  DaleteBrand(this.brandRepo);

  @override
  Future<Either<Failure, bool>> call(DeleteBrandParams params) async {
    return await brandRepo.deleteBrand(id: params.id);
  }
}

class DeleteBrandParams extends Equatable {
  final String id;
  const DeleteBrandParams({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
