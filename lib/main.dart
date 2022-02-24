import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racha_role/features/home/home-page.dart';
import 'package:racha_role/features/login/login.controller.dart';
import 'package:racha_role/features/login/login.page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Racha Role',
      // builder: (BuildContext context, Widget? widget) {
      //   ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      //     return CustomError(errorDetails: errorDetails);
      //   };

      //   return widget;
      // },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(title: "Racha Conta"),
        '/login': (context) => LoginPage()
      },
    );
  }
}
