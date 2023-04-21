import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/core/widgets/button.dart';
import 'package:dependencyinjection/core/widgets/button_text.dart';
import 'package:dependencyinjection/core/widgets/text_f.dart';
import 'package:dependencyinjection/features/auth/auth.dart';
import 'package:dependencyinjection/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:dependencyinjection/utils/ext/context.dart';
import 'package:dependencyinjection/utils/ext/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
          loading: () => context.show(),
          success: (data) {
            context.dismiss();
            data.toString().toToastSuccess();
          },
          failure: (failure) {
            context.dismiss();
            failure.toToastError();
          },
        );
      },
      child: Scaffold(
        backgroundColor: Palette.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(''),
                    Image.asset(
                      'assets/login_logo.png',
                      scale: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextF(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    hint: 'Username',
                    controller: _username,
                  ),
                  TextF(
                    prefixIcon: const Icon(Icons.password),
                    hint: 'Password',
                    controller: _password,
                  ),
                  Button(
                    title: 'Login',
                    onPressed: () {
                      // email: 'eve.holt@reqres.in',
                      //       password: 'cityslicka',
                      context.read<AuthCubit>().login(
                            const LoginParams(
                              email: 'eve.holt@reqres.in',
                              password: 'cityslicka',
                            ),
                          );
                    },
                    color: Palette.graphicblue,
                  ),
                  ButtonText(
                    title: 'Don\'t have an account?',
                    onPressed: () {},
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _login(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            child: const Text('Login'),
            onPressed: () {},
          ),
          CupertinoButton(
            child: const Text('Sign in anonymously'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
