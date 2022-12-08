import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:locate_app/animation/dice.dart';
import 'package:locate_app/main.dart';

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
  bool toggle = false;

  int resIndex = 0;
  Restaurant restaurant = Restaurant(
      name: "",
      diet: [""],
      styles: [""],
      link: "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
      price: 0);

  // creates a list of all the restaurants in the database

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
    setState(() {
      icon1 = 0;
      icon2 = 0;
      icon3 = 0;
      icon4 = 0;
      _controller.value = 0;
      _controllerImg.value = 0;
      _controller.forward();

      // TODO: Query Goes Here
      if (resIndex >= global.restList.length) {
        resIndex = 0;
      }
      restaurant = global.restList[resIndex];

      if (resIndex < global.restList.length) {
        resIndex++;
      }
      print(restaurant);
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

      if (global.familar.contains(restaurant.name)) {
        toggle = true;
      } else {
        toggle = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    global.getRestaurantsNew();

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
                )),
            Text(
              restaurant.name!,
              textScaleFactor: _controllerImg.value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0),
            ),
            GestureDetector(
                onDoubleTap: roll,
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                  child: Stack(children: <Widget>[
                    Image.network(
                      restaurant.link!,
                      width: 0 + 350 * _controllerImg.value,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 15, top: 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 0),
                                  backgroundColor:
                                      toggle ? Colors.green : Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (!toggle) {
                                      global.familar.add(restaurant.name!);
                                    } else {
                                      global.familar.remove(restaurant.name!);
                                    }
                                    toggle = !toggle;
                                    global.users
                                        .doc(
                                            '${global.emailTextController.text}')
                                        .set({
                                      'name': global.emailTextController.text,
                                      'familar': global.familar
                                    });
                                  });
                                },
                                child: Icon(Icons.check_circle,
                                    color: toggle ? Colors.white : Colors.grey,
                                    size: 50 * _controllerImg.value))))
                  ]),
                )),
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
            Wrap(
              alignment: WrapAlignment.center,
              children: (createTexttextfields(
                  List.from(restaurant.diet!)..addAll(restaurant.styles!))),
            ),
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   children: createTexttextfields(restaurant.styles!),
            // ),
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
