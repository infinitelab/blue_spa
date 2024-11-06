import 'package:blue_spa/data/models/user_model.dart';
import 'package:blue_spa/features/auth/data/data_sources/auth_pref_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPref extends AuthPrefImpl {
  static const idKey = 'id';
  static const nameKey = 'name';
  static const emailKey = 'email';
  static const tokenkey = 'token';

  @override
  Future<void> saveUser(UserModel user) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(idKey, user.id);
    pref.setString(nameKey, user.name);
    pref.setString(nameKey, user.email);
  }

  @override
  Future<UserModel?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final id = pref.getString(idKey) ?? '';
    final name = pref.getString(nameKey) ?? '';
    final email = pref.getString(emailKey) ?? '';
    final token = pref.getString(tokenkey) ?? '';
    return UserModel(id: id, name: name, email: email, token: token);
  }

  @override
  Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(tokenkey, token);
  }

  @override
  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(tokenkey);
  }
}
