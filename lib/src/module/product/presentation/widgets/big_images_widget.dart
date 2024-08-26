import 'dart:developer';

import 'package:e_commerce_admin/src/config/locator.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/dialogs/app_bottom_sheet.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/big_image/big_image.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigImagesWidget extends StatefulWidget {
  const BigImagesWidget({
    required this.folderName,
    required this.bigImagesCallback,
    this.height,
    this.bgColor,
    super.key,
  });

  final String folderName;
  final ValueSetter<List<String>>? bigImagesCallback;
  final double? height;
  final Color? bgColor;

  @override
  State<BigImagesWidget> createState() => _BigImagesWidgetState();
}

class _BigImagesWidgetState extends State<BigImagesWidget> {
  String smallImageUrl = '';

  List<String> bigImageUrlList = [];
  //String folderName = '';
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 132.h,
      width: double.infinity,
      color: widget.bgColor ?? Colors.white,
      child: BlocProvider(
        create: (context) => sl<BigImageCubit>(),
        child: BlocBuilder<BigImageCubit, BigImageState>(
          builder: (context, state) {
            if (state is LoadedSelectedBigImagesUrlState) {
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.selctedBigImagesList.length,
                    itemBuilder: (context, index) {
                      final image = state.selctedBigImagesList[index];
                      //final oldSmallImage = state.imageUrl;
                      return image == ''
                          ? InkWell(
                              onTap: () {
                                BlocProvider.of<BigImageCubit>(context)
                                    .getAllBigImages(
                                        folderName: widget.folderName);
                                AppBottomSheet.showBottomSheet(
                                  context: context,
                                  title: 'Image',
                                  content: imageContent(context),
                                  // content: BlocProvider.value(
                                  //   value: BlocProvider.of<BigImageCubit>(
                                  //       context),
                                  //   child: imageContent(context),
                                  // ),
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
                  ),
                ),
              );
            }
            return InkWell(
              onTap: () {
                BlocProvider.of<BigImageCubit>(context)
                    .getAllBigImages(folderName: widget.folderName);
                AppBottomSheet.showBottomSheet(
                  context: context,
                  title: 'Image',
                  content: imageContent(context),
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
            );
          },
        ),
      ),
    );
  }

  Widget imageContent(BuildContext context) {
    //Small image
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Big images',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        BlocBuilder<BigImageCubit, BigImageState>(
          builder: (context, state) {
            if (state is LoadingBigImageState) {
              return SizedBox(
                height: 150.h,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 10),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            } else if (state is LoadedAllBigImagesUrlState) {
              return SizedBox(
                height: 150.h,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.bigImagesList.length,
                    //itemCount: 5,
                    itemBuilder: (context, index) {
                      final image = state.bigImagesList[index];
                      // bigImageUrlList.clear();
                      // bigImageUrlList.addAll(state.bigImagesList);
                      return InkWell(
                        onTap: () {
                          bigImageUrlList.add(image);
                          isSelected = !isSelected;
                          setState(() {});
                        },
                        child: Container(
                          //color: Colors.red,
                          margin: REdgeInsets.only(right: 8),
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 2.5)
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return SizedBox(
              height: 150.h,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    'Выберите основное изображение!',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        20.verticalSpace,
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
            onPressed: () {
              widget.bigImagesCallback!(bigImageUrlList);
              BlocProvider.of<BigImageCubit>(context).getSelectedBigImages(
                selectedBigImages: bigImageUrlList,
              );
              Navigator.pop(context);
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}
