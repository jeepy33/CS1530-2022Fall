import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
//comment for update purposes

class InputChipExample extends StatefulWidget {
  @override
  InputChipExampleState createState() => new InputChipExampleState();
}

class InputChipExampleState extends State<InputChipExample>
    with TickerProviderStateMixin {
  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < global.styleOptions.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: global.styleSelected[i],
        label:
            Text(global.styleOptions[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.white,
        backgroundColor: Colors.black54,
        selectedColor: Color.fromARGB(255, 119, 195, 91),
        onSelected: (bool selected) {
          setState(() {
            global.styleSelected[i] = selected;
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 30,
      child: _buildChips(),
    );
  }
}

class InputChipExample2 extends StatefulWidget {
  @override
  InputChipExample2State createState() => new InputChipExample2State();
}

class InputChipExample2State extends State<InputChipExample2>
    with TickerProviderStateMixin {
  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < global.dietOptions.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: global.dietSelected[i],
        label:
            Text(global.dietOptions[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.white,
        backgroundColor: Colors.black54,
        selectedColor: Color.fromARGB(255, 119, 195, 91),
        onSelected: (bool selected) {
          setState(() {
            global.dietSelected[i] = selected;
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 30,
      child: _buildChips(),
    );
  }
}
