import 'package:flutter/material.dart';
import 'constants.dart';
import 'list.dart';

class RollFamiliarPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<RollFamiliarPage> createState() => _RollFamiliarPageState();
}

class _RollFamiliarPageState extends State<RollFamiliarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocAte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Favorite Restuarant'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('New Restuarant'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, filterRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Filters'),
            )
          ],
        ),
      ),
    );
  }
}