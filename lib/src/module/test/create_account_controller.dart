// import 'dart:developer';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/models/user_model.dart';
// import '../../../repositories/user/user_repo.dart';
// import '../../authentication/controllers/authentication_controller.dart';
// import 'package:image_picker/image_picker.dart';

// class CreateAccountController extends GetxController {
//   static final CreateAccountController? findCreateAccountCont =
//       Get.find<CreateAccountController>();

//   final AuthenticationController _authController =
//       AuthenticationController.findAuthCont!;

//   String password = '123';

//   final TextEditingController firstNameCont = TextEditingController();
//   final TextEditingController lastNameCont = TextEditingController();
//   final TextEditingController mainPhoneNumberCont = TextEditingController();
//   final TextEditingController secondPhoneNumberCont = TextEditingController();
//   final TextEditingController carCont = TextEditingController();
//   final TextEditingController carNumberCont = TextEditingController();
//   final TextEditingController passwordCont = TextEditingController();
//   final createAccountFormKey = GlobalKey<FormState>();
//   final passFormKey = GlobalKey<FormState>();

//   //RxString carController = ''.obs;
//   RxBool isLoadingImage = false.obs;
//   RxString profileImageUrl = ''.obs;
//   RxBool isTextField = false.obs;
//   RxBool isCreatingUser = false.obs;
//   RxString autoImageFile = ''.obs;
//   RxString profileImageFile = ''.obs;
//   RxInt initialPage = 0.obs;

//   RxString dropdownvalue = 'user'.obs;
//   var items = [
//     'user',
//     'admin',
//   ];

//   @override
//   void onInit() {
//     // carCont.addListener(() {
//     //   carController.value = carCont.text;
//     // });
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {}

//   Future<XFile> getProfileImage(ImageSource _imageSource) async {
//     isLoadingImage.value = true;
//     update();
//     final ImagePicker _picker = ImagePicker();
//     // Pick an image
//     final XFile? _image = await _picker.pickImage(source: _imageSource);
//     profileImageFile.value = _image!.path;

//     //final _fileName = _image!.path.split('/').last;
//     // profileImageUrl.value = await uploadProfileImages(_image.path, _fileName);

//     isLoadingImage.value = false;
//     update();
//     return _image;
//   }

//   Future<String> uploadProfileImages(String filePath, String fileName) async {
//     return await userRepo.uploadProfileImages(filePath, fileName);
//   }

//   void addTextFormField() {
//     isTextField.value = true;
//     update();
//   }

//   void deleteTextFormField() {
//     isTextField.value = false;
//     update();
//   }

//   Future<void> createAccount({
//     String? userID,
//     String? firstName,
//     String? lastName,
//     String? mainPhoneNumber,
//     String? secondPhoneNumber,
//     String? car,
//     String? carNumber,
//     String? profilePhoto,
//   }) async {
//     isCreatingUser.value = true;
//     update();

//     UserModel _user = UserModel(
//       userID: userID,
//       firstName: firstName,
//       lastName: lastName,
//       mainPhoneNumber: mainPhoneNumber,
//       secondPhoneNumber: secondPhoneNumber,
//       car: car,
//       carNumber: carNumber,
//       profilePhoto: profilePhoto,
//       //sumWage:
//       // sumPlane:
//       // sumOthers:
//       // index:
//       // sumConsumption:
//       // isCheckedDriver:
//       // isCheckedWage:
//       // isCheckedPlane:
//       // isSelectedWageToggle:
//       // isSelectedPlaneToggle:
//       // isSelectedOthersToggle:
//       //message:
//       isWorking: false,
//       role: dropdownvalue.value,
//     );
//     final _userModel = await userRepo.createAccount(_user);
//     isCreatingUser.value = false;
//     update();

//     _authController.setAuthState(user: _userModel);
//   }
// }
