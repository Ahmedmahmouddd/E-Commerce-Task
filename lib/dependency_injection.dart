import 'package:ahmed_mahmoud_flutter_task/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/repository/auth_repository.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/cubits/signin_cubit/signin_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/data_source.dart/cart_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/repository/cart_repository_impl.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/repository/cart_repository.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/data_source/product_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/repository/product_repository_impl.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/repository/product_repository.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/data/data_source/search_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/data/repository/search_repository_imp.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/domain/repository/search_repository.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/UI/cubit/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl()),
  );
  //
  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  //
  // Cubits
  sl.registerFactory(() => SigninCubit(sl()));
  sl.registerFactory(() => BottomNavBarCubit());
  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => SearchCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));
}
