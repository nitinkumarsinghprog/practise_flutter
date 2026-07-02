// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practise_flutter/Model/posts_model.dart';
import 'package:practise_flutter/Repository/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository repository;

  PostsBloc(this.repository) : super(PostsInitial()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostsLoading());

      try {
        final posts = await repository.fetchPosts();

        emit(PostsLoaded(posts));
      } catch (e) {
        emit(PostsError(e.toString()));
      }
    });
  }
}
