// import 'package:e_commerce/src/module/home/domain/entities/product_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'buttons/favorite_toggle_icon_button.dart';

// class CustomVerticalContainer extends StatelessWidget {
//   CustomVerticalContainer({
//     super.key,
//     required this.product,
//     required this.isSale,
//     required this.onTap,
//     required this.sizedHeight,
//     this.sizedWidth = 140,
//   });

//   final ProductEntity product;
//   final bool isSale;
//   final VoidCallback onTap;
//   final double sizedWidth;
//   final double sizedHeight;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 13),
//         child: SizedBox(
//           width: 155.h,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: sizedHeight,
//                 child: Stack(
//                   children: [
//                     ///Image
//                     Container(
//                       height: 195.h,
//                       decoration: BoxDecoration(
//                         color: Colors.greenAccent,
//                         // image: DecorationImage(
//                         //   image: NetworkImage(product.photoURL!),
//                         //   fit: BoxFit.cover,
//                         // ),
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                     ),

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
//                                 borderRadius: BorderRadius.circular(12.r),
//                               ),
//                               child: Text(
//                                 product.isSale! ? '-${product.sale}%' : 'New',
//                                 style: TextStyle(
//                                   fontSize: 11.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),
//                     ),

//                     /// Favorite button
//                     Positioned(
//                       bottom: 8.h,
//                       right: -14.h,
//                       child: FavoriteToggleIconBtn(
//                           isFavorite: product.isFavorite!),
//                     ),

//                     /// Rating
//                     Positioned(
//                       bottom: 0.h,
//                       left: -1.h,
//                       child: Row(
//                         children: [
//                           RatingBarIndicator(
//                             rating: product.rating!,
//                             itemBuilder: (context, index) => const Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                             ),
//                             unratedColor: Colors.black12,
//                             itemCount: 5,
//                             itemSize: 16.0.h,
//                             direction: Axis.horizontal,
//                           ),
//                           5.horizontalSpace,
//                           Text(
//                             '(${product.totalUser})',
//                             style: TextStyle(
//                               fontSize: 10.sp,
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               ///Brand
//               5.verticalSpace,
//               Text(
//                 product.brand!,
//                 style: TextStyle(fontSize: 11.sp, color: Colors.grey),
//               ),

//               ///Item
//               5.verticalSpace,
//               Text(
//                 product.item!,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               ///Prise
//               5.verticalSpace,
//               !product.isSale!
//                   ? Text(
//                       '\$${product.price}',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   : Row(
//                       children: [
//                         Text(
//                           '\$${product.price}',
//                           style: TextStyle(
//                               fontSize: 14.sp,
//                               color: Colors.grey,
//                               decoration: TextDecoration.lineThrough),
//                         ),
//                         5.horizontalSpace,
//                         Text(
//                           '\$${product.newPrice}',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
