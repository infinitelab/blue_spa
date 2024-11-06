import 'package:blue_spa/features/auth/controllers/sign_in_controller.dart';
import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/i18n/app_locale.dart';
import 'package:blue_spa/main.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:blue_spa/utils/app_navigation.dart';
import 'package:blue_spa/utils/dimensions.dart';
import 'package:blue_spa/utils/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = context.read<AuthProvider>();
    final SignInController signInController =
        Get.put(SignInController(authProvider));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: body(context, signInController),
    );
  }

  Widget body(BuildContext context, SignInController controller) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingLarge,
        ),
        children: [
          const SizedBox(
            height: 100,
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
              AppLocale.loginScreenTitle,
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
              AppLocale.loginScreenSubTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            ),
          ),
          //Mobile input
          const SizedBox(
            height: Dimensions.paddingMedium,
          ),
          //Form
          Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  ValueListenableBuilder(
                      valueListenable: controller.formErrorNotier,
                      builder: (context, error, child) {
                        return TextFormField(
                          onChanged: controller.setEmail,
                          validator: Validations.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: error
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                              hintText: AppLocale.enterYourEmail,
                              border: OutlineInputBorder()),
                        );
                      }),
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
                  ValueListenableBuilder(
                      valueListenable: controller.formErrorNotier,
                      builder: (context, error, child) {
                        return TextFormField(
                          onChanged: controller.setPassword,
                          validator: Validations.validatePassword,
                          obscureText: true,
                          autovalidateMode: error
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                              hintText: AppLocale.enterYourPassword,
                              border: OutlineInputBorder()),
                        );
                      }),
                  const SizedBox(
                    height: Dimensions.paddingSmall,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          AppLocale.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        )),
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
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                controller.signIn(context);
                              },
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text(
                                AppLocale.login,
                              ))),
                  )
                ],
              )),

          const SizedBox(
            height: Dimensions.paddingLarge * 2,
          ),
          const Row(
            children: [
              Expanded(
                child: Divider(),
              ),
              SizedBox(
                width: Dimensions.paddingDefault,
              ),
              Text('or'),
              SizedBox(
                width: Dimensions.paddingDefault,
              ),
              Expanded(child: Divider()),
            ],
          ),
          //Google plus icons
          const SizedBox(
            height: Dimensions.paddingLarge * 2,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Brand(
                      Brands.google,
                      size: Dimensions.iconsMedium,
                    ),
                    const SizedBox(
                      width: Dimensions.paddingExtraSmall,
                    ),
                    Text(
                      AppLocale.continueWithGoogle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          //Register button
          const SizedBox(
            height: Dimensions.paddingLarge * 2,
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith()),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigation.push(context, AppConstants.routerSignUp);
                      },
                    text: " create one",
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
