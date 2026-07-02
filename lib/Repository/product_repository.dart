

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practise_flutter/Model/product_model.dart';

class ProductRepository {

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['products'] as List)
      .map((product) => ProductModel.fromJson(product))
      .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}