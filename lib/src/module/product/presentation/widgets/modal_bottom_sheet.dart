// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../../../config/util/app_constants/colors/app_colors.dart';

// class ShowBottomSheet {
//   static Future<void> showBottomSheet(BuildContext context) {
//     return showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 100,
//           color: AppColors.mainColor.withOpacity(0.1),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () async {
//                           // _file = await _createAccountController
//                           //     .getImage(ImageSource.gallery);

//                           // log('_file >>> $_file');

//                           Navigator.pop(context);
//                         },
//                         icon: const FaIcon(
//                           FontAwesomeIcons.image,
//                           color: AppColors.mainColor,
//                         ),
//                         iconSize: 40,
//                       ),
//                       //const SizedBox(height: 2),
//                       const Text(
//                         'Галерея',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(width: 60),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () async {
//                           //   _file = await _createAccountController
//                           //       .getImage(ImageSource.camera);
//                           //   log('_file >>> $_file');
//                           //   Navigator.pop(context);
//                         },
//                         icon: const FaIcon(
//                           FontAwesomeIcons.camera,
//                           color: AppColors.mainColor,
//                         ),
//                         iconSize: 40,
//                       ),
//                       //const SizedBox(height: 10),
//                       const Text(
//                         'Камера',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
