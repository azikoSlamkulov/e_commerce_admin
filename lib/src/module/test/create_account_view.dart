// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:kgdrivers/app/app_widgets/buttons/custom_button_widget.dart';
// import 'package:kgdrivers/app/app_widgets/inputs/custom_text_form_field.dart';
// import '../../../app_constants/assets/app_assets.dart';
// import '../../../app_constants/colors/app_colors.dart';
// import '../../../app_widgets/dialogs/custom_form_field_dialog.dart';
// import '../../../app_widgets/progress/progress.dart';
// import '../widgets/modal_bottom_sheet.dart';
// import '../widgets/profile_widget.dart';
// import '../../create_account/controllers/create_account_controller.dart';

// class CreateAccountView extends GetView<CreateAccountController> {
//   CreateAccountView({
//     this.userCredential,
//     this.showBackButton = false,
//     Key? key,
//   }) : super(key: key);
//   final UserCredential? userCredential;
//   final bool showBackButton;

//   // final CreateAccountController _createAccountController =
//   //     Get.put<CreateAccountController>(CreateAccountController());

//   // final AuthenticationController _authenticationController =
//   //     AuthenticationController.findAuthCont!;

//   XFile? _file;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColorBlue,
//       // appBar: AppBar(
//       //   leading: IconButton(
//       //     icon: FaIcon(
//       //       FontAwesomeIcons.chevronLeft,
//       //       color: AppColors.white,
//       //       size: 20,
//       //     ),
//       //     onPressed: () => Navigator.of(context).pop(),
//       //   ),
//       //   elevation: 0,
//       //   backgroundColor: AppColors.bgColorBlue,
//       //   title: Text(
//       //     'Добавить водителя',
//       //     style: TextStyle(color: AppColors.white),
//       //     //style: AppTextStyles.mulishBlack18w600,
//       //   ),
//       //   centerTitle: true,
//       //   actions: [],
//       // ),
//       body: SafeArea(
//         child: Obx(
//           () => controller.isCreatingUser.value ||
//                   controller.isLoadingImage.value
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       progressIndicator.circularProgress(),
//                     ],
//                   ),
//                 )
//               : SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Obx(
//                         () => ProfileWidget(
//                           profileImageUrl: controller.profileImageFile.value,
//                           autoOnTap: () async {
//                             await showBottomSheet(context);
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 25),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 18),
//                         child: Container(
//                           alignment: Alignment.topRight,
//                           child: Obx(
//                             () => Container(
//                               //alignment: Alignment.topLeft,
//                               padding: EdgeInsets.symmetric(horizontal: 12),
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               child: DropdownButton(
//                                 value: controller.dropdownvalue.value,
//                                 icon: const Icon(Icons.keyboard_arrow_down),
//                                 items: controller.items.map((String items) {
//                                   return DropdownMenuItem(
//                                     value: items,
//                                     child: Text(items),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   controller.dropdownvalue.value = newValue!;
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                           child: Form(
//                             key: controller.createAccountFormKey,
//                             child: Column(
//                               //mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const SizedBox(height: 18),
//                                 CustomTextFormField(
//                                   controller: controller.firstNameCont,
//                                   hintText: 'Имя',
//                                 ),
//                                 const SizedBox(height: 18),
//                                 CustomTextFormField(
//                                   controller: controller.lastNameCont,
//                                   hintText: 'Фамилия',
//                                 ),
//                                 const SizedBox(height: 18),
//                                 Obx(
//                                   () => controller.dropdownvalue.value == 'user'
//                                       ? Column(
//                                           children: [
//                                             CustomTextFormField(
//                                               controller: controller.carCont,
//                                               hintText: 'Марка авто',
//                                             ),
//                                             const SizedBox(height: 18),
//                                             CustomTextFormField(
//                                               controller:
//                                                   controller.carNumberCont,
//                                               hintText: 'Гос.номер авто',
//                                               suffixIcon:
//                                                   !controller.isTextField.value
//                                                       ? IconButton(
//                                                           icon: Icon(
//                                                             Icons.add,
//                                                             //color: AppColors.black,
//                                                           ),
//                                                           onPressed: () {
//                                                             controller
//                                                                 .addTextFormField();
//                                                           },
//                                                         )
//                                                       : null,
//                                             ),
//                                           ],
//                                         )
//                                       : const SizedBox(),
//                                 ),
//                                 const SizedBox(height: 18),
//                                 CustomTextFormField(
//                                   controller: controller.lastNameCont,
//                                   hintText: 'Номер WhatsApp',
//                                 ),
//                                 const SizedBox(height: 18),
//                                 // CustomTextFormField(
//                                 //   controller: _createAccountController.mainPhoneNumberCont,
//                                 //   hintText: 'Номер телефона',
//                                 //   suffixIcon: !_createAccountController.isTextField.value
//                                 //       ? IconButton(
//                                 //           icon: Icon(
//                                 //             Icons.add,
//                                 //             //color: AppColors.black,
//                                 //           ),
//                                 //           onPressed: () {
//                                 //             _createAccountController.addTextFormField();
//                                 //           },
//                                 //         )
//                                 //       : null,
//                                 // ),
//                                 // const SizedBox(height: 18),
//                                 Obx(
//                                   () => controller.isTextField.value
//                                       ? CustomTextFormField(
//                                           controller:
//                                               controller.secondPhoneNumberCont,
//                                           hintText: 'Номер телефона',
//                                           suffixIcon: IconButton(
//                                             icon: Icon(
//                                               Icons.remove,
//                                               //color: AppColors.black,
//                                             ),
//                                             onPressed: () {
//                                               controller.deleteTextFormField();
//                                             },
//                                           ),
//                                         )
//                                       : const SizedBox(),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 _button(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }

//   _form() {}

//   _button() {
//     return CustomButtonWidget(
//       bgColor: AppColors.red,
//       horizontal: Get.size.width * 0.29,
//       vertical: 15,
//       text: Text('Сохранить'),
//       onPressed: () async {
//         if (controller.createAccountFormKey.currentState!.validate() &&
//             controller.dropdownvalue.value == 'user') {
//           await controller.createAccount(
//             userID: userCredential!.user!.uid,
//             firstName: controller.firstNameCont.text,
//             lastName: controller.lastNameCont.text,
//             mainPhoneNumber: userCredential!.user!.phoneNumber,
//             secondPhoneNumber: controller.secondPhoneNumberCont.text,
//             car: controller.carCont.value.text,
//             carNumber: controller.carNumberCont.text,
//             profilePhoto: controller.profileImageUrl.value,
//           );
//         } else if (controller.createAccountFormKey.currentState!.validate() &&
//             controller.dropdownvalue.value == 'admin') {
//           // TODO Доделать админ
//           CustomFormFieldDialog().getDialog(
//             title: 'Пароль',
//             hintText: '',
//             keyboardType: TextInputType.number,
//             autofocus: true,
//             controller: controller.passwordCont,
//             key: controller.passFormKey,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Поле не должно быть пустым!';
//               }
//               if (value != controller.password) {
//                 return 'Не верный пороль!';
//               }
//               return null;
//             },
//             onTap: () {
//               Get.back();
//               controller.passwordCont.clear();
//             },
//             onPressed: () async {
//               if (controller.passFormKey.currentState!.validate() &&
//                   controller.passwordCont.text == controller.password) {
//                 await controller.createAccount(
//                   userID: userCredential!.user!.uid,
//                   firstName: controller.firstNameCont.text,
//                   lastName: controller.lastNameCont.text,
//                   mainPhoneNumber: userCredential!.user!.phoneNumber,
//                   secondPhoneNumber: controller.secondPhoneNumberCont.text,
//                   profilePhoto: controller.profileImageUrl.value,
//                 );
//                 controller.passwordCont.clear();
//                 Get.back();
//               }
//             },
//           );
//         }
//       },
//     );
//   }

//   Future<void> showBottomSheet(BuildContext context) {
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
//                           if (controller.initialPage == 0) {
//                             controller.getProfileImage(ImageSource.gallery);
//                             Navigator.pop(context);
//                           } else {
//                             controller.getAutoImage(ImageSource.gallery);
//                             Navigator.pop(context);
//                           }
//                         },
//                         icon: FaIcon(
//                           FontAwesomeIcons.image,
//                           color: AppColors.mainColor,
//                         ),
//                         iconSize: 40,
//                       ),
//                       //const SizedBox(height: 2),
//                       Text(
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
//                           if (controller.initialPage == 0) {
//                             controller.getProfileImage(ImageSource.camera);
//                             Navigator.pop(context);
//                           } else {
//                             controller.getAutoImage(ImageSource.camera);
//                             Navigator.pop(context);
//                           }
//                         },
//                         icon: FaIcon(
//                           FontAwesomeIcons.camera,
//                           color: AppColors.mainColor,
//                         ),
//                         iconSize: 40,
//                       ),
//                       //const SizedBox(height: 10),
//                       Text(
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
