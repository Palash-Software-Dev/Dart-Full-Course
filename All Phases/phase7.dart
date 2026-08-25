// ============================================================================
// DART MASTER ROADMAP
// PHASE 7 — COLLECTIONS + FUNCTIONAL PROGRAMMING
// ============================================================================
//
// Goal:
// Master Dart collections and functional programming deeply enough to work
// confidently with real Flutter applications, REST APIs, JSON, state
// management, ERP data, filtering, searching, sorting, pagination, reports,
// dashboards and business logic.
//
// This phase is extremely important for Flutter development because you will
// constantly work with:
//
//   List<Product>
//   List<Order>
//   List<User>
//   Map<String, dynamic>
//   Set<String>
//   API JSON arrays
//   filtered lists
//   sorted lists
//   transformed data
//
// ============================================================================
//
// PHASE 7 TOPICS
//
// COLLECTIONS
// 01. Collection overview
// 02. List
// 03. List creation
// 04. List indexing
// 05. List length
// 06. List first/last
// 07. List add
// 08. List addAll
// 09. List insert
// 10. List insertAll
// 11. List remove
// 12. List removeAt
// 13. List removeLast
// 14. List removeWhere
// 15. List retainWhere
// 16. List clear
// 17. List contains
// 18. List indexOf
// 19. List lastIndexOf
// 20. List sublist
//
// 21. Set
// 22. Set uniqueness
// 23. Set add
// 24. Set addAll
// 25. Set remove
// 26. Set contains
// 27. Set union
// 28. Set intersection
// 29. Set difference
//
// 30. Map
// 31. Map keys
// 32. Map values
// 33. Map entries
// 34. Map add
// 35. Map update
// 36. Map putIfAbsent
// 37. Map remove
// 38. Map containsKey
// 39. Map containsValue
// 40. Map iteration
//
// ITERABLE
//
// 41. Iterable
// 42. where()
// 43. map()
// 44. expand()
// 45. reduce()
// 46. fold()
// 47. forEach()
// 48. any()
// 49. every()
// 50. contains()
// 51. first
// 52. last
// 53. firstWhere()
// 54. lastWhere()
// 55. singleWhere()
// 56. take()
// 57. takeWhile()
// 58. skip()
// 59. skipWhile()
// 60. toList()
// 61. toSet()
//
// FUNCTIONAL PROGRAMMING
//
// 62. Functions as objects
// 63. Anonymous functions
// 64. Higher-order functions
// 65. Callback functions
// 66. Closures
// 67. Lexical scope
// 68. Function parameters
// 69. Function return types
// 70. Function typedef
// 71. Tear-offs
// 72. Function composition
//
// DART COLLECTION FEATURES
//
// 73. Spread operator
// 74. Null-aware spread
// 75. Collection-if
// 76. Collection-for
// 77. Cascade operator
// 78. Nested collections
// 79. Collection transformation
//
// REAL APPLICATION
//
// 80. JSON list handling
// 81. API response transformation
// 82. Model list conversion
// 83. Search
// 84. Filtering
// 85. Sorting
// 86. Grouping
// 87. Pagination
// 88. Deduplication
// 89. Aggregation
// 90. Dashboard calculations
//
// ============================================================================


// ============================================================================
// 1. COLLECTION OVERVIEW
// ============================================================================
//
// Dart provides three primary collection types:
//
//   List
//   Set
//   Map
//
// List:
//
//   Ordered collection.
//   Duplicate values allowed.
//
// Set:
//
//   Unique values.
//   Duplicate values removed.
//
// Map:
//
//   Key-value pairs.
//
// ============================================================================


// ============================================================================
// 2. LIST
// ============================================================================
//
// List is the most commonly used collection in Flutter.
//
// ============================================================================

void listBasicExample() {
  List<String> names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names);
}


// ============================================================================
// 3. TYPE INFERENCE
// ============================================================================

void listInferenceExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names);
}


// ============================================================================
// 4. LIST OF NUMBERS
// ============================================================================

void numberListExample() {
  final prices = <double>[
    100,
    200,
    500,
  ];

  print(prices);
}


// ============================================================================
// 5. LIST OF OBJECTS
// ============================================================================
//
// This is extremely important for Flutter.
//
// ============================================================================

class StudentModel {
  final String name;
  final double cgpa;

  const StudentModel({
    required this.name,
    required this.cgpa,
  });
}

void objectListExample() {
  final students = <StudentModel>[
    const StudentModel(
      name: "Palash",
      cgpa: 3.50,
    ),
    const StudentModel(
      name: "Rahim",
      cgpa: 3.20,
    ),
  ];

  print(students[0].name);
}


// ============================================================================
// 6. LIST INDEX
// ============================================================================
//
// Index starts from:
//
//   0
//
// Example:
//
//   [0] → first
//   [1] → second
//   [2] → third
//
// ============================================================================

void listIndexExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products[0]);
  print(products[1]);
  print(products[2]);
}


// ============================================================================
// 7. LIST LENGTH
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
// 8. FIRST AND LAST
// ============================================================================

void firstLastExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.first);
  print(products.last);
}


// ============================================================================
// WARNING:
//
// .first and .last throw an error when the list is empty.
//
// Safer:
//
//   list.isNotEmpty
//
// ============================================================================


// ============================================================================
// 9. ADD
// ============================================================================

void listAddExample() {
  final products = <String>[
    "Phone",
    "Laptop",
  ];

  products.add("Tablet");

  print(products);
}


// ============================================================================
// 10. ADD ALL
// ============================================================================

void listAddAllExample() {
  final products = <String>[
    "Phone",
  ];

  products.addAll([
    "Laptop",
    "Tablet",
    "Watch",
  ]);

  print(products);
}


// ============================================================================
// 11. INSERT
// ============================================================================

void listInsertExample() {
  final products = <String>[
    "Phone",
    "Tablet",
  ];

  products.insert(1, "Laptop");

  print(products);
}


// ============================================================================
// Result:
//
//   Phone
//   Laptop
//   Tablet
//
// ============================================================================


// ============================================================================
// 12. INSERT ALL
// ============================================================================

void listInsertAllExample() {
  final products = <String>[
    "Phone",
    "Watch",
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
// 13. REMOVE BY VALUE
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
// 14. REMOVE AT INDEX
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
// 15. REMOVE LAST
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
// 16. REMOVE WHERE
// ============================================================================
//
// Removes all elements matching a condition.
//
// ============================================================================

void removeWhereExample() {
  final prices = <int>[
    100,
    200,
    300,
    400,
  ];

  prices.removeWhere(
    (price) => price > 250,
  );

  print(prices);
}


// ============================================================================
// 17. RETAIN WHERE
// ============================================================================
//
// Keeps only matching elements.
//
// ============================================================================

void retainWhereExample() {
  final prices = <int>[
    100,
    200,
    300,
    400,
  ];

  prices.retainWhere(
    (price) => price <= 250,
  );

  print(prices);
}


// ============================================================================
// 18. CLEAR
// ============================================================================

void clearExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products.clear();

  print(products);
}


// ============================================================================
// 19. CONTAINS
// ============================================================================

void containsExample() {
  final roles = [
    "admin",
    "employee",
    "vendor",
  ];

  print(roles.contains("admin"));
  print(roles.contains("customer"));
}


// ============================================================================
// 20. INDEX OF
// ============================================================================

void indexOfExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.indexOf("Laptop"));
  print(products.indexOf("Watch"));
}


