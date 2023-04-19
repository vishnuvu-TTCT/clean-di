import 'package:dependencyinjection/features/auth/auth.dart';
import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:dependencyinjection/utils/ext/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
          loading: () => context.show(),
          success: (data) {
            context.dismiss();
            showToast(data.toString());
          },
          failure: (failure) {
            context.dismiss();
            showToast(failure.toString());
          },
        );
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                child: const Text('Login'),
                onPressed: () {
                  context.read<AuthCubit>().login(const LoginParams(
                        email: 'eve.holt@reqres.in',
                        password: 'cityslicka',
                      ));
                },
              ),
              CupertinoButton(
                child: const Text('Sign in anonymously'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
