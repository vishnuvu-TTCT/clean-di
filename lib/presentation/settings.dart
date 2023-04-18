import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            context.read<AuthCubit>().logout();
          },
          child: const Text('Settings'),
        ),
      ),
    );
  }
}
