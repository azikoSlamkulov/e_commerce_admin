//import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app_router.dart';
import '../module/auth/presentation/logic/auth_bloc.dart';

Future initialization(BuildContext? context) async {
  /// Load resources
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          //title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            //canvasColor: Colors.transparent,
            sliderTheme: SliderThemeData(
              //showValueIndicator: ShowValueIndicator.never,
              thumbShape: SliderComponentShape.noThumb,
            ),
          ),
          routerConfig: router,
          // routeInformationProvider: router.routeInformationProvider,
          // routeInformationParser: router.routeInformationParser,
          // routerDelegate: router.routerDelegate,
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   //final router = AppRouter(context.watch<AuthBloc>()).router;

  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     //title: 'Flutter Demo',
  //     // theme: ThemeData(
  //     //   primarySwatch: Colors.blue,
  //     //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  //     //   //canvasColor: Colors.transparent,
  //     // ),
  //     home: ProfileView(),
  //   );

  // return ScreenUtilInit(
  //   designSize: const Size(393, 851),
  //   minTextAdapt: true,
  //   splitScreenMode: true,
  //   builder: (context, child) {
  //     return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       //title: 'Flutter Demo',
  //       // theme: ThemeData(
  //       //   primarySwatch: Colors.blue,
  //       //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  //       //   //canvasColor: Colors.transparent,
  //       // ),
  //       home: MobileProductsView(),
  //     );
  //   },
  // );
  //}
}
