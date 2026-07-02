part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

final class FetchCommentsEvent extends CommentEvent {}
