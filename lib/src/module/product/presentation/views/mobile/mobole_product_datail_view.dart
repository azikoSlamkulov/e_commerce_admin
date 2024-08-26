// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/rating_and_reviews_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../config/util/app_constants/colors/app_colors.dart';
// import '../../../../../config/util/app_constants/text_styles/app_text_styles.dart';
// import '../../../../../config/util/app_widgets/app_rating_bar_indicator.dart';
// import '../../../../../config/util/app_widgets/bar/custom_app_bar.dart';
// import '../../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
// import '../../../../../config/util/app_widgets/buttons/favorite_toggle_icon_button.dart';
// import '../../../../../config/util/app_widgets/dialogs/custom_snackbar.dart';
// import '../../../domain/entities/product_entity.dart';
// import '../../logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
// import '../../logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
// import '../../widgets/custom_dropdown_menu.dart';
// import '../../widgets/custom_horizontal_list_view_widget.dart';
// import '../../widgets/custom_toggle_button.dart';
// import '../../widgets/filters_colors_toggle_btn.dart';

// class MobileProductDatailView extends StatelessWidget {
//   const MobileProductDatailView({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final ProductEntity product;
//   //final String productID;

//   @override
//   Widget build(BuildContext context) {
//     // return BlocListener<BagBloc, BagState>(
//     //   listener: (context, state) {
//     //     if (state is AddedProductToCartState) {
//     //       CustomSnackbar().getSnackbar(context: context, title: 'Добавлен.');
//     //       //Navigator.pop(context);
//     //       // TODO: Доделать возврат на пред. страницу после добавления в корзину
//     //     }
//     //   },
//     //   child: NestedMobileProductDatailView(
//     //     product: product,
//     //     //allNewProducts: allNewProducts,
//     //   ),
//     //   // child: BlocBuilder<ProductBloc, ProductState>(
//     //   //   builder: (context, state) {
//     //   //     if (state is LoadingProductState) {
//     //   //       return const Scaffold(
//     //   //         backgroundColor: AppColors.white,
//     //   //         body: Center(
//     //   //           child: CircularProgressIndicator(),
//     //   //         ),
//     //   //       );
//     //   //     } else if (state is LoadedProductState) {
//     //   //       BlocProvider.of<ProductListBloc>(context).add(
//     //   //         GetSortedProductsEvent(
//     //   //           firstQuery: state.product.type,
//     //   //           secondQuery: state.product.collectionName,
//     //   //           thirdQuery: state.product.categoryName,
//     //   //         ),
//     //   //       );
//     //   //       //final allNewProducts = FakeProductData().allFakeProducts;
//     //   //       return NestedMobileProductDatailView(
//     //   //         product: state.product,
//     //   //         //allNewProducts: allNewProducts,
//     //   //       );
//     //   //     } else {
//     //   //       return const Center(child: Text('Login'));
//     //   //     }
//     //   //   },
//     //   // ),
//     //   // child: BlocBuilder<AuthBloc, AuthState>(
//     //   //   builder: (context, state) {
//     //   //     if (state is AuthenticatedState) {
//     //   //       return NestedMobileProductDatailView(
//     //   //         product: product,
//     //   //         allNewProducts: allNewProducts,
//     //   //         userID: state.user.userID!,
//     //   //       );
//     //   //     } else {
//     //   //       return const Center(child: Text('Login'));
//     //   //     }
//     //   //   },
//     //   // ),
//     // );
//     return NestedMobileProductDatailView(
//       product: product,
//       //allNewProducts: allNewProducts,
//     );
//   }
// }

// class NestedMobileProductDatailView extends StatelessWidget {
//   const NestedMobileProductDatailView({
//     super.key,
//     required this.product,
//     //required this.allNewProducts,
//     //required this.userID,
//   });

//   //final List<ProductsListEntity> allNewProducts;
//   final ProductEntity product;
//   //final String userID;

