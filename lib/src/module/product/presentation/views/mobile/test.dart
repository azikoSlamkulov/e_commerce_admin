// import 'dart:developer';

// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_brands_list_view.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_categories_list_view.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/dialogs/app_custom_bottom_sheet.dart';
// import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
// import 'package:e_commerce_admin/src/config/util/app_widgets/inputs/custom_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     TextEditingController nameController = TextEditingController();
//     TextEditingController priseController = TextEditingController();
//     String selectedColor = '';
//     String selectedSize = '';
//     String collectionChoice = '';
//     String typeChoice = '';
//     String typedBrand = 'Бренд не выбран';
//     String typedCategory = 'Категория не выбрана';
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Test'),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 //minLines: 10,
//                 //maxLines: 10,
//                 controller: nameController,
//                 //keyboardType: keyboardType,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 5.0,
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Поле не должно быть пустым!';
//                   }
//                   return null;
//                 },
//                 //onChanged: onChanged,
//               ),
//               // 20.verticalSpace,
//               // TextFormField(
//               //   //minLines: 10,
//               //   //maxLines: 10,
//               //   controller: priseController,
//               //   //keyboardType: keyboardType,
//               //   decoration: const InputDecoration(
//               //     labelText: 'Prise',
//               //     border: OutlineInputBorder(
//               //       borderSide: BorderSide(
//               //         width: 5.0,
//               //         style: BorderStyle.solid,
//               //       ),
//               //     ),
//               //   ),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return 'Поле не должно быть пустым!';
//               //     }
//               //     return null;
//               //   },
//               //   //onChanged: onChanged,
//               // ),
//               20.verticalSpace,
//               CustomTextFormField(
//                 controller: priseController,
//                 labelText: 'Enter prise',
//                 sizedBoxHeight: 40.h,
//               ),
//               20.verticalSpace,
//               BuildCategory(
//                 formKey: formKey,
//                 collectionChoice: collectionChoice,
//                 typeChoice: typeChoice,
//                 typedCategory: typedCategory,
//                 callback: (value) => typedCategory = value,
//               ),
//               BuildBrand(
//                 typedBrandName: typedBrand,
//                 callback: (value) {
//                   typedBrand = value;
//                 },
//               ),
//               20.verticalSpace,
//               Container(
//                 padding: REdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   bottom: 25,
//                 ),
//                 height: 104.h,
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomElevatedButton(
//                       sizedBoxHeight: 36.h,
//                       sizedBoxWidth: 160.w,
//                       borderRadius: 30,
//                       bgColor: Colors.white,
//                       isBorderSide: true,
//                       text: Text(
//                         'Discard',
//                         style: TextStyle(color: Colors.black, fontSize: 14.sp),
//                       ),
//                       onPressed: () {},
//                     ),
//                     CustomElevatedButton(
//                       sizedBoxHeight: 36.h,
//                       sizedBoxWidth: 160.w,
//                       borderRadius: 30,
//                       text: Text(
//                         'Apply',
//                         style: TextStyle(fontSize: 14.sp),
//                       ),
//                       onPressed: () {
//                         // BlocProvider.of<ProductBloc>(context).add(
//                         //   SetProductEvent(
//                         //     ProductEntities(
//                         //       id: '1',
//                         //       name: nameController.text,
//                         //       type: typeChoice,
//                         //       collection: collectionChoice,
//                         //       category: typedCategory,
//                         //       brand: typedBrand,
//                         //       color: selectedColor,
//                         //       size: selectedSize,
//                         //       isNew: false,
//                         //       isSale: false,
//                         //       sale: 0,
//                         //       price: double.parse(priseController.text),
//                         //       newPrice: 0.0,
//                         //       count: int.parse(countController.text),
//                         //       rating: 0,
//                         //       imgUrl: '',
//                         //     ),
//                         //   ),
//                         // );
//                         log(nameController.text);
//                         log(priseController.text);
//                         // log(countController.text);
//                         // log(selectedColor);
//                         // log(selectedSize);
//                         log(typedBrand);
//                         log(typedCategory);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BuildCategory extends StatefulWidget {
//   BuildCategory({
//     required this.formKey,
//     required this.collectionChoice,
//     required this.typeChoice,
//     required this.typedCategory,
//     this.callback,
//     super.key,
//   });

//   GlobalKey<FormState> formKey;
//   String collectionChoice;
//   String typeChoice;
//   String typedCategory;
//   final ValueSetter<String>? callback;

//   @override
//   State<BuildCategory> createState() => _BuildCategoryState();
// }

// class _BuildCategoryState extends State<BuildCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return listTileBtn(
//       context,
//       'Category',
//       widget.typedCategory,
//       () {
//         AppCustomBottomSheet().showGetCategoryDialog(
//           context: context,
//           formKey: widget.formKey,
//           collectionChoice: widget.collectionChoice,
//           typeChoice: widget.typeChoice,
//           callbackSelectedType: (value) {
//             widget.typeChoice = value;
//           },
//           callbackSelectedCollection: (value) {
//             widget.collectionChoice = value;
//           },
//           onPressed: () async {
//             widget.typedCategory = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return MobileCategoriesListView(
//                     typeChoice: widget.typeChoice,
//                     collectionChoice: widget.collectionChoice,
//                   );
//                 },
//               ),
//             );
//             widget.callback!(widget.typedCategory);
//             Navigator.pop(context);
//             setState(() {});
//           },
//         );
//       },
//     );
//   }
// }

// class BuildBrand extends StatefulWidget {
//   BuildBrand({
//     super.key,
//     required this.typedBrandName,
//     this.callback,
//   });

//   String typedBrandName;
//   final ValueSetter<String>? callback;

//   @override
//   State<BuildBrand> createState() => _BuildBrandState();
// }

// class _BuildBrandState extends State<BuildBrand> {
//   @override
//   Widget build(BuildContext context) {
//     return listTileBtn(
//       context,
//       'Brand',
//       widget.typedBrandName,
//       () async {
//         widget.typedBrandName = await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return const MobileBrandListView();
//             },
//           ),
//         );
//         widget.callback!(widget.typedBrandName);
//         setState(() {});
//       },
//     );
//     // return BlocBuilder<BrandCubit, BrandState>(
//     //   builder: (context, state) {
//     //     if (state is BrandInitial) {
//     //       return listTileBtn(
//     //         context,
//     //         'Brand',
//     //         'Бренд не выбран',
//     //         () {
//     //           // typedBrand = await Navigator.push(
//     //           //   context,
//     //           //   MaterialPageRoute(
//     //           //     builder: (context) {
//     //           //       return MobileBrandListView();
//     //           //     },
//     //           //   ),
//     //           // );
//     //           Navigator.push(
//     //             context,
//     //             MaterialPageRoute(
//     //               builder: (context) {
//     //                 return MobileBrandListView();
//     //               },
//     //             ),
//     //           );
//     //         },
//     //       );
//     //     } else if (state is LoadingState) {
//     //       return const Center(child: CircularProgressIndicator());
//     //     } else if (state is TypedBrandState) {
//     //       return listTileBtn(
//     //         context,
//     //         'Brand',
//     //         state.typedBrandName,
//     //         () {
//     //           Navigator.push(
//     //             context,
//     //             MaterialPageRoute(
//     //               builder: (context) {
//     //                 return MobileBrandListView();
//     //               },
//     //             ),
//     //           );
//     //         },
//     //       );
//     //     } else {
//     //       //return const SomeError();,
//     //       return Text('');
//     //     }
//     //   },
//     // );
//   }
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
