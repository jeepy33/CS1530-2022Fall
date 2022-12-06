import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'fire_auth.dart';
import 'validator.dart';
import 'firebase_options.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseOptions firebaseConfig = DefaultFirebaseOptions.currentPlatform;
    FirebaseApp firebaseApp =
        await Firebase.initializeApp(options: firebaseConfig);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && mounted) {
      //Navigator.pushNamed(context, homeRoute,
      //arguments: 'arguments/chose Templates');
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 119, 195, 91),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 119, 174, 98),
            title: new Image.asset("assets/images/Logo.png")),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 100, // <-- SEE HERE
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 25),
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
                          SizedBox(height: 8.0),
                          TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            cursorColor: Colors.white,
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) => Validator.validatePassword(
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
                          SizedBox(height: 24.0),
                          _isProcessing
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 120, vertical: 30),
                                            textStyle: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () async {
                                          _focusEmail.unfocus();
                                          _focusPassword.unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            User? user = await FireAuth
                                                .signInUsingEmailPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                              context: context,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null && mounted) {
                                              Navigator.pushNamed(
                                                  context, homeRoute,
                                                  arguments:
                                                      'arguments/chose Templates');
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Sign In',
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
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
