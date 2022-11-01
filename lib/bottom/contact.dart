import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../drawer.dart';
import '../home.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
class Contact extends StatefulWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                 ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(40, 40),
                                textStyle: TextStyle(fontSize: 15),
                                primary: Colors.black38,
                                onPrimary: Colors.white,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Text('CONTACT US'),
                            ),
              Icon(Icons.comment),
              Text('Need an ASAP answer? Contact us via chat, 24/7! For existing furniture orders, please'),
                ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(40, 40),
                                textStyle: TextStyle(fontSize: 15),
                                primary: Colors.black38,
                                onPrimary: Colors.white,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Text('CHAT WITH US'),
                            ),
               Icon(Icons.mail),
               Text('You can text us at 800-309-2622 - or click on the "text us"/n link below on your mobile device. Please allow the system to acknowledge a simple greeting/n (even "Hi" will do!) before providing your question/ order details. Consent is not required for any purchase. Message and data rates may apply. /nText messaging may not be available via all carriers'),
              ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(40, 40),
                                textStyle: TextStyle(fontSize: 15),
                                primary: Colors.black38,
                                onPrimary: Colors.white,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Text('TEXT US'),
                            ),
            Icon(FontAwesomeIcons.twitter),
           Text('To send us a private or direct message,/n like @Open Fashion on Facebook or follow us on Twitter. Well get back to you ASAP/nPlease include your name, order number, and email address for a faster response'),
          Footer(),
            ],
          ),
        ),
      ),
    );
  }
}