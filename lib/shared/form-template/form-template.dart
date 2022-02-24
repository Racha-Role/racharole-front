import 'package:flutter/material.dart';
import 'package:racha_role/shared/form-template/form-template.interface.dart';

class FormTemplate extends StatefulWidget {
  final List<FormTemplateInterface> fieldList;
  final GlobalKey<FormState> formKey;

  const FormTemplate({Key? key, required this.formKey, required this.fieldList})
      : super(key: key);

  @override
  _FormTemplateState createState() => _FormTemplateState();
}

class _FormTemplateState extends State<FormTemplate> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = widget.formKey;
    List<FormTemplateInterface> fieldList = widget.fieldList;

    final form = Form(
        key: formKey,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: fieldList.length,
          itemBuilder: (context, index) {
            return TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: fieldList[index].name),
              initialValue: fieldList[index].value,
              validator: fieldList[index].validator,
              onSaved: fieldList[index].onSaved,
            );
          },
        ));

    return form;
  }
}
