import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/repositories/domain.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Shoes> list;
  CartCubit(this.list) : super(const CartState()) {
    getCart(list);
  }

  final Domain domain = Domain();

  Future<void> getCart(List<Shoes> list) async {
    emit(const CartLoading());
    final cart = await domain.cart.fetchCart(list);
    emit(CartState(cart));
  }
}
