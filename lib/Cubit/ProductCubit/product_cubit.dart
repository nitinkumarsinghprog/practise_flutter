

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Cubit/ProductCubit/product_state.dart';
import 'package:practise_flutter/Repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitialState());
  

  Future<void> fetchProducts() async {
    emit(ProductLoadingState());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}