import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'firebase_options.dart';

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

class _CheckInPageState extends State<CheckPage> {
  //FirebaseDatabase db = FirebaseDatabase.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();


  void test() async {
    await db.collection("restaurants").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} +> ${doc.data()}");
      }
    },
      onError: (e) => print("Error getting doc"),
    );
  }


  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseOptions firebaseConfig = DefaultFirebaseOptions.currentPlatform;
    FirebaseApp firebaseApp =
    await Firebase.initializeApp(options: firebaseConfig);

    return firebaseApp;
  }



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

  @override
  Widget build(BuildContext context) {
    test();
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
        //unselectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 119, 195, 91),
        onTap: _onItemTapped,
      ),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 174, 98),
        automaticallyImplyLeading: false,
        title: new Image.asset("assets/images/Logo.png"),
      ),

      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.toString());
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
            ]));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
