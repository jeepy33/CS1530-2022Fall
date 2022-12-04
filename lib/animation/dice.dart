import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

import '../constants.dart';

class Dice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _diceState();
}

class _diceState extends State<Dice> {
  Random rand = new Random();
  int left = 6;
  int right = 3;
  ImageMap images = ImageMap();
  String img = diceImageList[0];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.asset(img),
    ]);
  }
}
