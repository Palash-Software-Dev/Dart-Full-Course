// ============================================================================
// DART MASTER ROADMAP
// PHASE 4 — COLLECTIONS & FUNCTIONAL PROGRAMMING
// ============================================================================
//
// Goal:
// Learn Dart collections deeply enough to work confidently with:
//
//   • Flutter UI lists
//   • API responses
//   • JSON data
//   • Products / orders / users
//   • ERP data
//   • Search & filtering
//   • Sorting
//   • Pagination
//   • Data transformation
//   • State management
//   • Database results
//
// IMPORTANT:
// Collections are one of the MOST frequently used parts of Dart/Flutter.
//
// ============================================================================
//
// PHASE 4 TOPICS
//
// 01. Collection overview
// 02. List basics
// 03. Creating Lists
// 04. Fixed-length vs growable Lists
// 05. List properties
// 06. Accessing elements
// 07. Updating elements
// 08. Adding elements
// 09. Removing elements
// 10. Searching Lists
// 11. List loops
// 12. forEach()
// 13. List spread operator
// 14. Collection-if
// 15. Collection-for
// 16. List copy
// 17. List equality concepts
// 18. List methods
//
// 19. Set basics
// 20. Creating Sets
// 21. Adding/removing Set values
// 22. Set uniqueness
// 23. Set operations
//
// 24. Map basics
// 25. Creating Maps
// 26. Reading Map values
// 27. Adding/updating Map values
// 28. Removing Map values
// 29. Map keys/values/entries
// 30. Map loops
//
// 31. Iterable
// 32. where()
// 33. map()
// 34. reduce()
// 35. fold()
// 36. any()
// 37. every()
// 38. contains()
// 39. firstWhere()
// 40. singleWhere()
// 41. take()
// 42. skip()
// 43. expand()
// 44. toList()
// 45. toSet()
// 46. whereType()
//
// 47. Sorting
// 48. Custom sorting
// 49. Reverse sorting
// 50. Filtering
// 51. Searching
// 52. Transformation
// 53. Aggregation
//
// 54. Nested collections
// 55. List<Map>
// 56. Map<String, dynamic>
// 57. API-like JSON data
// 58. Product filtering
// 59. Order calculations
// 60. ERP practical examples
//
// ============================================================================


// ============================================================================
// 1. COLLECTION OVERVIEW
// ============================================================================
//
// Dart's main collection types:
//
//   List
//   Set
//   Map
//
// LIST
//   Ordered collection.
//   Duplicate values allowed.
//
// SET
//   Unique collection.
//   Duplicate values automatically removed.
//
// MAP
//   Key-value collection.
//
// Example:
//
//   List<String> names = ["Palash", "Rahim", "Karim"];
//
//   Set<String> roles = {"admin", "employee", "vendor"};
//
//   Map<String, dynamic> user = {
//     "name": "Palash",
//     "age": 24,
//   };
//
// ============================================================================


// ============================================================================
// 2. LIST BASICS
// ============================================================================
//
// List is probably the most commonly used collection in Flutter.
//
// ============================================================================

void listBasics() {
  List<String> names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names);
}


// ============================================================================
// 3. TYPE-SAFE LIST
// ============================================================================
//
// Prefer:
//
//   List<String>
//
// instead of:
//
//   List<dynamic>
//
// Type safety catches mistakes earlier.
//
// ============================================================================

void typedListExample() {
  List<String> products = [
    "Laptop",
    "Phone",
    "Monitor",
  ];

  print(products);
}


// ============================================================================
// 4. LIST OF NUMBERS
// ============================================================================

void numberListExample() {
  List<int> numbers = [
    10,
    20,
    30,
    40,
  ];

  print(numbers);
}


// ============================================================================
// 5. EMPTY LIST
// ============================================================================

void emptyListExample() {
  List<String> names = [];

  print(names);
}


// ============================================================================
// 6. TYPE INFERENCE
// ============================================================================
//
// Dart can infer the type:
//
//   final names = <String>[];
//
// ============================================================================

void listTypeInference() {
  final names = <String>[];

  names.add("Palash");

  print(names);
}


// ============================================================================
// 7. GROWABLE LIST
// ============================================================================
//
// Normal List literals are growable.
//
// ============================================================================

void growableListExample() {
  final numbers = <int>[1, 2, 3];

  numbers.add(4);

  print(numbers);
}


// ============================================================================
// 8. FIXED-LENGTH LIST
// ============================================================================
//
// You can create a fixed-length list:
//
//   List<int>.filled(5, 0, growable: false)
//
// Its length cannot change.
//
// But individual values can be changed.
//
// ============================================================================

void fixedLengthListExample() {
  final numbers = List<int>.filled(
    5,
    0,
    growable: false,
  );

  numbers[0] = 10;

  print(numbers);
}


// ============================================================================
// 9. LIST LENGTH
// ============================================================================

void listLengthExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.length);
}


// ============================================================================
// 10. LIST isEmpty / isNotEmpty
// ============================================================================

void listEmptyExample() {
  final products = <String>[];

  print(products.isEmpty);
  print(products.isNotEmpty);
}


// ============================================================================
// 11. ACCESSING LIST ELEMENTS
// ============================================================================
//
// List indexes start from 0.
//
//   index 0 → first
//   index 1 → second
//   index 2 → third
//
// ============================================================================

void listAccessExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names[0]);
  print(names[1]);
  print(names[2]);
}


// ============================================================================
// 12. FIRST AND LAST
// ============================================================================

void firstLastExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names.first);
  print(names.last);
}


// ============================================================================
// 13. WARNING — EMPTY LIST
// ============================================================================
//
// Calling:
//
//   list.first
//   list.last
//
// on an empty list causes an error.
//
// Safer:
//
//   if (list.isNotEmpty) {
//     print(list.first);
//   }
//
// ============================================================================


// ============================================================================
// 14. NEGATIVE INDEXING DOES NOT WORK
// ============================================================================
//
// Dart List does not support:
//
//   list[-1]
//
// ============================================================================


// ============================================================================
// 15. UPDATE LIST ELEMENT
// ============================================================================

void updateListExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products[1] = "Gaming Laptop";

  print(products);
}


// ============================================================================
// 16. ADD ELEMENT
// ============================================================================

void addExample() {
  final products = <String>[
    "Phone",
    "Laptop",
  ];

  products.add("Tablet");

  print(products);
}


// ============================================================================
// 17. ADD MULTIPLE ELEMENTS
// ============================================================================

void addAllExample() {
  final products = <String>[
    "Phone",
  ];

  products.addAll([
    "Laptop",
    "Tablet",
    "Monitor",
  ]);

  print(products);
}