//   @override
//   Widget build(BuildContext context) {
//     final List<String> sizeItems = ['XS', 'S', 'M', 'L', 'XL'];
//     // final List<String> colorItems = ['Color', 'Black', 'White', 'Red', 'Blue'];
//     final List<String?> colorItems =
//         product.colors!.map((e) => e.color).toList();
//     String size = 'Size';
//     String color = 'Color';
//     List<bool> isSelected = [false, false, false, false, false];

//     return Scaffold(
//       backgroundColor: AppColors.bgColorMain,
//       appBar: CustomAppBar(
//         title: '${product.category!.categoryName}',
//         showShareBtn: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Product image
//             Container(
//               height: 413.h,
//               decoration: BoxDecoration(
//                 //color: Colors.greenAccent,
//                 image: DecorationImage(
//                   image: NetworkImage(product.imgUrl!),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.r),
//                   bottomLeft: Radius.circular(10.r),
//                 ),
//               ),
//             ),

//             /// choose size and color
//             12.verticalSpace,
//             Padding(
//               padding: REdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //ToDo: Доделать DropdownMenu
//                       CustomDropdownMenu(
//                         items: sizeItems,
//                         //selectedItem: sizeItems[0],
//                         isHint: true,
//                         hintText: size,
//                         callback: (value) => size = value,
//                       ),
//                       //16.horizontalSpace,
//                       CustomDropdownMenu(
//                         items: colorItems,
//                         selectedItem: colorItems[0],
//                         callback: (value) => color = value,
//                       ),
//                       //16.horizontalSpace,
//                       FavoriteToggleIconBtn(),
//                     ],
//                   ),
//                   22.verticalSpace,

//                   /// Product datails
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${product.brand}',
//                         style: AppTextStyles.black24Bold,
//                       ),
//                       Text(
//                         '\$${product.price}',
//                         style: AppTextStyles.black24Bold,
//                       ),
//                     ],
//                   ),
//                   5.verticalSpace,
//                   Text(
//                     '${product.category!.categoryName}',
//                     style: AppTextStyles.grey11,
//                   ),
//                   5.verticalSpace,
//                   AppRatingBarIndicator(product: product, itemSize: 15.h),

//                   /// Product
//                   20.verticalSpace,
//                   // TODO: Доделать описание продукта
//                   Container(
//                     height: 120.h,
//                     //color: Colors.blue[400],
//                     child: product.description != ''
//                         ? Text(
//                             product.description!,
//                             style: AppTextStyles.black14,
//                           )
//                         : Center(
//                             child: Text(
//                               'Без описания!',
//                               style: AppTextStyles.grey16,
//                             ),
//                           ),
//                   ),
//                 ],
//               ),
//             ),

