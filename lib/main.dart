import 'dart:async';

import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/dependency_injection.dart';
import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:dependencyinjection/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9909);
  runZonedGuarded(
      () => SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]).then((value) async {
            SharedPreferences.getInstance().then((value) {
              initPrefManager(value);
              runApp(const MyApp());
            });
          }),
      (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<AuthCubit>())],
      child: Builder(builder: (context) {
        AppRoute.setStream(context);
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routeInformationProvider: AppRoute.router.routeInformationProvider,
          routeInformationParser: AppRoute.router.routeInformationParser,
          routerDelegate: AppRoute.router.routerDelegate,
        );
      }),
    );
  }
}
