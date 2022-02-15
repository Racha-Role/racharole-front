import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racha_role/shared/form/dynamic-form.dart';
import 'package:racha_role/shared/form/dynamic-form.interface.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(15),
          child: DynamicForm(inputList: [
            new DynamicFormInterface("aaa", [Validator.email])
          ])),
    );
  }
}



//  Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Preencha o campo";
//                         }
//                         if (!(new RegExp(
//                                 r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$"))
//                             .hasMatch(value)) {
//                           return "Email inválido";
//                         }

//                         log((new RegExp(
//                                 r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$"))
//                             .hasMatch(value)
//                             .toString());

//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         hintText: 'Email',
//                       )),
//                   TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Preencha o campo";
//                         }

//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         hintText: 'Senha',
//                       )),
//                   ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("VALIDATE")));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("NOT VALIDATE")));
//                         }
//                       },
//                       child: const Text("Entrar"))
//                 ],
//               ))