import 'package:fashion_app/cart/cart_cubit/cart_cubit.dart';
import 'package:fashion_app/models/quatity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/product.dart';
import '../drawer.dart';
import '../home.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class Lost extends StatefulWidget {
  const Lost({Key? key}) : super(key: key);

  @override
  State<Lost> createState() => _LostState();
}

class _LostState extends State<Lost> {
  
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool isGrid = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
          drawer: const BuildDrawer(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Appbar(scaffoldKey: _key,)),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.white10,
                child: Row(
                  children: [
                    Text('     4500 APPAREL'),
                    Spacer(
                      flex: 3,
                    ),
                    Chip(label: Text('new ')),
                    Spacer(),
                    IconButton(
                        onPressed: () {

                          setState(() {
                            isGrid = !isGrid;
                          });
                         // print(isEnable);
                        },
                        
                         icon: Icon( isGrid?Icons.list:Icons.grid_view_sharp),),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.menu_rounded)),
                  ],
                ),
              ),

            isGrid?buildgrid(context): buildList(context),
            // buildgrid(context),

             SizedBox(
                height: isGrid? 20:80
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Text(
                      '>',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              
              Footer(),
            ],
          ),
        ));
  }

  Widget buildList(BuildContext context) {
    return Column(
      children: products.map((e) => stuff(context,e)).toList(),
    );
  }

  List<Stuff> items = [
    Stuff(
      img: '',
      title: '',
      price: 25,
    ),
  ];
}

class Stuff {
  final String img;
  final String title;
  final double price;
  Stuff({required this.img, required this.title, required this.price});
}

Widget stuff(BuildContext context, Product gulab) {

  return InkWell(
    onTap: (){
      final CartItem item = CartItem(product: gulab, qty: 1);
      context.read<CartCubit>().addToCart(item);

    },
    child: Container(
      height: 120,
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(flex:1,child: Image.asset(gulab.imageUrl),),
          SizedBox(width: 8,),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                    color: Colors.black,
                    child: Text(
                      gulab.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Text(gulab.subtitle),
                Text(
                  '\$${gulab.price}',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                ),
                Row(
                  children: [
                    Text('Size'),
                    SizedBox(
                      width: 5,
                    ),
                      CircleAvatar(
                          backgroundColor: Colors.lime,
                          child: Text('s'),
                          minRadius: 10.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.lime,
                          child: Text('M'),
                          minRadius: 10.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.lime,
                          child: Text('L'),
                          minRadius: 10.0,
                        ),
                        
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.favorite,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildgrid(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    height: 600,
    width: MediaQuery.of(context).size.width,
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.57,crossAxisSpacing: 22,mainAxisSpacing: 8),
      // children: [
      //   buildGridItem('assets/images/Rectangle 344.jpg', 'LAMEREI', 120),
      //   buildGridItem('assets/images/Rectangle 344 (1).jpg', 'JACKET', 500),
      //   buildGridItem('assets/images/Frame 18.jpg', 'BALMAIN', 360),
      //   buildGridItem('assets/images/Rectangle 348.jpg', 'BASICS', 700),
      //   buildGridItem('assets/images/Rectangle 344.jpg', 'ALLEN SOLLY', 138),
      //   buildGridItem('assets/images/Frame 19.jpg', 'RARE RABBIT', 400),
      //   buildGridItem('assets/images/Frame 18.jpg', 'APOLLO', 160),
      //   buildGridItem('assets/images/Rectangle 344.jpg', 'WILLINGTON', 500),

      // ],
      children: products.map((e) => buildGridItem(context, e)).toList(),
    ),
  );
}

Widget buildGridItem(BuildContext context, Product item) {
  return InkWell(
    onTap: (){
      final cartItem = CartItem(product: item, qty: 1);
      context.read<CartCubit>().addToCart(cartItem);
    },
    child: GridTile(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                    item.imageUrl,
                    fit: BoxFit.fill,
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    item.price.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Positioned(right: 4,bottom:60,child: Icon(Icons.favorite))
        ],
      ),
    ),
  );
}

List<Product> products = const [
  Product(imageUrl: 'assets/images/Rectangle 344.jpg', name: 'LAMEREI', price: 120, subtitle: 'Nobody does it better'),
  Product(imageUrl: 'assets/images/Rectangle 344 (1).jpg', name:'JACKET' , price: 500, subtitle:'make Lives Better' ),
  Product(imageUrl:'assets/images/Frame 18.jpg', name:'BALMAIN' , price:360 , subtitle:'Nothing Is IMpossible' ),
  Product(imageUrl: 'assets/images/Rectangle 348.jpg', name: 'BASICS', price: 700, subtitle: 'Nobody does it better'),
  Product(imageUrl: 'assets/images/Rectangle 344 (1).jpg', name:'ALLEN SOLLY' , price: 138, subtitle:'make Lives Better' ),
  Product(imageUrl:'assets/images/Frame 19.jpg', name:'RARE RABBIT' , price:400 , subtitle:'Nothing Is IMpossible' ),
   Product(imageUrl:'assets/images/Frame 18.jpg', name:'APOLLO' , price:160 , subtitle:'CAYBERRRR DOME' ),
   Product(imageUrl:'assets/images/Frame 19.jpg', name:'WILLINGTON' , price:509 , subtitle:'VAMMOSSSS' )
   
];