//             ///
//             20.verticalSpace,
//             const Divider(height: 0),
//             datailListileBtn(
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => RatingAndReviewsView(
//                 //       product: product,
//                 //     ),
//                 //   ),
//                 // );
//               },
//               text: 'Item details',
//             ),
//             const Divider(height: 0),
//             datailListileBtn(
//               onTap: () {},
//               text: 'Shipping info',
//             ),
//             const Divider(height: 0),
//             datailListileBtn(
//               onTap: () {},
//               text: 'Support',
//             ),
//             const Divider(height: 0),

//             /// Product list
//             // TODO: Доделать список
//             40.verticalSpace,
//             // BlocBuilder<ProducBloc, ProductState>(
//             //   builder: (context, state) {
//             //     if (state is LoadedProductsState) {
//             //       return CustomHorizontalListViewWidget(
//             //         products: state.allProducts,
//             //         title: 'You can also like this',
//             //         subtitle: '',
//             //       );
//             //       // return Column(
//             //       //   children: [
//             //       //     Padding(
//             //       //       padding: REdgeInsets.symmetric(horizontal: 16),
//             //       //       child: Row(
//             //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       //         children: [
//             //       //           Text(
//             //       //             'You can also like this',
//             //       //             style: AppTextStyles.black18Bold,
//             //       //           ),
//             //       //           Text(
//             //       //             //'12 items',
//             //       //             '${state.allProducts.length} items',
//             //       //             style: AppTextStyles.grey11,
//             //       //           ),
//             //       //         ],
//             //       //       ),
//             //       //     ),
//             //       //     15.verticalSpace,
//             //       //     CustomListViewWidget(
//             //       //       products: state.allProducts,
//             //       //       title: 'You can also like this',
//             //       //       subtilte: '',
//             //       //     ),
//             //       //   ],
//             //       // );
//             //     }
//             //     return Align(
//             //       alignment: Alignment.center,
//             //       child: Text(
//             //         'Some Error!',
//             //         style: AppTextStyles.grey16,
//             //       ),
//             //     );
//             //   },
//             // ),
//             // 15.verticalSpace,
//             // BlocBuilder<ProductListBloc, ProductsListState>(
//             //   builder: (context, state) {
//             //     if (state is LoadedProductsListState) {
//             //       return CustomListView(allProducts: state.allProducts);
//             //     } else {
//             //       return Align(
//             //         alignment: Alignment.center,
//             //         child: Text(
//             //           'Список пуст!',
//             //           style: AppTextStyles.grey16,
//             //         ),
//             //       );
//             //     }
//             //   },
//             // ),
//           ],
//         ),
//       ),

//       ///
//       bottomNavigationBar: Container(
//         padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
//         height: 112.h,
//         color: Colors.white,
//         child: CustomElevatedButton(
//           sizedBoxHeight: 48.h,
//           sizedBoxWidth: MediaQuery.of(context).size.width,
//           borderRadius: 30,
//           bgColor: AppColors.mainColor,
//           text: Text(
//             'ADD TO CART',
//             style: TextStyle(color: Colors.white, fontSize: 14.sp),
//           ),
//           onPressed: () {
//             if (size == 'Size') {
//               bottomSheetBtn(context, isSelected, color, product);
//             } else {
//               // BlocProvider.of<BagBloc>(context).add(
//               //   SetProductToCartEvent(
//               //     BagEntity(
//               //       productID: product.productID,
//               //       name: product.category!.categoryName,
//               //       color: color,
//               //       size: size,
//               //       pricePerUnit: product.price,
//               //       cardTotalPrice: product.price,
//               //       quantity: 1,
//               //       productImgUrl: product.imgUrl,
//               //     ),
//               //   ),
//               // );
//               // Navigator.pop(context);
//             }
//             // if (_formKey.currentState!.validate()) {
//             //   log('color');
//             // }
//           },
//         ),
//       ),
//     );
//   }
// }

// datailListileBtn({required VoidCallback onTap, required String text}) {
//   return ListTile(
//     onTap: onTap,
//     title: Text(
//       text,
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }

