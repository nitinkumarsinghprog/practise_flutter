
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practise_flutter/Model/posts_model.dart';

class PostRepository {

  Future<List<PostsModel>> fetchPosts() async {

    final response = await http.get(
      Uri.parse("https://dummyjson.com/posts"),
    );

    if (response.statusCode == 200){

      final data = jsonDecode(response.body);

      return (data['posts'] as List).map((e) => PostsModel.fromJson(e)).toList();
      
    }else {
      throw Exception('Failed to fetch posts');
    }
  }
}