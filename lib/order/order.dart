import 'package:fashion_app/bottom/cubit/payment_type_cubit/cubit/payment_type_cubit.dart';
import 'package:fashion_app/drawer.dart';
import 'package:fashion_app/home.dart';
import 'package:fashion_app/models/adressmodel.dart';
import 'package:fashion_app/payment/pay.dart';
import 'package:fashion_app/textfield/adderss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widgets/appbar.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isEnable = false;
  bool selected = false;
  Address? addedAddress;
  String data = "";

  @override
  Widget build(BuildContext context) {
    final payCubit = context.watch<PaymentTypeCubit>();
    return Scaffold(
      key: _key,
      drawer: BuildDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar(
          scaffoldKey: _key,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CHECK OUT',
                    style: GoogleFonts.gemunuLibre(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Build_divider(),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Shipping Adderss'),
                ],
              ),
              Column(
               
                children: [
                  Container(
                    height: addedAddress == null ? 100 : null,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white54,
                    child: addedAddress == null
                        ? null
                        : Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(addedAddress!.name,style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(addedAddress!.lastName,style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(addedAddress!.address),
                              Text(addedAddress!.city),
                              Text(addedAddress!.state),
                              Text(addedAddress!.phoneNumber.toString()),
                              Text(addedAddress!.pincode.toString()),
                            ],
                          ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(2, 2, 3 ,3)
                      //shape: shape
                      ),
                  onPressed: () async {
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen(addedAddress: addedAddress)));
                    if (result is Address) {
                      setState(() {
                        addedAddress = result;
                      });
                    } else {}
                  },
                  
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.end,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Add shipping address'),
                      Spacer(),
                      
                      Icon(Icons.add),

                      InkWell(child: Icon(Icons.edit),
                      onTap: ()   async{
                        final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen(addedAddress: addedAddress)));
if (result is Address) {
                      setState(() {
                        addedAddress = result;
                      });
                    } else {}
                  },
                      
                      )
                    ],
                  )),
              SizedBox(
                height: 20,

              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('payment method'),

              ]),
              ElevatedButton(
              
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(2, 2, 3 ,3)
                      //shape: shape
                      ),
                  onPressed: () {
                    setState(() {
                      isEnable = !isEnable;
                    });
                    print(isEnable);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          //    selected ==false?'select Payment method':data),
                          payCubit.state),
                      Icon(Icons.list)
                    ],
                  )),
              Visibility(
                visible: isEnable,
                child: Container(
                  color: Colors.black12,
                  height: 200,
                  width: 600,
                  child: Column(
                    children: [
                      ListTile(
                        title: InkWell(
                          child: Text('phone pe'),
                          onTap: () {
                            setState(() {
                              // selected = true;
                              //data = "phone pe";

                              payCubit.changePaymethod("Phone pe");

                              isEnable = !isEnable;
                            });
                          },
                        ),
                      ),
                      ListTile(
                          title: InkWell(
                        child: Text('Cash'),
                        onTap: () {
                          setState(() {
                            // selected = true;
                            // data = 'cash';
                            payCubit.changePaymethod("Cash");
                            isEnable = !isEnable;
                          });
                        },
                      )),
                      ListTile(
                        title: InkWell(
                          child: Text('Credit Card'),
                          onTap: () {
                            setState(() {
                              // selected = true;

                              // data = 'Credit Card';
                              payCubit.changePaymethod("Credit card");
                              isEnable = !isEnable;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
            height: 40,
            child: Center(
                child: InkWell(
              child: Text(
                'place order',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Pay()));
              },
            ))),
      ),
    );
  }

  List<String> methods = ['Phone pe', 'credit card', 'cash'];
}
