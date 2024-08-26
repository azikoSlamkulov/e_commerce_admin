import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/src/core/data/remote/firebase/firebase_storage.dart';
import 'package:e_commerce_admin/src/module/orders/presentation/cubit/orders_cubit.dart';
import 'package:e_commerce_admin/src/module/orders/data/datasources/remote_orders.dart';
import 'package:e_commerce_admin/src/module/orders/data/repositories/orders_repo_impl.dart';
import 'package:e_commerce_admin/src/module/orders/domain/repositories/orders_repo.dart';
import 'package:e_commerce_admin/src/module/orders/domain/usecases/get_all_orders.dart';
import 'package:e_commerce_admin/src/module/orders/domain/usecases/get_order_info.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/delete_category.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_categories.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_product_big_images.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_product_small_images.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_all_products.dart';
import 'package:e_commerce_admin/src/module/product/domain/usecases/get_product_datails.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/big_image/big_image.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/brands_bloc/brands_bloc.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/colors_and_sizes/colors_and_sizes.dart';
import 'package:e_commerce_admin/src/module/product/presentation/logic/tab_bar/tab_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/data/local/sharedpreferences/local_storage.dart';
import '../core/data/remote/firebase/firebase_auth.dart';
import '../core/data/remote/firebase/firestore.dart';
import '../module/auth/data/data_source/local/local_auth_data.dart';
import '../module/auth/data/data_source/remote/firebase_auth_data.dart';
import '../module/auth/data/data_source/remote/firebase_auth_with_firestore.dart';
import '../module/auth/data/repositories/auth_repo_impl.dart';
import '../module/auth/domain/repositories/auth_repo.dart';
import '../module/auth/domain/usecases/get_current_user.dart';
import '../module/auth/domain/usecases/sign_in_with_email.dart';
import '../module/auth/domain/usecases/sign_in_with_google.dart';
import '../module/auth/domain/usecases/sign_out.dart';
import '../module/auth/domain/usecases/sign_up.dart';
import '../module/auth/presentation/logic/auth_bloc.dart';
import '../module/product/data/data_source/remote_product.dart';
import '../module/product/data/data_source/remote_brands.dart';
import '../module/product/data/data_source/remote_categories.dart';
import '../module/product/data/data_source/remote_product_image.dart';
import '../module/product/data/repositories/product_image_repo_impl.dart';
import '../module/product/data/repositories/product_repo_impl.dart';
import '../module/product/data/repositories/brands_repo_impl.dart';
import '../module/product/data/repositories/categories_repo_impl.dart';
import '../module/product/domain/repositories/product_image_repo.dart';
import '../module/product/domain/repositories/product_repo.dart';
import '../module/product/domain/repositories/brands_repo.dart';
import '../module/product/domain/repositories/categories_repo.dart';
import '../module/product/domain/usecases/add_brand.dart';
import '../module/product/domain/usecases/add_category.dart';
import '../module/product/domain/usecases/delete_brand.dart';
import '../module/product/domain/usecases/get_all_brands.dart';
import '../module/product/domain/usecases/get_categories.dart';
import '../module/product/domain/usecases/set_product.dart';
import '../module/product/domain/usecases/set_product_image.dart';
import '../module/product/presentation/logic/brand_cubit/brand_cubit.dart';
import '../module/product/presentation/logic/categories_bloc/categories_bloc.dart';
import '../module/product/presentation/logic/category_toggle_btn_cubit/category_toggle_btn_cubit.dart';
import '../module/product/presentation/logic/colors_toggle_btn_cubit/colors_toggle_btn_cubit.dart';
import '../module/product/presentation/logic/image_cubit/image_cubit.dart';
import '../module/product/presentation/logic/multiple_toggle_btn_cubit/multiple_toogle_btn_cubit.dart';
import '../module/product/presentation/logic/product/product_bloc.dart';
import '../module/product/presentation/logic/product_cubit/product_cubit.dart';
import '../module/product/presentation/logic/single_toggle_btn_cubit/single_toggle_btn_cubit.dart';
import '../module/product/presentation/logic/sizes_toggle_btn_cubit/sizes_toggle_btn_cubit.dart';
import '../module/product/presentation/logic/type_toggle_btn_cubit/type_toggle_btn_cubit.dart';

