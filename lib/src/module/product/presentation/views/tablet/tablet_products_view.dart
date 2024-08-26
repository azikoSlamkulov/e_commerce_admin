// import 'package:e_commerce_admin/src/module/product/domain/entities/product_entity.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/logic/product_bloc/product_bloc.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_add_product_veiw.dart';
// import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
// import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// import '../../../../../config/locator.dart';
// import '../../../../../config/util/app_widgets/dialogs/custom_snackbar.dart';
// import '../../../../../config/util/datetime_format/datetime_format.dart';
// import '../../../../../config/util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// import 'package:flash/flash.dart';

// //allow read, write: if request.auth != null;

// class TabletProductsView extends StatelessWidget {
//   const TabletProductsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
//     return BlocListener<ProductBloc, ProductState>(
//       listener: (context, state) {
//         if (state is CreatedProductState) {
//           BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
//           CustomSnackbar().getSnackbar(
//             context: context,
//             title: 'Продукт добавлен',
//             isError: false,
//           );
//         }
//       },
//       child: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is LoadingProductState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is LoadedAllProductState) {
//             return NestedProductsView(
//               allProducts: state.allProducts,
//             );
//           } else if (state is ProductFailureState) {
//             //return MyErrorWidget('${state.exception}');
//             return Text('');
//           } else {
//             //return const SomeError();,
//             return Text('');
//           }
//         },
//       ),
//     );
//   }
// }

// class NestedProductsView extends StatelessWidget {
//   NestedProductsView({super.key, required this.allProducts});

//   final List<ProductEntity> allProducts;

//   final String collectionChoice = '';
//   final String typeChoice = '';
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColorMain,
//       appBar: CustomAppBar(
//         title: 'Products',
//         showBackBtn: false,
//         showSearchBtn: true,
//         onPressed: () {
//           return BlocProvider.of<ProductBloc>(context).add(
//             GetAllProductEvent(),
//           );
//         },
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ///SearchBar
//           // Padding(
//           //   padding: REdgeInsets.only(left: 16, right: 16, top: 22),
//           //   child: CustomSearchBar(),
//           // ),

//           Padding(
//             padding: REdgeInsets.only(left: 16, right: 16, top: 22),
//             child: CustomElevatedButton(
//               sizedBoxHeight: 50.h,
//               sizedBoxWidth: MediaQuery.of(context).size.width,
//               borderRadius: 30,
//               bgColor: AppColors.mainColor,
//               //isBorderSide: true,
//               text: Text(
//                 'ADD NEW PRODUCT',
//                 style: AppTextStyles.white14,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MobileAddProductView(),
//                   ),
//                 );
//               },
//             ),
//           ),

//           //10.verticalSpace,
//           Padding(
//             padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
//             child: Text(
//               'All products',
//               style: AppTextStyles.grey14,
//             ),
//           ),

