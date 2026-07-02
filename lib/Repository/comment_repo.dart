import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practise_flutter/Model/comment_model.dart';

class CommentRepo {
  Future<List<CommentModel>> getComments() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/comments"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['comments'] as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
