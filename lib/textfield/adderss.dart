import 'dart:ui';

import 'package:fashion_app/home.dart';
import 'package:fashion_app/models/adressmodel.dart';
import 'package:fashion_app/order/order.dart';
import 'package:fashion_app/payment/pay.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key, required this.addedAddress}) : super(key: key);

  final Address? addedAddress;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final phonenumberController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
   if(widget.addedAddress != null){
     nameController.text = widget.addedAddress!.name;
    lastNameController.text = widget.addedAddress!.lastName;
    stateController.text = widget.addedAddress!.state;
    cityController.text = widget.addedAddress!.city;
    addressController.text = widget.addedAddress!.address;
    phonenumberController.text = widget.addedAddress!.phoneNumber.toString();
    pincodeController .text = widget.addedAddress!.pincode.toString();
   }
    



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Shipping Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                height: 5,
                thickness: 3,
                indent: 200,
                endIndent: 200,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Name',hintStyle: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',hintStyle: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: 'Adderss',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: stateController,
                          decoration: InputDecoration(
                            hintText: 'State',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: pincodeController,
                          decoration: InputDecoration(
                            hintText: 'pin code',
                          ),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: phonenumberController,
                    decoration: InputDecoration(
                      hintText: 'phone number',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
              child: InkWell(
            child: Text(
              'ADD NOW',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            onTap: () {
              final name = nameController.text;
              final lastName = lastNameController.text;
              final pincode = pincodeController.text;
              final address = addressController.text;
              final city = cityController.text;
              final state = stateController.text;
              final phonenumber = phonenumberController.text;

              final addressModel = Address(address: address, city: city, lastName: lastName, name: name, phoneNumber: int.parse(phonenumber), pincode: int.parse(pincode), state: state,);


              Navigator.pop(context,addressModel);

            },
          )),
        ),
      ),
    );
  }
}
