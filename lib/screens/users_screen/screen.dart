import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test_app/bloc/user_bloc.dart';
import 'package:user_test_app/bloc/user_event.dart';
import 'package:user_test_app/bloc/user_state.dart';
import 'package:user_test_app/screens/authorization_screen/auth_view_model.dart';
import 'package:user_test_app/screens/authorization_screen/screen.dart';
import 'package:user_test_app/screens/users_screen/widgets/users_list_item.dart';
import 'package:user_test_app/style/app_colors.dart';
import 'package:user_test_app/style/app_text_styles.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return BlocProvider(
      create: (_) => UsersBloc()..add(InitialUsersEvent()),
      child: SafeArea(
        child: BlocConsumer<UsersBloc, UsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingUsersState) {
              return const Scaffold(body:  Center(child: CircularProgressIndicator()));
            }
            if (state is DataUsersState) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text(
                    'Hello ${vm.controller.text}',
                    style: AppTextStyle.textStyle18w500
                        .copyWith(color: AppColors.white),
                  ),
                  actions: [
                    // IconButton(
                    //     onPressed: () async {
                    //       _runFilter;
                    //       // Navigator.pushReplacement(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (BuildContext ctx) =>
                    //       //          UserSearch(user: user[foundUsers.length])));
                    //
                    //       // final result = await showSearch(
                    //       //     context: context, delegate: UserSearch());
                    //       // print('Results $result');
                    //     },
                    //     icon: const Icon(Icons.search)),

                    IconButton(
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
                  ],
                  leading: SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) => BlocProvider.of<UsersBloc>(context)
                        ..add(SearchUsersEvent(name: value)),
                      decoration: const InputDecoration(
                          labelText: 'Search', suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                  backgroundColor: Colors.lightBlue,
                ),
                backgroundColor: AppColors.darkWhite,
                body: state.users.isEmpty
                    ? const Center(
                        child: Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          context.read<UsersBloc>().add(InitialUsersEvent());
                        },
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            return UsersListItem(
                              key: ValueKey(state.users.length),
                              user: state.users[index],
                            );
                          },
                        ),
                      ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