// ============================================================================
// If not found:
//
//   -1
//
// ============================================================================


// ============================================================================
// 21. LAST INDEX OF
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
// 22. SUBLIST
// ============================================================================

void sublistExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Watch",
  ];

  final result = products.sublist(1, 3);

  print(result);
}


// ============================================================================
// Result:
//
//   Laptop
//   Tablet
//
// Start index is inclusive.
// End index is exclusive.
//
// ============================================================================


// ============================================================================
// 23. SET
// ============================================================================
//
// Set stores unique values.
//
// ============================================================================

void setExample() {
  final roles = <String>{
    "admin",
    "employee",
    "vendor",
    "admin",
  };

  print(roles);
}


// ============================================================================
// Duplicate "admin" is stored only once.
//
// ============================================================================


// ============================================================================
// 24. SET ADD
// ============================================================================

void setAddExample() {
  final ids = <String>{
    "U001",
    "U002",
  };

  ids.add("U003");
  ids.add("U001");

  print(ids);
}


// ============================================================================
// 25. SET ADD ALL
// ============================================================================

void setAddAllExample() {
  final ids = <String>{
    "U001",
  };

  ids.addAll([
    "U002",
    "U003",
    "U001",
  ]);

  print(ids);
}


// ============================================================================
// 26. SET REMOVE
// ============================================================================

void setRemoveExample() {
  final ids = <String>{
    "U001",
    "U002",
    "U003",
  };

  ids.remove("U002");

  print(ids);
}


// ============================================================================
// 27. SET UNION
// ============================================================================

void setUnionExample() {
  final a = {1, 2, 3};
  final b = {3, 4, 5};

  final result = a.union(b);

  print(result);
}


// ============================================================================
// Result:
//
//   {1, 2, 3, 4, 5}
//
// ============================================================================


// ============================================================================
// 28. SET INTERSECTION
// ============================================================================

void setIntersectionExample() {
  final a = {1, 2, 3};
  final b = {3, 4, 5};

  final result = a.intersection(b);

  print(result);
}


// ============================================================================
// Result:
//
//   {3}
//
// ============================================================================


// ============================================================================
// 29. SET DIFFERENCE
// ============================================================================

void setDifferenceExample() {
  final a = {1, 2, 3};
  final b = {3, 4, 5};

  final result = a.difference(b);

  print(result);
}


// ============================================================================
// Result:
//
//   {1, 2}
//
// ============================================================================


// ============================================================================
// 30. MAP
// ============================================================================
//
// Map stores:
//
//   key → value
//
// ============================================================================

void mapExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 24,
    "isActive": true,
  };

  print(user);
}


// ============================================================================
// 31. MAP ACCESS
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
// 32. MAP ADD
// ============================================================================

void mapAddExample() {
  final user = <String, dynamic>{};

  user["name"] = "Palash";
  user["email"] = "palash@example.com";

  print(user);
}


// ============================================================================
// 33. MAP UPDATE
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
// 34. MAP REMOVE
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
// 35. CONTAINS KEY
// ============================================================================

void containsKeyExample() {
  final user = {
    "name": "Palash",
    "age": 24,
  };

  print(user.containsKey("name"));
  print(user.containsKey("email"));
}


// ============================================================================
// 36. CONTAINS VALUE
// ============================================================================

void containsValueExample() {
  final user = {
    "name": "Palash",
    "age": 24,
  };

  print(user.containsValue("Palash"));
  print(user.containsValue(100));
}


// ============================================================================
// 37. MAP KEYS
// ============================================================================

void mapKeysExample() {
  final user = {
    "name": "Palash",
    "age": 24,
  };

  print(user.keys);
}


// ============================================================================
// 38. MAP VALUES
// ============================================================================

void mapValuesExample() {
  final user = {
    "name": "Palash",
    "age": 24,
  };

  print(user.values);
}


// ============================================================================
// 39. MAP ENTRIES
// ============================================================================

void mapEntriesExample() {
  final user = {
    "name": "Palash",
    "age": 24,
  };

  for (final entry in user.entries) {
    print("${entry.key}: ${entry.value}");
  }
}


// ============================================================================
// 40. MAP PUT IF ABSENT
// ============================================================================
//
// Adds a value only when the key doesn't already exist.
//
// ============================================================================

void putIfAbsentExample() {
  final cache = <String, String>{
    "name": "Palash",
  };

  cache.putIfAbsent(
    "name",
    () => "Other Name",
  );

  cache.putIfAbsent(
    "email",
    () => "palash@example.com",
  );

  print(cache);
}


// ============================================================================
// 41. ITERABLE
// ============================================================================
//
// Iterable is an abstraction used by List, Set and many collection APIs.
//
// Many powerful methods are defined on Iterable.
//
// ============================================================================


// ============================================================================
// 42. WHERE
// ============================================================================
//
// Filters elements.
//
// ============================================================================

void whereExample() {
  final prices = [
    100,
    200,
    500,
    1000,
  ];

  final expensive = prices.where(
    (price) => price >= 500,
  );

  print(expensive);
}


// ============================================================================
// Convert to List:
//
// ============================================================================

void whereToListExample() {
  final prices = [
    100,
    200,
    500,
    1000,
  ];

  final expensive = prices
      .where((price) => price >= 500)
      .toList();

  print(expensive);
}


// ============================================================================
// 43. MAP
// ============================================================================
//
// Transforms every element.
//
// ============================================================================

void iterableMapExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final discountedPrices = prices.map(
    (price) => price * 0.9,
  );

  print(discountedPrices.toList());
}


// ============================================================================
// 44. MAP WITH OBJECTS
// ============================================================================

class Product {
  final String name;
  final double price;

  const Product({
    required this.name,
    required this.price,
  });
}

void productMapExample() {
  final products = <Product>[
    const Product(
      name: "Phone",
      price: 100000,
    ),
    const Product(
      name: "Laptop",
      price: 150000,
    ),
  ];

  final names = products
      .map((product) => product.name)
      .toList();

  print(names);
}


// ============================================================================
// 45. WHERE + MAP
// ============================================================================
//
// Very common in Flutter.
//
// ============================================================================

void whereMapExample() {
  final products = <Product>[
    const Product(
      name: "Phone",
      price: 100000,
    ),
    const Product(
      name: "Laptop",
      price: 150000,
    ),
    const Product(
      name: "Watch",
      price: 20000,
    ),
  ];

  final expensiveProductNames = products
      .where((product) => product.price > 50000)
      .map((product) => product.name)
      .toList();

  print(expensiveProductNames);
}


// ============================================================================
// 46. EXPAND
// ============================================================================
//
// Flattens nested collections.
//
// ============================================================================

void expandExample() {
  final categories = [
    ["Phone", "Laptop"],
    ["Shirt", "Pant"],
    ["Watch"],
  ];

  final products = categories
      .expand((category) => category)
      .toList();

  print(products);
}


// ============================================================================
// 47. REDUCE
// ============================================================================
//
// Combines elements into one value.
//
// Example: total.
//
// ============================================================================

void reduceExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final total = prices.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// ============================================================================
// IMPORTANT:
//
// reduce() requires a non-empty collection.
//
// For potentially empty collections, fold() is often safer.
//
// ============================================================================


// ============================================================================
// 48. FOLD
// ============================================================================
//
// fold starts with an initial value.
//
// ============================================================================

void foldExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final total = prices.fold<int>(
    0,
    (sum, price) => sum + price,
  );

  print(total);
}


// ============================================================================
// Empty list also works:
//
// ============================================================================

void foldEmptyExample() {
  final prices = <int>[];

  final total = prices.fold<int>(
    0,
    (sum, price) => sum + price,
  );

  print(total);
}


// ============================================================================
// 49. FOREACH
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
// For simple iteration, a normal for-in loop is often more readable:
//
// ============================================================================

void forInExample() {
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
// 50. ANY
// ============================================================================
//
// Returns true if at least one element matches.
//
// ============================================================================

void anyExample() {
  final prices = [
    100,
    200,
    1000,
  ];

  final hasExpensiveProduct = prices.any(
    (price) => price > 500,
  );

  print(hasExpensiveProduct);
}


// ============================================================================
// 51. EVERY
// ============================================================================
//
// Returns true if every element matches.
//
// ============================================================================

void everyExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final allPositive = prices.every(
    (price) => price > 0,
  );

  print(allPositive);
}


// ============================================================================
// 52. CONTAINS
// ============================================================================

void iterableContainsExample() {
  final roles = [
    "admin",
    "vendor",
    "employee",
  ];

  print(roles.contains("admin"));
}


// ============================================================================
// 53. FIRST
// ============================================================================

void iterableFirstExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.first);
}


// ============================================================================
// 54. LAST
// ============================================================================

void iterableLastExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.last);
}


// ============================================================================
// 55. FIRST WHERE
// ============================================================================
//
// Returns first matching element.
//
// ============================================================================

void firstWhereExample() {
  final prices = [
    100,
    200,
    500,
    1000,
  ];

  final result = prices.firstWhere(
    (price) => price >= 500,
  );

  print(result);
}


// ============================================================================
// firstWhere + orElse
// ============================================================================
//
// Prevents StateError when no match exists.
//
// ============================================================================

void firstWhereSafeExample() {
  final prices = [
    100,
    200,
  ];

  final result = prices.firstWhere(
    (price) => price >= 500,
    orElse: () => 0,
  );

  print(result);
}


// ============================================================================
// 56. LAST WHERE
// ============================================================================

void lastWhereExample() {
  final prices = [
    100,
    500,
    200,
    1000,
  ];

  final result = prices.lastWhere(
    (price) => price >= 500,
  );

  print(result);
}


// ============================================================================
// 57. SINGLE WHERE
// ============================================================================
//
// Expects exactly one matching element.
//
// If zero or more than one matches, it throws.
//
// ============================================================================

void singleWhereExample() {
  final ids = [
    "A",
    "B",
    "C",
  ];

  final result = ids.singleWhere(
    (id) => id == "B",
  );

  print(result);
}


// ============================================================================
// Use singleWhere only when uniqueness is guaranteed.
//
// ============================================================================


// ============================================================================
// 58. TAKE
// ============================================================================

void takeExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Watch",
  ];

  final result = products
      .take(2)
      .toList();

  print(result);
}


// ============================================================================
// Result:
//
//   Phone
//   Laptop
//
// ============================================================================


// ============================================================================
// 59. TAKE WHILE
// ============================================================================

void takeWhileExample() {
  final numbers = [
    1,
    2,
    3,
    10,
    4,
  ];

  final result = numbers
      .takeWhile((number) => number < 5)
      .toList();

  print(result);
}


// ============================================================================
// Result:
//
//   [1, 2, 3]
//
// It stops at the first failure.
//
// ============================================================================


// ============================================================================
// 60. SKIP
// ============================================================================

void skipExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Watch",
  ];

  final result = products
      .skip(2)
      .toList();

  print(result);
}


// ============================================================================
// Result:
//
//   Tablet
//   Watch
//
// ============================================================================


// ============================================================================
// 61. SKIP WHILE
// ============================================================================

void skipWhileExample() {
  final numbers = [
    1,
    2,
    3,
    10,
    4,
  ];

  final result = numbers
      .skipWhile((number) => number < 5)
      .toList();

  print(result);
}


// ============================================================================
// Result:
//
//   [10, 4]
//
// ============================================================================


// ============================================================================
// 62. TO LIST
// ============================================================================

void toListExample() {
  final numbers = <int>{1, 2, 3};

  final list = numbers.toList();

  print(list);
}


// ============================================================================
// 63. TO SET
// ============================================================================

void toSetExample() {
  final ids = [
    "A",
    "B",
    "A",
    "C",
    "B",
  ];

  final uniqueIds = ids.toSet();

  print(uniqueIds);
}


// ============================================================================
// 64. FUNCTIONS AS OBJECTS
// ============================================================================
//
// In Dart, functions are first-class objects.
//
// You can:
//
//   store functions
//   pass functions
//   return functions
//
// ============================================================================

int addNumbers(
  int a,
  int b,
) {
  return a + b;
}

void functionObjectExample() {
  final operation = addNumbers;

  print(operation(10, 20));
}


// ============================================================================
// 65. ANONYMOUS FUNCTION
// ============================================================================

void anonymousFunctionExample() {
  final numbers = [1, 2, 3];

  final doubled = numbers.map(
    (number) {
      return number * 2;
    },
  ).toList();

  print(doubled);
}


// ============================================================================
// 66. ARROW FUNCTION
// ============================================================================

int squareNumber(int number) => number * number;


// ============================================================================
// 67. HIGHER-ORDER FUNCTION
// ============================================================================
//
// A function that accepts another function OR returns a function.
//
// ============================================================================

int calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  return operation(a, b);
}


// ============================================================================
// Usage:
//
// ============================================================================

void higherOrderExample() {
  final sum = calculate(
    10,
    20,
    (a, b) => a + b,
  );

  final multiplication = calculate(
    10,
    20,
    (a, b) => a * b,
  );

  print(sum);
  print(multiplication);
}


// ============================================================================
// 68. CALLBACK FUNCTION
// ============================================================================

void performAction(
  String name,
  void Function(String) callback,
) {
  print("Performing action for $name");

  callback(name);
}


// ============================================================================
// Usage:
//
// ============================================================================

void callbackExample() {
  performAction(
    "Palash",
    (name) {
      print("Welcome $name");
    },
  );
}


// ============================================================================
// 69. CLOSURE
// ============================================================================
//
// A closure remembers variables from its surrounding scope.
//
// ============================================================================

Function createCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}


// ============================================================================
// Usage:
//
// ============================================================================

void closureExample() {
  final counter = createCounter();

  print(counter());
  print(counter());
  print(counter());
}


// ============================================================================
// Output:
//
//   1
//   2
//   3
//
// The function remembers count.
//
// ============================================================================


// ============================================================================
// 70. LEXICAL SCOPE
// ============================================================================

void lexicalScopeExample() {
  const appName = "ERP";

  void printAppName() {
    print(appName);
  }

  printAppName();
}


// ============================================================================
// Inner functions can access variables from their outer scope.
//
// ============================================================================


// ============================================================================
// 71. FUNCTION TYPE
// ============================================================================

void functionTypeExample() {
  int Function(int, int) operation;

  operation = (a, b) => a + b;

  print(operation(10, 20));
}


// ============================================================================
// 72. TYPEDEF
// ============================================================================
//
// typedef gives a function type a name.
//
// ============================================================================

