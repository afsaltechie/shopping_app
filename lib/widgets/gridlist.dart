import 'dart:ui';

import 'package:flutter/material.dart';

class Listg extends StatefulWidget {
  final String img;
  final String name;
  final double price;
  const Listg({ Key? key,  required this.img, required this.name, required this.price }) : super(key: key);

  @override
  State<Listg> createState() => _ListgState();
}

class _ListgState extends State<Listg> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded( 
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.img)),
              ),
              child: Image.asset(widget.img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                ),
                Text('\$${widget.price.toString()}',style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
        ],
      );
  }
}


List<Horizontal> itemImg = [
  Horizontal(img: "assets/images/Product 3.jpg", price: 380, title: 'Indian Terrain'),
   Horizontal(img:  "assets/images/Product 4.jpg", price: 700, title: 'Arrow'),
   Horizontal(img:  "assets/images/Product 5.jpg", price: 550, title: 'Basics'),
   Horizontal(img: "assets/images/Product 6.jpg" , price: 110, title: 'Scullers')

];

List<ProductDet> itemLis = [
  ProductDet(
      img: "assets/images/Product 3.jpg",
      itemName: "21WN reversible angora cardigan",
      price: 120.0),
  ProductDet(
      img: "assets/images/Product 4.jpg",
      itemName: "21WN reversible angora cardigan",
      price: 200.0,),
  ProductDet(
      img: "assets/images/Product 5.jpg",
      itemName: "21WN reversible angora cardigan",
      price: 450.0),
  ProductDet(
      img: "assets/images/Product 6.jpg",
      itemName: "21WN reversible angora cardigan",
      price: 620.0),
];

class ProductDet {
  final String img;
  final String itemName;
  final double price;

  ProductDet({required this.img, required this.itemName, required this.price});
}
class Horizontal {
  final String img;
  final String title;
  final double price;
  Horizontal({required this.img,required this.price,required this.title});
}
 