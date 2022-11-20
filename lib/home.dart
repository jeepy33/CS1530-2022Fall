import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Color.fromARGB(255, 119, 195, 91), //0x86c66f // gray 0x8d948b
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 174, 98),
        automaticallyImplyLeading: false,
        title: const Text('LocAte'),
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
                  const EdgeInsets.symmetric(horizontal: 77, vertical: 30),
                  textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, roll1Route,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Favorite Restuarant',
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
                  const EdgeInsets.symmetric(horizontal: 96, vertical: 30),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, roll2Route,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('New Restuarant',
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
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, filterRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Filters',
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