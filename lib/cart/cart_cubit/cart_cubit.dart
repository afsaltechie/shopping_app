import 'package:bloc/bloc.dart';
import 'package:fashion_app/cart/product.dart';
import 'package:fashion_app/models/quatity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(CartItem cartItemToAdd) {
    final currentCart = List<CartItem>.from(state);

    if (currentCart.contains(cartItemToAdd)) {
     // print("already in cart");
    //   Fluttertoast.showToast(
    //     msg: "Item Already in cart",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    int index = currentCart.indexOf(cartItemToAdd);
    currentCart[index].qty++;
    } else {
      currentCart.add(cartItemToAdd);
    }
    emit(currentCart);
  }

  void incrementQty(CartItem item){
      final currentCart = List<CartItem>.from(state);
      int index = currentCart.indexOf(item);
      currentCart[index].qty++;
      emit(currentCart);
  }

  void clear() {
    emit([]); 
  }
  void decrementQty(CartItem item){
     final currentCart = List<CartItem>.from(state);
      int index = currentCart.indexOf(item);
      currentCart[index].qty--;
      emit(currentCart);
  }
}
