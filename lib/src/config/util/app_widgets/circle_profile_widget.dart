// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// import '../app_constants/colors/app_colors.dart';

// class CircleProfileWidget extends StatelessWidget {
//   CircleProfileWidget({
//     required this.onTap,
//     required this.isUpdate,
//     required this.imageUrl,
//     //this.icon,
//     this.size,
//     Key? key,
//   }) : super(key: key);

//   final VoidCallback onTap;
//   String imageUrl;
//   //final IconData? icon;
//   final double? size;
//   final bool isUpdate;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.red,
//       //margin: REdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         color: AppColors.bgColorCircleProfile,
//         shape: BoxShape.circle,
//         border: imageUrl.isNotEmpty
//             ? Border.all(style: BorderStyle.none)
//             : Border.all(color: AppColors.grey),
//       ),
//       child: Stack(
//         children: [
//           if (imageUrl.isNotEmpty)
//             CircleAvatar(
//               radius: size,
//               backgroundImage: NetworkImage(imageUrl),
//             )
//           else
//             Padding(
//               padding: REdgeInsets.all(size! - 5),
//               child: FaIcon(
//                 FontAwesomeIcons.user,
//                 size: size,
//                 color: AppColors.grey,
//               ),
//             ),
//           isUpdate
//               ? Positioned(
//                   bottom: 3.h,
//                   right: 2.h,
//                   child: InkWell(
//                     onTap: onTap,
//                     child: FaIcon(
//                       FontAwesomeIcons.plusCircle,
//                       size: 30.h,
//                       color: imageUrl.isNotEmpty
//                           ? AppColors.mainColor
//                           : AppColors.mainColor,
//                     ),
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }

// // class ProfileWidget extends StatelessWidget {
// //   // final CreateAccountController _createController =
// //   //     CreateAccountController.findCreateAccountCont!;
// //   int initialPage = 0;

// //   ProfileWidget({
// //     this.profileOnTap,
// //     required this.carOnTap,
// //     this.profileImageUrl,
// //     this.carImageUrl,
// //     this.xFile,
// //     Key? key,
// //   }) : super(key: key);

// //   final void Function()? profileOnTap;
// //   final void Function()? carOnTap;
// //   final String? profileImageUrl;
// //   final String? carImageUrl;
// //   final String? xFile;

// //   final controller = CarouselController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 8),
// //           child: CarouselSlider(
// //             carouselController: controller,
// //             options: CarouselOptions(
// //               initialPage: initialPage,
// //               height: 240,
// //               enlargeCenterPage: true,
// //               // onPageChanged: (position, reason) {
// //               //   print(reason);
// //               //   print(CarouselPageChangedReason.controller);
// //               // },
// //               enableInfiniteScroll: false,
// //             ),
// //             items: [
// //               InkWell(
// //                 onTap: carOnTap,
// //                 child: Container(
// //                   width: MediaQuery.of(context).size.width,
// //                   child: (profileImageUrl!.isEmpty)
// //                       ? Icon(
// //                           Icons.add_a_photo,
// //                           size: 60,
// //                           color: AppColors.white,
// //                         )
// //                       : Image.file(
// //                           File(profileImageUrl!),
// //                           fit: BoxFit.cover,
// //                         ),
// //                 ),
// //               ),
// //               InkWell(
// //                 onTap: carOnTap,
// //                 child: Container(
// //                   width: MediaQuery.of(context).size.width,
// //                   child: (carImageUrl!.isEmpty)
// //                       ? Icon(
// //                           Icons.add_a_photo,
// //                           size: 60,
// //                           color: AppColors.white,
// //                         )
// //                       : Image.file(
// //                           File(carImageUrl!),
// //                           fit: BoxFit.cover,
// //                         ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         Positioned(
// //           bottom: 10,
// //           right: 120,
// //           child: _buttons(),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buttons() {
// //     return initialPage == 0
// //         ? OutlinedButton(
// //             style: OutlinedButton.styleFrom(
// //               side: BorderSide(width: 1.0, color: AppColors.white),
// //             ),
// //             onPressed: () {
// //               controller.nextPage();

// //               initialPage++;
// //             },
// //             child: Text(
// //               'Добавить фото авто',
// //               style: TextStyle(color: AppColors.white),
// //             ),
// //           )
// //         : OutlinedButton(
// //             style: OutlinedButton.styleFrom(
// //               side: BorderSide(width: 1.0, color: AppColors.white),
// //             ),
// //             onPressed: () {
// //               controller.previousPage();

// //               initialPage--;
// //             },
// //             child: Text(
// //               'Вернуться к водителю',
// //               style: TextStyle(color: AppColors.white),
// //             ),
// //           );
// //   }
// // }