// ============================================================================
// 18. INSERT ELEMENT
// ============================================================================

void insertExample() {
  final products = [
    "Phone",
    "Laptop",
  ];

  products.insert(1, "Tablet");

  print(products);
}


// ============================================================================
// 19. INSERT MULTIPLE
// ============================================================================

void insertAllExample() {
  final products = [
    "Phone",
    "Monitor",
  ];

  products.insertAll(
    1,
    [
      "Laptop",
      "Tablet",
    ],
  );

  print(products);
}


// ============================================================================
// 20. REMOVE BY VALUE
// ============================================================================

void removeExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products.remove("Laptop");

  print(products);
}


// ============================================================================
// 21. REMOVE AT INDEX
// ============================================================================

void removeAtExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products.removeAt(1);

  print(products);
}


// ============================================================================
// 22. REMOVE LAST
// ============================================================================

void removeLastExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products.removeLast();

  print(products);
}


// ============================================================================
// 23. REMOVE WHERE
// ============================================================================
//
// Removes every element matching a condition.
//
// ============================================================================

void removeWhereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  numbers.removeWhere(
    (number) => number.isEven,
  );

  print(numbers);
}


// ============================================================================
// 24. CLEAR LIST
// ============================================================================

void clearExample() {
  final products = [
    "Phone",
    "Laptop",
  ];

  products.clear();

  print(products);
}


// ============================================================================
// 25. CONTAINS
// ============================================================================

void containsExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.contains("Phone"));
  print(products.contains("Camera"));
}


// ============================================================================
// 26. INDEX OF
// ============================================================================

void indexOfExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.indexOf("Laptop"));
  print(products.indexOf("Camera"));
}


// ============================================================================
// 27. LAST INDEX OF
// ============================================================================

void lastIndexExample() {
  final numbers = [
    10,
    20,
    10,
    30,
    10,
  ];

  print(numbers.lastIndexOf(10));
}


// ============================================================================
// 28. LIST ITERATION USING FOR LOOP
// ============================================================================

void listForLoopExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  for (int i = 0; i < products.length; i++) {
    print(products[i]);
  }
}


// ============================================================================
// 29. FOR-IN LOOP
// ============================================================================

void listForInExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  for (final product in products) {
    print(product);
  }
}


// ============================================================================
// 30. forEach()
// ============================================================================
//
// Executes a function for every element.
//
// ============================================================================

void forEachExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products.forEach(
    (product) {
      print(product);
    },
  );
}


// ============================================================================
// 31. forEach() WITH ARROW FUNCTION
// ============================================================================

void forEachArrowExample() {
  final numbers = [1, 2, 3, 4, 5];

  numbers.forEach(
    (number) => print(number),
  );
}


// ============================================================================
// 32. SPREAD OPERATOR (...)
// ============================================================================
//
// The spread operator inserts elements of one collection into another.
//
// ============================================================================

void spreadExample() {
  final first = [
    "Phone",
    "Laptop",
  ];

  final second = [
    "Tablet",
    "Monitor",
  ];

  final allProducts = [
    ...first,
    ...second,
  ];

  print(allProducts);
}


// ============================================================================
// 33. NULL-AWARE SPREAD (...?)
// ============================================================================
//
// If a collection might be null:
//
//   ...?
//
// prevents an error.
//
// ============================================================================

void nullAwareSpreadExample() {
  List<String>? products;

  final allProducts = [
    "Phone",
    ...?products,
  ];

  print(allProducts);
}


// ============================================================================
// 34. COLLECTION-IF
// ============================================================================
//
// You can conditionally include an item.
//
// ============================================================================

void collectionIfExample() {
  final isAdmin = true;

  final menu = [
    "Dashboard",
    "Products",
    if (isAdmin) "Admin Panel",
    "Profile",
  ];

  print(menu);
}


// ============================================================================
// 35. COLLECTION-IF WITH ELSE
// ============================================================================

void collectionIfElseExample() {
  final isLoggedIn = true;

  final menu = [
    "Home",
    if (isLoggedIn) "Logout" else "Login",
  ];

  print(menu);
}


// ============================================================================
// 36. COLLECTION-FOR
// ============================================================================
//
// You can generate collection elements using a loop.
//
// ============================================================================

void collectionForExample() {
  final numbers = [1, 2, 3, 4, 5];

  final squares = [
    for (final number in numbers) number * number,
  ];

  print(squares);
}


// ============================================================================
// 37. COLLECTION-FOR + IF
// ============================================================================

void collectionForIfExample() {
  final numbers = [1, 2, 3, 4, 5, 6];

  final evenNumbers = [
    for (final number in numbers)
      if (number.isEven) number,
  ];

  print(evenNumbers);
}


// ============================================================================
// 38. COPY LIST
// ============================================================================
//
// This:
//
//   final second = first;
//
// does NOT create an independent List.
//
// Both variables point to the same List object.
//
// ============================================================================

void listReferenceExample() {
  final first = [1, 2, 3];

  final second = first;

  second.add(4);

  print(first);
}


// ============================================================================
// 39. ACTUAL LIST COPY
// ============================================================================

void listCopyExample() {
  final first = [1, 2, 3];

  final second = [
    ...first,
  ];

  second.add(4);

  print(first);
  print(second);
}


// ============================================================================
// 40. SUBLIST
// ============================================================================

void sublistExample() {
  final numbers = [
    10,
    20,
    30,
    40,
    50,
  ];

  final result = numbers.sublist(1, 4);

  print(result);

  // [20, 30, 40]
}


// ============================================================================
// 41. TAKE()
// ============================================================================
//
// Returns the first N elements as an Iterable.
//
// ============================================================================

void takeExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final result = numbers.take(3).toList();

  print(result);
}


// ============================================================================
// 42. SKIP()
// ============================================================================
//
// Skips the first N elements.
//
// ============================================================================

void skipExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final result = numbers.skip(2).toList();

  print(result);
}


// ============================================================================
// 43. TAKE + SKIP
// ============================================================================
//
// Useful for pagination-like operations.
//
// ============================================================================

void takeSkipExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  final page = numbers
      .skip(2)
      .take(2)
      .toList();

  print(page);

  // [3, 4]
}


// ============================================================================
// 44. where()
// ============================================================================
//
// where() filters elements.
//
// ============================================================================

void whereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  final evenNumbers = numbers
      .where((number) => number.isEven)
      .toList();

  print(evenNumbers);
}


// ============================================================================
// 45. where() WITH STRING
// ============================================================================

void stringWhereExample() {
  final products = [
    "iPhone",
    "Samsung",
    "Laptop",
    "iPad",
  ];

  final result = products
      .where(
        (product) => product.toLowerCase().contains("i"),
      )
      .toList();

  print(result);
}


