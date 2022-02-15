class DynamicFormInterface {
  final String value;
  final List<Validator>? validators;
  final Function? customValidator;

  DynamicFormInterface(this.value, this.validators, [this.customValidator]);
}

enum Validator { email, text, number }

extension ValidatorFunction on Validator {
  String? Function(String?)? get validator {
    switch (this) {
      case Validator.email:
        return emailValidator;
      default:
        return (value) {
          return null;
        };
    }
  }
}

String? emailValidator(String? value) {
  if (!(new RegExp(r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$"))
      .hasMatch(value.toString())) {
    return "Email inválido";
  }
  return null;
}
