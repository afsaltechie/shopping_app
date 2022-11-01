import 'package:fashion_app/cart/cart_cubit/cart_cubit.dart';
import 'package:fashion_app/drawer.dart';
import 'package:fashion_app/home.dart';
import 'package:fashion_app/order/order.dart';
import 'package:fashion_app/textfield/adderss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/quatity.dart';
import '../widgets/appbar.dart';
import 'buy.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required List<CartItem> cartList}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: BuildDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar(
            scaffoldKey: _key,
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CHECK OUT',
                      style: GoogleFonts.gemunuLibre(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Build_divider(),
                    SizedBox(
                      height: 50,
                    ),
                    // Container(
                    //   height: 100,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Row(
                    //     children: [
                    //       Image.asset('assets/images/image 10.jpg'),
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Title(
                    //             color: Colors.black,
                    //             child: Text(
                    //               'LAMEREI',
                    //               style: TextStyle(
                    //                   fontSize: 15, fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //           Text('Recycle bouncle knit cardigan pink'),
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text('-  1  +'),
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           Text(
                    //             '\$120',
                    //             style: TextStyle(color: Colors.red),
                    //           ),
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         height: 20,
                    //       ),
                    //     ],
                    //   ),
                    // ),
      
                    BlocBuilder<CartCubit, List<CartItem>>(
                      builder: (context, cartList) {
                        return Container(
                        //  color: Colors.red,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (CartItem p in cartList)
                                  CartItemWidget(
                                    cartItem: p,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
      
                    Divider(
                      thickness: 0,
                      color: Color.fromARGB(255, 122, 114, 114),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.percent_sharp),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Add Promo Code')
                      ],
                    ),
                    Divider(
                      thickness: 0,
                      color: Color.fromARGB(255, 122, 114, 114),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.delivery_dining),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Delivery'),
                        SizedBox(
                          width: 50,
                        ),
                        Text('Free')
                      ],
                    ),
                    Divider(
                      thickness: 0,
                      color: Color.fromARGB(255, 122, 114, 114),
                    ),
                  ],
                ),
              ])),
        ]),
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.fromLTRB(15,0,15,0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EST.TOTAL',
                    style: TextStyle(color: Colors.red),
                  ),
                  BlocBuilder<CartCubit, List<CartItem>>(
                    builder: (context, cartList) {
                      return Text(
                        cartList
                            .fold(
                                0.0,
                                (double previousValue, element) => previousValue +
                                    element.qty * element.product.price)
                            .toString(),
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BottomAppBar(
              child: Container(
                color: Colors.black,
                height: 40,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          child: Text(
                            'CHECK  OUT',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Order()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
