part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<Shoes>? items;

  double totalPrice(List<Shoes> shoes) {
    double total = 0;
    for (int i = 0; i < shoes.length; i++) {
      total = total +
          double.parse(shoes[i].count.toString()) *
              shoes[i].price!.toDouble();
    }
    return total;
  }

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
