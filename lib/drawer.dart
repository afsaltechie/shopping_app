import 'package:fashion_app/home.dart';

import 'package:fashion_app/view/Brand.dart';
import 'package:fashion_app/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
            
                child: TabBar(
                  indicatorColor: Colors.orange,
                  labelStyle: TextStyle(color: Colors.red),
                  labelColor: Colors.green,
                  tabs: [
                    Tab(
                      text: ('WOMEN'),
                    ),
                    Tab(
                      text: ('MEN'),
                    ),
                    Tab(
                      text: ('KIDS'),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(100)),
            body: SingleChildScrollView(
              child: Container(
                height: 750,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  
                  children: [
                    Expanded(
                      flex: 4,
                      child: TabBarView(children: [
                        Column(
                          children: [
                            ExpansionTile(
                              title: Text('New'),
                              children: [InkWell(child: Text('BRAND'),
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Brand()));
                              } ,), 
                              SizedBox(height: 8,),
                              Text('local')],
                            ),
                            ExpansionTile(
                              title: Text('Apparel'),
                              children: [
                                Text('outer'),
                                Text('Dress'),
                                Text('shirt'),
                                Text('T-shirt'),
                                Text('pants'),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('bag'),
                              children: [
                                Text('scoobee'),
                                Text('Diesel'),
                                Text('kitex'),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('shoes'),
                              children: [
                                Text('addidas'),
                                Text('caterpiller'),
                                Text('sketchers'),
                                Text('addidas'),
                                Text('caterpiller'),
                                Text('woodland'),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ExpansionTile(
                              title: Text('Beauty'),
                              children: [
                                Text('accessories'),
                                Text('beauty'),
                                Text('shave'),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('watches'),
                              children: [
                                Text('Rolex'),
                                Text('Tissot'),
                                Text('police'),
                                Text('Rolex'),
                                Text('Tissot'),
                                Text('police'),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ExpansionTile(
                              title: Text('Toys'),
                              children: [
                                Text('jeep'),
                                Text('bus'),
                              ],
                            ),
                           
                          ],
                        ),
                         
                      ]),
                    ),
                     Expanded(
                     flex: 1,
                       child: Column(
                         children: [
                          SizedBox(height:10,),
                       
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on),
                                Text('Store Locator',style: TextStyle(color: Colors.black),
                                ),
                                
                              ],
                            ),
                            SizedBox(height: 20,),
                             Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        IconButton(
                  onPressed: () {
                    launchUrlString('https://twitter.com/AfsalBa60392336');
                  },
                  icon: Icon(FontAwesomeIcons.twitter)),
                  SizedBox(width: 50,),
                        IconButton(
                  onPressed: () {
                    launchUrlString('https://instagram.com/afsal_babu__/');
                  },
                  icon: Icon(FontAwesomeIcons.instagram)),
                  SizedBox(width: 50,),
                        IconButton(
                  onPressed: () {
                    launchUrlString('https://www.youtube.com/');
                  },
                  icon: Icon(FontAwesomeIcons.youtube)),
                 
                    ],
                  ),
                   MaterialButton(onPressed: (){
                        
                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text('Sign Out',style: TextStyle(color: Colors.white))),color: Colors.black,),
                          // SizedBox(height: 20,)
                         ],
                         
                       ),
                     ),
                   
                  ],
                  
                ),
              ),
            ),
            
          ),
        )
        );
        
  }
}
