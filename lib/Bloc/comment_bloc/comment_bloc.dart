import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practise_flutter/Model/comment_model.dart';
import 'package:practise_flutter/Repository/comment_repo.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepo commentRepo;

  CommentBloc(this.commentRepo) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      emit(CommentLoading());

      try {
        final comments = await commentRepo.getComments();
        emit(CommentLoaded(comments: comments));
      } catch (e) {
        emit(CommentError(message: e.toString()));
      }
    });
  }
}
