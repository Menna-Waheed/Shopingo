class AppValidator {
  AppValidator._(); //private constructor

  static String? validateEmail(String? val) {
    RegExp emailRegExp = RegExp(
      '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}',
    );
    if (val == null || val.trim().isEmpty) {
      return 'this feild is required';
    } else if (emailRegExp.hasMatch(val) == false) {
      return 'please enter valid email';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (val == null || val.trim().isEmpty) {
      return 'this feild is required';
    } else if (val.length < 8 || passwordRegex.hasMatch(val) == false) {
      return 'please enter valid password';
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.trim().isEmpty) {
      return 'this feild is required';
    } else if (val != password) {
      return 'password not match';
    }
    return null;
  }

  static String? validateName(String? val) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');

    if (val == null || val.trim().isEmpty) {
      return 'this feild is required';
    } else if (nameRegex.hasMatch(val) == false) {
      return 'please enter valid name';
    }
    return null;
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'required field';
    } else if (val.trim().length != 11) {
      return 'enter value must eQuel 11 digit';
    } else if (int.tryParse(val.trim()) == null) {
      return ' number only';
    } else {
      return null;
    }
  }
}
