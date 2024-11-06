import 'package:blue_spa/data/services/api_client.dart';
import 'package:blue_spa/features/auth/data/data_sources/auth_pref.dart';
import 'package:get_it/get_it.dart';

void getItSetup() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<AuthPref>(AuthPref());

}
