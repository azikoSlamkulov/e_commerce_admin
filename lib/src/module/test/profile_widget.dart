// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../util/app_constants/colors/app_colors.dart';



// class ProfileWidget extends StatelessWidget {
//   final CreateAccountController _createController =
//       CreateAccountController.findCreateAccountCont!;
//   ProfileWidget({
//     this.profileOnTap,
//     required this.autoOnTap,
//     this.profileImageUrl,
//     this.autoImageUrl,
//     this.xFile,
//     Key? key,
//   }) : super(key: key);

//   final void Function()? profileOnTap;
//   final void Function()? autoOnTap;
//   final String? profileImageUrl;
//   final String? autoImageUrl;
//   final String? xFile;

//   final controller = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: CarouselSlider(
//             carouselController: controller,
//             options: CarouselOptions(
//               initialPage: _createController.initialPage.value,
//               height: 240,
//               enlargeCenterPage: true,
//               // onPageChanged: (position, reason) {
//               //   print(reason);
//               //   print(CarouselPageChangedReason.controller);
//               // },
//               enableInfiniteScroll: false,
//             ),
//             items: [
//               InkWell(
//                 onTap: autoOnTap,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: (profileImageUrl!.isEmpty)
//                       ? Icon(
//                           Icons.add_a_photo,
//                           size: 60,
//                           color: AppColors.white,
//                         )
//                       : Image.file(
//                           File(profileImageUrl!),
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
//               InkWell(
//                 onTap: autoOnTap,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: (autoImageUrl!.isEmpty)
//                       ? Icon(
//                           Icons.add_a_photo,
//                           size: 60,
//                           color: AppColors.white,
//                         )
//                       : Image.file(
//                           File(autoImageUrl!),
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           right: 120,
//           child: _buttons(),
//         ),
//       ],
//     );
//   }

//   Widget _buttons() {
//     return Obx(
//       () => _createController.initialPage.value == 0
//           ? OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 side: BorderSide(width: 1.0, color: AppColors.white),
//               ),
//               onPressed: () {
//                 controller.nextPage();

//                 _createController.initialPage.value++;
//               },
//               child: Text(
//                 'Добавить фото авто',
//                 style: TextStyle(color: AppColors.white),
//               ),
//             )
//           : OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 side: BorderSide(width: 1.0, color: AppColors.white),
//               ),
//               onPressed: () {
//                 controller.previousPage();

//                 _createController.initialPage.value--;
//               },
//               child: Text(
//                 'Вернуться к водителю',
//                 style: TextStyle(color: AppColors.white),
//               ),
//             ),
//     );
//   }
// }
