import 'dart:developer';

import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/dialogs/app_bottom_sheet.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/admin_product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_size_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/sizes_entity.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/image_cubit/image_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/big_images_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/colors_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/sizes_multi_select_toggle_btn.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/colors_and_sizes/colors_and_sizes_cubit.dart';

class BuildColorsAndSizesWidget extends StatelessWidget {
  BuildColorsAndSizesWidget({
    // required this.colorsAndSizesCallback,
    // required this.bigImagesCallback,
    required this.colorsAndSizes,
    super.key,
  });

  // final ValueSetter<ProductColorEntity>? colorsAndSizesCallback;
  // final ValueSetter<List<String>>? bigImagesCallback;

  String selectedColor = 'Цвет не выбран';
  final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
  List<ProductSizeEntity> selectedSizeList = [];
  List<String> selectedBigImagesList = [];
  ProductSizeEntity selectedSize = const ProductSizeEntity();
  List<bool> isSelectedColors = [];
  List<bool> isSelectedSizes = [];
  final AdminProductColorEntity colorsAndSizes;
  //List<ProductColorEntity> colorsAndSizesList = [const ProductColorEntity()];

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
  //     builder: (context, state) {
  //       if (state is LoadedColorsAndSizesState) {
  //         colorsAndSizesList.add(state.colorsAndSizesList);
  //         //isSelectedColors.addAll(state.selectedColorsList);
  //         return ListView.builder(
  //           itemCount: colorsAndSizesList.length,
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             final colorAndSize = colorsAndSizesList[index];
  //             return buildColorsAndSize(context, colorAndSize);
  //           },
  //         );
  //       }
  //       return ListTile(
  //         onTap: () {
  //           AppBottomSheet.showBottomSheet(
  //             context: context,
  //             title: 'Image',
  //             content: colorsAndSizesContent(context),
  //           );
  //         },
  //         title: Text(
  //           'Color and sizes',
  //           style: AppTextStyles.black16Bold,
  //         ),
  //         subtitle: Text(
  //           'Выбрать цвет',
  //           style: TextStyle(
  //             color: Colors.black38,
  //             fontSize: 14.sp,
  //           ),
  //         ),
  //         trailing: const Icon(Icons.chevron_right),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        colorsAndSizes.color!.colorName!,
        style: AppTextStyles.black16Bold,
        //style: Theme.of(context).textTheme.bodyMedium,
      ),
      leading: SizedBox(
        height: 20.h,
        width: 20.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: colorsAndSizes.color!.color,
          ),
          onPressed: () {},
          // onPressed: () {
          //   isActivity = !isActivity;
          //   setState(() {});
          // },
          child: const Text(''),
        ),
      ),
      // subtitle: Text(
      //   colorsAndSizes.color!.color!,
      //   style: TextStyle(
      //     color: Colors.black38,
      //     fontSize: 14.sp,
      //   ),
      // ),
      children: [
        /// Colors
        // const TitlesWidget(title: 'Colors'),
        // ColorsWidget(isSelected: colorsAndSizes.isSelectedColorsList!),

        /// Sizes
        const TitlesWidget(title: 'Sizes'),
        SizesMultiSelectToggleButton(
          itemList: productSizes,
          sizeAddCallback: (value) {
            //size();
            //addSelectedSize(value);
            //selectedSizeList.add(addSelectedSize(value));
            //selectedSizeList.add(value);
          },
          // sizeRemoveCallback: (value) {
          //   //addSelectedSize(value);
          //   //selectedSizeList.add(addSelectedSize(value));
          //   selectedSizeList.remove(value);
          // },
          isSelectedSizesCallback: (value) => isSelectedSizes = value,
          isSelectedList: colorsAndSizes.isSelectedSizesList,
          //oldSize: selectedSize,
          oldSize: colorsAndSizes.color!.colorSizes,
        ),

        // Big Images
        const TitlesWidget(title: 'Big images'),
        // BlocProvider.value(
        //   value: BlocProvider.of<ImageCubit>(context),
        //   child: BigImagesWidget(
        //     bigImagesCallback: (value) {
        //       selectedBigImagesList = value;
        //     },
        //   ),
        // ),
        BigImagesWidget(
          bigImagesCallback: (value) {
            selectedBigImagesList = value;
          },
        ),
      ],
    );
  }

  buildColorsAndSize(BuildContext context, ProductColorEntity color) {
    return color != ProductColorEntity()
        ? ExpansionTile(
            title: Text(
              'Color and sizes',
              style: AppTextStyles.black16Bold,
              //style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              color.colorName!,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.sp,
              ),
            ),
            children: [
              /// Colors
              const TitlesWidget(title: 'Colors'),
              ColorsWidget(isSelected: isSelectedColors),

              /// Sizes
              const TitlesWidget(title: 'Sizes'),
              SizesMultiSelectToggleButton(
                itemList: productSizes,
                sizeAddCallback: (value) {
                  //size();
                  //addSelectedSize(value);
                  //selectedSizeList.add(addSelectedSize(value));
                  //selectedSizeList.add(value);
                },
                // sizeRemoveCallback: (value) {
                //   //addSelectedSize(value);
                //   //selectedSizeList.add(addSelectedSize(value));
                //   selectedSizeList.remove(value);
                // },
                isSelectedSizesCallback: (value) => isSelectedSizes = value,
                isSelectedList: isSelectedSizes,
                oldSize: selectedSize,
              ),

              // Big Images
              const TitlesWidget(title: 'Big images'),
              BlocProvider.value(
                value: BlocProvider.of<ImageCubit>(context),
                child: BigImagesWidget(
                  bigImagesCallback: (value) {
                    selectedBigImagesList = value;
                  },
                ),
              ),
            ],
          )
        : ListTile(
            onTap: () {
              AppBottomSheet.showBottomSheet(
                context: context,
                title: 'Image',
                content: colorsAndSizesContent(context),
              );
            },
            title: Text(
              'Color and sizes',
              style: AppTextStyles.black16Bold,
            ),
            subtitle: Text(
              'Выбрать цвет',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.sp,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
          );
  }

  colorsAndSizesContent(BuildContext context) {
    return Column(
      children: [
        /// Colors
        const TitlesWidget(title: 'Colors'),
        BlocBuilder<ColorsToggleBtnCubit, ColorsToggleBtnState>(
          builder: (context, state) {
            if (state is ColorsInitialState) {
              isSelectedColors = state.isSelected;
              return ColorsWidget(isSelected: state.isSelected);
            } else if (state is ColorsSelectedState) {
              selectedColor = state.colorName;
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
            //size();
            //addSelectedSize(value);
            //selectedSizeList.add(addSelectedSize(value));
            //selectedSizeList.add(value);
            selectedSize = value;
          },
          // sizeRemoveCallback: (value) {
          //   //addSelectedSize(value);
          //   //selectedSizeList.add(addSelectedSize(value));
          //   selectedSizeList.remove(value);
          // },
          isSelectedSizesCallback: (value) => isSelectedSizes = value,
          isSelectedList: [],
        ),

        // Big Images
        const TitlesWidget(title: 'Big images'),
        BlocProvider.value(
          value: BlocProvider.of<ImageCubit>(context),
          child: BigImagesWidget(
            bigImagesCallback: (value) {
              selectedBigImagesList = value;
            },
          ),
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
              // colorsAndSizesCallback!(ProductColorEntity(
              //   color: selectedColor,
              //   colorSizes: selectedSize,
              // ));
              // bigImagesCallback!(selectedBigImagesList);
              // BlocProvider.of<BigImageCubit>(context).getSelectedBigImages(
              //   selectedBigImages: bigImageUrlList,
              // );
              // BlocProvider.of<ColorsAndSizesCubit>(context).getColorsAndSizes(
              //   colorsAndSizes: ProductColorEntity(
              //     color: selectedColor,
              //     colorSizes: selectedSize,
              //     colorImages: selectedBigImagesList,
              //   ),
              //   selectedImagesList: selectedBigImagesList,
              //   selectedColorsList: isSelectedColors,
              //   selectedSizesList: isSelectedSizes,
              // );
              // colorsAndSizesList.add(
              //   ProductColorEntity(
              //     color: selectedColor,
              //     colorSizes: selectedSize,
              //     colorImages: selectedBigImagesList,
              //   ),
              // );
              log('Colors ====>>>>>> $selectedColor');
              //log('Sizes ====>>>>>> $isSelectedSizes');
              Navigator.pop(context);
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}
