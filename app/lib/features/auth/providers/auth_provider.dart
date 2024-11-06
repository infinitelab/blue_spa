import 'package:blue_spa/data/models/user_model.dart';
import 'package:blue_spa/features/auth/data/data_sources/auth_pref.dart';
import 'package:blue_spa/features/auth/data/repositories/auth_repository.dart';

import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final AuthPref authPref;
  AuthProvider(this.authRepository, this.authPref);

  UserModel? _user;

  UserModel? get user => _user;
  bool get isAuthenticated => _user != null;

  Future<UserModel> signUp(String name, String email, String password) async {
    try {
      _user = await authRepository
          .signUp({'name': name, 'email': email, 'password': password});
      authPref.saveToken(_user!.token);
      authPref.saveUser(user!);
      notifyListeners();
      return user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn(String email, String password) async {
    try {
      _user =
          await authRepository.signIn({'email': email, 'password': password});
      authPref.saveToken(user!.token);
      authPref.saveUser(user!);
      notifyListeners();
      return user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> authCheck() async {
    return await authPref.getToken() != null;
  }
}
