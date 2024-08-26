enum APP_PAGE {
  loading,
  signIn,
  signUp,
  passwordRecovery,

  /// Dashboard
  dashboard,
  error,

  /// Orders
  orders,

  /// Products
  products,

  /// Categories
  categories,

  /// Profile
  profile,

  /// Admin
  admin,
  test,
}

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      /// Auth
      case APP_PAGE.loading:
        return "/splash";
      case APP_PAGE.signUp:
        return "/signUp";
      case APP_PAGE.signIn:
        return "/signIn";
      case APP_PAGE.passwordRecovery:
        return "/passwordRecovery";

      /// Dashboard
      case APP_PAGE.dashboard:
        return "/";

      /// Orders
      case APP_PAGE.orders:
        return "/orders";

      /// Products
      case APP_PAGE.products:
        return "/products";

      /// Categories
      case APP_PAGE.categories:
        return "/categories";

      /// Profile
      case APP_PAGE.profile:
        return "/profile";
      case APP_PAGE.error:
        return "/error";

      /// Admin
      case APP_PAGE.admin:
        return "/admin";
      case APP_PAGE.test:
        return "/test";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      /// Auth
      case APP_PAGE.loading:
        return "SPLASH";
      case APP_PAGE.signIn:
        return "SIGNIN";
      case APP_PAGE.signUp:
        return "SIGNUP";
      case APP_PAGE.passwordRecovery:
        return "PASSWORDRECOVERY";

      /// Dashboard
      case APP_PAGE.dashboard:
        return "DASHBOARD";

      /// Orders
      case APP_PAGE.orders:
        return "ORDERS";

      /// Products
      case APP_PAGE.products:
        return "PRODUCTS";

      /// Categories
      case APP_PAGE.categories:
        return "CATEGORIES";

      /// Profile
      case APP_PAGE.profile:
        return "PROFILE";
      case APP_PAGE.error:
        return "ERROR";

      /// Admin
      case APP_PAGE.admin:
        return "ADMIN";
      case APP_PAGE.test:
        return "TEST";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      /// Auth
      case APP_PAGE.loading:
        return "My App Splash";
      case APP_PAGE.signIn:
        return "My App Sign In";
      case APP_PAGE.signUp:
        return "My App Sign Up";
      case APP_PAGE.passwordRecovery:
        return "Password Recovery";

      /// Dashboard
      case APP_PAGE.dashboard:
        return "Dashboard";

      /// Orders
      case APP_PAGE.orders:
        return "Orders";

      /// Products
      case APP_PAGE.products:
        return "Products";

      /// Categories
      case APP_PAGE.categories:
        return "Categories";

      /// Profile
      case APP_PAGE.profile:
        return "Profile";
      case APP_PAGE.error:
        return "My App Error";

      /// Admin
      case APP_PAGE.admin:
        return "admin";
      case APP_PAGE.test:
        return "Test";
      default:
        return "My App";
    }
  }
}
