import 'package:dependencyinjection/core/api/dio_client.dart';
import 'package:dependencyinjection/features/auth/auth.dart';
import 'package:dependencyinjection/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dependencyinjection/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dependencyinjection/utils/helper/helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/pages/login/cubit/auth_cubit.dart';

GetIt sl = GetIt.instance;

//Dio
Future<void> serviceLocator() async {
  sl.registerSingleton<DioClient>(DioClient());
  dataSources();
  repositories();
  useCases();
  cubit();
}

void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

void dataSources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
}

void repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
}

void useCases() {
  sl.registerLazySingleton(() => PostLogin(sl()));
}

void cubit() {
  sl.registerFactory(() => AuthCubit(sl()));
}
