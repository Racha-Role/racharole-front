import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:racha_role/shared/form/dynamic-form.interface.dart';

class DynamicForm extends StatefulWidget {
  final List<DynamicFormInterface>? inputList;

  const DynamicForm({Key? key, this.inputList}) : super(key: key);

  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  @override
  Widget build(BuildContext context) {
    List<DynamicFormInterface>? inputList = widget.inputList;

    return Form(
        child: ListView.builder(
      itemCount: inputList?.length,
      itemBuilder: (context, index) {
        return TextFormField(
          initialValue: inputList?[index].value,
          validator: inputList?[index].validators?[0].validator,
        );
      },
    ));
  }
}
// TextFormField(
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