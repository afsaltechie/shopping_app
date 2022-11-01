import 'package:equatable/equatable.dart';
import 'package:fashion_app/cart/product.dart';

class CartItem extends Equatable {
  final Product product;
  int qty;

  CartItem({required this.product, required this.qty});

  //double get priceWithQty => (product.price * qty);

  @override
  List<Object?> get props => [product.imageUrl];
}
