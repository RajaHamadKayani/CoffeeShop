import 'package:coffee_shop_app/models/login_model_class/login_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  LoginModelClass loginModelClass = LoginModelClass();
  Future<bool> saveToken(var token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    return token;
  }

  static Future<LoginModelClass> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    print(token);
    return LoginModelClass(token: token.toString());
  }

  Future<bool> removeUser(LoginModelClass loginModelClass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return true;
  }
}
