import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filter_list/filter_list.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'list.dart';

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
        body: HomePage(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
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
  List<String> _options = ['Flutter', 'Dart', 'Woolha'];
  List<bool> _selected = [false, false, false];

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
            Slider(
              value: distance,
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
            Slider(
              value: price,
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
            FilterChip(
                label: Text('Pizza'),
                selected: pizza,
                onSelected: (bool newValue) {
                  setState(() {
                    pizza = newValue;
                  });
                }),
            FilterChip(
                label: Text('Mexican'),
                selected: mex,
                onSelected: (bool newValue) {
                  setState(() {
                    mex = newValue;
                  });
                }),
            FilterChip(
                label: Text('Chinese'),
                selected: chinese,
                onSelected: (bool newValue) {
                  setState(() {
                    chinese = newValue;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
