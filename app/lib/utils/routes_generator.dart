import 'package:blue_spa/features/auth/screens/sign_in_screen.dart';
import 'package:blue_spa/features/auth/screens/sign_up_screen.dart';
import 'package:blue_spa/features/auth/screens/splash_screen.dart';
import 'package:blue_spa/features/main/screens/main_screen.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.routerSplash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppConstants.routerSignIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case AppConstants.routerSignUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppConstants.routerMain:
        return MaterialPageRoute(builder: (context) => const MainScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No router defined'),
                  ),
                ));
    }
  }
}
