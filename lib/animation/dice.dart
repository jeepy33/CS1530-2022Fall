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
  late NodeWithSize rootNode;
  ImageMap images = ImageMap();

  @override
  void initState() {
    super.initState();
    rootNode = NodeWithSize(const Size(1024.0, 1024.0));
    images.load(diceImageList);
  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }
}
