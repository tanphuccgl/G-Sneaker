import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/repositories/domain.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    getCart();
  }

  final Domain domain = Domain();

  Future<void> getCart() async {
    final cart = await domain.cart.fetchCart();
    emit(state.copyWithItem(cart));
  }

  void onItemChanged() {
    domain.cart.saveCart(state.items ?? []);
  }

  void addItem(Shoes item) {
    item.count = 1;
    final List<Shoes> items = [...(state.items ?? []), item];

    emit(state.copyWithItem(items));
    onItemChanged();
  }

  void removeItem(Shoes item) {
    final List<Shoes> items = [...(state.items ?? [])];
    items.remove(item);

    emit(state.copyWithItem(items));
    onItemChanged();
  }

  void increaseNumber(Shoes item) {
    List<Shoes> items = [...(state.items ?? [])];

    for (var e in items) {
      if (e.id == item.id) {
        item.count = item.count! + 1;
        e.count = item.count;
      }
    }
    emit(state.copyWithItem(items));
    onItemChanged();
  }

  void decreaseNumber(Shoes item) {
    // TODO
  }
}
