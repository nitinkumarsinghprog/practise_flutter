
import 'package:flutter/material.dart';
import 'package:practise_flutter/Model/user_model.dart';
import 'package:practise_flutter/Repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
 final UserRepository _userRepository = UserRepository();

  List<UserModel> users = [];

  bool isLoading = false;

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      users = await _userRepository.fetchUsers();
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}