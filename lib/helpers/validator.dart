class Validator {
  static String isEmptyText(String text) {
    if (text.isEmpty) return 'Campo obrigatório';

    return null;
  }

  static String isEmptyDate(DateTime dateTime) {
    if (dateTime == null) return 'Campo obrigatório';

    return null;
  }

  static String validatePhone(String value) {
    if (value.isEmpty) return 'Campo obrigatório';
    
    return null;
  }    
}
