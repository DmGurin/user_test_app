import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test_app/bloc/user_bloc.dart';
import 'package:user_test_app/bloc/user_event.dart';
import 'package:user_test_app/bloc/user_state.dart';
import 'package:user_test_app/screens/authorization_screen/auth_view_model.dart';
import 'package:user_test_app/screens/authorization_screen/screen.dart';
import 'package:user_test_app/screens/profile_screen/screen.dart';
import 'package:user_test_app/screens/users_screen/widgets/users_list_item.dart';
import 'package:user_test_app/source/images.dart';
import 'package:user_test_app/style/app_text_styles.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return BlocProvider(
      create: (_) =>
      UsersBloc()
        ..add(InitialUsersEvent()),
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

          }, builder: (context, state) {
            if (state is LoadingUsersState) {
              const CircularProgressIndicator();
            }
            if (state is DataUsersState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return UsersListItem(
                    user: state.users[index],
                  );
                },
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
