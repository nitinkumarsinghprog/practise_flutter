import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practise_flutter/Model/quote_model.dart';
import 'package:practise_flutter/Repository/quote_repository.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteInitial()) {
    on<FetchQuotesEvent>((event, emit) async {
      emit(QuoteLoading());
      try {
        final quotes = await quoteRepository.fetchQuotes();
        emit(QuoteLoaded(quotes));
      } catch (e) {
        emit(QuoteError(e.toString()));
      }
    });
  }
}
