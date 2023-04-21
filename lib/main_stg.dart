import 'dart:async';
import 'package:dependencyinjection/config.dart';
import 'package:dependencyinjection/dependency_injection.dart';
import 'package:dependencyinjection/lzyct_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  /// Register Service locator
  await serviceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseServices().init();

  /// Set env as staging
  environment = Environment.staging;

  runZonedGuarded(
    /// Lock device orientation to portrait
    () => SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) async {
      /// Load SharedPref before load My App Widget
      SharedPreferences.getInstance().then((value) {
        initPrefManager(value);
        runApp(const LzyctApp());
      });
    }),
    (error, stackTrace) async {
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
