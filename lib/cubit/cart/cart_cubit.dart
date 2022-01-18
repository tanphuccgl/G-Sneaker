import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/repositories/domain.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    getCart();
  }

  final Domain domain = Domain();

  Future<void> getCart() async {
    emit(state.copyWithLoading());
    final cart = await domain.cart.fetchCart();
    emit(state.copyWithItem(cart));
  }

  void onItemChanged() {
    domain.cart.saveCart(state.items ?? []);
  }

  void addItem(Shoes item) {
    // TODO
    final List<Shoes> items = [...(state.items ?? []), item];
    emit(state.copyWithItem(items));
  }

  void removeItem(Shoes item) {
    // TODO
  }
  void increaseNumber(Shoes item) {
    // TODO
  }
  void decreaseNumber(Shoes item) {
    // TODO
  }
}
