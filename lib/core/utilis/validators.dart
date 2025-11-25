class MyValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(
      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    ).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an phone';
    }
    if (!value.startsWith('010')) {
      return 'Phone number must start with 010';
    }
    if (value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length != 11) {
      return 'Phone number must be exactly 11 digits long';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? nationalIdValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a  nationalId';
    }
    if (value.length != 14) {
      return 'nationalId must be at least 14 characters long';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? genderValidator({String? value}) {
    if (value!.isEmpty) {
      return 'please enter gender';
    }
    return null;
  }

  static String? imageValidator(String? image) {
    if (image == null || image.isEmpty) {
      return 'Image cannot be empty';
    }
    return null;
  }

  static String? tokenValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'token cannot be empty';
    }
    return null;
  }
}
