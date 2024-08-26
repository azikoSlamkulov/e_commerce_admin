import 'package:bloc/bloc.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_small_image_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_product_small_images.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/usecases/set_product_image.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final SetProductImage setProductImage;
  final GetAllProductSmallImages getAllProductSmallImages;

  ImageCubit({
    required this.setProductImage,
    required this.getAllProductSmallImages,
  }) : super(ImageInitial());

  List<String> imageList = [''];

  getProfileImage(ImageSource imageSource) async {
    emit(LoadingState());
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: imageSource);
    //profileImageFile.value = _image!.path;

    // final fileName = image!.path.split('/').last;
    // final profileImageUrl = await uploadProfileImages(image.path, fileName);

    emit(LoadedFileState(image));
  }

  uploadProfileImages(String filePath, String fileName) async {
    final productImageUrl = await setProductImage(SetProductImageParams(
      filePath: filePath,
      fileName: fileName,
    ));
    productImageUrl.fold((error) => emit(const ImageFailureState('')),
        (productImageUrl) {
      imageList.add(productImageUrl);
      imageList.sort((a, b) => b.compareTo(a));
      emit(LoadedImageUrlState(productImageUrl, imageList));
    });
  }

  getImages(String productImageUrl) async {
    emit(LoadingState());
    imageList.add(productImageUrl);
    imageList.sort((a, b) => b.compareTo(a));
    emit(LoadedImageUrlState(productImageUrl, imageList));
  }

  getSelectedSmallImage(ProductSmallImageEntity selectedSmallImage) async {
    emit(LoadingState());
    emit(LoadedSelectedSmallImageState(selectedSmallImage));
  }

  getSmallAndBigImages(
      {required String smallImage, required List<String> bigImages}) async {
    emit(LoadingState());
    List<String> images = [''];
    images.addAll(bigImages);
    images.sort((a, b) => b.compareTo(a));
    emit(LoadedImageUrlState(smallImage, images));
  }

  getAllSmallImages() async {
    emit(LoadingState());
    final allProductSmallImageUrl =
        await getAllProductSmallImages.getAllProductSmallImages();

    allProductSmallImageUrl.fold(
      (error) => emit(const ImageFailureState('')),
      (smallImagesUrl) => emit(LoadedAllSmallImagesUrlState(smallImagesUrl)),
    );
  }

  cleareImages() async {
    emit(LoadingState());
    imageList.clear();
    imageList.add('');
    emit(ClearedImagesState());
  }
}
