import 'package:http/http.dart' as http;

abstract class LoginInterface {
  set email(String email);
  set password(String password);
}

class LoginRepository implements LoginInterface {
  late String _email;
  set email(String email) => _email = email;
  late String _password;
  set password(String password) => _password = password;

  String? login() {
    if (_email == "a@a.a" && _password == "12345678")
      return "Usuário não cadastrado";

    return null;
  }
}
