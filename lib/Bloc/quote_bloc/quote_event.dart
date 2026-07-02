part of 'quote_bloc.dart';

@immutable
sealed class QuoteEvent {}

class FetchQuotesEvent extends QuoteEvent {}