// ============================================================================
// 46. map()
// ============================================================================
//
// map() transforms every element.
//
// Input:
//
//   [1,2,3]
//
// Output:
//
//   [2,4,6]
//
// ============================================================================

void mapExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled = numbers
      .map((number) => number * 2)
      .toList();

  print(doubled);
}


// ============================================================================
// 47. MAP STRING TRANSFORMATION
// ============================================================================

void mapStringExample() {
  final names = [
    "palash",
    "rahim",
    "karim",
  ];

  final upperNames = names
      .map((name) => name.toUpperCase())
      .toList();

  print(upperNames);
}


// ============================================================================
// 48. where() + map()
// ============================================================================
//
// First filter.
// Then transform.
//
// ============================================================================

void whereMapExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  final result = numbers
      .where((number) => number.isEven)
      .map((number) => number * 10)
      .toList();

  print(result);

  // [20, 40, 60]
}


// ============================================================================
// 49. any()
// ============================================================================
//
// Returns true if at least ONE element satisfies the condition.
//
// ============================================================================

void anyExample() {
  final numbers = [
    1,
    3,
    5,
    8,
  ];

  final hasEven = numbers.any(
    (number) => number.isEven,
  );

  print(hasEven);
}


// ============================================================================
// 50. every()
// ============================================================================
//
// Returns true if ALL elements satisfy the condition.
//
// ============================================================================

void everyExample() {
  final numbers = [
    2,
    4,
    6,
    8,
  ];

  final allEven = numbers.every(
    (number) => number.isEven,
  );

  print(allEven);
}


// ============================================================================
// 51. contains()
// ============================================================================

void containsCollectionExample() {
  final roles = [
    "admin",
    "employee",
    "vendor",
  ];

  print(roles.contains("admin"));
}


// ============================================================================
// 52. firstWhere()
// ============================================================================
//
// Finds the first element matching a condition.
//
// ============================================================================

void firstWhereExample() {
  final numbers = [
    1,
    3,
    4,
    6,
  ];

  final result = numbers.firstWhere(
    (number) => number.isEven,
  );

  print(result);

  // 4
}


// ============================================================================
// 53. firstWhere() WITH orElse
// ============================================================================
//
// If nothing matches, normal firstWhere() throws an error.
//
// Use orElse when appropriate.
//
// ============================================================================

void firstWhereOrElseExample() {
  final numbers = [
    1,
    3,
    5,
  ];

  final result = numbers.firstWhere(
    (number) => number.isEven,
    orElse: () => -1,
  );

  print(result);

  // -1
}


// ============================================================================
// 54. singleWhere()
// ============================================================================
//
// singleWhere() expects exactly ONE matching element.
//
// If zero or multiple elements match, it throws an error unless orElse is
// supplied.
//
// ============================================================================

void singleWhereExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final result = numbers.singleWhere(
    (number) => number == 2,
  );

  print(result);
}


// ============================================================================
// 55. REDUCE()
// ============================================================================
//
// reduce combines elements into one result.
//
// Example:
//
//   [1,2,3,4]
//
// becomes:
//
//   10
//
// ============================================================================

void reduceExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final total = numbers.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// ============================================================================
// 56. REDUCE WARNING
// ============================================================================
//
// reduce() cannot work on an empty List.
//
// If the collection might be empty, fold() is often safer.
//
// ============================================================================


// ============================================================================
// 57. fold()
// ============================================================================
//
// fold() starts with an initial value.
//
// ============================================================================

void foldExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final total = numbers.fold<int>(
    0,
    (sum, number) => sum + number,
  );

  print(total);
}


// ============================================================================
// 58. fold() WITH EMPTY LIST
// ============================================================================

void emptyFoldExample() {
  final numbers = <int>[];

  final total = numbers.fold<int>(
    0,
    (sum, number) => sum + number,
  );

  print(total);

  // 0
}


// ============================================================================
// 59. REDUCE VS FOLD
// ============================================================================
//
// reduce():
//
//   • Uses first element as initial value
//   • Empty list is a problem
//
// fold():
//
//   • You provide initial value
//   • Works naturally with empty collections
//
// For production business calculations, fold() is often very useful.
//
// ============================================================================


// ============================================================================
// 60. SORT()
// ============================================================================
//
// sort() changes the original List.
//
// ============================================================================

void sortExample() {
  final numbers = [
    50,
    10,
    40,
    20,
    30,
  ];

  numbers.sort();

  print(numbers);
}


// ============================================================================
// 61. SORT DESCENDING
// ============================================================================

void sortDescendingExample() {
  final numbers = [
    50,
    10,
    40,
    20,
    30,
  ];

  numbers.sort(
    (a, b) => b.compareTo(a),
  );

  print(numbers);
}


// ============================================================================
// 62. SORT STRINGS
// ============================================================================

void sortStringExample() {
  final names = [
    "Rahim",
    "Palash",
    "Karim",
  ];

  names.sort();

  print(names);
}


// ============================================================================
// 63. CUSTOM SORTING
// ============================================================================
//
// Example: sort products by price.
//
// ============================================================================

void customSortExample() {
  final products = [
    {
      "name": "Phone",
      "price": 50000,
    },
    {
      "name": "Laptop",
      "price": 100000,
    },
    {
      "name": "Tablet",
      "price": 30000,
    },
  ];

  products.sort(
    (a, b) =>
        (a["price"] as int).compareTo(
          b["price"] as int,
        ),
  );

  print(products);
}


// ============================================================================
// 64. SORT BY NAME
// ============================================================================

void sortByNameExample() {
  final products = [
    {
      "name": "Phone",
      "price": 50000,
    },
    {
      "name": "Laptop",
      "price": 100000,
    },
    {
      "name": "Tablet",
      "price": 30000,
    },
  ];

  products.sort(
    (a, b) =>
        (a["name"] as String).compareTo(
          b["name"] as String,
        ),
  );

  print(products);
}


// ============================================================================
// 65. REVERSE
// ============================================================================
//
// reversed returns an Iterable in reverse order.
//
// ============================================================================

void reversedExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final reversed = numbers.reversed.toList();

  print(reversed);
}


// ============================================================================
// 66. toList()
// ============================================================================
//
// Many Iterable operations return Iterable.
//
// Convert back to List using:
//
//   toList()
//
// ============================================================================

void toListExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final evenNumbers = numbers
      .where((number) => number.isEven);

  final list = evenNumbers.toList();

  print(list);
}


// ============================================================================
// 67. toSet()
// ============================================================================

void toSetExample() {
  final numbers = [
    1,
    2,
    2,
    3,
    3,
    3,
  ];

  final uniqueNumbers = numbers.toSet();

  print(uniqueNumbers);
}


