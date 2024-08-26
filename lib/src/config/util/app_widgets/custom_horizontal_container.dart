// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// import 'buttons/favorite_toggle_icon_button.dart';

// class CustomHorizontalContainer extends StatelessWidget {
//   const CustomHorizontalContainer({
//     super.key,
//     required this.product,
//     required this.onTap,
//     required this.isSale,
//     //this.sizedWidth = 140,
//   });

//   final ProductEntity product;
//   final VoidCallback onTap;
//   final bool isSale;
//   //final double sizedWidth;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Stack(
//         children: [
//           Card(
//             //color: Colors.blue,
//             clipBehavior: Clip.hardEdge,
//             //elevation: 10,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0.r),
//             ),
//             margin: REdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
//             //color: Colors.redAccent.shade100,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     /// Image
//                     Container(
//                       height: 155.h,
//                       width: 135.h,
//                       decoration: BoxDecoration(
//                         color: Colors.greenAccent,
//                         // image: DecorationImage(
//                         //   image: NetworkImage(product.photoURL!),
//                         //   fit: BoxFit.cover,
//                         // ),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10.r),
//                           bottomLeft: Radius.circular(10.r),
//                         ),
//                       ),
//                     ),
//                     // Image.network(
//                     //   product.photoURL!,
//                     //   fit: BoxFit.fill,
//                     //   width: 140.h,
//                     //   height: 155.h,
//                     // ),

//                     ///Round text
//                     Positioned(
//                       top: 10.h,
//                       left: 10.h,
//                       child: product.isSale! || product.isNew!
//                           ? Container(
//                               padding: REdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color:
//                                     product.isSale! ? Colors.red : Colors.black,
//                                 borderRadius: BorderRadius.circular(10.r),
//                               ),
//                               child: Text(
//                                 product.isSale! ? '-${product.sale}%' : 'New',
//                                 style: TextStyle(
//                                   fontSize: 8.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 20, vertical: 11),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ///Item
//                       Text(
//                         product.item!,
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       10.verticalSpace,

//                       ///Brand
//                       Text(
//                         product.brand!,
//                         style: TextStyle(fontSize: 11.sp, color: Colors.grey),
//                       ),
//                       10.verticalSpace,

//                       /// Rating
//                       Row(
//                         children: [
//                           RatingBarIndicator(
//                             rating: product.rating!,
//                             itemBuilder: (context, index) => const Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                             ),
//                             unratedColor: Colors.black12,
//                             itemCount: 5,
//                             itemSize: 20.0.h,
//                             direction: Axis.horizontal,
//                           ),
//                           5.horizontalSpace,
//                           Text(
//                             '(${product.totalUser})',
//                             style: TextStyle(
//                               fontSize: 11.sp,
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       ),
//                       10.verticalSpace,

//                       ///Prise
//                       !product.isSale!
//                           ? Text(
//                               '\$${product.price}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )
//                           : Row(
//                               children: [
//                                 Text(
//                                   '\$${product.price}',
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Colors.grey,
//                                     decoration: TextDecoration.lineThrough,
//                                   ),
//                                 ),
//                                 5.horizontalSpace,
//                                 Text(
//                                   '\$${product.newPrice}',
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           /// Favorite button
//           Positioned(
//             bottom: 8.h,
//             right: -5.h,
//             child: FavoriteToggleIconBtn(isFavorite: product.isFavorite!),
//           ),
//         ],
//       ),
//     );
//   }
// }