typedef CalculatorOperation = int Function(
  int a,
  int b,
);

int executeCalculation(
  int a,
  int b,
  CalculatorOperation operation,
) {
  return operation(a, b);
}


// ============================================================================
// Usage:
//
// ============================================================================

void typedefExample() {
  final result = executeCalculation(
    10,
    20,
    (a, b) => a * b,
  );

  print(result);
}


// ============================================================================
// 73. TEAR-OFF
// ============================================================================
//
// A tear-off means passing a method/function without calling it.
//
// WRONG:
//
//   printName()
//
// RIGHT:
//
//   printName
//
// ============================================================================

void printName(String name) {
  print(name);
}

void tearOffExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  names.forEach(printName);
}


// ============================================================================
// 74. METHOD TEAR-OFF
// ============================================================================

class Printer {
  void printValue(String value) {
    print(value);
  }
}

void methodTearOffExample() {
  final printer = Printer();

  final names = [
    "A",
    "B",
    "C",
  ];

  names.forEach(printer.printValue);
}


// ============================================================================
// 75. FUNCTION COMPOSITION
// ============================================================================
//
// One operation's result becomes another operation's input.
//
// ============================================================================

int doubleValue(int value) {
  return value * 2;
}

int addTen(int value) {
  return value + 10;
}

void compositionExample() {
  final value = 5;

  final result = addTen(
    doubleValue(value),
  );

  print(result);
}


// ============================================================================
// 76. SPREAD OPERATOR
// ============================================================================
//
// ... inserts all elements of another collection.
//
// ============================================================================

void spreadExample() {
  final first = [
    "Phone",
    "Laptop",
  ];

  final second = [
    "Tablet",
    "Watch",
  ];

  final all = [
    ...first,
    ...second,
  ];

  print(all);
}


// ============================================================================
// 77. NULL-AWARE SPREAD
// ============================================================================

void nullAwareSpreadExample() {
  List<String>? optionalProducts;

  final products = [
    "Phone",
    ...?optionalProducts,
  ];

  print(products);
}


// ============================================================================
// 78. COLLECTION IF
// ============================================================================
//
// Flutter uses this heavily.
//
// ============================================================================

void collectionIfExample(bool isAdmin) {
  final actions = [
    "View",
    if (isAdmin) "Delete",
  ];

  print(actions);
}


// ============================================================================
// 79. COLLECTION IF / ELSE
// ============================================================================

void collectionIfElseExample(bool isAdmin) {
  final actions = [
    "View",
    if (isAdmin)
      "Delete"
    else
      "Request Delete",
  ];

  print(actions);
}


// ============================================================================
// 80. COLLECTION FOR
// ============================================================================

void collectionForExample() {
  final numbers = [1, 2, 3];

  final doubled = [
    for (final number in numbers)
      number * 2,
  ];

  print(doubled);
}


// ============================================================================
// 81. COLLECTION FOR + IF
// ============================================================================

void collectionForIfExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final evenNumbers = [
    for (final number in numbers)
      if (number.isEven) number,
  ];

  print(evenNumbers);
}


// ============================================================================
// 82. NESTED COLLECTION FOR
// ============================================================================

void nestedCollectionForExample() {
  final categories = {
    "Electronics": [
      "Phone",
      "Laptop",
    ],
    "Fashion": [
      "Shirt",
      "Pant",
    ],
  };

  final products = [
    for (final category in categories.values)
      for (final product in category)
        product,
  ];

  print(products);
}


// ============================================================================
// 83. CASCADE OPERATOR
// ============================================================================
//
// .. allows multiple operations on the same object.
//
// ============================================================================

class Cart {
  final List<String> products = [];

  void add(String product) {
    products.add(product);
  }

  void remove(String product) {
    products.remove(product);
  }
}

void cascadeExample() {
  final cart = Cart()
    ..add("Phone")
    ..add("Laptop")
    ..add("Tablet");

  print(cart.products);
}


// ============================================================================
// 84. CASCADE + PROPERTY
// ============================================================================
//
// Cascade is extremely common in Dart/Flutter APIs.
//
// ============================================================================


// ============================================================================
// 85. COLLECTION TRANSFORMATION
// ============================================================================
//
// Common transformation pipeline:
//
//   source
//      ↓
//   where
//      ↓
//   map
//      ↓
//   toList
//
// ============================================================================

void transformationExample() {
  final prices = [
    100,
    200,
    500,
    1000,
  ];

  final result = prices
      .where((price) => price >= 200)
      .map((price) => price * 0.9)
      .toList();

  print(result);
}


// ============================================================================
// 86. SEARCH
// ============================================================================

void productSearchExample() {
  final products = <Product>[
    const Product(
      name: "iPhone 17",
      price: 100000,
    ),
    const Product(
      name: "Samsung Galaxy",
      price: 90000,
    ),
    const Product(
      name: "MacBook",
      price: 150000,
    ),
  ];

  final query = "iphone";

  final results = products.where(
    (product) => product.name
        .toLowerCase()
        .contains(query.toLowerCase()),
  ).toList();

  print(results.map((e) => e.name).toList());
}


// ============================================================================
// 87. FILTER ACTIVE PRODUCTS
// ============================================================================

class InventoryProduct {
  final String name;
  final int stock;
  final bool isActive;

  const InventoryProduct({
    required this.name,
    required this.stock,
    required this.isActive,
  });
}

void activeProductExample() {
  final products = <InventoryProduct>[
    const InventoryProduct(
      name: "Phone",
      stock: 10,
      isActive: true,
    ),
    const InventoryProduct(
      name: "Laptop",
      stock: 0,
      isActive: true,
    ),
    const InventoryProduct(
      name: "Watch",
      stock: 20,
      isActive: false,
    ),
  ];

  final available = products.where(
    (product) =>
        product.isActive &&
        product.stock > 0,
  ).toList();

  print(
    available.map((e) => e.name).toList(),
  );
}


// ============================================================================
// 88. SORTING
// ============================================================================
//
// sort() modifies the list.
//
// ============================================================================

void sortingExample() {
  final prices = [
    500,
    100,
    300,
    200,
  ];

  prices.sort();

  print(prices);
}


// ============================================================================
// 89. DESCENDING SORT
// ============================================================================

void descendingSortExample() {
  final prices = [
    500,
    100,
    300,
    200,
  ];

  prices.sort(
    (a, b) => b.compareTo(a),
  );

  print(prices);
}


// ============================================================================
// 90. SORT OBJECTS BY PRICE
// ============================================================================

void sortProductsByPrice() {
  final products = <Product>[
    const Product(
      name: "Phone",
      price: 100000,
    ),
    const Product(
      name: "Watch",
      price: 20000,
    ),
    const Product(
      name: "Laptop",
      price: 150000,
    ),
  ];

  products.sort(
    (a, b) => a.price.compareTo(b.price),
  );

  for (final product in products) {
    print(
      "${product.name}: ${product.price}",
    );
  }
}


// ============================================================================
// 91. SORT OBJECTS DESCENDING
// ============================================================================

void sortProductsDescending() {
  final products = <Product>[
    const Product(
      name: "Phone",
      price: 100000,
    ),
    const Product(
      name: "Watch",
      price: 20000,
    ),
    const Product(
      name: "Laptop",
      price: 150000,
    ),
  ];

  products.sort(
    (a, b) => b.price.compareTo(a.price),
  );

  print(
    products.map((e) => e.name).toList(),
  );
}