// ============================================================================
// 68. SET BASICS
// ============================================================================
//
// Set stores UNIQUE values.
//
// ============================================================================

void setBasics() {
  final roles = <String>{
    "admin",
    "employee",
    "vendor",
  };

  print(roles);
}


// ============================================================================
// 69. SET AUTOMATICALLY REMOVES DUPLICATES
// ============================================================================

void setDuplicateExample() {
  final roles = <String>{
    "admin",
    "admin",
    "vendor",
    "vendor",
  };

  print(roles);
}


// ============================================================================
// 70. EMPTY SET
// ============================================================================
//
// IMPORTANT:
//
//   {} alone creates a Map.
//
// To create an empty Set:
//
//   <String>{}
//
// ============================================================================

void emptySetExample() {
  final roles = <String>{};

  print(roles);
}


// ============================================================================
// 71. SET ADD
// ============================================================================

void setAddExample() {
  final roles = <String>{
    "admin",
  };

  roles.add("vendor");
  roles.add("admin");

  print(roles);
}


// ============================================================================
// 72. SET REMOVE
// ============================================================================

void setRemoveExample() {
  final roles = <String>{
    "admin",
    "vendor",
  };

  roles.remove("vendor");

  print(roles);
}


// ============================================================================
// 73. SET CONTAINS
// ============================================================================

void setContainsExample() {
  final roles = <String>{
    "admin",
    "vendor",
  };

  print(roles.contains("admin"));
}


// ============================================================================
// 74. SET UNION
// ============================================================================

void setUnionExample() {
  final first = {
    "admin",
    "employee",
  };

  final second = {
    "employee",
    "vendor",
  };

  final result = first.union(second);

  print(result);
}


// ============================================================================
// 75. SET INTERSECTION
// ============================================================================

void setIntersectionExample() {
  final first = {
    "admin",
    "employee",
  };

  final second = {
    "employee",
    "vendor",
  };

  final result = first.intersection(second);

  print(result);
}


// ============================================================================
// 76. SET DIFFERENCE
// ============================================================================

void setDifferenceExample() {
  final first = {
    "admin",
    "employee",
  };

  final second = {
    "employee",
    "vendor",
  };

  final result = first.difference(second);

  print(result);
}


// ============================================================================
// 77. MAP BASICS
// ============================================================================
//
// Map stores:
//
//   key → value
//
// Example:
//
//   "name" → "Palash"
//   "age"  → 24
//
// ============================================================================

void mapBasics() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
    "isAdmin": true,
  };

  print(user);
}


// ============================================================================
// 78. TYPED MAP
// ============================================================================

void typedMapExample() {
  final prices = <String, double>{
    "Phone": 50000,
    "Laptop": 100000,
    "Tablet": 30000,
  };

  print(prices);
}


// ============================================================================
// 79. ACCESS MAP VALUE
// ============================================================================

void mapAccessExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  print(user["name"]);
  print(user["age"]);
}


// ============================================================================
// 80. MAP ACCESS WITH UNKNOWN KEY
// ============================================================================
//
// If the key does not exist, map[key] returns null.
//
// ============================================================================

void missingMapKeyExample() {
  final user = <String, dynamic>{
    "name": "Palash",
  };

  print(user["phone"]);
}


// ============================================================================
// 81. ADD MAP VALUE
// ============================================================================

void mapAddExample() {
  final user = <String, dynamic>{
    "name": "Palash",
  };

  user["age"] = 24;

  print(user);
}


// ============================================================================
// 82. UPDATE MAP VALUE
// ============================================================================

void mapUpdateExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  user["age"] = 25;

  print(user);
}


// ============================================================================
// 83. REMOVE MAP VALUE
// ============================================================================

void mapRemoveExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  user.remove("age");

  print(user);
}


// ============================================================================
// 84. MAP KEYS
// ============================================================================

void mapKeysExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  print(user.keys);
}


// ============================================================================
// 85. MAP VALUES
// ============================================================================

void mapValuesExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  print(user.values);
}


// ============================================================================
// 86. MAP ENTRIES
// ============================================================================
//
// Each entry contains:
//
//   key
//   value
//
// ============================================================================

void mapEntriesExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  for (final entry in user.entries) {
    print("${entry.key}: ${entry.value}");
  }
}


// ============================================================================
// 87. MAP forEach()
// ============================================================================

void mapForEachExample() {
  final prices = <String, double>{
    "Phone": 50000,
    "Laptop": 100000,
  };

  prices.forEach(
    (product, price) {
      print("$product = $price");
    },
  );
}


// ============================================================================
// 88. MAP containsKey()
// ============================================================================

void containsKeyExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
  };

  print(user.containsKey("name"));
  print(user.containsKey("phone"));
}


// ============================================================================
// 89. MAP containsValue()
// ============================================================================

void containsValueExample() {
  final roles = <String, String>{
    "Palash": "admin",
    "Rahim": "employee",
  };

  print(roles.containsValue("admin"));
}


// ============================================================================
// 90. MAP update()
// ============================================================================
//
// update() changes an existing value.
//
// ============================================================================

void mapUpdateMethodExample() {
  final stock = <String, int>{
    "Phone": 10,
  };

  stock.update(
    "Phone",
    (value) => value + 5,
  );

  print(stock);
}


// ============================================================================
// 91. MAP putIfAbsent()
// ============================================================================
//
// Adds a value only if the key doesn't already exist.
//
// ============================================================================

void putIfAbsentExample() {
  final user = <String, String>{
    "name": "Palash",
  };

  user.putIfAbsent(
    "role",
    () => "admin",
  );

  print(user);
}


// ============================================================================
// 92. NESTED MAP
// ============================================================================

void nestedMapExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "address": {
      "city": "Dhaka",
      "country": "Bangladesh",
    },
  };

  print(user["address"]);
}


// ============================================================================
// 93. LIST OF MAPS
// ============================================================================
//
// This structure appears constantly when working with API/JSON data.
//
// ============================================================================

void listOfMapsExample() {
  final products = <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "Phone",
      "price": 50000,
    },
    {
      "id": "P002",
      "name": "Laptop",
      "price": 100000,
    },
  ];

  print(products);
}


// ============================================================================
// 94. ACCESS LIST OF MAPS
// ============================================================================

void listOfMapsAccessExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "price": 50000,
    },
    {
      "name": "Laptop",
      "price": 100000,
    },
  ];

  print(products[0]["name"]);
  print(products[1]["price"]);
}


// ============================================================================
// 95. FILTER PRODUCTS
// ============================================================================

void filterProductsExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "category": "Electronics",
      "price": 50000,
    },
    {
      "name": "Shirt",
      "category": "Fashion",
      "price": 2000,
    },
    {
      "name": "Laptop",
      "category": "Electronics",
      "price": 100000,
    },
  ];

  final electronics = products
      .where(
        (product) =>
            product["category"] == "Electronics",
      )
      .toList();

  print(electronics);
}


// ============================================================================
// 96. TRANSFORM PRODUCTS
// ============================================================================

void transformProductsExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "price": 50000,
    },
    {
      "name": "Laptop",
      "price": 100000,
    },
  ];

  final names = products
      .map(
        (product) => product["name"] as String,
      )
      .toList();

  print(names);
}


// ============================================================================
// 97. CALCULATE PRODUCT TOTAL
// ============================================================================

void productTotalExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "price": 50000,
      "quantity": 2,
    },
    {
      "name": "Laptop",
      "price": 100000,
      "quantity": 1,
    },
  ];

  final total = products.fold<double>(
    0,
    (sum, product) {
      final price = product["price"] as num;
      final quantity = product["quantity"] as int;

      return sum + (price * quantity);
    },
  );

  print(total);
}


// ============================================================================
// 98. FIND PRODUCT BY ID
// ============================================================================

Map<String, dynamic>? findProductById(
  List<Map<String, dynamic>> products,
  String id,
) {
  for (final product in products) {
    if (product["id"] == id) {
      return product;
    }
  }

  return null;
}


// ============================================================================
// 99. FIND PRODUCT USING firstWhere()
// ============================================================================

Map<String, dynamic>? findProductByIdUsingWhere(
  List<Map<String, dynamic>> products,
  String id,
) {
  final matches = products.where(
    (product) => product["id"] == id,
  );

  if (matches.isEmpty) {
    return null;
  }

  return matches.first;
}


// ============================================================================
// 100. UNIQUE CATEGORIES
// ============================================================================
//
// Convert List → Set to remove duplicates.
//
// ============================================================================

void uniqueCategoriesExample() {
  final categories = [
    "Phone",
    "Laptop",
    "Phone",
    "Tablet",
    "Laptop",
  ];

  final uniqueCategories = categories.toSet();

  print(uniqueCategories);
}


// ============================================================================
// 101. whereType()
// ============================================================================
//
// Useful when working with mixed/dynamic collections.
//
// ============================================================================

void whereTypeExample() {
  final values = [
    "Palash",
    24,
    99.5,
    true,
    "Flutter",
  ];

  final strings = values
      .whereType<String>()
      .toList();

  final integers = values
      .whereType<int>()
      .toList();

  print(strings);
  print(integers);
}


// ============================================================================
// 102. EXPAND()
// ============================================================================
//
// expand() flattens nested collections.
//
// Example:
//
//   [
//     [1,2],
//     [3,4],
//   ]
//
// becomes:
//
//   [1,2,3,4]
//
// ============================================================================

void expandExample() {
  final nestedNumbers = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  final numbers = nestedNumbers
      .expand((list) => list)
      .toList();

  print(numbers);
}


// ============================================================================
// 103. PRACTICAL ERP — PRODUCT VARIANTS
// ============================================================================

void productVariantExample() {
  final products = [
    {
      "name": "T-Shirt",
      "variants": [
        {
          "size": "M",
          "stock": 10,
        },
        {
          "size": "L",
          "stock": 5,
        },
      ],
    },
    {
      "name": "Shirt",
      "variants": [
        {
          "size": "M",
          "stock": 8,
        },
      ],
    },
  ];

  final allVariants = products
      .expand(
        (product) =>
            product["variants"] as List<Map<String, dynamic>>,
      )
      .toList();

  print(allVariants);
}


// ============================================================================
// 104. SEARCH PRODUCTS
// ============================================================================

List<Map<String, dynamic>> searchProducts(
  List<Map<String, dynamic>> products,
  String query,
) {
  final normalizedQuery = query.toLowerCase();

  return products.where(
    (product) {
      final name =
          (product["name"] as String).toLowerCase();

      return name.contains(normalizedQuery);
    },
  ).toList();
}


// ============================================================================
// 105. FILTER PRODUCTS BY PRICE
// ============================================================================

List<Map<String, dynamic>> filterByPrice(
  List<Map<String, dynamic>> products,
  double maxPrice,
) {
  return products.where(
    (product) {
      final price = product["price"] as num;

      return price <= maxPrice;
    },
  ).toList();
}


// ============================================================================
// 106. SORT PRODUCTS BY PRICE
// ============================================================================

List<Map<String, dynamic>> sortProductsByPrice(
  List<Map<String, dynamic>> products,
) {
  final result = [
    ...products,
  ];

  result.sort(
    (a, b) {
      final priceA = a["price"] as num;
      final priceB = b["price"] as num;

      return priceA.compareTo(priceB);
    },
  );

  return result;
}


// ============================================================================
// 107. IMPORTANT — DO NOT MUTATE ORIGINAL DATA UNNECESSARILY
// ============================================================================
//
// sort() changes the original list.
//
// If you don't want that:
//
//   final result = [...products];
//
// Then sort result.
//
// This is particularly important when working with Flutter state.
//
// ============================================================================


// ============================================================================
// 108. PAGINATION LOGIC
// ============================================================================
//
// Example:
//
// page = 2
// pageSize = 10
//
// skip = (page - 1) * pageSize
//
// ============================================================================

List<T> paginate<T>(
  List<T> items, {
  required int page,
  required int pageSize,
}) {
  if (page <= 0 || pageSize <= 0) {
    return [];
  }

  final start = (page - 1) * pageSize;

  if (start >= items.length) {
    return [];
  }

  final end = (start + pageSize)
      .clamp(0, items.length);

  return items.sublist(
    start,
    end,
  );
}


// ============================================================================
// 109. PAGINATION EXAMPLE
// ============================================================================

void paginationExample() {
  final products = List.generate(
    25,
    (index) => "Product ${index + 1}",
  );

  final page2 = paginate(
    products,
    page: 2,
    pageSize: 10,
  );

  print(page2);
}


// ============================================================================
// 110. JSON-LIKE API RESPONSE
// ============================================================================
//
// API responses often look like:
//
// {
//   "success": true,
//   "data": [
//     {...},
//     {...},
//   ]
// }
//
// ============================================================================

void apiDataExample() {
  final response = <String, dynamic>{
    "success": true,
    "data": [
      {
        "id": "P001",
        "name": "Phone",
      },
      {
        "id": "P002",
        "name": "Laptop",
      },
    ],
  };

  final data =
      response["data"] as List<dynamic>;

  print(data);
}


// ============================================================================
// 111. EXTRACT API PRODUCT NAMES
// ============================================================================

