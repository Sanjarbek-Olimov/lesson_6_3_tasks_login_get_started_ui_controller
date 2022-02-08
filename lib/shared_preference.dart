import 'dart:convert';
import 'package:lesson_6_3_tasks/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user_model.dart';

class Prefs{

  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString("user", stringUser);
  }

  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("user");
    if(stringUser==null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }

  static storeAccount(Account account) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(account);
    prefs.setString("account", stringUser);
  }

  static Future<Account?> loadAccount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("account");
    if(stringUser==null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return Account.fromJson(map);
  }

  static Future<bool> removeAccount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("account");
  }

}