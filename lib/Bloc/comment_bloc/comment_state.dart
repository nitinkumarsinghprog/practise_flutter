part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoading extends CommentState {}

final class CommentLoaded extends CommentState {
  final List<CommentModel> comments;

  CommentLoaded({required this.comments});
}

final class CommentError extends CommentState {
  final String message;

  CommentError({required this.message});
}
