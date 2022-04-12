import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test_app/bloc/user_event.dart';
import 'package:user_test_app/bloc/user_state.dart';
import 'package:user_test_app/data/models/user_model.dart';
import 'package:user_test_app/repo/repository.dart';


class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final repository = Repository();
  List<UserModel> usersList = [];

  UsersBloc() : super(InitialUsersState()) {
    on<InitialUsersEvent>(_onInitialUsersEvent);
  }

  void _onInitialUsersEvent(
      InitialUsersEvent event,
      Emitter<UsersState> emit,
      ) async {
    emit(LoadingUsersState());
    try {
      final response = await repository.getUserModel();
      usersList = response;
    } catch (ex) {
      emit(ErrorUsersState(error: ex.toString()));
    }
    emit(DataUsersState(users: usersList));

  }

}