void apiProductNamesExample() {
  final response = <String, dynamic>{
    "success": true,
    "data": [
      {
        "id": "P001",
        "name": "Phone",
      },
      {
        "id": "P002",
        "name": "Laptop",
      },
    ],
  };

  final data =
      response["data"] as List<dynamic>;

  final names = data
      .map(
        (item) =>
            (item as Map<String, dynamic>)["name"]
                as String,
      )
      .toList();

  print(names);
}


// ============================================================================
// 112. NULL-SAFE API DATA
// ============================================================================
//
// Real APIs may omit data or return null.
//
// ============================================================================

void nullableApiDataExample() {
  final response = <String, dynamic>{
    "success": true,
    "data": null,
  };

  final data =
      response["data"] as List<dynamic>? ?? [];

  print(data);
}


// ============================================================================
// 113. LIST OF USER IDS → SET
// ============================================================================
//
// Useful when you need uniqueness.
//
// ============================================================================

void uniqueUserIdsExample() {
  final userIds = [
    "U001",
    "U002",
    "U001",
    "U003",
    "U002",
  ];

  final uniqueIds = userIds.toSet();

  print(uniqueIds);
}


// ============================================================================
// 114. CHECK ROLE PERMISSION
// ============================================================================

bool hasPermission(
  Set<String> permissions,
  String requiredPermission,
) {
  return permissions.contains(requiredPermission);
}


// ============================================================================
// 115. PERMISSION EXAMPLE
// ============================================================================

void permissionExample() {
  final permissions = <String>{
    "product.create",
    "product.update",
    "order.view",
  };

  print(
    hasPermission(
      permissions,
      "product.create",
    ),
  );
}


// ============================================================================
// 116. COLLECTION PIPELINE
// ============================================================================
//
// A very important pattern:
//
//   data
//     ↓
//   where()
//     ↓
//   map()
//     ↓
//   toList()
//
// Example:
//
// ============================================================================

void collectionPipelineExample() {
  final prices = [
    100,
    200,
    300,
    400,
    500,
  ];

  final result = prices
      .where((price) => price >= 300)
      .map((price) => price * 2)
      .toList();

  print(result);
}


// ============================================================================
// 117. MORE COMPLEX PIPELINE
// ============================================================================

void complexPipelineExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "price": 50000,
      "active": true,
    },
    {
      "name": "Laptop",
      "price": 100000,
      "active": false,
    },
    {
      "name": "Tablet",
      "price": 30000,
      "active": true,
    },
  ];

  final names = products
      .where(
        (product) => product["active"] == true,
      )
      .where(
        (product) => (product["price"] as num) > 40000,
      )
      .map(
        (product) => product["name"] as String,
      )
      .toList();

  print(names);
}


// ============================================================================
// 118. COUNT ACTIVE PRODUCTS
// ============================================================================

int countActiveProducts(
  List<Map<String, dynamic>> products,
) {
  return products
      .where(
        (product) => product["active"] == true,
      )
      .length;
}


// ============================================================================
// 119. TOTAL STOCK
// ============================================================================

int calculateTotalStock(
  List<Map<String, dynamic>> products,
) {
  return products.fold<int>(
    0,
    (total, product) {
      final stock = product["stock"] as int? ?? 0;

      return total + stock;
    },
  );
}


// ============================================================================
// 120. LOW STOCK PRODUCTS
// ============================================================================

List<Map<String, dynamic>> getLowStockProducts(
  List<Map<String, dynamic>> products, {
  int threshold = 5,
}) {
  return products.where(
    (product) {
      final stock =
          product["stock"] as int? ?? 0;

      return stock <= threshold;
    },
  ).toList();
}


// ============================================================================
// 121. OUT OF STOCK PRODUCTS
// ============================================================================

List<Map<String, dynamic>> getOutOfStockProducts(
  List<Map<String, dynamic>> products,
) {
  return products.where(
    (product) {
      final stock =
          product["stock"] as int? ?? 0;

      return stock <= 0;
    },
  ).toList();
}


// ============================================================================
// 122. CALCULATE ORDER TOTAL
// ============================================================================

double calculateOrderTotalFromItems(
  List<Map<String, dynamic>> items,
) {
  return items.fold<double>(
    0,
    (total, item) {
      final price = item["price"] as num? ?? 0;
      final quantity =
          item["quantity"] as int? ?? 0;

      return total + (price * quantity);
    },
  );
}


// ============================================================================
// 123. GROUPING CONCEPT
// ============================================================================
//
// Dart's standard collection API does not have one universal built-in
// groupBy() method like some other languages.
//
// You can build one using Map.
//
// ============================================================================

Map<String, List<Map<String, dynamic>>> groupProductsByCategory(
  List<Map<String, dynamic>> products,
) {
  final result =
      <String, List<Map<String, dynamic>>>{};

  for (final product in products) {
    final category =
        product["category"] as String;

    result.putIfAbsent(
      category,
      () => [],
    );

    result[category]!.add(product);
  }

  return result;
}


// ============================================================================
// 124. GROUPING EXAMPLE
// ============================================================================

void groupingExample() {
  final products = <Map<String, dynamic>>[
    {
      "name": "Phone",
      "category": "Electronics",
    },
    {
      "name": "Laptop",
      "category": "Electronics",
    },
    {
      "name": "Shirt",
      "category": "Fashion",
    },
  ];

  final grouped =
      groupProductsByCategory(products);

  print(grouped);
}


// ============================================================================
// 125. NESTED COLLECTIONS
// ============================================================================
//
// Example:
//
// List<List<int>>
//
// ============================================================================

