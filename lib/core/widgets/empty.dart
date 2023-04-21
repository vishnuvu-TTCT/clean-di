import 'package:dependencyinjection/utils/ext/context.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/login_logo.png',
          width: context.widthInPercent(45),
        ),
        Text(
          errorMessage ?? 'No data',
        ),
      ],
    );
  }
}
