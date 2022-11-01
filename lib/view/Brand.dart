import 'package:fashion_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Brand extends StatefulWidget {
  const Brand({ Key? key }) : super(key: key);

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InkWell(child: Image.asset('assets/images/Frame 59.jpg'),
               onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              ),
              SizedBox(height: 199,),
              InkWell(child: Image.asset('assets/images/Related product.jpg'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              )
            ],
          ),
        ),
      ),
      
    );
  }
}