import 'dart:async';
import 'dart:developer';
import 'package:e_commerce_admin/src/module/product/presentation/logic/big_image/big_image.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/brands_bloc/brands_bloc.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/image_cubit/image_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator.dart';
import '../module/auth/presentation/logic/auth_bloc.dart';
import '../module/auth/presentation/logic/auth_event.dart';
// import '../module/product/presentation/logic/brand_cubit/brand_cubit.dart';
import '../module/product/presentation/logic/categories_bloc/categories_bloc.dart';
// import '../module/product/presentation/logic/image_cubit/image_cubit.dart';
// import '../module/product/presentation/logic/multiple_toggle_btn_cubit/multiple_toogle_btn_cubit.dart';
import '../module/product/presentation/logic/product/product_bloc.dart';
// import '../module/product/presentation/logic/product_cubit/product_cubit.dart';
// import '../module/product/presentation/logic/single_toggle_btn_cubit/single_toggle_btn_cubit.dart';
// import '../module/product/presentation/logic/type_toggle_btn_cubit/type_toggle_btn_cubit.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        /// Auth
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
          //create: (context) => sl<AuthBloc>(),
        ),

        /// Admin
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        // //BlocProvider<ProductCubit>(create: (context) => sl<ProductCubit>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<BrandsBloc>(create: (context) => sl<BrandsBloc>()),
        BlocProvider<ImageCubit>(
          create: (context) => sl<ImageCubit>(),
        ),
        BlocProvider<BigImageCubit>(
          create: (context) => sl<BigImageCubit>(),
        ),
        // BlocProvider<SingleToggleBtnCubit>(
        //     create: (context) => sl<SingleToggleBtnCubit>()),
        // BlocProvider<TypeToggleBtnCubit>(
        //     create: (context) => sl<TypeToggleBtnCubit>()),

        //BlocProvider<ImageCubit>(create: (context) => sl<ImageCubit>()),

        /// Shop
        // BlocProvider<MultipleToogleBtnCubit>(
        //     create: (context) => sl<MultipleToogleBtnCubit>()),

        //BlocProvider<BrandCubit>(create: (context) => sl<BrandCubit>()),
        // //BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        // BlocProvider<OrientationCubit>(
        //     create: (context) => sl<OrientationCubit>()),
        // BlocProvider<SortToggleButtonCubit>(
        //   create: (context) => sl<SortToggleButtonCubit>(),
        //),
        // BlocProvider<CategoryToggleBtnCubit>(
        //   create: (context) => sl<CategoryToggleBtnCubit>(),
        // ),
        // BlocProvider<SizesToggleBtnCubit>(
        //   create: (context) => sl<SizesToggleBtnCubit>(),
        // ),
        // BlocProvider<ColorsToggleBtnCubit>(
        //   create: (context) => sl<ColorsToggleBtnCubit>(),
        // ),

        // BlocProvider<ShopBloc>(create: (context) => sl<ShopBloc>()),
      ],
      child: await builder(),
    ),
  );
}
