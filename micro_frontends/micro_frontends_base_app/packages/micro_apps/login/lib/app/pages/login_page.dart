import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ButtonDefaultWidget(
          onPressed: () {
            navigatorKey.currentState?.pushNamed('/home');
          },
          title: 'Ir para Home',
        ),
      ),
    );
  }
}
