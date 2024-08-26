import 'dart:developer';

import 'package:e_commerce_admin/src/config/locator.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/inputs/custom_text_form_field.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/admin_product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_size_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/sizes_entity.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/big_image/big_image.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_and_sizes/colors_and_sizes.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/image_cubit/image_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/big_images_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/colors_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/sizes_multi_select_toggle_btn.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddColorAndSizesWidget extends StatelessWidget {
  const AddColorAndSizesWidget({
    super.key,
  });

  // @override
  // Widget build(BuildContext context) {
  //   String selectedColor = 'Цвет не выбран';
  //   final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
  //   List<String> selectedBigImagesList = [];
  //   ProductSizeEntity selectedSize = const ProductSizeEntity();
  //   List<bool> isSelectedColors = [];
  //   List<bool> isSelectedSizes = [];
  //   TextEditingController sizeTextController = TextEditingController();
  //   return Scaffold(
  //     backgroundColor: AppColors.bgColorMain,
  //     appBar: CustomAppBar(
  //       title: 'Add product',
  //       showSearchBtn: true,
  //     ),
  //     body: Column(
  //       children: [
  //         /// Sizes
  //         const TitlesWidget(title: 'Sizes'),
  //         SizesMultiSelectToggleButton(
  //           itemList: productSizes,
  //           sizeAddCallback: (value) {
  //             selectedSize = value;
  //           },
  //           isSelectedSizesCallback: (value) {
  //             isSelectedSizes = value;
  //           },
  //           isSelectedList: isSelectedSizes,
  //           oldSize: selectedSize,
  //         ),

  //         // TextFormField(
  //         //   controller: sizeTextController,
  //         // ),

  //         80.verticalSpace,
  //         Padding(
  //           padding: REdgeInsets.all(16),
  //           child: CustomElevatedButton(
  //             sizedBoxHeight: 48.h,
  //             sizedBoxWidth: double.infinity,
  //             borderRadius: 30,
  //             bgColor: AppColors.mainColor,
  //             text: Text(
  //               'Ok',
  //               style: AppTextStyles.white14,
  //             ),
  //             onPressed: () {
  //               BlocProvider.of<ColorsAndSizesCubit>(context).addColors(
  //                 color: AdminProductColorEntity(
  //                   color: ProductColorEntity(
  //                     color: selectedColor,
  //                     colorSizes: selectedSize,
  //                     colorImages: selectedBigImagesList,
  //                   ),
  //                   isSelectedColorsList: isSelectedColors,
  //                   isSelectedSizesList: isSelectedSizes,
  //                 ),
  //               );

  //               log('Colors ====>>>>>> ${sizeTextController.text}');
  //               log('isSelectedSizessss ====>>>>>> $isSelectedSizes');

  //               Navigator.pop(context);
  //             },
  //           ),
  //         ),
  //         15.verticalSpace,
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String selectedColorName = 'Цвет не выбран';
    Color selectedColor = Colors.white;
    final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
    List<String> selectedBigImagesList = [];
    ProductSizeEntity selectedSize = const ProductSizeEntity();
    List<bool> isSelectedColors = [];
    List<bool> isSelectedSizes = [];
    TextEditingController sizeTextController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        // BlocProvider<BigImageCubit>(
        //   create: (context) => sl<BigImageCubit>(),
        // ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: CustomAppBar(
          title: 'Add color and sizes',
          showSearchBtn: true,
        ),
        body: Column(
          children: [
            /// Colors
            const TitlesWidget(title: 'Colors'),
            BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
              builder: (context, state) {
                if (state is ColorsInitialState) {
                  isSelectedColors = state.isSelected;
                  return ColorsWidget(isSelected: state.isSelected);
                } else if (state is ColorsSelectedState) {
                  selectedColorName = state.colorName;
                  selectedColor = state.color;
                  isSelectedColors = state.isSelected;
                  return ColorsWidget(isSelected: state.isSelected);
                }

                return const Center(child: Text('Error'));
              },
            ),

            /// Sizes
            const TitlesWidget(title: 'Sizes'),
            SizesMultiSelectToggleButton(
              itemList: productSizes,
              sizeAddCallback: (value) {
                selectedSize = value;
              },
              isSelectedSizesCallback: (value) {
                isSelectedSizes = value;
              },
              isSelectedList: isSelectedSizes,
              oldSize: selectedSize,
            ),

            // Big Images
            const TitlesWidget(title: 'Big images'),
            // BlocProvider.value(
            //   value: BlocProvider.of<BigImageCubit>(context),
            //   child: BigImagesWidget(
            //     bigImagesCallback: (value) {
            //       selectedBigImagesList = value;
            //     },
            //   ),
            // ),
            BlocBuilder<ImageCubit, ImageState>(
              builder: (context, state) {
                if (state is LoadedSelectedSmallImageState) {
                  final folderName = state.selectedSmallImage.imageName!;
                  return BigImagesWidget(
                    folderName: folderName,
                    bigImagesCallback: (value) {
                      selectedBigImagesList.addAll(value);
                    },
                  );
                }
                return Container(
                  height: 132.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Выберите основное изображение!',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
            80.verticalSpace,
            Padding(
              padding: REdgeInsets.all(16),
              child: CustomElevatedButton(
                sizedBoxHeight: 48.h,
                sizedBoxWidth: double.infinity,
                borderRadius: 30,
                bgColor: AppColors.mainColor,
                text: Text(
                  'Ok',
                  style: AppTextStyles.white14,
                ),
                onPressed: () {
                  BlocProvider.of<ColorsAndSizesCubit>(context).addColors(
                    color: AdminProductColorEntity(
                      color: ProductColorEntity(
                        colorName: selectedColorName,
                        color: selectedColor,
                        colorSizes: selectedSize,
                        colorImages: selectedBigImagesList,
                      ),
                      isSelectedColorsList: isSelectedColors,
                      isSelectedSizesList: isSelectedSizes,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
