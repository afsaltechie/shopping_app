

import 'package:flutter/material.dart';

import '../drawer.dart';
import '../home.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
class Blog extends StatefulWidget {
  const Blog({ Key? key }) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final GlobalKey<ScaffoldState> _key =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _key,
      drawer: BuildDrawer(),
       appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Appbar(scaffoldKey: _key,)),
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
         padding: EdgeInsets.all(10),
          child: Column(
            
            children: [
              
              Column(
                
                children: [
                  Image.asset('assets/images/Rectangle 434.jpg'),
                ],
              ),
              Text('2021 style guide'),
              Text('You guys know how much I love mixing high and low-end/n - its the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags And honestly they are probably the best pieces to mix and match./n I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags'),
              Image.asset('assets/images/image 14.jpg'),
               SizedBox(height: 200,),
               
              Footer(),
            ],
      
      
          ),
          
        ),
      ),
         
    );
  }
}