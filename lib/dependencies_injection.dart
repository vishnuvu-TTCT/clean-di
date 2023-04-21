import 'package:dependencyinjection/core/api/dio_client.dart';
import 'package:dependencyinjection/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dependencyinjection/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:dependencyinjection/features/features.dart';
import 'package:dependencyinjection/features/users/users.dart';
import 'package:dependencyinjection/utils/helper/helper.dart';
import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  /// For unit testing only
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then((value) {
      initPrefManager(value);
    });
    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
    dataSources();
    repositories();
    useCase();
    cubit();
  } else {
    sl.registerSingleton<DioClient>(DioClient());
    dataSources();
    repositories();
    useCase();
    cubit();
  }
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()));
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<UsersRemoteDatasource>(
    () => UsersRemoteDatasourceImpl(sl()),
  );
}

void useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));

  /// Users
  sl.registerLazySingleton(() => GetUsers(sl()));
}

void cubit() {
  /// Auth

  sl.registerFactory(() => AuthCubit(sl()));

  /// Users
  sl.registerFactory(() => UsersCubit(sl()));
}
