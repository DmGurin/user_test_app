import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test_app/bloc/user_event.dart';
import 'package:user_test_app/bloc/user_state.dart';
import 'package:user_test_app/data/models/user_model.dart';
import 'package:user_test_app/repo/repository.dart';


class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final repository = Repository();
  List<UserModel> usersList = [];
  List<UserModel> usersSearch = [];

  UsersBloc() : super(InitialUsersState()) {
    on<InitialUsersEvent>(_onInitialUsersEvent);
    on<SearchUsersEvent>(_onSearchUsersEvent);
    on<ReturnUsersEvent>(_onReturnUsersEvent);
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
    emit(DataUsersState(users: usersList)
    );


  }
  void _onSearchUsersEvent(
      SearchUsersEvent event,
      Emitter<UsersState> emit,
      ) async {
    emit(DataUsersState(users: usersList));
    try {
      if (event.name.isEmpty) {
        usersSearch = usersList;
      } else {
        usersSearch = usersList
            .where((user) => user.name.firstName
            .toLowerCase()
            .contains(event.name.toLowerCase())||
            user.name.lastName
                .toLowerCase()
                .contains(event.name.toLowerCase())
        )
            .toList();
      }
    }
    catch(ex){
      emit(ErrorUsersState(error: ex.toString()));
    }
          emit(DataUsersState(users: usersSearch));
  }
  void _onReturnUsersEvent(
      ReturnUsersEvent event,
      Emitter<UsersState> emit,
      ) async{
    emit(DataUsersState(users: usersList));

  }
}
