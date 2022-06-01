import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/repositories/domain.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState()) {
    getProduct();
  }
  final Domain domain = Domain();

  Future<void> getProduct() async {
    final product = await domain.products.fetchProduct();
    emit(state.copyWithItem(product));
  }
}
