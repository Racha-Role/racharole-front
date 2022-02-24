import 'package:flutter/material.dart';
import 'package:racha_role/features/login/login.controller.dart';
import 'package:racha_role/shared/form-template/form-template.dart';
import 'package:racha_role/shared/form-template/form-template.interface.dart';
import 'package:provider/provider.dart';
import 'package:racha_role/shared/snack-bar/notifier-snack-bar.dart';

class SignInComponent extends StatefulWidget {
  const SignInComponent({Key? key}) : super(key: key);

  @override
  _SignInComponentState createState() => _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = context.watch<LoginController>();
    NotifierSnackBar notifier = new NotifierSnackBar(context: context);

    double screenWidth = MediaQuery.of(context).size.width;
    TargetPlatform targetPlatform = Theme.of(context).platform;
    late double maxWidth;

    if (targetPlatform == TargetPlatform.android ||
        targetPlatform == TargetPlatform.iOS ||
        screenWidth <= 600) {
      maxWidth = screenWidth;
    } else {
      maxWidth = screenWidth * 0.35;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormTemplate(
              fieldList: [
                new FormTemplateInterface(
                    name: "Email",
                    onSaved: loginController.saveEmail,
                    validator: loginController.emailValidator),
                new FormTemplateInterface(
                    name: "Senha",
                    onSaved: loginController.savePassword,
                    validator: loginController.passwordValidator),
              ],
              formKey: loginController.formKey,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  if (loginController.login() == null) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (_) => false);
                  } else {
                    notifier.show("Erro ao logar", NotifierSnackBarType.error);
                  }
                },
                child: Text("Entrar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
