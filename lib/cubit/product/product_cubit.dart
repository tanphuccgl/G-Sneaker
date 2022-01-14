import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/repositories/domain.dart';
import 'package:g_sneaker/repositories/product_repository.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductInitial()) {
    getProduct();
  }
  final Domain domain = Domain();

  Future<void> getProduct() async {
    try {
      emit(const ProductLoading());
      final product = await domain.products.fetchProduct();
      emit(ProductLoaded(shoes: product));
    } on NetworkException {
      emit(const ProductError("ERROR"));
    }
  }
}