// ============================================================================
// 92. DEDUPLICATION
// ============================================================================

void deduplicationExample() {
  final ids = [
    "P001",
    "P002",
    "P001",
    "P003",
    "P002",
  ];

  final uniqueIds = ids.toSet().toList();

  print(uniqueIds);
}


// ============================================================================
// 93. GROUPING
// ============================================================================
//
// Dart doesn't provide a direct groupBy() method in core collections.
// We can build grouping manually.
//
// ============================================================================

class SalesItem {
  final String category;
  final double amount;

  const SalesItem({
    required this.category,
    required this.amount,
  });
}

void groupingExample() {
  final sales = <SalesItem>[
    const SalesItem(
      category: "Electronics",
      amount: 1000,
    ),
    const SalesItem(
      category: "Fashion",
      amount: 500,
    ),
    const SalesItem(
      category: "Electronics",
      amount: 700,
    ),
  ];

  final grouped =
      <String, List<SalesItem>>{};

  for (final sale in sales) {
    grouped
        .putIfAbsent(
          sale.category,
          () => [],
        )
        .add(sale);
  }

  print(grouped);
}


// ============================================================================
// 94. GROUPED TOTAL
// ============================================================================

void groupedTotalExample() {
  final sales = <SalesItem>[
    const SalesItem(
      category: "Electronics",
      amount: 1000,
    ),
    const SalesItem(
      category: "Fashion",
      amount: 500,
    ),
    const SalesItem(
      category: "Electronics",
      amount: 700,
    ),
  ];

  final totals = <String, double>{};

  for (final sale in sales) {
    totals[sale.category] =
        (totals[sale.category] ?? 0) +
            sale.amount;
  }

  print(totals);
}


// ============================================================================
// 95. DASHBOARD TOTAL
// ============================================================================

void dashboardTotalExample() {
  final orders = [
    1000.0,
    2500.0,
    500.0,
    700.0,
  ];

  final totalSales = orders.fold<double>(
    0,
    (sum, amount) => sum + amount,
  );

  print(totalSales);
}


// ============================================================================
// 96. AVERAGE
// ============================================================================

void averageExample() {
  final prices = [
    100.0,
    200.0,
    300.0,
  ];

  final total = prices.fold<double>(
    0,
    (sum, value) => sum + value,
  );

  final average =
      prices.isEmpty
          ? 0
          : total / prices.length;

  print(average);
}


// ============================================================================
// 97. MINIMUM
// ============================================================================

void minimumExample() {
  final prices = [
    500,
    100,
    300,
    200,
  ];

  final minimum = prices.reduce(
    (a, b) => a < b ? a : b,
  );

  print(minimum);
}


// ============================================================================
// 98. MAXIMUM
// ============================================================================

void maximumExample() {
  final prices = [
    500,
    100,
    300,
    200,
  ];

  final maximum = prices.reduce(
    (a, b) => a > b ? a : b,
  );

  print(maximum);
}


// ============================================================================
// 99. PAGINATION
// ============================================================================
//
// Suppose API returns 100 products.
// You want page size = 10.
//
// ============================================================================

List<T> paginate<T>(
  List<T> items,
  int page,
  int pageSize,
) {
  if (page < 1 || pageSize <= 0) {
    return [];
  }

  final start = (page - 1) * pageSize;

  if (start >= items.length) {
    return [];
  }

  final end =
      (start + pageSize > items.length)
          ? items.length
          : start + pageSize;

  return items.sublist(start, end);
}


// ============================================================================
// Pagination usage:
//
// ============================================================================

void paginationExample() {
  final products = List.generate(
    25,
    (index) => "Product ${index + 1}",
  );

  final page1 = paginate(
    products,
    1,
    10,
  );

  final page2 = paginate(
    products,
    2,
    10,
  );

  print(page1);
  print(page2);
}


// ============================================================================
// 100. JSON ARRAY
// ============================================================================
//
// API response frequently looks like:
//
// [
//   {"id": "P001", "name": "Phone"},
//   {"id": "P002", "name": "Laptop"}
// ]
//
// Dart representation:
//
//   List<Map<String, dynamic>>
//
// ============================================================================

void jsonArrayExample() {
  final json = <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "Phone",
      "price": 100000,
    },
    {
      "id": "P002",
      "name": "Laptop",
      "price": 150000,
    },
  ];

  print(json);
}


// ============================================================================
// 101. JSON → MODEL LIST
// ============================================================================

List<ProductJsonModel> productsFromJson(
  List<Map<String, dynamic>> json,
) {
  return json
      .map(
        ProductJsonModel.fromJson,
      )
      .toList();
}


// ============================================================================
// 102. MODEL LIST → JSON
// ============================================================================

List<Map<String, dynamic>> productsToJson(
  List<ProductJsonModel> products,
) {
  return products
      .map((product) => product.toJson())
      .toList();
}


// ============================================================================
// 103. API FILTERING
// ============================================================================

void apiFilteringExample() {
  final products = <ProductJsonModel>[
    const ProductJsonModel(
      id: "P001",
      name: "Phone",
      price: 100000,
    ),
    const ProductJsonModel(
      id: "P002",
      name: "Laptop",
      price: 150000,
    ),
    const ProductJsonModel(
      id: "P003",
      name: "Watch",
      price: 20000,
    ),
  ];

  final filtered = products.where(
    (product) => product.price >= 50000,
  ).toList();

  print(
    filtered.map((e) => e.name).toList(),
  );
}


// ============================================================================
// 104. MULTIPLE FILTERS
// ============================================================================

void multipleFilterExample() {
  final products = <Product>[
    const Product(
      name: "iPhone",
      price: 100000,
    ),
    const Product(
      name: "Samsung",
      price: 80000,
    ),
    const Product(
      name: "Watch",
      price: 20000,
    ),
  ];

  final result = products.where(
    (product) =>
        product.price > 50000 &&
        product.name
            .toLowerCase()
            .contains("phone"),
  ).toList();

  print(result);
}


// ============================================================================
// 105. COLLECTION PIPELINE
// ============================================================================
//
// Real Flutter example:
//
//   API products
//      ↓
//   filter
//      ↓
//   search
//      ↓
//   sort
//      ↓
//   map
//      ↓
//   ListView
//
// ============================================================================

void collectionPipelineExample() {
  final products = <Product>[
    const Product(
      name: "iPhone",
      price: 100000,
    ),
    const Product(
      name: "Samsung Phone",
      price: 80000,
    ),
    const Product(
      name: "MacBook",
      price: 150000,
    ),
  ];

  final query = "phone";

  final result = products
      .where(
        (product) => product.name
            .toLowerCase()
            .contains(query.toLowerCase()),
      )
      .toList()
    ..sort(
      (a, b) => a.price.compareTo(b.price),
    );

  print(
    result.map((e) => e.name).toList(),
  );
}


// ============================================================================
// 106. NULLABLE COLLECTION
// ============================================================================

void nullableCollectionExample() {
  List<Product>? products;

  final result =
      products?.where(
        (product) => product.price > 50000,
      ).toList() ??
      [];

  print(result);
}


// ============================================================================
// 107. COLLECTION OF NULLABLE VALUES
// ============================================================================

void nullableValuesExample() {
  final values = <String?>[
    "A",
    null,
    "B",
    null,
    "C",
  ];

  final nonNullValues = values
      .whereType<String>()
      .toList();

  print(nonNullValues);
}


