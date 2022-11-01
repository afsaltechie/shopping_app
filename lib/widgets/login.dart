import 'dart:math';

import 'package:fashion_app/home.dart';
import 'package:fashion_app/view/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final passWord = TextEditingController();

  bool isSelected = false;
  bool isobscure = true;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Welcome back! please enter your details.'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passWord,
                obscureText: isobscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: InkWell(
                    child: const Icon(Icons.remove_red_eye),
                    onTap: () {
                      setState(() {
                        isobscure = !isobscure;
                      });
                    },
                  ),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const Spacer(),
                  const Text('Forgot password')
                ],
              ),
              isloading
                  ? const CircularProgressIndicator()
                  : MaterialButton(
                      shape: const StadiumBorder(),
                      minWidth: 300,
                      onPressed: () async {
                        if (email.text.isNotEmpty && passWord.text.isNotEmpty) {
                          await signInWithEmailAndPassword();
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Please complete the required field',textColor: Colors.red);
                        }
                      },
                      color: Colors.black,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                //shape: StadiumBorder(),
                minWidth: 300,
                onPressed: () {},
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.email),
                    Text('Sign in with Email'),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an account?'),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup()));
                    },
                    child: const Text(
                      'Sign up for free',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: passWord.text,
      );
      if (credential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      Fluttertoast.showToast(msg: e.toString());
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    setState(() {
      isloading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: passWord.text);
      if (credential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        await createUserWithEmailAndPassword();
      } else if (e.code == 'wrong-password') {
        setState(() {
          isloading = false;
        });
        print('Wrong password provided for that user.');
        Fluttertoast.showToast(msg: "Wrong password provided for that user.",textColor: Colors.red);
      }
    }
  }
}
