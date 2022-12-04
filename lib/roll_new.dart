import 'package:flutter/material.dart';
import 'dart:math';

import 'package:locate_app/animation/dice.dart';

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
    _controller.value = 0;
    _controllerImg.value = 0;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 195, 91),
      appBar: AppBar(
          title: const Text('LocAte'),
          backgroundColor: Color.fromARGB(255, 119, 174, 98)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: roll,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Image(
                  width: 160 - 160 * _controller.value,
                  image: AssetImage(
                      'assets/images/dice_$leftDiceNumber$rightDiceNumber.png'),
                ),
              ),
            ),
            GestureDetector(
              onDoubleTap: roll,
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.network(
                    'https://googleflutter.com/sample_image.jpg',
                    width: 0 + 350 * _controllerImg.value,
                  )),
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
}
