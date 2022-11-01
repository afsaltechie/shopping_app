import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage
({ Key? key }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
            ),
            
            decoration: BoxDecoration(image: DecorationImage(
              
               image: AssetImage('assets/images/guccu.jpg'),
               fit: BoxFit.fill
            )),
            
          ),
           Container(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
            ),
            decoration: BoxDecoration(image: DecorationImage(
              
               image: AssetImage('assets/images/Brand.jpg'),
               fit: BoxFit.fill
            )),
            
          ),
          Container(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
            ),
            decoration: BoxDecoration(image: DecorationImage(
              
               image: AssetImage('assets/images/Group 260.jpg'),
               fit: BoxFit.fill
            )),
            
          ),
        ],
      ),
    );
  }
}