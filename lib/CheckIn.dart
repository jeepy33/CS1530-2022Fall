import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<CheckPage> createState() => _CheckInPageState();
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('TEST'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class _CheckInPageState extends State<CheckPage> {
  int _selectedIndex = 1;
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
      if (index == 1) {
        _selectedIndex = 1;
        Navigator.pushNamed(context, checkInRoute,
            arguments: 'arguments/chose Templates');
      } else if (index == 0) {
        _selectedIndex = 0;
        Navigator.pushNamed(context, homeRoute,
            arguments: 'arguments/chose Templates');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 119, 195, 91), //0x86c66f // gray 0x8d948b
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
        selectedItemColor: Color.fromARGB(255, 119, 195, 91),
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
              child: const Text('Trials',
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
