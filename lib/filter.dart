import 'package:flutter/material.dart';
import 'list.dart';
import 'constants.dart';

class FilterPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _pages = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: CheckIn',
      style: optionStyle,
    ),
    Text(
      'Index 2: Filters',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _selectedIndex = 2;
      Navigator.pushNamed(context, filterRoute,
          arguments: 'arguments/chose Templates');
    } else if (index == 1) {
      _selectedIndex = 1;
      Navigator.pushNamed(context, checkInRoute,
          arguments: 'arguments/chose Templates');
    } else if (index == 0) {
      _selectedIndex = 0;
      Navigator.pushNamed(context, homeRoute,
          arguments: 'arguments/chose Templates');
    }
  }

  double distance = 0;
  double price = 0;
  String filter = '';
  //final bool selected;
  bool pizza = false;
  bool mex = false;
  bool chinese = false;

  @override
  Widget build(BuildContext context) {
    //var filter;
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), //0x86c66f // gray 0x8d948b
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //_pages:
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Check In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt),
            label: 'Filters',
          ),
        ],
        // unselectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),

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
            //Slider Widget
            Text('Filters',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            //  Icon(Icons.filter_alt),
            const SizedBox(
              height: 50, // <-- SEE
            ),
            Text(
              'Distance',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Slider(
              value: distance,
              activeColor: Color.fromARGB(255, 119, 195, 91),
              inactiveColor: Colors.grey,
              thumbColor: Color.fromARGB(255, 119, 195, 91),
              label: '${distance.round()} Distanmce (miles)',
              onChanged: (newDistance) {
                setState(() {
                  distance = newDistance;
                });
              },
              min: 0,
              max: 60,
              divisions: 6,
              //label: "Distance (miles)"
            ),
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            Text(
              'Price',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Slider(
              value: price,
              activeColor: Color.fromARGB(255, 119, 195, 91),
              inactiveColor: Colors.grey,
              thumbColor: Color.fromARGB(255, 119, 195, 91),
              label: '${price.round()} Avg Price (per plate)',
              onChanged: (newPrice) {
                setState(() {
                  price = newPrice;
                });
              },
              min: 0,
              max: 100,
              divisions: 10,
              // label: "Avg Price (per plate)"
            ),
            // const Divider(
            //   height: 20,
            //   thickness: 5,
            //   color: Colors.black,
            // ),
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 119, 195, 91),
            ),
            Text(
              'Style',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            InputChipExample(),
            // const Divider(
            //   height: 20,
            //   thickness: 5,
            //   color: Color.fromARGB(255, 119, 195, 91),
            // ),
            const SizedBox(
              height: 25, // <-- SEE HERE
            ),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 119, 195, 91),
            ),
            const SizedBox(
              height: 25, // <-- SEE HERE
            ),
            // const Divider(
            //   height: 20,
            //   thickness: 20,
            //   color: Color.fromARGB(255, 119, 195, 91),
            // ),
            // const SizedBox(
            //   height: 30, // <-- SEE HERE
            // ),
            Text(
              'Diet',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            InputChipExample2(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 119, 195, 91),
            ),
            const SizedBox(
              height: 20, // <-- SEE HERE
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 119, 195, 91),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 96, vertical: 30),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Save Filters Request',
                  style: TextStyle(
                    //backgroundColor: Color.fromARGB(255, 119, 195, 91),
                    color: Color.fromARGB(255, 255, 254, 254),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
