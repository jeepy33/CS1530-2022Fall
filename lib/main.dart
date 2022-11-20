import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filter_list/filter_list.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'list.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return firebaseApp;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: loginRoute,
    );
  }
}