// ============================================================================
// 108. WHERE TYPE
// ============================================================================
//
// whereType<T>() is very useful when working with mixed/nullable data.
//
// ============================================================================

void whereTypeExample() {
  final values = <Object>[
    "Hello",
    100,
    20.5,
    true,
  ];

  final strings = values
      .whereType<String>()
      .toList();

  print(strings);
}


// ============================================================================
// 109. LIST GENERATE
// ============================================================================

void listGenerateExample() {
  final numbers = List.generate(
    10,
    (index) => index + 1,
  );

  print(numbers);
}


// ============================================================================
// 110. LIST FILLED
// ============================================================================

void listFilledExample() {
  final values = List.filled(
    5,
    0,
  );

  print(values);
}


// ============================================================================
// IMPORTANT:
//
// List.filled() with mutable objects can cause shared-reference surprises.
//
// Example:
//
//   List.filled(3, <String>[])
//
// All elements refer to the same inner list.
//
// Better:
//
//   List.generate(3, (_) => <String>[])
//
// ============================================================================

void safeNestedListExample() {
  final lists = List.generate(
    3,
    (_) => <String>[],
  );

  lists[0].add("A");

  print(lists);
}


// ============================================================================
// 111. MAP FROM LIST
// ============================================================================
//
// Create a lookup map from a list.
//
// ============================================================================

void listToMapExample() {
  final products = <ProductJsonModel>[
    const ProductJsonModel(
      id: "P001",
      name: "Phone",
      price: 100000,
    ),
    const ProductJsonModel(
      id: "P002",
      name: "Laptop",
      price: 150000,
    ),
  ];

  final productMap = {
    for (final product in products)
      product.id: product,
  };

  print(productMap["P001"]?.name);
}


// ============================================================================
// 112. INDEXED LOOP
// ============================================================================

void indexedLoopExample() {
  final products = [
    "Phone",
    "Laptop",
    "Watch",
  ];

  for (var i = 0; i < products.length; i++) {
    print("$i: ${products[i]}");
  }
}


// ============================================================================
// 113. MAP ENTRIES TRANSFORMATION
// ============================================================================

void mapTransformationExample() {
  final prices = <String, double>{
    "Phone": 100000,
    "Laptop": 150000,
  };

  final discounted = prices.map(
    (name, price) {
      return MapEntry(
        name,
        price * 0.9,
      );
    },
  );

  print(discounted);
}


// ============================================================================
// 114. MAP WHERE
// ============================================================================

void mapWhereExample() {
  final prices = <String, double>{
    "Phone": 100000,
    "Laptop": 150000,
    "Watch": 20000,
  };

  final expensive = Map.fromEntries(
    prices.entries.where(
      (entry) => entry.value > 50000,
    ),
  );

  print(expensive);
}


// ============================================================================
// 115. MAP KEYS TO LIST
// ============================================================================

void mapKeysToListExample() {
  final data = {
    "a": 1,
    "b": 2,
    "c": 3,
  };

  final keys = data.keys.toList();

  print(keys);
}


// ============================================================================
// 116. SET FOR UNIQUE CATEGORIES
// ============================================================================

void uniqueCategoriesExample() {
  final categories = [
    "Electronics",
    "Fashion",
    "Electronics",
    "Grocery",
    "Fashion",
  ];

  final uniqueCategories =
      categories.toSet().toList();

  print(uniqueCategories);
}


// ============================================================================
// 117. REAL ERP STOCK CALCULATION
// ============================================================================

class StockMovement {
  final String productId;
  final int quantity;
  final bool isIncoming;

  const StockMovement({
    required this.productId,
    required this.quantity,
    required this.isIncoming,
  });
}

int calculateStock(
  List<StockMovement> movements,
) {
  return movements.fold<int>(
    0,
    (stock, movement) {
      if (movement.isIncoming) {
        return stock + movement.quantity;
      }

      return stock - movement.quantity;
    },
  );
}


// ============================================================================
// 118. REAL ERP LOW-STOCK FILTER
// ============================================================================

class StockProduct {
  final String id;
  final String name;
  final int stock;
  final int minimumStock;

  const StockProduct({
    required this.id,
    required this.name,
    required this.stock,
    required this.minimumStock,
  });
}

List<StockProduct> lowStockProducts(
  List<StockProduct> products,
) {
  return products.where(
    (product) =>
        product.stock <=
        product.minimumStock,
  ).toList();
}


// ============================================================================
// 119. REAL ERP SALES REPORT
// ============================================================================

class Sale {
  final String orderId;
  final double amount;

  const Sale({
    required this.orderId,
    required this.amount,
  });
}

double calculateSales(
  List<Sale> sales,
) {
  return sales.fold<double>(
    0,
    (total, sale) =>
        total + sale.amount,
  );
}


// ============================================================================
// 120. REAL ERP CUSTOMER SEARCH
// ============================================================================

class Customer {
  final String id;
  final String name;
  final String phone;

  const Customer({
    required this.id,
    required this.name,
    required this.phone,
  });
}

List<Customer> searchCustomers(
  List<Customer> customers,
  String query,
) {
  final normalizedQuery =
      query.trim().toLowerCase();

  if (normalizedQuery.isEmpty) {
    return customers;
  }

  return customers.where(
    (customer) {
      return customer.name
              .toLowerCase()
              .contains(normalizedQuery) ||
          customer.phone
              .contains(normalizedQuery);
    },
  ).toList();
}


// ============================================================================
// 121. REAL ERP ORDER FILTER
// ============================================================================

enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled,
}

class Order {
  final String id;
  final OrderStatus status;
  final double total;

  const Order({
    required this.id,
    required this.status,
    required this.total,
  });
}

List<Order> filterOrders(
  List<Order> orders,
  OrderStatus status,
) {
  return orders
      .where(
        (order) => order.status == status,
      )
      .toList();
}


// ============================================================================
// 122. COUNT ORDERS BY STATUS
// ============================================================================

int countOrdersByStatus(
  List<Order> orders,
  OrderStatus status,
) {
  return orders
      .where(
        (order) => order.status == status,
      )
      .length;
}


// ============================================================================
// 123. ORDER TOTAL BY STATUS
// ============================================================================

double totalOrdersByStatus(
  List<Order> orders,
  OrderStatus status,
) {
  return orders
      .where(
        (order) => order.status == status,
      )
      .fold<double>(
        0,
        (total, order) =>
            total + order.total,
      );
}


// ============================================================================
// 124. FUNCTION RETURNING FUNCTION
// ============================================================================

int Function(int) multiplier(
  int factor,
) {
  return (int value) {
    return value * factor;
  };
}


// ============================================================================
// Usage:
//
// ============================================================================

void functionReturningFunctionExample() {
  final doubleValue = multiplier(2);
  final tripleValue = multiplier(3);

  print(doubleValue(10));
  print(tripleValue(10));
}


// ============================================================================
// 125. REUSABLE FILTER FUNCTION
// ============================================================================

List<T> filter<T>(
  List<T> items,
  bool Function(T item) condition,
) {
  return items
      .where(condition)
      .toList();
}


// ============================================================================
// Usage:
//
// ============================================================================

void genericFilterExample() {
  final numbers = [1, 2, 3, 4, 5];

  final evenNumbers = filter(
    numbers,
    (number) => number.isEven,
  );

  print(evenNumbers);
}


