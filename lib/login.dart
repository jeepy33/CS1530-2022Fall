import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants.dart';
import 'list.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 119, 195, 91), //0x86c66f // gray 0x8d948b
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 174, 98),
        automaticallyImplyLeading: false,
        title: new Image.asset("assets/images/Logo.png"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, signInRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Sign In',
                  style: TextStyle(
                    color: Color.fromARGB(255, 68, 98, 56),
                  )),
            ),
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, signUpRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 68, 98, 56),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
