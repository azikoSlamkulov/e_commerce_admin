import 'dart:developer';

import 'package:e_commerce_admin/src/config/navbar/root_layout.dart';
import 'package:e_commerce_admin/src/config/routes/router_utils.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/add_product_veiw_two.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_add_product_veiw.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/mobile_products_view.dart';
import 'package:e_commerce_admin/src/module/product/presentation/views/mobile/test_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../module/auth/presentation/logic/auth_bloc.dart';

import '../../module/auth/presentation/logic/auth_state.dart';
import '../../module/auth/presentation/views/password_recovery.dart';
import '../../module/auth/presentation/views/sign_in_vew.dart';
import '../../module/auth/presentation/views/sign_up_view.dart';

import '../../module/dashboard/presentation/views/mobile/mobile_dashboard_view.dart';
import '../../module/orders/presentation/views/mobile/mobile_orders_view.dart';
import '../../module/profile/profile_view.dart';
import '../util/app_constants/colors/app_colors.dart';
import '../util/app_widgets/progress/progress.dart';
//import '../../module/product/presentation/views/tablet/tablet_products_view.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: APP_PAGE.products.toPath,
    routes: <GoRoute>[
      /// Admin
      // GoRoute(
      //   path: APP_PAGE.admin.toPath,
      //   name: APP_PAGE.admin.toName,
      //   builder: (context, state) => const MobileAdminView(),
      // ),

      /// Auth
      GoRoute(
        path: APP_PAGE.loading.toPath,
        name: APP_PAGE.loading.toName,
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.black,
          body: Center(
            child: progressIndicator.circularProgress(),
          ),
        ),
      ),
      GoRoute(
        path: APP_PAGE.signUp.toPath,
        name: APP_PAGE.signUp.toName,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: APP_PAGE.signIn.toPath,
        name: APP_PAGE.signIn.toName,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: APP_PAGE.passwordRecovery.toPath,
        name: APP_PAGE.passwordRecovery.toName,
        builder: (context, state) => PasswordRecoveryView(),
      ),

      // Dashboard
      GoRoute(
        path: APP_PAGE.dashboard.toPath,
        name: APP_PAGE.dashboard.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            mobile: MobileDashbordView(),
            tablet: MobileDashbordView(),
          ),
        ),
      ),

      /// Orders
      GoRoute(
        path: APP_PAGE.orders.toPath,
        name: APP_PAGE.orders.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            mobile: MobileOrdersView(),
            tablet: MobileOrdersView(),
          ),
        ),
      ),

      /// Products
      GoRoute(
        path: APP_PAGE.products.toPath,
        name: APP_PAGE.products.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            mobile: AddProductViewTwo(),
            tablet: MobileProductsView(),
          ),
        ),
      ),

      /// Categories
      // GoRoute(
      //   path: APP_PAGE.categories.toPath,
      //   name: APP_PAGE.categories.toName,
      //   pageBuilder: (context, state) => const MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 3,
      //       mobile: MobileCategoriesView(),
      //       tablet: TabletProductsView(),
      //     ),
      //   ),
      // ),

      /// Profile
      GoRoute(
        path: APP_PAGE.profile.toPath,
        name: APP_PAGE.profile.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            mobile: ProfileView(),
            tablet: ProfileView(),
          ),
        ),
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          state.extra.toString(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ),

    // Redirect
    // redirect: (context, state) {
    //   // --- 1 ---
    //   final bool loggedIn = authBloc.state is AuthenticatedState;
    //   final bool loggingIn = state.subloc == APP_PAGE.dashboard.toPath;
    //   final bool onBoarding = state.subloc == APP_PAGE.signUp.toPath;
    //   // final bool signUp = state.subloc == AppPage.signUp.toPath;
    //   // final bool signIn = state.subloc == AppPage.signIn.toPath;
    //   // final bool passwordRecovery =
    //   //     state.subloc == AppPage.passwordRecovery.toPath;
    //   final bool loading = authBloc.state is LoadingState;
    //   //final bool loading = state.subloc == AppPage.loading.toPath;

    //   if (loading) {
    //     return APP_PAGE.loading.toPath;
    //   } else if (!loggedIn) {
    //     return onBoarding ? null : APP_PAGE.signUp.toPath;
    //   } else if (loggedIn) {
    //     //return APP_PAGE.dashboard.toPath;
    //     return null;
    //   }
    //   return null;
    // }
    // redirect: (state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final passwordRecoveryLocation =
    //       state.subloc == APP_PAGE.passwordRecovery.toPath;
    //   //final errorLocation = state.subloc == APP_PAGE.error.toPath;

    //   final isLoading = authBloc.state is LoadingState;
    //   final isAuthenticated = authBloc.state is AuthenticatedState;
    //   final isUnAuthenticated = authBloc.state is UnAuthenticatedState;
    //   final isOpenSignUp = authBloc.state is OpenSignUpState;
    //   final isOpenSignIn = authBloc.state is OpenSignInState;
    //   final isOpenPasswordRecovery =
    //       authBloc.state is OpenPasswordRecoveryState;

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   } else if (isOpenSignUp) {
    //     log('2');
    //     return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   } else if (isOpenSignIn) {
    //     log('3');
    //     return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   } else if (isOpenPasswordRecovery) {
    //     log('4');
    //     return passwordRecoveryLocation
    //         ? null
    //         : APP_PAGE.passwordRecovery.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     return null;
    //   }
    // },
  );
}
