import 'package:flutter/material.dart';
import 'package:practise_flutter/Model/comment_model.dart';
import 'package:practise_flutter/Repository/comment_repo.dart';

class CommentProvider extends ChangeNotifier {
  final CommentRepo _commentRepository = CommentRepo();

  List<CommentModel> comments = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchComments() async {
    isLoading = true;
    notifyListeners();

    try {
      comments = await _commentRepository.getComments();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
