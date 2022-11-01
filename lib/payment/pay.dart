import 'package:fashion_app/drawer.dart';
import 'package:fashion_app/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {

   final GlobalKey<ScaffoldState> _key =GlobalKey();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: BuildDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar(scaffoldKey: _key,),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PAYMENT METHOD',
                  style: GoogleFonts.abel(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/images/PhonePe.png'),
                TextField(
                  decoration: InputDecoration(
                      hintText: '0afsal0babu7@ybl',
                      border: OutlineInputBorder()),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _dialogBuilder(context);
                    },
                    child: Text('DONE')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Payment Success'),
        content: Image.asset('assets/images/Frame 33.jpg'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Submit'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Back to home'),
            onPressed: () {
              //Navigator.of(context).pop();
              // Navigator.popUntil(context, (route) => false);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      );
    },
  );
}
