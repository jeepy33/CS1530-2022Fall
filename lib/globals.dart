import 'package:cloud_firestore/cloud_firestore.dart';

class Globals {
  List<String> styleOptions = [
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

  List<bool> styleSelected = [
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

  List<String> dietOptions = [
    'Vegetarian ',
    'Vegan',
    'Pescatarian',
    'Gluten-Free',
    'Kosher',
    'Keto',
    'Dairy-Free',
    'Low-Carb',
    'Paleo'
  ];
  List<bool> dietSelected = [
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

  List<String> getActiveStyle() {
    int index = 0;
    List<String> filters = [];
    for (bool i in styleSelected) {
      if (i) {
        filters.add(styleOptions[index]);
      }
      index++;
    }
    return filters;
  }

  List<String> getActiveDiet() {
    int index = 0;
    List<String> filters = [];
    for (bool i in dietSelected) {
      if (i) {
        filters.add(dietOptions[index]);
      }
      index++;
    }
    return filters;
  }
}

class Restaurant {
  final String?name;
  final List<String>? style;
  final List<String>? diet;
  final String? link;
  final List<double>? location;

  Restaurant({this.name, this.style, this.diet, this.link, this.location});

  factory Restaurant.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Restaurant(
      name: data?['name'],
      style: data?['style'] is Iterable ? List.from(data?['style']) : null,
      diet: data?['diet'] is Iterable ? List.from(data?['diet']) : null,
      link: data?['link'],
      location: data?['location'] is Iterable ? List.from(data?['location']) : null,
    );
  }
}