// ============================================================================
// 126. GENERIC MAP FUNCTION
// ============================================================================

List<R> transform<T, R>(
  List<T> items,
  R Function(T item) converter,
) {
  return items
      .map(converter)
      .toList();
}


// ============================================================================
// Usage:
//
// ============================================================================

void genericTransformExample() {
  final numbers = [1, 2, 3];

  final strings = transform(
    numbers,
    (number) => "Number: $number",
  );

  print(strings);
}


// ============================================================================
// 127. CHAINING
// ============================================================================
//
// Dart collection APIs can be chained.
//
// ============================================================================

void chainingExample() {
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
      .map((number) => number * number)
      .where((number) => number > 10)
      .toList();

  print(result);
}


// ============================================================================
// 128. LAZY ITERABLE CONCEPT
// ============================================================================
//
// Methods like:
//
//   where()
//   map()
//   take()
//   skip()
//
// generally produce lazy Iterable views.
//
// Work happens as the iterable is consumed.
//
// Calling:
//
//   toList()
//
// materializes the result into a List.
//
// ============================================================================


// ============================================================================
// 129. AVOID UNNECESSARY toList()
// ============================================================================
//
// If another Iterable method can directly consume the result,
// you may not need to create an intermediate List.
//
// Example:
//
// ============================================================================

void avoidUnnecessaryListExample() {
  final numbers = [1, 2, 3, 4];

  final hasLargeEvenNumber = numbers
      .where((number) => number.isEven)
      .any((number) => number > 2);

  print(hasLargeEvenNumber);
}


// ============================================================================
// 130. IMPORTANT PERFORMANCE IDEA
// ============================================================================
//
// Avoid doing:
//
//   list
//      .where(...)
//      .toList()
//      .where(...)
//      .toList()
//      .map(...)
//      .toList()
//
// when you don't need intermediate Lists.
//
// Prefer:
//
//   list
//      .where(...)
//      .where(...)
//      .map(...)
//      .toList()
//
// ============================================================================


// ============================================================================
// 131. NULL-SAFE SEARCH
// ============================================================================

void nullSafeSearchExample() {
  final names = <String?>[
    "Palash",
    null,
    "Rahim",
  ];

  final result = names
      .whereType<String>()
      .where(
        (name) => name
            .toLowerCase()
            .contains("a"),
      )
      .toList();

  print(result);
}


// ============================================================================
// 132. REAL FLUTTER LISTVIEW PREPARATION
// ============================================================================
//
// UI often needs:
//
//   List<Product> products
//
// then:
//
//   products.map(...)
//
// or:
//
//   ListView.builder
//
// The collection knowledge from this phase directly supports Flutter UI.
//
// ============================================================================


// ============================================================================
// 133. API RESPONSE PIPELINE
// ============================================================================
//
// Typical flow:
//
// JSON
//  ↓
// List<Map<String, dynamic>>
//  ↓
// map(Product.fromJson)
//  ↓
// List<Product>
//  ↓
// where()
//  ↓
// sort()
//  ↓
// ListView
//
// ============================================================================


// ============================================================================
// 134. COMPLETE API PIPELINE EXAMPLE
// ============================================================================

void completeApiPipeline() {
  final json = <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "iPhone",
      "price": 100000,
    },
    {
      "id": "P002",
      "name": "Laptop",
      "price": 150000,
    },
    {
      "id": "P003",
      "name": "Watch",
      "price": 20000,
    },
  ];

  final products = json
      .map(ProductJsonModel.fromJson)
      .where(
        (product) => product.price >= 50000,
      )
      .toList()
    ..sort(
      (a, b) => a.price.compareTo(b.price),
    );

  print(
    products.map((e) => e.name).toList(),
  );
}


// ============================================================================
// 135. IMPORTANT DIFFERENCE
// ============================================================================
//
// List:
//   Ordered
//   Duplicates allowed
//   Index-based
//
// Set:
//   Unique
//   No duplicate values
//   Great for membership/uniqueness
//
// Map:
//   Key → Value
//   Great for lookup
//
// Iterable:
//   Collection abstraction + transformation methods
//
// ============================================================================


// ============================================================================
// 136. WHEN TO USE WHAT?
// ============================================================================
//
// Use List when:
//
//   You need ordered data.
//   You need duplicates.
//   You need index access.
//
// Example:
//
//   List<Order>
//
// Use Set when:
//
//   You need unique IDs.
//
// Example:
//
//   Set<String> selectedProductIds
//
// Use Map when:
//
//   You need fast key-based lookup.
//
// Example:
//
//   Map<String, Product> productsById
//
// ============================================================================


// ============================================================================
// 137. REAL ERP LOOKUP MAP
// ============================================================================

Map<String, ProductJsonModel> indexProducts(
  List<ProductJsonModel> products,
) {
  return {
    for (final product in products)
      product.id: product,
  };
}


// ============================================================================
// Then:
//
//   productsById["P001"]
//
// can directly retrieve a product by ID.
//
// ============================================================================


// ============================================================================
// 138. SELECTED IDS WITH SET
// ============================================================================

void selectedIdsExample() {
  final selectedProductIds = <String>{};

  selectedProductIds.add("P001");
  selectedProductIds.add("P002");

  if (selectedProductIds.contains("P001")) {
    print("P001 selected");
  }

  selectedProductIds.remove("P001");
}


// ============================================================================
// This pattern is extremely useful for:
//
//   Bulk delete
//   Bulk approve
//   Bulk status update
//   Multi-select UI
//
// ============================================================================


// ============================================================================
// 139. CASCADE + LIST
// ============================================================================

void cascadeListExample() {
  final numbers = <int>[]
    ..add(10)
    ..add(20)
    ..addAll([30, 40]);

  print(numbers);
}


// ============================================================================
// 140. SPREAD + CONDITIONAL COLLECTION
// ============================================================================

void advancedCollectionExample(
  bool isAdmin,
  List<String> commonActions,
) {
  final actions = [
    ...commonActions,
    if (isAdmin) ...[
      "Edit",
      "Delete",
      "Approve",
    ],
  ];

  print(actions);
}


// ============================================================================
// 141. FUNCTIONAL STYLE
// ============================================================================
//
// Functional style generally emphasizes:
//
//   Transform data
//   Avoid unnecessary mutation
//   Small reusable functions
//   Functions as values
//
// Example:
//
// ============================================================================

List<int> getEvenSquares(
  List<int> numbers,
) {
  return numbers
      .where((number) => number.isEven)
      .map((number) => number * number)
      .toList();
}


// ============================================================================
// 142. IMPERATIVE VS FUNCTIONAL
// ============================================================================
//
// Imperative:
//
// ============================================================================

List<int> getEvenSquaresImperative(
  List<int> numbers,
) {
  final result = <int>[];

  for (final number in numbers) {
    if (number.isEven) {
      result.add(number * number);
    }
  }

  return result;
}


// ============================================================================
// Functional:
//
// ============================================================================

List<int> getEvenSquaresFunctional(
  List<int> numbers,
) {
  return numbers
      .where((number) => number.isEven)
      .map((number) => number * number)
      .toList();
}


// ============================================================================
// Both are valid.
//
// Choose the style that makes the code clearest.
//
// ============================================================================


