import 'package:fashion_app/textfield/adderss.dart';
import 'package:flutter/rendering.dart';

class Address {
  final String name;
  final String lastName;
  final String address;
  final String city;
  final String state;
  final int pincode;
  final int phoneNumber;

  const Address({
    required this.address,
    required this.city,
    required this.lastName,
    required this.name,
    required this.phoneNumber,
    required this.pincode,
    required this.state,
  });
}
