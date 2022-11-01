import 'package:flutter/material.dart';
class Done extends StatefulWidget {
  const Done({ Key? key }) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: Container(
    height: 500,
    width: MediaQuery.of(context).size.width,
    child: Image.asset('assets/images/Frame 32.jpg')),    
    );
  }
}