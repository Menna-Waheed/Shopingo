// class AppValidator {
//   AppValidator._(); //private constructor
//
//   static String? validateEmail(String? val) {
//     RegExp emailRegExp = RegExp(
//       '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}',
//     );
//     if (val == null || val.trim().isEmpty) {
//       return 'this feild is required';
//     } else if (emailRegExp.hasMatch(val) == false) {
//       return 'please enter valid email';
//     }
//     return null;
//   }
//
//   static String? validatePassword(String? val) {
//     final RegExp passwordRegex = RegExp(
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
//     );
//     if (val == null || val.trim().isEmpty) {
//       return 'this feild is required';
//     } else if (val.length < 8 || passwordRegex.hasMatch(val) == false) {
//       return 'please enter valid password';
//     }
//     return null;
//   }
//
//   static String? validateConfirmPassword(String? val, String? password) {
//     if (val == null || val.trim().isEmpty) {
//       return 'this feild is required';
//     } else if (val != password) {
//       return 'password not match';
//     }
//     return null;
//   }
//
//   static String? validateName(String? val) {
//     final RegExp nameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
//
//     if (val == null || val.trim().isEmpty) {
//       return 'this feild is required';
//     } else if (nameRegex.hasMatch(val) == false) {
//       return 'please enter valid name';
//     }
//     return null;
//   }
//
//   static String? validatePhoneNumber(String? val) {
//     if (val == null || val.trim().isEmpty) {
//       return 'required field';
//     } else if (val.trim().length != 11) {
//       return 'enter value must eQuel 11 digit';
//     } else if (int.tryParse(val.trim()) == null) {
//       return ' number only';
//     } else {
//       return null;
//     }
//   }
// }

class AppValidator {
  AppValidator._();

  static String? validateEmail(String? val) {
    const String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp emailRegExp = RegExp(pattern);

    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!emailRegExp.hasMatch(val.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final RegExp passwordRegex = RegExp(pattern);

    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!passwordRegex.hasMatch(val)) {
      // بدون trim
      return 'Password must contain uppercase, lowercase, number, and special character';
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateName(String? val) {
    const String pattern = r'^[a-zA-Z0-9\s,.-]+$';
    final RegExp nameRegex = RegExp(pattern);

    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!nameRegex.hasMatch(val.trim())) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    }

    final String trimmed = val.trim();
    if (trimmed.length != 11) {
      return 'Phone number must be exactly 11 digits';
    } else if (int.tryParse(trimmed) == null) {
      return 'Phone number must contain digits only';
    }
    return null;
  }
}
