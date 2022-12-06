import 'dart:html';

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

class Resturant {
  String name;
  List<String> style;
  List<String> diet;
  String link;
  Geolocation location;

  Resturant(this.name, this.style, this.diet, this.link, this.location);
}
