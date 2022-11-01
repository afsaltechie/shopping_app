import 'dart:io';

import 'package:fashion_app/cart/bloc.dart';
import 'package:fashion_app/cart/cart_cubit/cart_cubit.dart';
import 'package:fashion_app/cart/checkout.dart';
import 'package:fashion_app/cart/product.dart';
import 'package:fashion_app/models/quatity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  int count = 0;
  //final _contru = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItem>>(
      builder: (context, cartList) {
        print(cartList);
        return Scaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(15, 7, 15, 10),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          // _contru.clear();
                          context.read<CartCubit>().clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          size: 15,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'CART',
                      style: GoogleFonts.cinzel(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //...cartList.map((e) => CartItemWidget(product: e,)).toList(),

                for (CartItem p in cartList)
                  CartItemWidget(
                    cartItem: p,
                  ),

                SizedBox(
                 height: 170,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Title(color: Colors.blue, child: Text('SUB TOTAL')),
                    Text(
                      cartList
                          .fold(
                              0.0,
                              (double previousValue, element) =>
                                  previousValue +
                                  element.qty * element.product.price)
                          .toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        '\'Shipping  charges,  Taxes,  Discount  codes\n are  calculated  at  the  time  of  accounting.\'')
                  ],
                )
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: Colors.black,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: InkWell(
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart(cartList: [],)));
                    },
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 100,
            child: Row(
              children: [
                Image.asset(cartItem.product.imageUrl),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.black,
                      child: Text(
                        cartItem.product.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(cartItem.product.subtitle),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Text('-',style: TextStyle(fontSize: 15)),
                          onTap: () {
                            context.read<CartCubit>().decrementQty(cartItem);
                          },
                        ),
                        InkWell(
                          child: Text(cartItem.qty.toString(),style: TextStyle(fontSize: 17),),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Text('+',style: TextStyle(fontSize: 15),),
                          onTap: () {
                            context.read<CartCubit>().incrementQty(cartItem);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      cartItem.product.price.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
