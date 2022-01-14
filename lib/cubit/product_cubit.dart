import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/product_state.dart';
import 'package:g_sneaker/repositories/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(const ProductInitial()) {
    getProduct();
  }




  Future<void> getProduct() async {
    try {
      emit(const ProductLoading());
      final product = await productRepository.fetchProduct();
      emit(ProductLoaded(shoes: product));
    } on NetworkException {
      emit(const ProductError("ERROR"));
    }
  }
}
