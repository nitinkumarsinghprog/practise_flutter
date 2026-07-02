
import 'package:flutter/material.dart';
import 'package:practise_flutter/Model/posts_model.dart';
import 'package:practise_flutter/Repository/post_repository.dart';

class PostsProvider extends ChangeNotifier {

  final PostRepository _postRepository = PostRepository();

  List<PostsModel> posts = [];
  bool isLoading = false;

  Future<void> fetchPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      posts = await _postRepository.fetchPosts();
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
   
}