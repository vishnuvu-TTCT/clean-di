import 'package:dependencyinjection/features/auth/pages/login/login_page.dart';
import 'package:dependencyinjection/features/users/users.dart';
import 'package:dependencyinjection/presentation/settings.dart';
import 'package:dependencyinjection/utils/helper/go_router_stream.dart';
import 'package:dependencyinjection/utils/helper/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../dependency_injection.dart';
import '../features/auth/pages/login/cubit/auth_cubit.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  /// Home Page
  dashboard("/dashboard"),
  settings("/settings"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;
  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: Routes.root.path,
          name: Routes.root.name,
          builder: (x, y) => const DashboardPage(),
          routes: const []),
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (x, y) => Container(),
      ),
      GoRoute(
        path: Routes.dashboard.path,
        name: Routes.dashboard.name,
        builder: (x, y) => const DashboardPage(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (x, y) => const AuthPage(),
      ),
      GoRoute(
        path: Routes.settings.path,
        name: Routes.settings.name,
        builder: (context, state) => const SettingsPage(),
      )
    ],
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (context, state) {
      bool isLoginPage = state.subloc == Routes.login.path;
      if (!sl<PrefManager>().isLogin) {
        return isLoginPage ? null : Routes.login.path;
      }
      if (isLoginPage && sl<PrefManager>().isLogin) {
        return Routes.dashboard.path;
      }
      return null;
    },
  );
}
