import 'package:fashion_app/cart/checkout.dart';
import 'package:fashion_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Empty extends StatefulWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 7, 15, 10),
        height: 600,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
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
            height: 200,
          ),
          Container(
            child: Text('You have no items in your shopping bag'),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: 40,
          child: Center(
              child: InkWell(
            child: Text(
              'Countinue Shopping',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
             // Navigator.push(
                //  context, MaterialPageRoute(builder: (context) =>Cart()));
            },
          )),
        ),
      ),
    );
  }
}
