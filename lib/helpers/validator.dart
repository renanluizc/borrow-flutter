class Validator {
  static String isEmptyText(String text) {
    if (text.isEmpty) return 'Campo obrigatório';

    return null;
  }

  static String isEmptyDate(DateTime dateTime) {
    if (dateTime.isAfter(DateTime.now())) return 'Data de empréstimo inválido';

    if (dateTime == null) return 'Campo obrigatório';

    return null;
  }

  static String validatePhone(String value) {
    Pattern pattern =
        r'^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Inserir número válido';

    
    if (value.isEmpty) return 'Campo obrigatório';
    
    return null;
  }    
}
