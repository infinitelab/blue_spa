import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late AuthProvider authProvider = context.read<AuthProvider>();

  @override
  void initState() {
    //opacity animation
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    opacityAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(controller);
    controller.forward();
    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reverse();
      } else if (!controller.isAnimating) {
        controller.forward();
      }
    });
    //go to next screen

    Future.delayed(const Duration(seconds: 3), () async {
      final isLogedIn = await authProvider.authCheck();
      if (mounted && isLogedIn) {
        Navigator.of(context).pushReplacementNamed(AppConstants.routerMain);
      } else if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppConstants.routerSignIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: AnimatedBuilder(
            animation: opacityAnimation,
            builder: (context, child) => Opacity(
                opacity: opacityAnimation.value,
                child: Image.asset('${AppConstants.imageAssets}logo.png')),
          ),
        ),
      ),
    );
  }
}
