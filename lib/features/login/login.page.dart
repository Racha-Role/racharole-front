import 'package:flutter/material.dart';
import 'package:racha_role/features/sign-up/sign-in.component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: SignInComponent(),
      ),
    );
  }
}
