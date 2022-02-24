import 'package:flutter/material.dart';

class FormTemplateInterface {
  final String name;
  final String? value;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String?> onSaved;

  FormTemplateInterface(
      {required this.name, this.value, required this.onSaved, this.validator});
}
