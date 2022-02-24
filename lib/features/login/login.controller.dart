import 'package:flutter/cupertino.dart';
import 'package:racha_role/features/login/login.repository.dart';
import 'package:racha_role/shared/validator/validator.dart';

class LoginController with ChangeNotifier {
  final LoginRepository loginRepository = LoginRepository();

  FormFieldSetter<String> get saveEmail =>
      (String? email) => loginRepository.email = email!;
  FormFieldSetter<String> get savePassword =>
      (String? password) => loginRepository.password = password!;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey {
    return _formKey;
  }

  LoginController({Key? key});

  String? emailValidator(String? email) {
    if (email == null || email.length == 0)
      return "Por favor, preencha o email";

    return Validator.email(email);
  }

  String? passwordValidator(String? password) {
    if (password == null || password.length == 0)
      return "Por favor, preencha a senha";

    return null;
  }

  String? login() {
    if (!_formKey.currentState!.validate())
      return "Por favor, preencha o formulário de login";

    _formKey.currentState!.save();

    return loginRepository.login();
  }
}
