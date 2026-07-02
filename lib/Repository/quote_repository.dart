import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practise_flutter/Model/quote_model.dart';

class QuoteRepository {
  Future<List<QuoteModel>> fetchQuotes() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/quotes"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['quotes'] as List)
          .map((quote) => QuoteModel.fromJson(quote))
          .toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