// bottomSheetBtn(BuildContext context, List<bool> isSelected, String color,
//     ProductEntity product) {
//   String size = '';
//   return showModalBottomSheet<void>(
//     context: context,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30.r),
//         topRight: Radius.circular(30.r),
//       ),
//     ),
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: 352.h,
//         child: Column(
//           children: [
//             Center(
//               child: Padding(
//                 padding: REdgeInsets.only(top: 36),
//                 child: Text(
//                   'Select size',
//                   style: AppTextStyles.black18,
//                   // style: TextStyle(
//                   //   fontSize: 18.sp,
//                   //   fontWeight: FontWeight.bold,
//                   // ),
//                 ),
//               ),
//             ),
//             22.verticalSpace,
//             BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
//               builder: (context, state) {
//                 if (state is SizesSelectedState) {
//                   size = state.selectedSize;
//                   return sizesBtn(context, state.isSelected);
//                 }
//                 return sizesBtn(context, isSelected);
//               },
//             ),
//             //sizesBtn(context, isSelected),
//             22.verticalSpace,
//             sbrandButton(context),
//             Padding(
//               padding: REdgeInsets.all(16),
//               child: CustomElevatedButton(
//                 sizedBoxHeight: 48.h,
//                 sizedBoxWidth: MediaQuery.of(context).size.width,
//                 borderRadius: 30,
//                 bgColor: AppColors.mainColor,
//                 text: Text(
//                   'ADD TO CART',
//                   style: TextStyle(color: Colors.white, fontSize: 14.sp),
//                 ),
//                 onPressed: () {
//                   // if (size != '') {
//                   //   BlocProvider.of<BagBloc>(context).add(
//                   //     SetProductToCartEvent(
//                   //       BagEntity(
//                   //         productID: product.productID,
//                   //         name: product.category!.categoryName,
//                   //         color: color,
//                   //         size: size,
//                   //         pricePerUnit: product.price,
//                   //         cardTotalPrice: product.price,
//                   //         quantity: 1,
//                   //         productImgUrl: product.imgUrl,
//                   //       ),
//                   //     ),
//                   //   );
//                   //   Navigator.pop(context);
//                   // } else {
//                   //   CustomSnackbar()
//                   //       .getSnackbar(context: context, title: 'Select size.');
//                   // }
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// productDatailColors(BuildContext context, List<bool> isSelected) {
//   return Container(
//     height: 92.h,
//     //color: Colors.blue.shade300,
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         FilterColorsToggleButton(
//           bgColor: Colors.black,
//           isActivity: isSelected[0],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(0);
//           },
//         ),
//         FilterColorsToggleButton(
//           bgColor: const Color(0xffff6f6f6),
//           isActivity: isSelected[1],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(1);
//           },
//         ),
//         FilterColorsToggleButton(
//           bgColor: const Color(0xfffb82222),
//           isActivity: isSelected[2],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(2);
//           },
//         ),
//         FilterColorsToggleButton(
//           bgColor: const Color(0xfffbea9a9),
//           isActivity: isSelected[3],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(3);
//           },
//         ),
//         FilterColorsToggleButton(
//           bgColor: const Color(0xfffe2bb8d),
//           isActivity: isSelected[4],
//           onPressed: () {
//             BlocProvider.of<ColorsToggleBtnCubit>(context).selected(4);
//           },
//         ),
//         FilterColorsToggleButton(
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

// sizesBtn(BuildContext context, List<bool> isSelected) {
//   return Padding(
//     padding: REdgeInsets.symmetric(horizontal: 16),
//     child: Container(
//       height: 100.h,
//       // padding: REdgeInsets.symmetric(
//       //   horizontal: 16,
//       //   vertical: 24,
//       // ),
//       //color: Colors.red,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomToggleButton(
//                 sizedBoxHeight: 40.h,
//                 sizedBoxWidth: 122.h,
//                 isActivity: isSelected[0],
//                 text: 'XS',
//                 onPressed: () {
//                   BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
//                 },
//               ),
//               CustomToggleButton(
//                 sizedBoxHeight: 40.h,
//                 sizedBoxWidth: 122.h,
//                 isActivity: isSelected[1],
//                 text: 'L',
//                 onPressed: () {
//                   BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
//                 },
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomToggleButton(
//                 sizedBoxHeight: 40.h,
//                 sizedBoxWidth: 122.h,
//                 text: 'S',
//                 isActivity: isSelected[2],
//                 onPressed: () {
//                   BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
//                 },
//               ),
//               CustomToggleButton(
//                 sizedBoxHeight: 40.h,
//                 sizedBoxWidth: 122.h,
//                 isActivity: isSelected[3],
//                 text: 'XL',
//                 onPressed: () {
//                   BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
//                 },
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomToggleButton(
//                 sizedBoxHeight: 40.h,
//                 sizedBoxWidth: 122.h,
//                 isActivity: isSelected[4],
//                 text: 'M',
//                 onPressed: () {
//                   BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// sbrandButton(BuildContext context) {
//   return ListTile(
//     shape: const Border(
//       top: BorderSide(color: Colors.black12, width: 0.5),
//       bottom: BorderSide(color: Colors.black12, width: 0.5),
//     ),
//     onTap: () {
//       // GoRouter.of(context).goNamed(
//       //   APP_PAGE.shopBrand.toName,
//       // );
//     },
//     title: Text(
//       'Size info',
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }
