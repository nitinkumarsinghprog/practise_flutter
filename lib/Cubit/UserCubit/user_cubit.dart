

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Cubit/UserCubit/user_state.dart';
import 'package:practise_flutter/Repository/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository): super(UserInitialState());

  Future<void> fetchUsers() async {
    emit(UserLoadingState());
    try {
      final users = await userRepository.fetchUsers();
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
  
}