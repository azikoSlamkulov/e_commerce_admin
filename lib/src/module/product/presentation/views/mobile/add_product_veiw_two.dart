//import 'dart:io';

import 'dart:developer';

// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_brands_list_view.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_categories_list_view.dart';

import 'package:e_commerce_admin/src/config/locator.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/inputs/custom_text_form_field.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/category_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_color_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_datail_entity.dart';
import 'package:e_commerce_admin/src/module/product/domain/entities/product_size_entity.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/category_toggle_btn_cubit/category_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_and_sizes/colors_and_sizes.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/product/product_bloc.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/color_and_sizes_view.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/test_view.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/build_brand_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/build_category_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/small_image_widget.dart';
import 'package:e_commerce_admin/src/module/product/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import '../../../../../config/locator.dart';

// import '../../../../../util/app_widgets/inputs/custom_text_form_field_tow.dart';
// import '../../logic/brand_cubit/brand_cubit.dart';
// import '../../logic/categories_bloc/categories_bloc.dart';
//

//import '../../widgets/titles_widget.dart';
// import '../../widgets/modal_bottom_sheet.dart';
// import '../../../../../util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// import 'home_view.dart';

class AddProductViewTwo extends StatelessWidget {
  const AddProductViewTwo({
    Key? key,
    //required this.productIndex,
  }) : super(key: key);

  //int productIndex;

  @override
  Widget build(BuildContext context) {
    //String brand = '';
    // final brands = BrandData().brands;
    // return NestedMobileBrandView(brands: brands);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorsToggleBtnCubit>(
          create: (context) => sl<ColorsToggleBtnCubit>(),
        ),
        BlocProvider<CategoryToggleBtnCubit>(
          create: (context) => sl<CategoryToggleBtnCubit>(),
        ),
        BlocProvider<SizesToggleBtnCubit>(
          create: (context) => sl<SizesToggleBtnCubit>(),
        ),
        BlocProvider<ColorsAndSizesCubit>(
          create: (context) => sl<ColorsAndSizesCubit>(),
        ),
        //BlocProvider<BrandsBloc>(create: (context) => sl<BrandsBloc>()),
        // BlocProvider<ProductBloc>(
        //   create: (context) => sl<ProductBloc>()..add(GetAllProductEvent()),
        // ),
        // BlocProvider<ProductCubit>(create: (context) => sl<ProductCubit>()),
        //BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        // BlocProvider<SingleToggleBtnCubit>(
        //     create: (context) => sl<SingleToggleBtnCubit>()),
        // BlocProvider<TypeToggleBtnCubit>(
        //     create: (context) => sl<TypeToggleBtnCubit>()),

        // BlocProvider<MultipleToogleBtnCubit>(
        //     create: (context) => sl<MultipleToogleBtnCubit>()),

        //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
        // BlocProvider<ShopBloc>(create: (context) => sl<ShopBloc>()),
      ],
      // child: BlocListener<ProductBloc, ProductState>(
      //   listener: (context, state) {
      //     if (state is CreatedProductState) {
      //       // CustomSnackbar().getSnackbar(
      //       //   context: context,
      //       //   title: state.isCreated ? 'Created' : 'Error',
      //       //   isError: state.isCreated ? false : true,
      //       // );
      //       //Navigator.pop(context);
      //     }
      //   },
      //   child: BlocBuilder<ProductBloc, ProductState>(
      //     builder: (context, state) {
      //       if (state is LoadingProductState) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (state is LoadedAllProductState) {
      //         return NestedAddProductView(
      //           productIndex: state.allProducts.length,
      //         );
      //       } else if (state is ProductFailureState) {
      //         //return MyErrorWidget('${state.exception}');
      //         return Text('');
      //       } else {
      //         //return const SomeError();,
      //         return Text('');
      //       }
      //     },
      //   ),
      // ),
      child: const NestedAddProductTwoView(),
    );
  }
}

final TextEditingController priseCtrl = TextEditingController();
final TextEditingController countCtrl = TextEditingController();
final TextEditingController descriptionCtrl = TextEditingController();

