import 'package:equatable/equatable.dart';
import 'package:g_sneaker/model/shoes_model.dart';

 class CartState extends Equatable {
  final List<Shoes>? items;

  const CartState([this.items]);

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class CartLoading extends CartState {
  const CartLoading();
}
