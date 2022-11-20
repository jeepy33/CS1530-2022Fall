import 'package:flutter/material.dart';
import 'list.dart';

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
                Navigator.pop(context);
              },
              child: const Text('Home'),
            ),
            //Slider Widget
            Text('Distance',
                selectionColor: Colors.grey, textAlign: TextAlign.left),
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
            Text('Price',
                selectionColor: Colors.grey, textAlign: TextAlign.left),
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
            Text('Style', selectionColor: Colors.grey),
            InputChipExample(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 119, 195, 91),
            ),
            Text('Diet', selectionColor: Colors.grey),
            InputChipExample2(),
          ],
        ),
      ),
    );
  }
}
