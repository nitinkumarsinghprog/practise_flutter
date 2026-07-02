

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practise_flutter/Model/user_model.dart';

class UserRepository {
  
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/users"),
    );

    if (response.statusCode == 200){
      final data = jsonDecode(response.body);

      return (data['users'] as List).map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }

  }
    
}