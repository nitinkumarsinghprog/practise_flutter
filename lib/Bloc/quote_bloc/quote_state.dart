part of 'quote_bloc.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}

final class QuoteLoading extends QuoteState {}

final class QuoteLoaded extends QuoteState {
  final List<QuoteModel> quotes;

  QuoteLoaded(this.quotes);
}

final class QuoteError extends QuoteState {
  final String message;

  QuoteError(this.message);
}
