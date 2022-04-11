import 'package:flutter/material.dart';
import 'package:user_test_app/authorization_screen/screen.dart';
import 'package:user_test_app/profile_screen/screen.dart';
import 'package:user_test_app/users_screen/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onItemTapped(int index) {
    setState(() {
      controller.jumpToPage(index);
    });
  }

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: const [
          AuthorizationScreen(),
          //UsersScreen(name: name),
          ProfileScreen(),
          Center(
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
