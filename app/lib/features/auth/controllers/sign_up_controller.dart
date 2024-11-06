import 'package:blue_spa/data/models/user_model.dart';
import 'package:blue_spa/data/services/api_exception.dart';
import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:blue_spa/utils/app_navigation.dart';
import 'package:blue_spa/utils/taost_notification.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class SignUpController extends GetxController {
  final AuthProvider _authProvider;

  SignUpController(AuthProvider authProvider) : _authProvider = authProvider;

  String _name = '';
  String _email = '';
  String _password = '';

  String get name => _name;
  String get email => _email;
  String get password => _password;
  var isLoading = false.obs;

  final ValueNotifier<bool> formErrorValueNotifer = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();

  _validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    formErrorValueNotifer.value = true;
    return false;
  }

  Future<void> signUp(BuildContext context) async {
    if (!_validateForm()) {
      return;
    }
    isLoading.value = true;

    //await Future.delayed(const Duration(seconds: 3));

    try {
      await _authProvider.signUp(name, email, password);

      if (context.mounted) {
        AppNavigation.pushAndRemoveAll(context, AppConstants.routerMain);
      }
      isLoading.value = false;
    } on ApiException catch (error) {
      if (context.mounted) {
        ToastNotification.show(context, error.message);
      }
      isLoading.value = false;
    } catch (e) {
      if (context.mounted) {
        toastification.show(
            alignment: Alignment.bottomCenter,
            context: context,
            title: Text(e.toString()));
      }
      isLoading.value = false;
    }
  }

  void setName(String newVal) {
    _name = newVal;
  }

  void setEmail(String newVal) {
    _email = newVal;
  }

  void setPassword(String newVal) {
    _password = newVal;
  }
}
