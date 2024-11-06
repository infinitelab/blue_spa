import 'package:blue_spa/i18n/app_locale.dart';

class Validations {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocale.nameIsRequired;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocale.emailIsRequired;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppLocale.enterValidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocale.passwordIsRequired;
    }
    if (value.length < 6) {
      return AppLocale.passwordAtleast;
    }
    return null;
  }
}