// ============================================================================
// 143. SIDE EFFECT AWARENESS
// ============================================================================
//
// Functional operations like map() should generally be used for
// transformation, not unrelated side effects.
//
// Avoid:
//
//   numbers.map((n) {
//     print(n);
//     return n;
//   });
//
// If your goal is iteration:
//
//   for (final n in numbers) {
//     print(n);
//   }
//
// ============================================================================


// ============================================================================
// 144. MUTATING sort()
// ============================================================================
//
// sort() modifies the original List.
//
// If you want to preserve the original list:
//
// ============================================================================

void nonMutatingSortExample() {
  final prices = [
    500,
    100,
    300,
  ];

  final sortedPrices = [
    ...prices,
  ]..sort();

  print(prices);
  print(sortedPrices);
}


// ============================================================================
// 145. IMMUTABLE-STYLE COLLECTION TRANSFORMATION
// ============================================================================

void immutableStyleExample() {
  final original = [
    "A",
    "B",
    "C",
  ];

  final updated = [
    ...original,
    "D",
  ];

  print(original);
  print(updated);
}


// ============================================================================
// 146. REAL CART CALCULATION
// ============================================================================

class CartItem {
  final String productName;
  final double unitPrice;
  final int quantity;

  const CartItem({
    required this.productName,
    required this.unitPrice,
    required this.quantity,
  });

  double get total =>
      unitPrice * quantity;
}

double calculateCartTotal(
  List<CartItem> items,
) {
  return items.fold<double>(
    0,
    (total, item) =>
        total + item.total,
  );
}


// ============================================================================
// 147. REAL CART FILTER
// ============================================================================

List<CartItem> expensiveCartItems(
  List<CartItem> items,
) {
  return items.where(
    (item) => item.total >= 1000,
  ).toList();
}


// ============================================================================
// 148. REAL ORDER REPORT
// ============================================================================

double calculateDeliveredRevenue(
  List<Order> orders,
) {
  return orders
      .where(
        (order) =>
            order.status ==
            OrderStatus.delivered,
      )
      .fold<double>(
        0,
        (total, order) =>
            total + order.total,
      );
}


// ============================================================================
// 149. REAL DASHBOARD DATA
// ============================================================================

class DashboardStats {
  final int totalOrders;
  final int deliveredOrders;
  final int pendingOrders;
  final double revenue;

  const DashboardStats({
    required this.totalOrders,
    required this.deliveredOrders,
    required this.pendingOrders,
    required this.revenue,
  });
}

DashboardStats calculateDashboardStats(
  List<Order> orders,
) {
  final delivered = orders.where(
    (order) =>
        order.status ==
        OrderStatus.delivered,
  );

  final pending = orders.where(
    (order) =>
        order.status ==
        OrderStatus.pending,
  );

  final revenue = delivered.fold<double>(
    0,
    (total, order) =>
        total + order.total,
  );

  return DashboardStats(
    totalOrders: orders.length,
    deliveredOrders: delivered.length,
    pendingOrders: pending.length,
    revenue: revenue,
  );
}


// ============================================================================
// 150. PHASE 7 MASTER CHECKLIST
// ============================================================================
//
// LIST
//
// [ ] List creation
// [ ] Index
// [ ] length
// [ ] first
// [ ] last
// [ ] add
// [ ] addAll
// [ ] insert
// [ ] insertAll
// [ ] remove
// [ ] removeAt
// [ ] removeLast
// [ ] removeWhere
// [ ] retainWhere
// [ ] clear
// [ ] contains
// [ ] indexOf
// [ ] lastIndexOf
// [ ] sublist
//
// SET
//
// [ ] Set
// [ ] uniqueness
// [ ] add
// [ ] addAll
// [ ] remove
// [ ] contains
// [ ] union
// [ ] intersection
// [ ] difference
//
// MAP
//
// [ ] Map
// [ ] keys
// [ ] values
// [ ] entries
// [ ] add
// [ ] update
// [ ] remove
// [ ] containsKey
// [ ] containsValue
// [ ] putIfAbsent
//
// ITERABLE
//
// [ ] Iterable
// [ ] where
// [ ] map
// [ ] expand
// [ ] reduce
// [ ] fold
// [ ] forEach
// [ ] any
// [ ] every
// [ ] contains
// [ ] firstWhere
// [ ] lastWhere
// [ ] singleWhere
// [ ] take
// [ ] takeWhile
// [ ] skip
// [ ] skipWhile
// [ ] toList
// [ ] toSet
// [ ] whereType
//
// FUNCTIONAL PROGRAMMING
//
// [ ] First-class functions
// [ ] Anonymous functions
// [ ] Arrow functions
// [ ] Higher-order functions
// [ ] Callbacks
// [ ] Closures
// [ ] Lexical scope
// [ ] Function types
// [ ] typedef
// [ ] Tear-offs
// [ ] Function composition
//
// DART COLLECTION FEATURES
//
// [ ] Spread operator
// [ ] Null-aware spread
// [ ] Collection-if
// [ ] Collection-for
// [ ] Cascade operator
// [ ] Nested collection
//
// REAL-WORLD SKILLS
//
// [ ] Search
// [ ] Filtering
// [ ] Sorting
// [ ] Deduplication
// [ ] Grouping
// [ ] Aggregation
// [ ] Pagination
// [ ] JSON list handling
// [ ] JSON → models
// [ ] Models → JSON
// [ ] Lookup maps
// [ ] ERP stock calculation
// [ ] ERP order filtering
// [ ] Dashboard calculations
//
// ============================================================================
//
// ⭐ MOST IMPORTANT METHODS TO MEMORIZE
//
//   where()
//   map()
//   fold()
//   reduce()
//   firstWhere()
//   any()
//   every()
//   contains()
//   expand()
//   take()
//   skip()
//   toList()
//   toSet()
//
// ⭐ MOST IMPORTANT OPERATORS
//
//   ...
//   ...?
//   ..
//
// ⭐ MOST IMPORTANT FUNCTION CONCEPTS
//
//   callback
//   higher-order function
//   closure
//   anonymous function
//   tear-off
//   typedef
//
// ============================================================================
//
// FULL-STACK FLUTTER CONNECTION
// -----------------------------
//
// API:
//
//   List<Map<String, dynamic>>
//
//        ↓
//
// Model:
//
//   List<Product>
//
//        ↓
//
// Search:
//
//   where()
//
//        ↓
//
// Transform:
//
//   map()
//
//        ↓
//
// Aggregate:
//
//   fold()
//
//        ↓
//
// Sort:
//
//   sort()
//
//        ↓
//
// UI:
//
//   ListView.builder
//
// This entire pipeline will appear constantly in your Flutter ERP/SaaS
// development.
//
// ============================================================================
//
// NEXT PHASE:
//
// PHASE 8 — ASYNCHRONOUS DART
//
// Topics will include:
//
//   • Future
//   • async
//   • await
//   • then()
//   • catchError()
//   • try/catch with async
//   • Future.wait()
//   • Future.any()
//   • Future timeout
//   • Future error handling
//   • Stream
//   • StreamController
//   • StreamSubscription
//   • listen()
//   • onError
//   • onDone
//   • broadcast streams
//   • single-subscription streams
//   • async*
/*   • yield
//   • await for
//   • Stream transformations
//   • API calls
//   • database operations
//   • loading/error/success states
//   • real Flutter async architecture
//
// ============================================================================
//
// END OF PHASE 7
// ============================================================================