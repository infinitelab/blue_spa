import 'package:blue_spa/data/services/api_client.dart';
import 'package:blue_spa/features/auth/data/data_sources/auth_pref.dart';
import 'package:blue_spa/features/auth/data/repositories/auth_repository.dart';
import 'package:blue_spa/features/auth/providers/auth_provider.dart';
import 'package:blue_spa/features/auth/screens/splash_screen.dart';
import 'package:blue_spa/get_injection.dart';
import 'package:blue_spa/i18n/app_locale.dart';
import 'package:blue_spa/utils/routes_generator.dart';
import 'package:blue_spa/utils/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() {
  getItSetup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(mapLocales: [
      const MapLocale('en', AppLocale.en),
      const MapLocale('de', AppLocale.de)
    ], initLanguageCode: 'en');
    localization.onTranslatedLanguage = _onTranslatedLanguage;

    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository(GetIt.I.get<ApiClient>()))
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AuthProvider(
                  context.read<AuthRepository>(), GetIt.I.get<AuthPref>()))
        ],
        child: ToastificationWrapper(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            supportedLocales: localization.supportedLocales,
            localizationsDelegates: localization.localizationsDelegates,
            theme: lightTheme,
            onGenerateRoute: RoutesGenerator.generateRoute,
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
