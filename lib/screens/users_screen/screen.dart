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

class UsersScreen extends StatefulWidget {
  const UsersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return BlocProvider(
      create: (_) => UsersBloc()..add(InitialUsersEvent()),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingUsersState) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is DataUsersState) {
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: AppColors.blue,
                    leading: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _isSearch = !_isSearch;
                        });
                      },
                    ),
                    title: _isSearch
                        ? SizedBox(
                            width: 200,
                            child: TextFormField(
                              obscureText: false,
                              enableInteractiveSelection: false,
                              onChanged: (value) =>
                                  BlocProvider.of<UsersBloc>(context)
                                    ..add(SearchUsersEvent(name: value)),
                              style: AppTextStyle.textStyle16w500
                                  .copyWith(color: AppColors.white),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintStyle: AppTextStyle.textStyle16w500
                                    .copyWith(color: AppColors.white),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isSearch = !_isSearch;
                                      context
                                          .read<UsersBloc>()
                                          .add(ReturnUsersEvent());
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 25,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text(
                            'Hello ${vm.name}',
                            style: AppTextStyle.textStyle18w500
                                .copyWith(color: AppColors.white),
                          ),
                    actions: [
                      IconButton(
                        splashColor: Colors.black,
                        color: Colors.white,
                        onPressed: () async {
                          vm.logOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                                  const AuthorizationScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.logout_rounded),
                      ),
                    ],

                  ),
                  backgroundColor: AppColors.darkWhite,
                  body: state.users.isEmpty
                      ? const Center(
                          child: Text(
                            'No results found',
                            style: AppTextStyle.textStyle24w500,
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
      ),
    );
  }
}
