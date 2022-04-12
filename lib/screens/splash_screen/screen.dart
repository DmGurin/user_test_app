import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_test_app/screens/authorization_screen/screen.dart';
import 'package:user_test_app/screens/users_screen/screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    check();
    super.initState();
  }

  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('username');
    return name != null;
  }

  void check() async {
    final result = await getLogin();
    if (result) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const UsersScreen()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AuthorizationScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          duration: Duration(seconds: 1),
          size: 200,
          style: FlutterLogoStyle.stacked,
        ),

      ),
    );
  }
}
