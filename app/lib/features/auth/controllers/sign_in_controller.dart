import 'package:blue_spa/data/services/api_exception.dart';
import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:blue_spa/utils/app_navigation.dart';
import 'package:blue_spa/utils/taost_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthProvider _authProvider;
  SignInController(AuthProvider authProvider) : _authProvider = authProvider;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;
  var isLoading = false.obs;

  ValueNotifier<bool> formErrorNotier = ValueNotifier(false);

  bool _validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    formErrorNotier.value = true;
    return false;
  }

  setEmail(String value) {
    _email = value;
  }

  setPassword(String value) {
    _password = value;
  }

  Future<void> signIn(BuildContext context) async {
    if (!_validateForm()) return;

    try {
      isLoading.value = true;
      await _authProvider.signIn(email, password);
      isLoading.value = false;
      if (context.mounted) {
        AppNavigation.pushAndRemoveAll(context, AppConstants.routerMain);
      }
    } on ApiException catch (e) {
      if (context.mounted) ToastNotification.show(context, e.message);
      isLoading.value = false;
    } catch (e) {
      if (context.mounted) ToastNotification.show(context, 'Unknown error');
      isLoading.value = false;
    }
  }
}
