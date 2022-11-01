import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../bottom/about.dart';
import '../bottom/blog.dart';
import '../bottom/contact.dart';
import '../home.dart';

class Footer extends StatefulWidget {

  const Footer({ Key? key }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
 Widget build(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                launchUrlString('https://twitter.com/AfsalBa60392336');
              },
              icon: Icon(FontAwesomeIcons.twitter)),
          IconButton(
              onPressed: () {
                launchUrlString('https://instagram.com/afsal_babu__/');
              },
              icon: Icon(FontAwesomeIcons.instagram)),
          IconButton(
              onPressed: () {
                launchUrlString('https://www.youtube.com/');
              },
              icon: Icon(FontAwesomeIcons.youtube)),
        ],
      ),
    //Build_divider(),
      SizedBox(
        height: 10,
      ),
      Text('Support@openUi.design'),
      SizedBox(
        height: 10,
      ),
      Text('+60-394 650 789'),
      SizedBox(
        height: 10,
      ),
      Text('08.00 - 12.00 - Everyday'),
      SizedBox(
        height: 10,
      ),
   Build_divider(),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Text('About'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Story()));
            },
          ),
          InkWell(
            child: Text('Contact'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          InkWell(
            child: const Text('blog'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Blog()));
            },
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      BottomAppBar(
        child: Text('Copyright@Open UI All Rights Reserved '),
      )
    ],
  );
}
}