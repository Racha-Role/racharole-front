enum ValidatorType { email, text, number }

extension Validator on ValidatorType {
  // String? Function(String?)? get validator {
  //   switch (this) {
  //     case ValidatorType.email:
  //       return emailValidator;
  //     default:
  //       return (value) {
  //         return null;
  //       };
  //   }
  // }

  static String? email(String? value) {
    if (!(new RegExp(r"^([a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?)?$"))
        .hasMatch(value.toString())) {
      return "Email inválido";
    }
    return null;
  }

  static String? requiredField(String? value) {
    if (value == null) return "Campo obrigatório";

    return null;
  }
}