//import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // init splash
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove();
  //FlutterNativeSplash.removeAfter(initialization);

  ///Bloc
  sl.registerFactory(
    () => AuthBloc(
      getCurrentUser: sl(),
      //updateCurrentUser: sl(),
      signInWithEmail: sl(),
      signInWithGoogle: sl(),
      signUp: sl(),
      signOut: sl(),
    ),
  );

  sl.registerFactory(() => ProductBloc(
        setProducts: sl(),
        getAllProducts: sl(),
        getProductDatails: sl(),
      ));

  // sl.registerFactory(() => ProductCubit(
  //       setProducts: sl(),
  //     ));

  sl.registerFactory(() => OrdersCubit(
        getAllOrders: sl(),
        getOrderInfo: sl(),
      ));

  // sl.registerFactory(() => BrandCubit(
  //       getAllBrands: sl(),
  //       addBrand: sl(),
  //       daleteBrand: sl(),
  //     ));
  sl.registerFactory(() => BrandsBloc(
        getAllBrands: sl(),
        addBrand: sl(),
        daleteBrand: sl(),
      ));

  sl.registerFactory(() => CategoriesBloc(
        getCategories: sl(),
        getAllCategories: sl(),
        addCategory: sl(),
        daleteCategory: sl(),
      ));
  sl.registerFactory(() => CategoryToggleBtnCubit());
  sl.registerFactory(() => SizesToggleBtnCubit());
  sl.registerFactory(() => ColorsToggleBtnCubit());
  sl.registerFactory(() => MultipleToogleBtnCubit());
  sl.registerFactory(() => SingleToggleBtnCubit());
  sl.registerFactory(() => TypeToggleBtnCubit());

  sl.registerFactory(() => ImageCubit(
        setProductImage: sl(),
        getAllProductSmallImages: sl(),
      ));

  sl.registerFactory(() => TabBarCubit());

  sl.registerFactory(() => ColorsAndSizesCubit());

  sl.registerFactory(() => BigImageCubit(
        getAllProductBigImages: sl(),
      ));

  // sl.registerFactory(
  //   () => ProductBloc(
  //     getProduct: sl(),
  //     getAllProducts: sl(),
  //     getAllSortedProducts: sl(),
  //   ),
  // );

  // sl.registerFactory(() => ShopBloc());
  // sl.registerFactory(() => OrientationCubit());
  // sl.registerFactory(() => SortToggleButtonCubit());

  ///Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  //sl.registerLazySingleton(() => UpdateCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  //sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetAllOrders(sl()));
  //sl.registerLazySingleton(() => GetAllSortedProductsByQuery(sl()));
  //sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetAllBrands(sl()));
  sl.registerLazySingleton(() => AddCategory(sl()));
  sl.registerLazySingleton(() => DaleteCategory(sl()));
  sl.registerLazySingleton(() => AddBrand(sl()));
  sl.registerLazySingleton(() => DaleteBrand(sl()));
  sl.registerLazySingleton(() => SetProduct(sl()));
  sl.registerLazySingleton(() => SetProductImage(sl()));
  sl.registerLazySingleton(() => GetOrderInfo(sl()));
  sl.registerLazySingleton(() => GetProductDatails(sl()));
  sl.registerLazySingleton(() => GetAllProductSmallImages(sl()));
  sl.registerLazySingleton(() => GetAllProductBigImages(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteAuth: sl(),
      localAuth: sl(),
    ),
  );

  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      remoteProduct: sl(),
    ),
  );

  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      remoteCategories: sl(),
    ),
  );

  sl.registerLazySingleton<BrandsRepo>(
    () => BrandsRepoImpl(
      remoteBrands: sl(),
    ),
  );

  sl.registerLazySingleton<OrdersRepo>(
    () => OrdersRepoImpl(
      remoteOrders: sl(),
    ),
  );

  sl.registerLazySingleton<ProductImageRepo>(
    () => ProductImageRepoImpl(
      remoteProductImage: sl(),
    ),
  );

  ///datasource
  sl.registerLazySingleton<FirebaseAuthData>(
    () => FirebaseAuthDataImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  // sl.registerLazySingleton<RemoteProduct>(
  //   () => RemoteProductImpl(
  //     firestore: sl(),
  //   ),
  // );

  sl.registerLazySingleton<RemoteCategories>(
    () => RemoteCategoriesImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteBrands>(
    () => RemoteBrandsImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProducts>(
    () => RemoteProductsImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteOrders>(
    () => RemoteOrdersImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProductImage>(
    () => RemoteProductImageImpl(
      fbStorageCore: sl(),
    ),
  );

  sl.registerLazySingleton<FirebaseAuthWithFirestore>(
    () => FirebaseAuthImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<LocalAuth>(
    () => AuthSharedPreferencesImpl(authPreferences: sl()),
  );
  // sl.registerLazySingleton<RemoteUser>(
  //   () => RemoteUserImpl(firestore: sl()),
  // );

  ///Core
  sl.registerLazySingleton<FirebaseAuthCore>(
    () => FirebaseAuthCoreImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<FirestoreCore>(
    () => FirestoreCoreImpl(firestoreDB: sl()),
  );
  sl.registerLazySingleton<FirebaseStorageCore>(
    () => FirebaseStorageCoreImpl(fbStorage: sl()),
  );
  sl.registerLazySingleton<SharedPreferencesDB>(
    () => SharedPreferencesImp(preferencesCore: sl()),
  );

  ///Extarnal
  // Firebase
  final firebase = await Firebase.initializeApp();
  sl.registerLazySingleton(() => firebase);
  final firebaseAuthDB = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuthDB);
  final firestoreDB = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestoreDB);
  final fbStorage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => fbStorage);

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