class NestedAddProductTwoView extends StatelessWidget {
  const NestedAddProductTwoView({
    super.key,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ProductSizeEntity addSelectedSize(String size) {
  //   return ProductSizeEntity(
  //     quantity: 5,
  //     size: size,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String selectedColor = 'Цвет не выбран';
    String smallImageUrl = '';
    //String smallImageName = '';
    List<String> selectedBigImagesList = [];

    String typedBrand = '';
    CategoryEntity typedCategory = const CategoryEntity();
    final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];
    List<ProductSizeEntity> selectedSizeList = [];
    List<ProductColorEntity>? colorsAndSizesList = [];

    int colorItemCount = 1;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Add product',
        showSearchBtn: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Small Image
              const TitlesWidget(title: 'Main image'),
              SmallImageWidget(
                smallImageCallback: (value) {
                  smallImageUrl = value.imageUrl!;
                  //smallImageName = value.imageName!;
                },
              ),

              // Color and sizes
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     // builder: (_) => BlocProvider.value(
                  //     //   value: BlocProvider.of<ColorsAndSizesCubit>(context)
                  //     //     ..getColors(),
                  //     //   child: ColorAndSizesView(),
                  //     // ),
                  //     builder: (context) => TestView(),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ColorAndSizesView(),
                      //builder: (context) => AddColorAndSizesWidget(),
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

              /// Category
              BuildCategoryWidget(
                callbackSelectedCategory: (value) => typedCategory = value,
              ),

              Container(
                height: 5.h,
                color: Colors.white,
              ),

              /// Brand
              BuildBrandWidget(
                callbackSelectedBrand: (value) {
                  typedBrand = value;
                },
              ),
              Container(
                height: 5.h,
                color: Colors.white,
              ),

              /// Sale
              // BuildSaleWidget(
              //     //callbackSelectedCategory: (value) => typedCategory = value,
              //     // formKey: formKey,
              //     // collectionChoice: collectionChoice,
              //     // typeChoice: typeChoice,
              //     //typedCategory: typedCategory,
              //     // callbackSelectedCategory: (value) => typedCategory = value,
              //     // callbackSelectedType: (value) => typeChoice = value,
              //     // callbackSelectedCollection: (value) =>
              //     //     collectionChoice = value,
              //     ),

              // Container(
              //   height: 5.h,
              //   color: Colors.white,
              // ),

              /// Description
              const TitlesWidget(title: 'Description'),
              buildDescription(descriptionCtrl),

              /// buttons
            ],
          ),
        ),
      ),

      /// BottomNavigationBar
      bottomNavigationBar: Container(
        padding: REdgeInsets.only(
          left: 16,
          right: 16,
          //bottom: 15,
        ),
        height: 80.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
              sizedBoxHeight: 36.h,
              sizedBoxWidth: 160.w,
              borderRadius: 30,
              bgColor: Colors.white,
              isBorderSide: true,
              text: Text(
                'Discard',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              onPressed: () {
                priseCtrl.clear();
                countCtrl.clear();
                descriptionCtrl.clear();
                Navigator.pop(context);
              },
            ),
            CustomElevatedButton(
              sizedBoxHeight: 36.h,
              sizedBoxWidth: 160.w,
              borderRadius: 30,
              text: Text(
                'Apply',
                style: TextStyle(fontSize: 14.sp),
              ),
              onPressed: () {
                BlocProvider.of<ProductBloc>(context).add(
                  SetProductEvent(
                    ProductDatailEntity(
                      category: CategoryEntity(
                        typeName: typedCategory.typeName,
                        collectionName: typedCategory.collectionName,
                        categoryName: typedCategory.categoryName,
                      ),
                      brand: typedBrand,
                      color: selectedColor,
                      colorAndSizes: colorsAndSizesList,
                      //sizes: selectedSizeList,
                      // price: double.parse(priseCtrl.text),
                      // quantity: int.parse(countCtrl.text),
                      price: 200.0,
                      quantity: 10,
                      description: descriptionCtrl.text,
                      reviews: const [],
                      imgUrl: smallImageUrl,
                      imgUrlList: selectedBigImagesList,
                    ),
                  ),
                );
                priseCtrl.clear();
                countCtrl.clear();
                descriptionCtrl.clear();
                //Navigator.pop(context);

                log('colorsandSizesList ===>>> $colorsAndSizesList');
                // log('color ====>>>>  $selectedColor');
                // log('selectedSizeList ====>>>>  $selectedSizeList');
                // log('selectedBigImagesList ===>>> $selectedBigImagesList');
                // log('prise ====>>>>  ${priseCtrl.text}');
                // log('prise ====>>>>  ${priseCtrl.text}');
                // log('count ====>>>>  ${countCtrl.text}');
                // log('Color ====>>>>  $selectedColor');
                // log('Size ====>>>>  $selectedSize');
                // log('typedBrand ====>>>>  $typedBrand');
                // log('typeName ====>>>>  ${typedCategory.typeName!}');
                // log('collectionName ====>>>>  ${typedCategory.collectionName!}');
                // log('categoryName ====>>>>  ${typedCategory.categoryName!}');
                // log('imageUrl ====>>>>  $imageUrl');
                // log('bigImagesUrlList ====>>>>  $bigImagesUrlList');
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavigationBar(
      //   context,
      //   () {
      //     BlocProvider.of<ProductBloc>(context).add(
      //       SetProductEvent(
      //         ProductEntities(
      //           //id: productIndex + 1,
      //           //name: nameController.text,
      //           type: typedCategory.type,
      //           collection: typedCategory.collection,
      //           category: typedCategory.category,
      //           brand: typedBrand,
      //           color: selectedColor,
      //           size: selectedSize,
      //           price: double.parse(priseController.text),
      //           count: int.parse(countController.text),
      //           imgUrl: nameController.text,
      //         ),
      //       ),
      //     );
      //     Navigator.pop(context);
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(
      //     //     builder: (context) => MobileHomeView(),
      //     //   ),
      //     // );

      //     // Future.delayed(Duration(milliseconds: 100)).then(
      //     //     (valueFuture) =>
      //     //         BlocProvider.of<ProductBloc>(context)
      //     //             .add(GetAllProductEvent()));

      //     // log(nameController.text);
      //     // log(priseController.text);
      //     // log(countController.text);
      //     // log(selectedColor);
      //     // log(selectedSize);
      //     // log(typedBrand);
      //     // log(typedCategory.type!);
      //     // log(typedCategory.collection!);
      //     // log(typedCategory.category!);
      //   },
      // ),
    );
  }
}

buildDescription(TextEditingController descriptionController) {
  return Padding(
    padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: CustomTextFormField(
      controller: descriptionController,
      sizedBoxHeight: 154.h,
      //sizedBoxWidth: MediaQuery.of(context).size.width,
      sizedBoxWidth: double.infinity,
      keyboardType: TextInputType.multiline,
      labelText: 'Enter description',
      fillColor: Colors.white,
      maxLines: 10,
    ),
  );
}

// titles(String title) {
//   return Padding(
//     padding: REdgeInsets.symmetric(horizontal: 16),
//     child: Container(
//       height: 42.h,
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           title,
//           style: AppTextStyles.black16Bold,
//           // style: TextStyle(
//           //   fontSize: 16.sp,
//           //   fontWeight: FontWeight.bold,
//           // ),
//         ),
//       ),
//     ),
//   );
// }

// colors(BuildContext context, List<bool> isSelected) {
//   return Container(
//     height: 80.h,
//     //color: Colors.blue.shade300,
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         FiltersColorsoggleButton(
//           bgColor: Colors.black,
//           isActivity: isSelected[0],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(0);
//           },
//         ),
//         FiltersColorsoggleButton(
//           bgColor: const Color(0xffff6f6f6),
//           isActivity: isSelected[1],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(1);
//           },
//         ),
//         FiltersColorsoggleButton(
//           bgColor: const Color(0xfffb82222),
//           isActivity: isSelected[2],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(2);
//           },
//         ),
//         FiltersColorsoggleButton(
//           bgColor: const Color(0xfffbea9a9),
//           isActivity: isSelected[3],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(3);
//           },
//         ),
//         FiltersColorsoggleButton(
//           bgColor: const Color(0xfffe2bb8d),
//           isActivity: isSelected[4],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(4);
//           },
//         ),
//         FiltersColorsoggleButton(
//           bgColor: const Color(0xfff151867),
//           isActivity: isSelected[5],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(5);
//           },
//         ),
//       ],
//     ),
//   );
// }

// sizes(BuildContext context, List<bool> isSelected) {
//   return Container(
//     height: 88.h,
//     color: Colors.white,
//     child: Row(
//       children: [
//         CustomToggleButton(
//           text: 'XS',
//           isActivity: isSelected[0],
//           onPressed: () {
//             BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
//           },
//           fontSize: 14.sp,
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 40.h,
//           paddingOnlyLeft: 16.h,
//         ),
//         CustomToggleButton(
//           text: 'S',
//           isActivity: isSelected[1],
//           onPressed: () {
//             BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
//           },
//           fontSize: 14.sp,
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 40.h,
//           paddingOnlyLeft: 16.h,
//         ),
//         CustomToggleButton(
//           text: 'L',
//           isActivity: isSelected[2],
//           onPressed: () {
//             BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
//           },
//           fontSize: 14.sp,
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 40.h,
//           paddingOnlyLeft: 16.h,
//         ),
//         CustomToggleButton(
//           text: 'M',
//           isActivity: isSelected[3],
//           onPressed: () {
//             BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
//           },
//           fontSize: 14.sp,
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 40.h,
//           paddingOnlyLeft: 16.h,
//         ),
//         CustomToggleButton(
//           text: 'XL',
//           isActivity: isSelected[4],
//           onPressed: () {
//             BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
//           },
//           fontSize: 14.sp,
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 40.h,
//           paddingOnlyLeft: 16.h,
//         ),
//       ],
//     ),
//   );
// }

// bottomNavigationBar(
//   BuildContext context,
//   VoidCallback onPressed,
// ) {
//   return Container(
//     padding: REdgeInsets.only(
//       left: 16,
//       right: 16,
//       bottom: 25,
//     ),
//     height: 104.h,
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomElevatedButton(
//           sizedBoxHeight: 36.h,
//           sizedBoxWidth: 160.w,
//           borderRadius: 30,
//           bgColor: Colors.white,
//           isBorderSide: true,
//           text: Text(
//             'Discard',
//             style: TextStyle(color: Colors.black, fontSize: 14.sp),
//           ),
//           onPressed: () {},
//         ),
//         CustomElevatedButton(
//           sizedBoxHeight: 36.h,
//           sizedBoxWidth: 160.w,
//           borderRadius: 30,
//           text: Text(
//             'Apply',
//             style: TextStyle(fontSize: 14.sp),
//           ),
//           onPressed: onPressed,
//         ),
//       ],
//     ),
//   );
// }

// buttons(
//   BuildContext context,
//   ProductEntities product,
// ) {
//   return Container(
//     padding: REdgeInsets.only(
//       left: 16,
//       right: 16,
//       bottom: 25,
//     ),
//     height: 104.h,
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomElevatedButton(
//           sizedBoxHeight: 36.h,
//           sizedBoxWidth: 160.w,
//           borderRadius: 30,
//           bgColor: Colors.white,
//           isBorderSide: true,
//           text: Text(
//             'Discard',
//             style: TextStyle(color: Colors.black, fontSize: 14.sp),
//           ),
//           onPressed: () {},
//         ),
//         CustomElevatedButton(
//           sizedBoxHeight: 36.h,
//           sizedBoxWidth: 160.w,
//           borderRadius: 30,
//           text: Text(
//             'Apply',
//             style: TextStyle(fontSize: 14.sp),
//           ),
//           onPressed: () {
//             BlocProvider.of<ProductBloc>(context).add(
//               SetProductEvent(
//                 product,
//                 // ProductEntities(
//                 //   //id: productIndex + 1,
//                 //   //name: nameController.text,
//                 //   type: typedCategory.type,
//                 //   collection: typedCategory.collection,
//                 //   category: typedCategory.category,
//                 //   brand: typedBrand,
//                 //   color: selectedColor,
//                 //   size: selectedSize,
//                 //   price: double.parse(priseController.text),
//                 //   count: int.parse(countController.text),
//                 //   imgUrl: nameController.text,
//                 // ),
//               ),
//             );
//             Navigator.pop(context);
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => MobileHomeView(),
//             //   ),
//             // );

//             // Future.delayed(Duration(milliseconds: 100)).then(
//             //     (valueFuture) =>
//             //         BlocProvider.of<ProductBloc>(context)
//             //             .add(GetAllProductEvent()));

//             // log(nameController.text);
//             // log(priseController.text);
//             // log(countController.text);
//             // log(selectedColor);
//             // log(selectedSize);
//             // log(typedBrand);
//             // log(typedCategory.type!);
//             // log(typedCategory.collection!);
//             // log(typedCategory.category!);
//           },
//         ),
//       ],
//     ),
//   );
// }

// photoBtn() {
//   return Container(
//     height: 70,
//     //width: MediaQuery.of(context).size.width,
//     color: Colors.white,
//     padding: REdgeInsets.symmetric(
//       horizontal: 80,
//       vertical: 15,
//     ),

//     child: Center(
//       child: CustomElevatedButton(
//         text: Text(
//           'Add photo',
//           style: TextStyle(fontSize: 14.sp),
//         ),
//         onPressed: () {},
//       ),
//     ),
//   );
// }

// saleBtn() {
//   return Container(
//     height: 70,
//     //width: MediaQuery.of(context).size.width,
//     color: Colors.white,
//     padding: REdgeInsets.symmetric(
//       horizontal: 80,
//       vertical: 15,
//     ),

//     child: Center(
//       child: CustomElevatedButton(
//         text: Text(
//           'Sale',
//           style: TextStyle(fontSize: 14.sp),
//         ),
//         onPressed: () {},
//       ),
//     ),
//   );
// }

// saleAndNew(
//   BuildContext context,
//   List<bool> isSelected,
// ) {
//   return Container(
//     height: 70,
//     color: Colors.white,
//     padding: REdgeInsets.symmetric(
//       horizontal: 80,
//       vertical: 15,
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomToggleButton(
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 122.h,
//           isActivity: isSelected[0],
//           text: 'New',
//           onPressed: () {
//             BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
//           },
//         ),
//         20.horizontalSpace,
//         CustomToggleButton(
//           sizedBoxHeight: 40.h,
//           sizedBoxWidth: 122.h,
//           isActivity: isSelected[1],
//           text: 'Sale',
//           onPressed: () {
//             BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
//           },
//         ),
//       ],
//     ),
//   );
// }

// category(BuildContext context, List<bool> isSelected) {
//   return Container(
//     height: 140.h,
//     padding: REdgeInsets.symmetric(
//       horizontal: 16,
//       vertical: 24,
//     ),
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomToggleButton(
//               sizedBoxHeight: 40.h,
//               sizedBoxWidth: 122.h,
//               isActivity: isSelected[0],
//               text: 'All',
//               onPressed: () {
//                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
//               },
//             ),
//             CustomToggleButton(
//               sizedBoxHeight: 40.h,
//               sizedBoxWidth: 122.h,
//               isActivity: isSelected[1],
//               text: 'Boys',
//               onPressed: () {
//                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
//               },
//             ),
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomToggleButton(
//               sizedBoxHeight: 40.h,
//               sizedBoxWidth: 122.h,
//               text: 'Women',
//               isActivity: isSelected[2],
//               onPressed: () {
//                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(2);
//               },
//             ),
//             CustomToggleButton(
//               sizedBoxHeight: 40.h,
//               sizedBoxWidth: 122.h,
//               isActivity: isSelected[3],
//               text: 'Girls',
//               onPressed: () {
//                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(3);
//               },
//             ),
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CustomToggleButton(
//               sizedBoxHeight: 40.h,
//               sizedBoxWidth: 122.h,
//               isActivity: isSelected[4],
//               text: 'Men',
//               onPressed: () {
//                 BlocProvider.of<CategoryToggleBtnCubit>(context).selected(4);
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// listTileBtn(
//   BuildContext context,
//   String text,
//   String subtitle,
//   VoidCallback onTap,
// ) {
//   return ListTile(
//     onTap: onTap,
//     // onTap: () {
//     //   GoRouter.of(context).goNamed(
//     //     APP_PAGE.shopBrand.toName,
//     //   );
//     // },
//     title: Text(
//       text,
//       style: AppTextStyles.black16Bold,
//     ),
//     subtitle: Text(
//       subtitle,
//       style: TextStyle(
//         color: Colors.black38,
//         fontSize: 14.sp,
//       ),
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }

//https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg
