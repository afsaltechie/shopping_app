

import 'package:fashion_app/drawer.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
class Story extends StatefulWidget {
  const Story({ Key? key }) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final GlobalKey<ScaffoldState> _key =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: BuildDrawer(),
       appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Appbar( scaffoldKey: _key, )),
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height:1000,
           width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OUR STORY',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
               Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 3,
                  indent: 200,
                  endIndent: 200,
                ),
                Text('Open Fashion - Free Ecommerce UI Kit is a free download UI kit./n You can open Open Fashion - Free Ecommerce UI Kit file by Figma Create stunning shop with bulletproof guidelines and thoughtful components./n Its library contains more than 50+ components supporting Light & Dark Mode and 60+/n ready to use mobile screens'),
      
                Image.asset('assets/images/image 3.jpg'),
                 Footer(),
            ],
      
          ),
          
      
        ),
      ),
    );
  }
}