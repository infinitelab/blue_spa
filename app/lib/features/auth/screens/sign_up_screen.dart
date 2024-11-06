import 'package:blue_spa/features/auth/controllers/sign_up_controller.dart';
import 'package:blue_spa/features/auth/data/repositories/auth_repository.dart';
import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/i18n/app_locale.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:blue_spa/utils/app_navigation.dart';
import 'package:blue_spa/utils/dimensions.dart';
import 'package:blue_spa/utils/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<SignUpScreen> {
  late final authProvider = Provider.of<AuthProvider>(context, listen: false);
  late final SignUpController signUpController =
      Get.put(SignUpController(authProvider));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingLarge,
        ),
        children: [
          const SizedBox(
            height: 50,
          ),
          //Logo
          Center(
              child: SizedBox(
                  width: 100,
                  child: Image.asset('${AppConstants.imageAssets}logo.png'))),
          //Title
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              AppLocale.register,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          //Sub Title
          const SizedBox(
            height: Dimensions.paddingMedium,
          ),
          Center(
            child: Text(
              AppLocale.createYourAccount,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            ),
          ),
          const SizedBox(
            height: Dimensions.paddingMedium,
          ),
          //Form
          ValueListenableBuilder(
              valueListenable: signUpController.formErrorValueNotifer,
              builder: (context, error, child) {
                return Form(
                    key: signUpController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Name
                        Text(
                          AppLocale.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingMedium,
                        ),
                        TextFormField(
                          onChanged: signUpController.setName,
                          validator: Validations.validateName,
                          keyboardType: TextInputType.name,
                          autovalidateMode: error
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                              hintText: AppLocale.enterYourName,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingMedium,
                        ),
                        //Email form field
                        Text(
                          AppLocale.email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingMedium,
                        ),
                        TextFormField(
                          onChanged: signUpController.setEmail,
                          validator: Validations.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: error
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                              hintText: AppLocale.enterYourEmail,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingMedium,
                        ),
                        //Password form field
                        Text(
                          AppLocale.password,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingMedium,
                        ),
                        TextFormField(
                          onChanged: signUpController.setPassword,
                          validator: Validations.validatePassword,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          autovalidateMode: error
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                              hintText: AppLocale.enterYourPassword,
                              border: OutlineInputBorder()),
                        ),

                        const SizedBox(
                          height: Dimensions.paddingLarge * 2,
                        ),
                        //Sign in button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Obx(() => FilledButton(
                              style: FilledButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: signUpController.isLoading.value
                                  ? null
                                  : () {
                                      signUpController.signUp(context);
                                    },
                              child: signUpController.isLoading.value
                                  ? const Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : const Text(
                                      AppLocale.signUp,
                                    ))),
                        )
                      ],
                    ));
              }),
          //Sign in
          const SizedBox(
            height: Dimensions.paddingLarge * 2,
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith()),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigation.pushAndRemoveAll(
                            context, AppConstants.routerSignIn);
                      },
                    text: " Sign in",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.blue))
              ])),
            ),
          )
        ],
      ),
    );
  }
}
