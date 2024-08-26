import 'package:e_commerce_admin/src/config/util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/locator.dart';
import '../../../../config/util/app_constants/colors/app_colors.dart';
import '../../../../config/util/app_constants/text_styles/app_text_styles.dart';
import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
import '../logic/image_cubit/image_cubit.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    required this.callback,
    super.key,
  });

  final ValueSetter<String>? callback;

  @override
  Widget build(BuildContext context) {
    TextEditingController imageController = TextEditingController();
    TextEditingController smallImageController = TextEditingController();
    return Container(
      height: 132.h,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: BlocProvider(
          create: (context) => sl<ImageCubit>(),
          child: BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadedImageUrlState) {
                callback!(state.imageUrl);
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.imageList.length,
                  itemBuilder: (context, index) {
                    final image = state.imageList[index];
                    return image == ''
                        ? InkWell(
                            onTap: () {
                              showCustomBottomSheet(
                                context: context,
                                title: 'Image',
                                imageController: imageController,
                                smallImageController: smallImageController,
                                onPressed: () {
                                  BlocProvider.of<ImageCubit>(context)
                                      .getImages(
                                    imageController.text,
                                  );
                                  Navigator.pop(context);
                                  imageController.clear;
                                  smallImageController.clear;
                                },
                              );
                            },
                            child: Container(
                              margin: REdgeInsets.only(right: 8),
                              width: 100,
                              child: const Icon(
                                Icons.add_a_photo,
                                size: 60,
                                color: AppColors.grey,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {},
                            child: Container(
                              margin: REdgeInsets.only(right: 8),
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                  },
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    //           CustomBottomSheet().showBottomSheet(
                    //              context: context,
                    // title: 'Image',
                    // content: ,
                    //           ),
                    showCustomBottomSheet(
                      context: context,
                      title: 'Image',
                      imageController: imageController,
                      smallImageController: smallImageController,
                      onPressed: () {
                        BlocProvider.of<ImageCubit>(context).getImages(
                          imageController.text,
                        );
                        Navigator.pop(context);
                        imageController.clear;
                        smallImageController.clear;
                      },
                    );
                  },
                  child: Container(
                    margin: REdgeInsets.only(right: 8),
                    width: 100,
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 60,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

showCustomBottomSheet({
  required BuildContext context,
  required String title,
  required VoidCallback onPressed,
  required TextEditingController imageController,
  required TextEditingController smallImageController,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 600.h, // 352
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: REdgeInsets.only(top: 36),
                  child: Text(
                    title,
                    style: AppTextStyles.black18Bold,
                  ),
                ),
              ),
              33.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  controller: imageController,
                  keyboardType: TextInputType.text,
                  sizedBoxHeight: 40.h,
                  sizedBoxWidth: MediaQuery.of(context).size.width,
                  //sizedBoxWidth: 50,
                  labelText: 'Enter image',
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  controller: smallImageController,
                  keyboardType: TextInputType.text,
                  sizedBoxHeight: 40.h,
                  sizedBoxWidth: MediaQuery.of(context).size.width,
                  //sizedBoxWidth: 50,
                  labelText: 'Enter small image',
                ),
              ),
              30.verticalSpace,
              Padding(
                padding: REdgeInsets.all(16),
                child: CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  sizedBoxWidth: MediaQuery.of(context).size.width,
                  borderRadius: 30,
                  bgColor: AppColors.mainColor,
                  text: Text(
                    'Ok',
                    style: AppTextStyles.white14,
                  ),
                  onPressed: onPressed,
                ),
              ),
              15.verticalSpace,
            ],
          ),
        ),
      );
    },
  );
}
