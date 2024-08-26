import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/product_image_repo.dart';

class SetProductImage extends UseCase<String, SetProductImageParams> {
  final ProductImageRepo productImageRepo;
  SetProductImage(this.productImageRepo);

  @override
  Future<Either<Failure, String>> call(SetProductImageParams params) async {
    return await productImageRepo.setProductImage(
      filePath: params.filePath,
      fileName: params.fileName,
    );
  }
}

class SetProductImageParams extends Equatable {
  final String filePath;
  final String fileName;
  const SetProductImageParams({
    required this.filePath,
    required this.fileName,
  });

  @override
  List<Object?> get props => [
        filePath,
        fileName,
      ];
}
