import 'package:e_commerce_admin/src/config/bootstrap.dart';
import 'package:e_commerce_admin/src/config/my_app.dart';
// import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_products_view.dart';
//import 'package:flutter/material.dart';

void main() {
  bootstrap(() => const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //final router = AppRouter(context.watch<AuthBloc>()).router;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//       //   //canvasColor: Colors.transparent,
//       // ),
//       home: ProfileView(),
//     );
//   }
// }

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: AppColors.bgColorMain,
//       appBar: AppBar(
//         elevation: 0,
//         //backgroundColor: AppColors.white,
//         title: const Text(
//           'Profile View',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//     );
//   }
// }
