import 'package:bloc/bloc.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_product_big_images.dart';
import 'package:equatable/equatable.dart';

part 'big_image_state.dart';

class BigImageCubit extends Cubit<BigImageState> {
  final GetAllProductBigImages getAllProductBigImages;
  BigImageCubit({
    required this.getAllProductBigImages,
  }) : super(BigImageInitial());

  List<String> selectedBigImagesList = [''];

  getAllBigImages({required String folderName}) async {
    emit(LoadingBigImageState());
    final allBigImageUrl = await getAllProductBigImages.call(
      GetAllProductBigImagesParams(
        folderName: folderName,
      ),
    );

    allBigImageUrl.fold(
      (error) => emit(const BigImageFailureState('')),
      (bigImagesUrl) => emit(LoadedAllBigImagesUrlState(bigImagesUrl)),
    );
  }

  getSelectedBigImages({required List<String> selectedBigImages}) async {
    selectedBigImagesList.addAll(selectedBigImages);
    selectedBigImagesList.sort((a, b) => b.compareTo(a));
    emit(LoadingBigImageState());
    emit(LoadedSelectedBigImagesUrlState(selectedBigImagesList));
  }
}
