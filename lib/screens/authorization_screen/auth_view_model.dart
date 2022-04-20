
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier{
  String name = "";
  final TextEditingController controller = TextEditingController(text: "");

  Future<void> setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', controller.text);
    name = controller.text;
  }
   logOut () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

  }

}