class Validation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePasswordConfirmation(
    String? value, {
    required String? confirmationValue,
    required String? originalPasswordValue,
  }) {
    if (confirmationValue == null || confirmationValue.isEmpty) {
      return 'Please confirm your password';
    }

    if (originalPasswordValue == null || originalPasswordValue.isEmpty) {
      return 'Original password is required first';
    }

    if (confirmationValue != originalPasswordValue) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters, spaces, hyphens, or apostrophes';
    }

    return null;
  }

  static String? validateEgyptianPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    String cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanValue.startsWith('0020')) {
      cleanValue = cleanValue.substring(4);
    } else if (cleanValue.startsWith('20')) {
      cleanValue = cleanValue.substring(2);
    }

    final phoneRegex = RegExp(r'^1[0125]\d{8}$');

    if (!phoneRegex.hasMatch(cleanValue)) {
      return 'Please enter a valid Egyptian mobile number (e.g., 1xxxxxxxxx)';
    }

    if (cleanValue.length != 10) {
      return 'Phone number must be exactly 11 digits';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length <= 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }
}
