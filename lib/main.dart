import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locate_app/globals.dart';
import 'firebase_options.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'login.dart';

Globals global = new Globals();

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await _initializeFirebase();
  runApp(const MyApp());
}

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseOptions firebaseConfig = DefaultFirebaseOptions.currentPlatform;
  FirebaseApp firebaseApp =
  await Firebase.initializeApp(options: firebaseConfig);
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    //Navigator.pushNamed(context, homeRoute,
    //arguments: 'arguments/chose Templates');
  }

  return firebaseApp;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: loginRoute,
    );
  }
}
