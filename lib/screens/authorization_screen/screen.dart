import 'package:flutter/material.dart';
import 'package:user_test_app/screens/authorization_screen/auth_view_model.dart';
import 'package:user_test_app/screens/users_screen/screen.dart';
import 'package:provider/provider.dart';
import 'package:user_test_app/style/app_colors.dart';
import 'package:user_test_app/style/app_text_styles.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blue,
          title:  Text('Log In ', style: AppTextStyle.textStyle18w500.copyWith(color: AppColors.white),),
        ),
        backgroundColor: AppColors.darkWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 1.5,
                child: const FlutterLogo(
                  size: 150,
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  height: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 150,
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: vm.controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            hintText: 'Enter your Login',
                          ),
                          onChanged: (text) {},
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (vm.controller.text != '')  {
                            await vm.setLogin();
                            vm.controller.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UsersScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: AppColors.lightBlue,
                          ),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Center(
                              child: Text(
                                'Войти',
                                style: AppTextStyle.textStyle24w500,
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
      ),
    );
  }
}
