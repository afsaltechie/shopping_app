import 'package:fashion_app/bottom/about.dart';
import 'package:fashion_app/bottom/blog.dart';
import 'package:fashion_app/bottom/contact.dart';
import 'package:fashion_app/cart/buy.dart';
import 'package:fashion_app/cart/empty.dart';
import 'package:fashion_app/drawer.dart';
import 'package:fashion_app/explore.dart';
import 'package:fashion_app/video_widget.dart';
import 'package:fashion_app/view/list.dart';
import 'package:fashion_app/widgets/footer.dart';
import 'package:fashion_app/widgets/gridlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _key,
          drawer: const BuildDrawer(),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Appbar(
                scaffoldKey: _key, )),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/image 10.jpg'),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                'LUXURY \n  FASHION\n&   ACCESSORIES',
                                style: GoogleFonts.acme(
                                    fontSize: 35,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40, 40),
                              textStyle: TextStyle(fontSize: 15),
                              primary: Colors.black38,
                              onPrimary: Colors.white,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Lost()));
                            },
                            child: Text('EXPLORE COLLECTION'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      child: Image.asset('assets/images/image 15.jpg'),
                    ),
                    Container(
                      height: 300,
                      child: Image.asset('assets/images/image 15 (1).jpg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Text(
                      'NEW ARRIVAL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Shoe',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Dress',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Tshirt',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Bag',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 700,
                    child: TabBarView(
                      // children: numbersList
                      //     .map(
                      //       (e) => Container(
                      //         height: 600,
                      //         child: GridView.builder(
                      //           itemCount: itemLis.length,
                      //           gridDelegate:
                      //               const SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //             crossAxisSpacing: 0,
                      //             mainAxisSpacing: 50,
                      //           ),
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return itemContainer(
                      //                 itemLis[index].img,
                      //                 itemLis[index].itemName,
                      //                 itemLis[index].price);
                      //           },
                      //         ),
                      //       ),
                      //     )
                      //     .toList(),
                      children: [
                        for (int i = 0; i < 5; i++)
                          Container(
                            height: 600,
                            child: GridView.builder(
                              itemCount: itemLis.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 50,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Listg(
                                  img: itemLis[index].img,
                                  name: itemLis[index].itemName,
                                  price: itemLis[index].price,
                                );

                                // return itemContainer(
                                //     itemLis[index].img,
                                //     itemLis[index].itemName,
                                //     itemLis[index].price);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 5,
                    thickness: 3,
                    indent: 200,
                    endIndent: 200,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExplorePage()));
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Explore More   ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Icon(Icons.arrow_forward_sharp)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/Brand.jpg'),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/Collection.jpg'),
                ],
              ),
              Column(
                children: [
                  // VideoWidget(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'JUST FOR YOU',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
             Build_divider(),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: new ListView.builder(
                  itemCount: itemImg.length,
                  scrollDirection: Axis.horizontal,
                  padding: new EdgeInsets.all(5.0),

                  //itemExtent: 20.0,
                  itemBuilder: (BuildContext context, int index) {
                    final item = itemImg[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(item.img),
                          Text(item.title),
                          Text(item.price.toString(),style: TextStyle(color: Colors.red),),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#2022'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#Spring'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#Collection'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#fall'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#Dress'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#AutumnCollection'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#openFashion'),
                        ),
                        Chip(
                          backgroundColor: Color.fromARGB(26, 237, 228, 228),
                          label: const Text('#style'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [Image.asset('assets/images/Openfashion.jpg')],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'FOLLOW US',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        launchUrlString('https://instagram.com/afsal_babu__');
                      },
                      icon: Icon(FontAwesomeIcons.instagram)),
                  Container(
                    height: 470,
                    width: MediaQuery.of(context).size.width,
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      children: [
                        GridTile(
                          child: Image.asset('assets/images/Group 257.jpg'),
                        ),
                        GridTile(
                            child: Image.asset('assets/images/Group 258.jpg')),
                        GridTile(
                            child: Image.asset('assets/images/Group 259.jpg')),
                        GridTile(
                            child: Image.asset('assets/images/Group 260.jpg')),
                      ],
                    ),
                  )
                ],
              ),
              Footer(),
            ]),
          ),
        ));
  }

// Column itemContainer(String img, String name, double price) {
// return Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage(img)),
//               ),
//               child: Image.asset(img),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Column(
//               children: [
//                 Text(
//                   name,
//                   textAlign: TextAlign.center,
//                 ),
//                 Text('\$${price.toString()}'),
//               ],
//             ),
//           ),
//         ],
//       );

//   }
}

Widget Build_divider() {
  return Divider(
    color: Colors.grey,
    height: 3,
    thickness: 2,
    indent: 200,
    endIndent: 200,
  );
}
