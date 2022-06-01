part of 'product_cubit.dart';

class ProductState extends Equatable {
  final List<Shoes>? items;
  const ProductState([this.items]);

  @override
  List<Object?> get props => [items];
  ProductState copyWithItem(List<Shoes> items) {
    return ProductState(items);
  }
}
