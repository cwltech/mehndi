class Validation {
  static String? emptyValidation(String v) {
    if (v.isEmpty) {
      return 'Required';
    }
    return null;
  }

  static String? emailValidation(String v) {
    if (v.isEmpty) {
      return 'required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(v)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? otpLengthValidation(String v) {
    if (v.length < 3) {
      return "Please enter OTP";
    } else {
      return null;
    }
  }
}
