class RequiredField {

  static String? requiredField(String? value) {
    if (value == null || value == "" || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

    static String? requiredFieldString(String? value) {
    if (value == null || value == "" || value.isEmpty) {
      return 'Campo obrigatório.';
    }
    if (!value.contains(RegExp("[a-zA-Z]")) || value.contains(RegExp("[0-9]"))) {
      return 'Este campo só aceita letras.';
    }
    return null;
  }

  static String? emailFieldValidator(String? value){
    final regexp = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return requiredField(value) ?? (regexp.hasMatch(value ?? '') == true ? null : 'Email inválido.');
  }

  static String? requiredFieldNumber(String? value) {
    final valueValid = num.tryParse(value!);
    if (value == "" || value.isEmpty) {
      return "Campo obrigatório.";
    }
    if (valueValid == null) {
      return "Este campo espera apenas números";
    }
    return null;
  }

}