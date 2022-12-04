import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'fire_auth.dart';
import 'firebase_options.dart';
import 'validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseOptions firebaseConfig = DefaultFirebaseOptions.currentPlatform;
    FirebaseApp firebaseApp =
        await Firebase.initializeApp(options: firebaseConfig);

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 119, 195, 91),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 119, 174, 98),
            title: const Text('LocAte')),
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 100, // <-- SEE HERE
                        ),
                        Form(
                          key: _registerFormKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                cursorColor: Colors.white,
                                controller: _nameTextController,
                                focusNode: _focusName,
                                validator: (value) => Validator.validateName(
                                  name: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                cursorColor: Colors.white,
                                controller: _emailTextController,
                                focusNode: _focusEmail,
                                validator: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                cursorColor: Colors.white,
                                controller: _passwordTextController,
                                focusNode: _focusPassword,
                                obscureText: true,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32.0),
                              _isProcessing
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 150,
                                                        vertical: 30),
                                                textStyle: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () async {
                                              setState(() {
                                                _isProcessing = true;
                                              });

                                              if (_registerFormKey.currentState!
                                                  .validate()) {
                                                User? user = await FireAuth
                                                    .registerUsingEmailPassword(
                                                  name:
                                                      _nameTextController.text,
                                                  email:
                                                      _emailTextController.text,
                                                  password:
                                                      _passwordTextController
                                                          .text,
                                                );

                                                setState(() {
                                                  _isProcessing = false;
                                                });

                                                if (user != null) {
                                                  Navigator.pushNamed(
                                                      context, homeRoute,
                                                      arguments:
                                                          'arguments/chose Templates');
                                                }
                                              }
                                            },
                                            child: Text(
                                              'Sign up',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 119, 195, 91)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
