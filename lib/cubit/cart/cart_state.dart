// TODO: user part of and part
import 'package:equatable/equatable.dart';

import 'package:g_sneaker/model/shoes_model.dart';

class CartState extends Equatable {
  final List<Shoes>? items;

  int get count => items?.length ?? 0;
  bool isContent(int id) {
    return (items?.indexWhere((e) => e.id == id) ?? -1) >= 0;
  }

  const CartState([this.items]);

  @override
  List<Object?> get props => [items];

  CartState copyWithItem(List<Shoes> items) {
    return CartState(items);
  }

  CartState copyWithLoading() {
    return const CartState(null);
  }
}
