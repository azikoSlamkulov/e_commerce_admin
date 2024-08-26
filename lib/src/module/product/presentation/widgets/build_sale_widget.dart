// import 'package:e_commerce_admin/src/module/product/presentation/widgets/titles_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../config/util/app_constants/colors/app_colors.dart';
// import '../../../../config/util/app_constants/text_styles/app_text_styles.dart';
// import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
// import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
// import '../views/mobile/mobile_add_product_veiw.dart';
// import 'list_tile_btn_widget.dart';

// class BuildSaleWidget extends StatefulWidget {
//   BuildSaleWidget({
//     // required this.formKey,
//     // required this.collectionChoice,
//     // required this.typeChoice,
//     // required this.typedCategory,
//     // this.callbackSelectedCategory,
//     // this.callbackSelectedType,
//     // this.callbackSelectedCollection,
//     super.key,
//   });

//   // GlobalKey<FormState> formKey;
//   // String collectionChoice;
//   // String typeChoice;
//   // String typedCategory;
//   // final ValueSetter<String>? callbackSelectedCategory;
//   // final ValueSetter<String>? callbackSelectedType;
//   // final ValueSetter<String>? callbackSelectedCollection;

//   @override
//   State<BuildSaleWidget> createState() => _BuildSaleWidgetState();
// }

// class _BuildSaleWidgetState extends State<BuildSaleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController newPriseController = TextEditingController();
//     TextEditingController saleController = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     bool isActive = true;
//     String collectionChoice = '';
//     String typeChoice = '';
//     //String typedCategory = '';
//     return ListTileBtnWidget(
//       text: 'Sale',
//       //widget.typedCategory,
//       subtitle: '',
//       onTap: () {
//         showBottomSheet(
//           context: context,
//           title: 'Sale',
//           newPriseController: newPriseController,
//           saleController: saleController,
//           isActive: isActive,
//           onChanged: (value) => setState(() => isActive = value),
//         );
//         // ShowCategoryBottomSheet().showGetCategoryDialog(
//         //   context: context,
//         //   formKey: formKey,
//         //   collectionChoice: collectionChoice,
//         //   typeChoice: typeChoice,
//         //   callbackSelectedType: (value) {
//         //     typeChoice = value;
//         //   },
//         //   callbackSelectedCollection: (value) {
//         //     collectionChoice = value;
//         //   },
//         //   onPressed: () async {
//         //     widget.typedCategory = await Navigator.push(
//         //       context,
//         //       MaterialPageRoute(
//         //         builder: (context) {
//         //           return MobileCategoriesListView(
//         //             typeChoice: typeChoice,
//         //             collectionChoice: collectionChoice,
//         //           );
//         //         },
//         //       ),
//         //     );
//         //     widget.callbackSelectedCategory!(widget.typedCategory);
//         //     widget.callbackSelectedType!(typeChoice);
//         //     widget.callbackSelectedCollection!(collectionChoice);
//         //     Navigator.pop(context);
//         //     setState(() {});
//         //   },
//         // );
//       },
//     );
//   }
// }

// showBottomSheet(
//     {required BuildContext context,
//     required String title,
//     required TextEditingController newPriseController,
//     required TextEditingController saleController,
//     required bool isActive,
//     required void Function(bool) onChanged

//     // String type,
//     // String collection,
//     // String category,
//     }) {
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
//         child: Padding(
//           padding: REdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: REdgeInsets.only(top: 36),
//                   child: Text(
//                     title,
//                     style: AppTextStyles.black18Bold,
//                   ),
//                 ),
//               ),
//               33.verticalSpace,
//               Row(
//                 children: [
//                   const Text(
//                     'Sale',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   20.horizontalSpace,
//                   //switchBtn(isActive, onChanged),
//                   Switch(
//                     activeColor: AppColors.mainColor,
//                     activeTrackColor: AppColors.greyDarker,
//                     inactiveThumbColor: Colors.blueGrey.shade300,
//                     inactiveTrackColor: Colors.grey.shade400,
//                     splashRadius: 50.0,
//                     value: isActive,
//                     onChanged: onChanged,
//                     //onChanged: (value) => setState(() => forAndroid = value),
//                   ),
//                 ],
//               ),
//               15.verticalSpace,

//               /// New Prise and Sale
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const TitlesWidget(title: 'New Prise'),
//                         Padding(
//                           padding: REdgeInsets.only(left: 16),
//                           child: CustomTextFormField(
//                             controller: newPriseController,
//                             keyboardType: TextInputType.number,
//                             sizedBoxHeight: 40.h,
//                             //sizedBoxWidth: MediaQuery.of(context).size.width,
//                             labelText: 'Enter new prise',
//                             enabled: false,
//                             enabledBorderColor: AppColors.greyDarker,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const TitlesWidget(title: 'Sale'),
//                         Padding(
//                           padding: REdgeInsets.symmetric(horizontal: 16),
//                           child: CustomTextFormField(
//                             controller: saleController,
//                             keyboardType: TextInputType.number,
//                             sizedBoxHeight: 40.h,
//                             //sizedBoxWidth: MediaQuery.of(context).size.width,
//                             labelText: 'Enter sale',
//                             enabled: true,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               30.verticalSpace,
//               Padding(
//                 padding: REdgeInsets.all(16),
//                 child: CustomElevatedButton(
//                   sizedBoxHeight: 48.h,
//                   sizedBoxWidth: MediaQuery.of(context).size.width,
//                   borderRadius: 30,
//                   bgColor: AppColors.mainColor,
//                   text: Text(
//                     'Ok',
//                     style: AppTextStyles.white14,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               //content,
//               // SortToggleButton(
//               //   type: type,
//               //   collection: collection,
//               //   category: category,
//               // ),
//               // button(context, 'Popular', false, () => log('Popular')),
//               // button(context, 'Newest', false, () => log('Newest')),
//               // button(context, 'Customer review', false,
//               //     () => log('Customer review')),
//               // button(context, 'Price: lowest to high', true,
//               //     () => log('Price: lowest to high')),
//               // button(context, 'Price: highest to low', false,
//               //     () => log('Price: highest to low')),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// // switchBtn(bool isActive, Function(bool) onChanged) {
// //   return Switch(
// //     // thumb color (round icon)
// //     activeColor: AppColors.mainColor,
// //     activeTrackColor: Colors.red[100],
// //     inactiveThumbColor: Colors.blueGrey.shade300,
// //     inactiveTrackColor: Colors.grey.shade400,
// //     splashRadius: 50.0,
// //     // boolean variable value
// //     value: isActive,
// //     // changes the state of the switch
// //     onChanged: onChanged,
// //     //onChanged: (value) => setState(() => forAndroid = value),
// //   );
// // }
