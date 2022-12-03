import 'package:flutter/material.dart';
import 'constants.dart';
import 'filter.dart';
import 'home.dart';
import 'package:locate_app/roll_favorite.dart';

class BarPage extends StatefulWidget {
  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  int _selectedIndex = 0; //New
  static const List<Widget> _pages = <Widget>[
   @override
   State<RollFavoritePage> createState() => _RollFavoritePageState();
  @override
   Widget build(BuildContext context) 
   {
    homePage();
   },
 
   @override
   Widget build(BuildContext context) 
   {
    FilterPage();
   },
    
    // Icon(
      
    // //  size: 150,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),

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
            icon: Icon(Icons.filter),
            label: 'Filters',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      backgroundColor:
          Color.fromARGB(255, 119, 195, 91), //0x86c66f // gray 0x8d948b
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 174, 98),
        automaticallyImplyLeading: false,
        title: const Text('LocAte'),
      ),
    );
  }
}
