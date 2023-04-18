import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RootLogin extends StatelessWidget {
  const RootLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logined'),
        leading: IconButton(
            onPressed: () async {
              await context.read<AuthCubit>().logout();
            },
            icon: const Icon(Icons.logout)),
      ),
      body: Container(
        child: Center(
          child: CupertinoButton(
            onPressed: () => context.go(Routes.settings.path),
            child: const Text('Settings'),
          ),
        ),
      ),
    );
  }
}
