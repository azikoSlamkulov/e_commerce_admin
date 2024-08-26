import 'dart:developer';

import 'package:e_commerce_admin/src/config/locator.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_button.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_and_sizes/colors_and_sizes.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/add_color_and_sizes_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/build_colors_and_sizes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorAndSizesView extends StatelessWidget {
  const ColorAndSizesView({
    // required this.colorsAndSizesCallback,
    // required this.bigImagesCallback,
    super.key,
  });

  // final ValueSetter<ProductColorEntity>? colorsAndSizesCallback;
  // final ValueSetter<List<String>>? bigImagesCallback;

  @override
  Widget build(BuildContext context) {
    TextEditingController sizeTextController = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorsAndSizesCubit>(
          create: (context) => sl<ColorsAndSizesCubit>()..getColors(),
        ),
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
      ],
      child: BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
        builder: (context, state) {
          if (state is LoadedColorsState) {
            return Scaffold(
              backgroundColor: AppColors.bgColorMain,
              appBar: CustomAppBar(
                title: 'Colors and sizes',
                showSearchBtn: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<ColorsAndSizesCubit>(context),
                              child: const AddColorAndSizesWidget(),
                            ),
                          ),
                        );
                      },
                      title: Text(
                        'Color and sizes',
                        style: AppTextStyles.black16Bold,
                      ),
                      subtitle: Text(
                        '',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14.sp,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    Container(
                      height: 5.h,
                      color: Colors.white,
                    ),
                    state.colorsList.isNotEmpty
                        ? ListView.separated(
                            itemCount: state.colorsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final colorsAndSizes = state.colorsList[index];
                              return BuildColorsAndSizesWidget(
                                // colorsAndSizesCallback: (value) =>
                                //     colorsAndSizesList.add(value),
                                // bigImagesCallback: (value) =>
                                //     selectedBigImagesList = value,
                                colorsAndSizes: colorsAndSizes,
                              );
                            },
                            separatorBuilder: (context, index) => Container(
                              height: 5.h,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      height: 5.h,
                      color: Colors.white,
                    ),
                    // BlocBuilder<ColorsAndSizesCubit, ColorsAndSizesState>(
                    //   builder: (context, state) {
                    //     if (state is LoadedColorsAndSizesState) {
                    //       colorsAndSizesList.add(state.colorsAndSizesList);
                    //       ListView.separated(
                    //         itemCount: 5,
                    //         shrinkWrap: true,
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         itemBuilder: (context, index) {
                    //           final colorsAndSizes = colorsAndSizesList[index];
                    //           return BuildColorsAndSizesWidget(
                    //             // colorsAndSizesCallback: (value) =>
                    //             //     colorsAndSizesList.add(value),
                    //             // bigImagesCallback: (value) =>
                    //             //     selectedBigImagesList = value,
                    //             colorsAndSizes: colorsAndSizes,
                    //           );
                    //         },
                    //         separatorBuilder: (context, index) => Container(
                    //           height: 5.h,
                    //           color: Colors.white,
                    //         ),
                    //       );
                    //     }
                    //     return const SizedBox();
                    //   },
                    // ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                padding:
                    REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
                height: 112.h,
                color: Colors.white,
                child: CustomButton(
                  text: 'Ok',
                  onPressed: () {},
                ),
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
