import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_test_app/authorization_screen/auth_view_model.dart';
import 'package:user_test_app/source/svg.dart';
import 'package:user_test_app/users_screen/screen.dart';
import 'package:provider/provider.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    vm.getLogin();
    return StreamBuilder<bool>(
        stream: context.watch<AuthViewModel>().getAuth,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data!) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersScreen()));
            return const SizedBox();
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlue,
                title: const Text('Profile '),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 1.5,
                      child: SvgPicture.asset(
                        AppSvg.flutterLogo,
                        height: 150,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              height: MediaQuery.of(context).size.width / 1.5,
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(1, 3),
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      controller: vm.controller,
                                      decoration: InputDecoration(
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 'Login',
                                      ),
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      if (vm.controller.text != '')  {
                                        await vm.setLogin();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UsersScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 250,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        color: Colors.red,
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Center(
                                          child: Text(
                                            'Войти',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}