void nestedListExample() {
  final matrix = <List<int>>[
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  print(matrix[0][1]);

  // 2
}


// ============================================================================
// 126. FLATTEN NESTED LIST
// ============================================================================

void flattenExample() {
  final matrix = <List<int>>[
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  final flattened = matrix
      .expand((row) => row)
      .toList();

  print(flattened);
}


// ============================================================================
// 127. COLLECTION-IF IN FLUTTER
// ============================================================================
//
// You will frequently see:
//
//   children: [
//     const Text("Dashboard"),
//     if (isAdmin)
//       const Text("Admin"),
//   ]
//
// This is a Dart language feature.
//
// It is NOT a special Flutter feature.
//
// ============================================================================


// ============================================================================
// 128. COLLECTION-FOR IN FLUTTER
// ============================================================================
//
// You will also see:
//
//   children: [
//     for (final product in products)
//       ProductCard(product: product),
//   ]
//
// This is also Dart collection syntax.
//
// ============================================================================


// ============================================================================
// 129. VERY IMPORTANT: Iterable
// ============================================================================
//
// List, Set and many other collections implement Iterable.
//
// Iterable represents a sequence of values that can be traversed.
//
// Methods like:
//
//   where()
//   map()
//   take()
//   skip()
//   any()
//   every()
//   reduce()
//   fold()
//
// commonly work with Iterable.
//
// ============================================================================


// ============================================================================
// 130. LAZY ITERABLE CONCEPT
// ============================================================================
//
// Operations such as where() and map() generally return an Iterable that
// can be evaluated as needed.
//
// Therefore:
//
//   final result = numbers.map(...);
//
// does not necessarily create a new List immediately.
//
// Use:
//
//   .toList()
//
// when you specifically need a List.
//
// ============================================================================


// ============================================================================
// 131. PRACTICAL SEARCH FUNCTION
// ============================================================================

List<Map<String, dynamic>> searchProductsByName(
  List<Map<String, dynamic>> products,
  String query,
) {
  final normalized =
      query.trim().toLowerCase();

  if (normalized.isEmpty) {
    return [
      ...products,
    ];
  }

  return products.where(
    (product) {
      final name =
          product["name"] as String? ?? "";

      return name
          .toLowerCase()
          .contains(normalized);
    },
  ).toList();
}


// ============================================================================
// 132. PRACTICAL PRICE RANGE FILTER
// ============================================================================

List<Map<String, dynamic>> filterProductsByPriceRange(
  List<Map<String, dynamic>> products, {
  required double minimum,
  required double maximum,
}) {
  return products.where(
    (product) {
      final price =
          (product["price"] as num?)?.toDouble() ?? 0;

      return price >= minimum &&
          price <= maximum;
    },
  ).toList();
}


// ============================================================================
// 133. PRACTICAL MULTI-CONDITION FILTER
// ============================================================================

List<Map<String, dynamic>> getAvailableProducts(
  List<Map<String, dynamic>> products,
) {
  return products.where(
    (product) {
      final active =
          product["active"] as bool? ?? false;

      final stock =
          product["stock"] as int? ?? 0;

      return active && stock > 0;
    },
  ).toList();
}


// ============================================================================
// 134. PRACTICAL ORDER STATUS FILTER
// ============================================================================

List<Map<String, dynamic>> filterOrdersByStatus(
  List<Map<String, dynamic>> orders,
  String status,
) {
  return orders.where(
    (order) {
      return order["status"] == status;
    },
  ).toList();
}


// ============================================================================
// 135. UNIQUE ORDER STATUSES
// ============================================================================

Set<String> getOrderStatuses(
  List<Map<String, dynamic>> orders,
) {
  return orders
      .map(
        (order) =>
            order["status"] as String,
      )
      .toSet();
}


// ============================================================================
// 136. CALCULATE AVERAGE
// ============================================================================

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final total = numbers.fold<double>(
    0,
    (sum, number) => sum + number,
  );

  return total / numbers.length;
}


// ============================================================================
// 137. MINIMUM / MAXIMUM
// ============================================================================
//
// List does not directly provide every numerical aggregation you might
// want in the exact form you expect.
//
// You can implement business-specific calculations.
//
// ============================================================================

double findMaximum(List<double> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var maximum = numbers.first;

  for (final number in numbers.skip(1)) {
    if (number > maximum) {
      maximum = number;
    }
  }

  return maximum;
}


// ============================================================================
// 138. FIND MINIMUM
// ============================================================================

double findMinimum(List<double> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var minimum = numbers.first;

  for (final number in numbers.skip(1)) {
    if (number < minimum) {
      minimum = number;
    }
  }

  return minimum;
}


// ============================================================================
// 139. PRACTICAL DASHBOARD STATISTICS
// ============================================================================

Map<String, dynamic> calculateDashboardStats(
  List<Map<String, dynamic>> orders,
) {
  final totalOrders = orders.length;

  final completedOrders = orders.where(
    (order) => order["status"] == "completed",
  );

  final pendingOrders = orders.where(
    (order) => order["status"] == "pending",
  );

  final revenue = completedOrders.fold<double>(
    0,
    (total, order) {
      final amount =
          (order["amount"] as num?)?.toDouble() ?? 0;

      return total + amount;
    },
  );

  return {
    "totalOrders": totalOrders,
    "completedOrders": completedOrders.length,
    "pendingOrders": pendingOrders.length,
    "revenue": revenue,
  };
}


// ============================================================================
// 140. IMPORTANT COLLECTION RULES TO REMEMBER
// ============================================================================
//
// LIST:
//
//   Ordered
//   Duplicates allowed
//   Index based
//
// SET:
//
//   Unique values
//   No duplicate values
//
// MAP:
//
//   Key-value pairs
//
// where():
//
//   Filter
//
// map():
//
//   Transform
//
// reduce():
//
//   Combine using first item as initial value
//
// fold():
//
//   Combine using your own initial value
//
// any():
//
//   At least one?
//
// every():
//
//   All?
//
// firstWhere():
//
//   First matching element
//
// singleWhere():
//
//   Exactly one matching element
//
// take():
//
//   Take first N
//
// skip():
//
//   Skip first N
//
// expand():
//
//   Flatten/expand nested collections
//
// toList():
//
//   Convert Iterable → List
//
// toSet():
//
//   Convert collection → Set
//
// ============================================================================


// ============================================================================
// 141. MOST IMPORTANT DIFFERENCE
// ============================================================================
//
// where() = FILTER
//
// Example:
//
//   [1,2,3,4]
//       ↓ where(even)
//   [2,4]
//
//
// map() = TRANSFORM
//
// Example:
//
//   [1,2,3]
//       ↓ map(*10)
//   [10,20,30]
//
//
// reduce()/fold() = AGGREGATE
//
// Example:
//
//   [1,2,3,4]
//       ↓
//   10
//
// ============================================================================


// ============================================================================
// 142. PHASE 4 PRACTICE — BEGINNER
// ============================================================================
//
// 1. Create a List of 10 names.
// 2. Add 2 names.
// 3. Remove 1 name.
// 4. Update one name.
// 5. Print first and last.
// 6. Check whether "Palash" exists.
// 7. Print all names using for-in.
// 8. Convert all names to uppercase using map().
//
// ============================================================================


// ============================================================================
// 143. PHASE 4 PRACTICE — INTERMEDIATE
// ============================================================================
//
// Create:
//
//   List<int> numbers = [
//
//     12,
//     7,
//     25,
//     4,
//     18,
//     9,
//   ];
//
// Tasks:
//
//   ✓ Find even numbers.
//   ✓ Find numbers > 10.
//   ✓ Multiply every number by 2.
//   ✓ Calculate total.
//   ✓ Calculate average.
//   ✓ Sort ascending.
//   ✓ Sort descending.
//   ✓ Find first number > 20.
//
// ============================================================================


// ============================================================================
// 144. PHASE 4 PRACTICE — SET
// ============================================================================
//
// Create:
//
//   ["admin", "admin", "vendor", "employee", "vendor"]
//
// Convert to Set.
//
// Then:
//
//   ✓ Print unique roles.
//   ✓ Check admin.
//   ✓ Add "manager".
//   ✓ Remove "vendor".
//
// ============================================================================


// ============================================================================
// 145. PHASE 4 PRACTICE — MAP
// ============================================================================
//
// Create a user:
//
//   name
//   email
//   age
//   role
//
// Then:
//
//   ✓ Read values.
//   ✓ Update role.
//   ✓ Add phone.
//   ✓ Remove age.
//   ✓ Check whether email exists.
//   ✓ Loop through entries.
//
// ============================================================================


// ============================================================================
// 146. PHASE 4 PRACTICE — ERP PRODUCT SYSTEM
// ============================================================================
//
// Create 10 products.
//
// Every product should have:
//
//   id
//   name
//   category
//   price
//   stock
//   active
//
// Then implement:
//
//   ✓ Search by name
//   ✓ Filter by category
//   ✓ Filter by price
//   ✓ Find out-of-stock products
//   ✓ Find low-stock products
//   ✓ Find active products
//   ✓ Sort by price
//   ✓ Sort by name
//   ✓ Calculate total stock
//   ✓ Calculate total inventory value
//   ✓ Get unique categories
//
// ============================================================================


// ============================================================================
// 147. PHASE 4 PRACTICE — ORDER SYSTEM
// ============================================================================
//
// Create orders containing:
//
//   orderId
//   customer
//   status
//   amount
//
// Then calculate:
//
//   ✓ Total orders
//   ✓ Completed orders
//   ✓ Pending orders
//   ✓ Cancelled orders
//   ✓ Total completed revenue
//   ✓ Average order value
//   ✓ Unique statuses
//
// ============================================================================


// ============================================================================
// 148. PHASE 4 PRACTICE — API DATA
// ============================================================================
//
// Given:
//
//   Map<String, dynamic> response
//
// containing:
//
//   success
//   data
//
// Extract:
//
//   ✓ Product list
//   ✓ Product names
//   ✓ Product IDs
//   ✓ Active products
//   ✓ Products under a price
//   ✓ Total stock
//
// ============================================================================


// ============================================================================
// 149. PHASE 4 PRACTICE — FLUTTER PREPARATION
// ============================================================================
//
// Practice generating a list of UI-like strings:
//
//   final widgets = [
//     for (final product in products)
//       "Product: ${product["name"]}",
//   ];
//
// Then practice conditional collection:
//
//   final menu = [
//     "Dashboard",
//     if (isAdmin) "Users",
//     if (isAdmin) "Reports",
//   ];
//
// These are directly useful when you start building Flutter screens.
//
// ============================================================================


// ============================================================================
// 150. PHASE 4 — MASTER CHALLENGE
// ============================================================================
//
// Build a complete in-memory mini ERP inventory system.
//
//
//
// PRODUCT:
//
//   id
//   name
//   category
//   price
//   stock
//   active
//
//
// FUNCTIONS:
//
//   addProduct()
//   removeProduct()
//   updateProduct()
//   findProduct()
//   searchProducts()
//   filterByCategory()
//   filterByPrice()
//   getLowStockProducts()
//   getOutOfStockProducts()
//   getActiveProducts()
//   calculateTotalStock()
//   calculateInventoryValue()
//   getUniqueCategories()
//   sortByPrice()
//   sortByName()
//   paginateProducts()
//
//
// Requirements:
//
//   • Never allow negative stock.
//   • Searching should be case-insensitive.
//   • Filtering should not destroy the original list.
//   • Sorting should preferably work on a copy if original ordering matters.
//   • Empty lists should be handled safely.
//   • Use typed collections wherever possible.
//
// ============================================================================


// ============================================================================
// PHASE 4 FINAL CHECKLIST
// ============================================================================
//
// Before moving to Phase 5, you should understand:
//
//   [ ] List
//   [ ] Set
//   [ ] Map
//   [ ] Iterable
//   [ ] add()
//   [ ] addAll()
//   [ ] insert()
//   [ ] insertAll()
//   [ ] remove()
//   [ ] removeAt()
//   [ ] removeWhere()
//   [ ] clear()
//   [ ] contains()
//   [ ] indexOf()
//   [ ] first
//   [ ] last
//   [ ] length
//   [ ] isEmpty
//   [ ] isNotEmpty
//   [ ] for loop
//   [ ] for-in
//   [ ] forEach()
//   [ ] where()
//   [ ] map()
//   [ ] reduce()
//   [ ] fold()
//   [ ] any()
//   [ ] every()
//   [ ] firstWhere()
//   [ ] singleWhere()
//   [ ] take()
//   [ ] skip()
//   [ ] expand()
//   [ ] sort()
//   [ ] reversed
//   [ ] sublist()
//   [ ] toList()
//   [ ] toSet()
//   [ ] whereType()
//   [ ] spread (...)
//   [ ] null-aware spread (...?)
//   [ ] collection-if
//   [ ] collection-for
//   [ ] nested collections
//   [ ] List<Map<String, dynamic>>
//   [ ] Map<String, dynamic>
//   [ ] filtering API data
//   [ ] transforming API data
//   [ ] calculating totals
//   [ ] searching data
//   [ ] sorting data
//   [ ] pagination basics
//
// ============================================================================
//
// VERY IMPORTANT FOR YOUR FULL-STACK FLUTTER GOAL:
//
// These collection concepts will repeatedly appear in:
//
//   Flutter:
//     ListView.builder
//     GridView.builder
//     Dropdowns
//     Menus
//     Tables
//     Forms
//     State management
//
//   API:
//     JSON arrays
//     API response parsing
//     filtering
//     pagination
//     search
//
//   ERP:
//     Products
//     Variants
//     Orders
//     Customers
//     Suppliers
//     Warehouses
//     Stock
//     Reports
//     Permissions
//     Dashboard statistics
//
// ============================================================================
//
// NEXT PHASE:
//
// PHASE 5 — DART NULL SAFETY + EXCEPTIONS + ERROR HANDLING
//
// You will learn:
//
//   • Null safety deeply
//   • nullable types
//   • non-nullable types
//   • ?
//   • !
//   • ??
//   • ??=
//   • ?. 
//   • null-aware method calls
//   • null-aware property access
//   • late
//   • required
//   • assert
//   • exceptions
//   • throw
//   • try
//   • catch
//   • on
//   • finally
//   • rethrow
//   • custom exceptions
//   • production API error handling
//   • Flutter error handling patterns
//
// ============================================================================