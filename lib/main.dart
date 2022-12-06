import 'package:flutter/material.dart';
import 'package:locate_app/globals.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'login.dart';

Globals global = new Globals();

void main() {
  runApp(const MyApp());
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
