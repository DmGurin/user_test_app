


import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_test_app/users_screen/screen.dart';

class AuthViewModel extends ChangeNotifier{
  final TextEditingController controller = TextEditingController(text: "");
  final _isAuth = BehaviorSubject.seeded(true);
  Stream<bool> get getAuth => _isAuth.stream;

  setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', controller.text);
  }
  Future<void> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('username');
   _isAuth.add(name != null);
  }

}