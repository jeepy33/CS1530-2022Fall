import 'package:cloud_firestore/cloud_firestore.dart';

class Globals {
  double distance = 0;
  double price = 0;

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
    'Salad',
    'Middle-Eastern'
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
  final String? name;
  final List<String>? styles;
  final List<String>? diet;
  final String? link;
  final GeoPoint? location;
  final int? price;

  Restaurant(
      {this.name,
      this.styles,
      this.diet,
      this.link,
      this.location,
      this.price});

  factory Restaurant.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Restaurant(
      name: data?['name'],
      styles: data?['styles'] is Iterable ? List.from(data?['styles']) : null,
      diet: data?['diet'] is Iterable ? List.from(data?['diet']) : null,
      link: data?['link'],
      location: data?['location'],
      price: data?['price'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '${this.name}: \n   diet: ${this.diet}\n   style: ${this.styles}\n   price: ${this.price}\n   link: ${this.link}\n   location: ${this.location}]n';
  }
}