//           /// Products ListView
//           Expanded(
//             child: ListView.separated(
//               itemCount: allProducts.length,
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(
//                 height: 0,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 final product = allProducts[index];
//                 final isNew = DateTimeFormatter().isNew(product.createdDate!);
//                 return ListTile(
//                   onTap: () {},
//                   title: Text(
//                     product.category!.categoryName!,
//                     style: AppTextStyles.black16,
//                   ),
//                   subtitle: isNew
//                       ? Text(
//                           'NEW',
//                           style: AppTextStyles.black16,
//                         )
//                       : Text(
//                           product.createdDate!,
//                           style: AppTextStyles.black16,
//                         ),
//                   contentPadding: REdgeInsets.symmetric(horizontal: 16),
//                   minVerticalPadding: 1,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// //   showCustomDialog(
// //     BuildContext context,
// //     TextEditingController controller,
// //     String text,
// //     Widget content,
// //     //String labelText,
// //     VoidCallback onPressed,
// //   ) {
// //     return showDialog(
// //       context: context,
// //       builder: (ctx) => AlertDialog(
// //         title: Text(text),
// //         content: content,
// //         actions: [
// //           ElevatedButton(
// //             onPressed: onPressed,
// //             child: const Text("Ok"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   buildBrandContent(BuildContext context) {
// //     return CustomTextFormField(
// //       controller: controller,
// //       sizedBoxHeight: 40.h,
// //       sizedBoxWidth: MediaQuery.of(context).size.width,
// //       labelText: 'Enter brand name',
// //     );
// //   }

// //   buildCategoryContent(BuildContext context) {
// //     return CustomTextFormField(
// //       controller: controller,
// //       sizedBoxHeight: 40.h,
// //       sizedBoxWidth: MediaQuery.of(context).size.width,
// //       labelText: 'Enter brand name',
// //     );
// //   }

// //   buildListTile(
// //     BuildContext context,
// //     String text,
// //     VoidCallback onTap,
// //   ) {
// //     return Expanded(
// //       child: Card(
// //         child: ListTile(
// //           onTap: onTap,
// //           title: Text(
// //             text,
// //             style: AppTextStyles.black16,
// //           ),
// //           trailing: const Icon(Icons.chevron_right),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // categoryList() {
// //   return Expanded(
// //     child: Card(
// //       child: ExpansionTile(
// //         title: Text('Categories'),
// //         children: [
// //           ExpansionTile(
// //             title: Text('Women'),
// //             children: [
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text('Men'),
// //             children: [
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text('Kids'),
// //             children: [
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //               ListTile(
// //                 title: Text(''),
// //                 onTap: () {},
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// }

// // showCategoryDialog(
// //   BuildContext context,
// //   TextEditingController controller,
// //   String text,
// //   String labelText,
// //   VoidCallback onPressed,
// //   List<String> typeItems,
// //   List<String> collectionItems,
// // ) {
// //   return showDialog(
// //     context: context,
// //     builder: (ctx) => AlertDialog(
// //       title: Text(text),
// //       content: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 'Type',
// //                 style: AppTextStyles.black18,
// //               ),
// //               DropdownMenu(
// //                 items: typeItems,
// //                 selectedItem: typeItems[0],
// //                 validator: (itemIndex) {
// //                   if (itemIndex == typeItems[0]) {
// //                     return 'dddd';
// //                     //showBottomSheet(context, isSelected);
// //                     //log('color');
// //                   }
// //                 },
// //               ),
// //             ],
// //           ),
// //           10.verticalSpace,
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 'Collection',
// //                 style: AppTextStyles.black18,
// //               ),
// //               DropdownMenu(
// //                 items: collectionItems,
// //                 selectedItem: collectionItems[0],
// //                 validator: (itemIndex) {
// //                   if (itemIndex == collectionItems[0]) {
// //                     return 'dddd';
// //                     //showBottomSheet(context, isSelected);
// //                     //log('color');
// //                   }
// //                 },
// //               ),
// //             ],
// //           ),
// //           20.verticalSpace,
// //           CustomTextFormField(
// //             controller: controller,
// //             sizedBoxHeight: 40.h,
// //             sizedBoxWidth: MediaQuery.of(context).size.width,
// //             labelText: 'Enter category name',
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         ElevatedButton(
// //           onPressed: onPressed,
// //           child: const Text("Ok"),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // buildExpansionTile(
// //   String mainTitle,
// //   String firstTitle,
// //   String secondTitle,
// //   VoidCallback firstOnTap,
// //   VoidCallback secondOnTap,
// // ) {
// //   return Card(
// //     child: ExpansionTile(
// //       title: Text(mainTitle),
// //       children: [
// //         ListTile(
// //           title: Text(firstTitle),
// //           onTap: firstOnTap,
// //         ),
// //         ListTile(
// //           title: Text(secondTitle),
// //           onTap: secondOnTap,
// //         ),
// //       ],
// //     ),
// //   );
// // }


// //  buildExpansionTile(
// //                     'Type',
// //                     'Add types',
// //                     'List of types',
// //                     () {
// //                       showCustomDialog(
// //                         context,
// //                         controller,
// //                         'Add type',
// //                         () {
// //                           BlocProvider.of<CategoriesBloc>(context).add(
// //                             AddTypeEvent(
// //                               controller.text,
// //                             ),
// //                           );
// //                           controller.clear();
// //                           Navigator.of(context).pop();
// //                         },
// //                       );
// //                     },
// //                     () {},
// //                   ),