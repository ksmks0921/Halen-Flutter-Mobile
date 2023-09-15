String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Please enter a valid email address'
      : null;
}

String? validateMobile(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please enter a mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }
  return '';
}

String? validateZip(String? value) {
  String pattern = r"^[0-9]{5}(?:-[0-9]{4})?$";
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please enter a valid zip code';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid zip code';
  }
  return '';
}

String? validateState(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a valid state';
  }

  // Regex pattern for US state abbreviations (case-insensitive)
  const pattern = r'^[a-zA-Z]{2}$';

  if (!RegExp(pattern).hasMatch(value)) {
    return 'No match found';
  }

  return '';
}
