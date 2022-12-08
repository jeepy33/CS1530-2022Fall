import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Globals {
  double distance = 0;
  double price = 0;
  List<Restaurant> restList = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final emailTextController = TextEditingController();
  List<String> familar = [];

  void getRestaurantsFav() async {
    await users.doc('${emailTextController.text}').get().then((value) {
      familar = List.from(value['familar']);
    });
    restList = [];
    await db.collection("restaurants").get().then(
      (event) {
        for (var doc in event.docs) {
          if (passFiltersFav(doc)) {
            restList.add(Restaurant.fromFirestore(doc, null));
          }
        }
      },
      onError: (e) => print("Error getting doc"),
    );
  }

  bool passFiltersFav(var doc) {
    List<String> diet = getActiveDiet();
    List<String> styles = getActiveStyle();
    List<String> dietR = List.from(doc.data()['diet']);
    List<String> stylesR = List.from(doc.data()['styles']);
    int priceR = doc.data()['price'];
    String nameR = doc.data()['name'];
    bool passDiet = false;
    bool passStyle = false;
    bool passPrice = true;

    if (!familar.contains(nameR)) {
      return false;
    }

    if (price == 0) {
      // nada
    } else if (priceR == 1) {
      if (price > 10) {
        passPrice = false;
      }
    } else if (priceR == 2) {
      if (price > 30 || price <= 10) {
        passPrice = false;
      }
    } else if (priceR == 3) {
      if (price > 60 || price <= 30) {
        passPrice = false;
      }
    } else {
      if (price < 60) {
        passPrice = false;
      }
    }

    if (diet.isNotEmpty) {
      for (String d in dietR) {
        if (diet.contains(d)) {
          passDiet = true;
          break;
        }
      }
    } else {
      passDiet = true;
    }

    if (styles.isNotEmpty) {
      for (String d in stylesR) {
        if (styles.contains(d)) {
          passStyle = true;
          break;
        }
      }
    } else {
      passStyle = true;
    }

    return passDiet && passStyle && passPrice;
  }

  void getRestaurantsNew() async {
    restList = [];
    await users.doc('${emailTextController.text}').get().then((value) {
      familar = List.from(value['familar']);
    });
    await db.collection("restaurants").get().then(
      (event) {
        for (var doc in event.docs) {
          if (passFiltersNew(doc)) {
            restList.add(Restaurant.fromFirestore(doc, null));
          }
        }
      },
      onError: (e) => print("Error getting doc"),
    );
  }

  bool passFiltersNew(var doc) {
    List<String> diet = getActiveDiet();
    List<String> styles = getActiveStyle();
    List<String> dietR = List.from(doc.data()['diet']);
    List<String> stylesR = List.from(doc.data()['styles']);
    int priceR = doc.data()['price'];
    String nameR = doc.data()['name'];
    bool passDiet = false;
    bool passStyle = false;
    bool passPrice = true;

    if (familar.contains(nameR)) {
      return false;
    }

    if (price == 0) {
      // nada
    } else if (priceR == 1) {
      if (price > 10) {
        passPrice = false;
      }
    } else if (priceR == 2) {
      if (price > 30 || price <= 10) {
        passPrice = false;
      }
    } else if (priceR == 3) {
      if (price > 60 || price <= 30) {
        passPrice = false;
      }
    } else {
      if (price < 60) {
        passPrice = false;
      }
    }

    if (diet.isNotEmpty) {
      for (String d in dietR) {
        if (diet.contains(d)) {
          passDiet = true;
          break;
        }
      }
    } else {
      passDiet = true;
    }

    if (styles.isNotEmpty) {
      for (String d in stylesR) {
        if (styles.contains(d)) {
          passStyle = true;
          break;
        }
      }
    } else {
      passStyle = true;
    }

    return passDiet && passStyle && passPrice;
  }

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
