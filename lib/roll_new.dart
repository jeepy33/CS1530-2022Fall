import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:locate_app/animation/dice.dart';

import 'globals.dart';

class RollNewPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<RollNewPage> createState() => _RollNewPageState();
}

class _RollNewPageState extends State<RollNewPage>
    with TickerProviderStateMixin {
  int leftDiceNumber = 0;
  int rightDiceNumber = 0;
  late AnimationController _controller;
  late AnimationController _controllerImg;
  late CurvedAnimation animation;
  late CurvedAnimation animationImg;

  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Restaurant> restList = [];


  // creates a list of all the restaurants in the database
  void getRestaurants() async {
    await db.collection("restaurants").get().then((event) {
      int i = 0;
      for (var doc in event.docs) {
        restList.add(Restaurant.fromFirestore(doc, null));
      }
    },
      onError: (e) => print("Error getting doc"),
    );
  }



  int icon1 = 0;
  int icon2 = 0;
  int icon3 = 0;
  int icon4 = 0;

  @override
  void initState() {
    super.initState();
    animate();
    animateImg();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    animation.addListener(() {
      setState(() {
        if ((_controller.value * 10).round() % 2 == 0) {
          leftDiceNumber = Random().nextInt(6) + 1;
        }
      });
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = 0;
        });
        // print('Completed');
        _controllerImg.forward();
      }
    });
  }

  animateImg() {
    _controllerImg = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animationImg =
        CurvedAnimation(parent: _controllerImg, curve: Curves.linear);
    animationImg.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    animationImg.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
        // print('Completed');
      }
    });
  }

  void roll() {
    icon1 = 0;
    icon2 = 0;
    icon3 = 0;
    icon4 = 0;
    _controller.value = 0;
    _controllerImg.value = 0;
    _controller.forward();
    // TODO: Query Goes Here
    getRestaurants();
    Restaurant restaurant = restList[0];
    if (restaurant.price! > 0) {
      icon1 = 1;
    }
    if (restaurant.price! > 1) {
      icon2 = 1;
    }
    if (restaurant.price! > 2) {
      icon3 = 1;
    }
    if (restaurant.price! > 3) {
      icon4 = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = restList[0];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 195, 91),
      appBar: AppBar(
          title: new Image.asset("assets/images/Logo.png"),
          backgroundColor: Color.fromARGB(255, 119, 174, 98)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: roll,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                  width: 160 - 160 * _controller.value,
                  image: AssetImage(
                      'assets/images/dice_$leftDiceNumber$rightDiceNumber.png'),
                ),
              ),
            ),
            Text(
              restaurant.name.toString(),
              textScaleFactor: _controllerImg.value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0),
            ),
            GestureDetector(
              onDoubleTap: roll,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    restaurant.link.toString(),
                    width: 0 + 350 * _controllerImg.value,
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.attach_money_sharp,
                  color: Colors.white,
                  size: icon1 * (0 + 40 * _controllerImg.value)),
              Icon(Icons.attach_money_sharp,
                  color: Colors.white,
                  size: icon2 * (0 + 40 * _controllerImg.value)),
              Icon(Icons.attach_money_sharp,
                  color: Colors.white,
                  size: icon3 * (0 + 40 * _controllerImg.value)),
              Icon(Icons.attach_money_sharp,
                  color: Colors.white,
                  size: icon4 * (0 + 40 * _controllerImg.value)),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: createTexttextfields(restaurant.diet!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: createTexttextfields(restaurant.styles!),
            ),
            ElevatedButton(
              onPressed: roll,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 119, 174, 98)),
              child: const Text(
                'Roll',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  createTexttextfields(List<String> list) {
    var textEditingControllers = <TextEditingController>[];

    var textFields = <Padding>[];

    list.forEach((i) {
      var textEditingController = Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, minimumSize: const Size(0, 0)),
              child: Text(
                "$i",
                textScaleFactor: _controllerImg.value,
                style: const TextStyle(
                    color: Color.fromARGB(255, 119, 174, 98),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )));
      return textFields.add((textEditingController));
    });
    return textFields;
  }
}
