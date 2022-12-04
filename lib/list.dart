import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//comment for update purposes

class InputChipExample extends StatefulWidget {
  @override
  InputChipExampleState createState() => new InputChipExampleState();
}

class InputChipExampleState extends State<InputChipExample>
    with TickerProviderStateMixin {
  List<String> _options = [
    'Breakfast',
    'Bakery',
    'Asian',
    'Tacos',
    'Wings',
    'Ice Cream',
    'Mexican',
    'Seafood',
    'Pasta',
    'Sushi',
    'Mediterranean',
    'Deli',
    'Snacks',
    'Candy',
    'Subs',
    'Noodle',
    'BBQ',
    'Italian',
    'Cafe',
    'Grill',
    'Burgers',
    'Desert',
    'Salad'
  ];
  List<bool> _selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.white,
        backgroundColor: Colors.black54,
        selectedColor: Color.fromARGB(255, 119, 195, 91),
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
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
  List<String> _options = [
    'Vegitarian',
    'Vegan',
    'Pescetarian',
    'Gluten-Free',
    'Kosher',
    'Keto',
    'Dairy-Free',
    'Low-Carb',
    'Paleo'
  ];
  List<bool> _selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.white,
        backgroundColor: Colors.black54,
        selectedColor: Color.fromARGB(255, 119, 195, 91),
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
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
