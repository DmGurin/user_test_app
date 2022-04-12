import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test_app/bloc/user_bloc.dart';
import 'package:user_test_app/bloc/user_event.dart';
import 'package:user_test_app/bloc/user_state.dart';
import 'package:user_test_app/screens/authorization_screen/auth_view_model.dart';
import 'package:user_test_app/screens/authorization_screen/screen.dart';
import 'package:user_test_app/screens/profile_screen/screen.dart';
import 'package:user_test_app/source/images.dart';
import 'package:user_test_app/style/app_text_styles.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
   const UsersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return BlocProvider(
      create: (_) => UsersBloc()..add(InitialUsersEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('Hello ${vm.controller.text}'),
                SizedBox(
                  height: 50,
                  child: IconButton(
                    splashColor: Colors.black,
                    color: Colors.white,
                    onPressed: () async {
                      vm.logOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                                  const AuthorizationScreen()));
                    },
                    icon: const Icon(Icons.logout_rounded),
                  ),
                ),
              ],
            ),
          ),
          body: BlocConsumer<UsersBloc, UsersState>(listener: (context, state) {
            if (state is LoadingUsersState) {
              const CircularProgressIndicator();
            }
          }, builder: (context, state) {
            if (state is DataUsersState) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 0,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(AppImages.manman)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: const [
                                Text(
                                  'JONSON',
                                  style: AppTextStyle.textStyle22w500,
                                ),
                                Text(
                                  'Boris',
                                  style: AppTextStyle.textStyle16w500,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 0,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(AppImages.man)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: const [
                                Text(
                                  'JONSON',
                                  style: AppTextStyle.textStyle22w500,
                                ),
                                Text(
                                  'Bill',
                                  style: AppTextStyle.textStyle16w500,
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen()));
                                },
                                child: const Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 0,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(AppImages.woman)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: const [
                                Text(
                                  'JONSON',
                                  style: AppTextStyle.textStyle22w500,
                                ),
                                Text(
                                  'Sandra',
                                  style: AppTextStyle.textStyle16w500,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
