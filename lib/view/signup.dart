import 'package:flutter/material.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        height: 500,
        width: 500,
        child: Text(' NO FREE SIGN UP \n          SORRY',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30),),
        
      ),
    );
  }
}