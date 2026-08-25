// ============================================================================
// DART MASTER ROADMAP
// PHASE 13 — COLLECTIONS + GENERICS + ITERABLE MASTERCLASS
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// This phase teaches Dart collections from BASIC → ADVANCED.
//
// Collections are extremely important for Flutter and full-stack development.
//
// You will use them everywhere:
//
//   • API responses
//   • JSON
//   • Product lists
//   • Orders
//   • Customers
//   • Inventory
//   • Cart
//   • Notifications
//   • Search results
//   • Pagination
//   • Filtering
//   • Sorting
//   • State management
//   • Database results
//
// ============================================================================
// PHASE 13 TOPICS
// ============================================================================
//
// COLLECTIONS
//
// 01. List
// 02. List creation
// 03. List literals
// 04. List indexing
// 05. List length
// 06. List first / last
// 07. List add
// 08. List addAll
// 09. List insert
// 10. List insertAll
// 11. List remove
// 12. List removeAt
// 13. List removeWhere
// 14. List retainWhere
// 15. List clear
// 16. List contains
// 17. List indexOf
// 18. List lastIndexOf
// 19. List sublist
// 20. List getRange
//
// ITERABLE
//
// 21. Iterable
// 22. for-in
// 23. forEach
// 24. map
// 25. where
// 26. whereType
// 27. expand
// 28. take
// 29. takeWhile
// 30. skip
// 31. skipWhile
// 32. firstWhere
// 33. lastWhere
// 34. singleWhere
// 35. any
// 36. every
// 37. contains
// 38. reduce
// 39. fold
// 40. join
// 41. toList
// 42. toSet
//
// SET
//
// 43. Set basics
// 44. Set creation
// 45. Set uniqueness
// 46. Set add
// 47. Set addAll
// 48. Set remove
// 49. Set contains
// 50. Set union
// 51. Set intersection
// 52. Set difference
//
// MAP
//
// 53. Map basics
// 54. Map creation
// 55. Map indexing
// 56. Map add/update
// 57. Map remove
// 58. Map containsKey
// 59. Map containsValue
// 60. Map keys
// 61. Map values
// 62. Map entries
// 63. Map forEach
// 64. Map putIfAbsent
// 65. Map update
// 66. Map updateAll
//
// COLLECTION TRANSFORMATION
//
// 67. map
// 68. where
// 69. expand
// 70. reduce
// 71. fold
// 72. chaining operations
//
// SORTING
//
// 73. sort
// 74. custom sorting
// 75. sort objects
// 76. reverse sorting
//
// GENERICS
//
// 77. Generic functions
// 78. Generic classes
// 79. Generic methods
// 80. Generic repositories
// 81. Generic API response
// 82. Generic pagination
// 83. Generic constraints
//
// NULL SAFETY
//
// 84. nullable collections
// 85. nullable elements
// 86. collection null filtering
// 87. whereType
//
// REAL FLUTTER / ERP
//
// 88. JSON List
// 89. JSON Map
// 90. API response parsing
// 91. Product collection
// 92. Inventory filtering
// 93. Cart calculations
// 94. Pagination
// 95. Search
// 96. Grouping
// 97. Deduplication
// 98. Generic repository
// 99. Generic API response
// 100. Production collection patterns
//
// ============================================================================


// ============================================================================
// 01. LIST
// ============================================================================
//
// List is an ordered collection.
//
// Example:
//
// [10, 20, 30, 40]
//
// Every item has an index.
//
// Index starts from 0.
//
// ============================================================================

void listBasics() {
  final numbers = [
    10,
    20,
    30,
    40,
  ];

  print(numbers);
}


// ============================================================================
// 02. LIST CREATION
// ============================================================================

void listCreation() {
  final numbers =
      <int>[
    10,
    20,
    30,
  ];

  final names =
      <String>[
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(numbers);
  print(names);
}


// ============================================================================
// 03. LIST LITERALS
// ============================================================================

void listLiteralExample() {
  final fruits = [
    "Apple",
    "Banana",
    "Mango",
  ];

  print(fruits);
}


// ============================================================================
// 04. LIST INDEXING
// ============================================================================

void listIndexExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  print(names[0]);
  print(names[1]);
  print(names[2]);
}


// ============================================================================
// IMPORTANT:
//
// names[0] → first item
// names[1] → second item
// names[2] → third item
//
// Accessing an invalid index causes a RangeError.
//
// ============================================================================


// ============================================================================
// 05. LIST LENGTH
// ============================================================================

void listLengthExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.length);
}


// ============================================================================
// 06. FIRST / LAST
// ============================================================================

void firstLastExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.first);
  print(numbers.last);

  print(numbers.isEmpty);
  print(numbers.isNotEmpty);
}


// ============================================================================
// 07. ADD
// ============================================================================

void listAddExample() {
  final names = <String>[];

  names.add("Palash");
  names.add("Rahim");

  print(names);
}


// ============================================================================
// 08. ADD ALL
// ============================================================================

void listAddAllExample() {
  final names = <String>[
    "Palash",
  ];

  names.addAll([
    "Rahim",
    "Karim",
  ]);

  print(names);
}


// ============================================================================
// 09. INSERT
// ============================================================================

void listInsertExample() {
  final numbers = [
    10,
    30,
  ];

  numbers.insert(
    1,
    20,
  );

  print(numbers);
}


// Result:
//
// [10, 20, 30]
//
// ============================================================================


// ============================================================================
// 10. INSERT ALL
// ============================================================================

void listInsertAllExample() {
  final numbers = [
    10,
    50,
  ];

  numbers.insertAll(
    1,
    [
      20,
      30,
      40,
    ],
  );

  print(numbers);
}


// ============================================================================
// 11. REMOVE
// ============================================================================

void listRemoveExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  names.remove("B");

  print(names);
}


// ============================================================================
// 12. REMOVE AT
// ============================================================================

void removeAtExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  names.removeAt(1);

  print(names);
}


// ============================================================================
// 13. REMOVE WHERE
// ============================================================================

void removeWhereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  numbers.removeWhere(
    (number) => number.isEven,
  );

  print(numbers);
}


// Result:
//
// [1, 3, 5]
//
// ============================================================================


// ============================================================================
// 14. RETAIN WHERE
// ============================================================================
//
// Keeps only items that satisfy the condition.
//
// ============================================================================

void retainWhereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  numbers.retainWhere(
    (number) => number.isEven,
  );

  print(numbers);
}


// Result:
//
// [2, 4]
//
// ============================================================================


// ============================================================================
// 15. CLEAR
// ============================================================================

void clearExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  numbers.clear();

  print(numbers);
}


// ============================================================================
// 16. CONTAINS
// ============================================================================

void containsExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(
    names.contains("Palash"),
  );

  print(
    names.contains("John"),
  );
}


// ============================================================================
// 17. INDEX OF
// ============================================================================

void indexOfExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  print(
    names.indexOf("B"),
  );
}


// ============================================================================
// 18. LAST INDEX OF
// ============================================================================

void lastIndexOfExample() {
  final numbers = [
    10,
    20,
    10,
    30,
  ];

  print(
    numbers.lastIndexOf(10),
  );
}


// ============================================================================
// 19. SUBLIST
// ============================================================================

void sublistExample() {
  final numbers = [
    10,
    20,
    30,
    40,
    50,
  ];

  final result =
      numbers.sublist(
    1,
    4,
  );

  print(result);
}


// Result:
//
// [20, 30, 40]
//
// Start index = included
// End index = excluded
//
// ============================================================================


// ============================================================================
// 20. GET RANGE
// ============================================================================

void getRangeExample() {
  final numbers = [
    10,
    20,
    30,
    40,
  ];

  final result =
      numbers
          .getRange(
            1,
            3,
          )
          .toList();

  print(result);
}


// ============================================================================
// 21. ITERABLE
// ============================================================================
//
// Iterable is one of the MOST important concepts in Dart collections.
//
// List, Set and many collection operations work through Iterable.
//
//
//
// List
//   ↓
// Iterable
//
//
//
// Many methods such as:
//
// map()
// where()
// any()
// every()
// reduce()
// fold()
//
// operate on Iterable.
//
// ============================================================================


// ============================================================================
// 22. FOR-IN
// ============================================================================

void forInExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  for (final name in names) {
    print(name);
  }
}


// ============================================================================
// 23. FOREACH
// ============================================================================

void forEachExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  numbers.forEach(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 24. MAP
// ============================================================================
//
// map transforms every item into another value.
//
// ============================================================================

void mapExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final doubled =
      numbers.map(
    (number) => number * 2,
  );

  print(doubled);
  print(doubled.toList());
}


// Result:
//
// (2, 4, 6, 8)
//
// map returns Iterable.
//
// Use toList() when you need List.
//
// ============================================================================


// ============================================================================
// 25. WHERE
// ============================================================================
//
// where filters items.
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

  final evenNumbers =
      numbers.where(
    (number) => number.isEven,
  );

  print(
    evenNumbers.toList(),
  );
}


// ============================================================================
// 26. Wheretype
// ============================================================================
//
// Useful when a collection contains multiple types.
//
// ============================================================================

void whereTypeExample() {
  final values = <dynamic>[
    10,
    "Hello",
    20,
    true,
    30,
  ];

  final integers =
      values.whereType<int>();

  print(
    integers.toList(),
  );
}


// ============================================================================
// 27. EXPAND
// ============================================================================
//
// expand converts each item into multiple items.
//
// ============================================================================

void expandExample() {
  final numbers = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  final result =
      numbers.expand(
    (list) => list,
  );

  print(
    result.toList(),
  );
}


// Result:
//
// [1, 2, 3, 4, 5, 6]
//
// Very useful when API data contains nested lists.
//
// ============================================================================


// ============================================================================
// 28. TAKE
// ============================================================================

void takeExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  print(
    numbers.take(3).toList(),
  );
}


// Result:
//
// [1, 2, 3]
//
// ============================================================================


// ============================================================================
// 29. TAKE WHILE
// ============================================================================

void takeWhileExample() {
  final numbers = [
    2,
    4,
    6,
    7,
    8,
  ];

  final result =
      numbers.takeWhile(
    (number) => number.isEven,
  );

  print(
    result.toList(),
  );
}


// Result:
//
// [2, 4, 6]
//
// It stops when the condition becomes false.
//
// ============================================================================


// ============================================================================
// 30. SKIP
// ============================================================================

void skipExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  print(
    numbers.skip(2).toList(),
  );
}


// Result:
//
// [3, 4, 5]
//
// ============================================================================


// ============================================================================
// 31. SKIP WHILE
// ============================================================================

void skipWhileExample() {
  final numbers = [
    2,
    4,
    6,
    7,
    8,
  ];

  final result =
      numbers.skipWhile(
    (number) => number.isEven,
  );

  print(
    result.toList(),
  );
}


// Result:
//
// [7, 8]
//
// ============================================================================


// ============================================================================
// 32. FIRST WHERE
// ============================================================================

void firstWhereExample() {
  final numbers = [
    1,
    3,
    5,
    8,
    10,
  ];

  final result =
      numbers.firstWhere(
    (number) => number.isEven,
  );

  print(result);
}


// Result:
//
// 8
//
// ============================================================================


// ============================================================================
// SAFE FIRST WHERE
// ============================================================================
//
// If no element matches, firstWhere normally throws an exception.
//
// Use orElse when appropriate.
//
// ============================================================================

void safeFirstWhereExample() {
  final numbers = [
    1,
    3,
    5,
  ];

  final result =
      numbers.firstWhere(
    (number) => number.isEven,
    orElse: () => -1,
  );

  print(result);
}


// ============================================================================
// 33. LAST WHERE
// ============================================================================

void lastWhereExample() {
  final numbers = [
    2,
    4,
    5,
    6,
    8,
  ];

  final result =
      numbers.lastWhere(
    (number) => number.isEven,
  );

  print(result);
}


// ============================================================================
// 34. SINGLE WHERE
// ============================================================================
//
// singleWhere expects exactly ONE matching item.
//
// If:
//
// 0 items → error
// 2+ items → error
//
// Use it when your business logic guarantees uniqueness.
//
// ============================================================================

void singleWhereExample() {
  final users = [
    "admin",
    "employee",
    "vendor",
  ];

  final result =
      users.singleWhere(
    (user) => user == "admin",
  );

  print(result);
}


// ============================================================================
// 35. ANY
// ============================================================================
//
// Returns true if at least one item satisfies the condition.
//
// ============================================================================

void anyExample() {
  final numbers = [
    1,
    3,
    5,
    8,
  ];

  final hasEven =
      numbers.any(
    (number) => number.isEven,
  );

  print(hasEven);
}


// ============================================================================
// 36. EVERY
// ============================================================================
//
// Returns true if every item satisfies the condition.
//
// ============================================================================

void everyExample() {
  final numbers = [
    2,
    4,
    6,
  ];

  final allEven =
      numbers.every(
    (number) => number.isEven,
  );

  print(allEven);
}


// ============================================================================
// 37. CONTAINS
// ============================================================================
//
// Iterable also supports contains.
//
// ============================================================================


// ============================================================================
// 38. REDUCE
// ============================================================================
//
// reduce combines elements into one value.
//
// ============================================================================

void reduceExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final total =
      numbers.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// Result:
//
// 60
//
// IMPORTANT:
//
// reduce requires a non-empty collection.
//
// ============================================================================


// ============================================================================
// 39. FOLD
// ============================================================================
//
// fold is more flexible than reduce because you provide an initial value.
//
// ============================================================================

void foldExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final total =
      numbers.fold<int>(
    0,
    (sum, number) =>
        sum + number,
  );

  print(total);
}


// ============================================================================
// REDUCE VS FOLD
// ============================================================================
//
// reduce:
//
//   [10, 20, 30]
//      ↓
//   60
//
// fold:
//
//   initial = 0
//      ↓
//   0 + 10 + 20 + 30
//
// fold works safely with empty collections when an appropriate initial
// value is provided.
//
// ============================================================================


// ============================================================================
// 40. JOIN
// ============================================================================

void joinExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final result =
      names.join(", ");

  print(result);
}


// Result:
//
// Palash, Rahim, Karim
//
// ============================================================================


// ============================================================================
// 41. TOLIST
// ============================================================================

void toListExample() {
  final numbers =
      Iterable.generate(
    5,
    (index) => index + 1,
  );

  final list =
      numbers.toList();

  print(list);
}


// ============================================================================
// 42. TOSET
// ============================================================================

void toSetExample() {
  final numbers = [
    1,
    2,
    2,
    3,
    3,
  ];

  final unique =
      numbers.toSet();

  print(unique);
}


// Result:
//
// {1, 2, 3}
//
// ============================================================================
// 43. SET BASICS
// ============================================================================
//
// Set stores unique values.
//
// ============================================================================

void setBasics() {
  final numbers =
      <int>{
    1,
    2,
    3,
  };

  print(numbers);
}


// ============================================================================
// 44. SET CREATION
// ============================================================================

void setCreation() {
  final names =
      <String>{
    "Palash",
    "Rahim",
    "Karim",
  };

  print(names);
}


// ============================================================================
// 45. SET UNIQUENESS
// ============================================================================

void setUniqueness() {
  final numbers =
      <int>{
    1,
    1,
    2,
    2,
    3,
  };

  print(numbers);
}


// Result:
//
// {1, 2, 3}
//
// ============================================================================
// 46. SET ADD
// ============================================================================

void setAddExample() {
  final roles =
      <String>{
    "admin",
  };

  roles.add("employee");

  print(roles);
}


// ============================================================================
// 47. SET ADD ALL
// ============================================================================

void setAddAllExample() {
  final roles =
      <String>{
    "admin",
  };

  roles.addAll([
    "employee",
    "vendor",
  ]);

  print(roles);
}


// ============================================================================
// 48. SET REMOVE
// ============================================================================

void setRemoveExample() {
  final roles =
      <String>{
    "admin",
    "employee",
  };

  roles.remove("employee");

  print(roles);
}


// ============================================================================
// 49. SET CONTAINS
// ============================================================================

void setContainsExample() {
  final permissions =
      <String>{
    "read",
    "write",
  };

  print(
    permissions.contains("read"),
  );
}


// ============================================================================
// 50. SET UNION
// ============================================================================

void setUnionExample() {
  final a =
      <int>{
    1,
    2,
    3,
  };

  final b =
      <int>{
    3,
    4,
    5,
  };

  final result =
      a.union(b);

  print(result);
}


// Result:
//
// {1, 2, 3, 4, 5}
//
// ============================================================================
// 51. SET INTERSECTION
// ============================================================================

void setIntersectionExample() {
  final a =
      <int>{
    1,
    2,
    3,
  };

  final b =
      <int>{
    2,
    3,
    4,
  };

  print(
    a.intersection(b),
  );
}


// Result:
//
// {2, 3}
//
// ============================================================================
// 52. SET DIFFERENCE
// ============================================================================

void setDifferenceExample() {
  final a =
      <int>{
    1,
    2,
    3,
  };

  final b =
      <int>{
    2,
    3,
  };

  print(
    a.difference(b),
  );
}


// Result:
//
// {1}
//
// ============================================================================
// 53. MAP BASICS
// ============================================================================
//
// Map stores:
//
// KEY → VALUE
//
// ============================================================================

void mapBasics() {
  final user = {
    "name": "Palash",
    "age": 25,
    "role": "developer",
  };

  print(user);
}


// ============================================================================
// 54. MAP CREATION
// ============================================================================

void mapCreation() {
  final scores =
      <String, int>{
    "Math": 90,
    "English": 85,
    "Physics": 88,
  };

  print(scores);
}


// ============================================================================
// 55. MAP INDEXING
// ============================================================================

void mapIndexExample() {
  final user =
      <String, dynamic>{
    "name": "Palash",
    "age": 25,
  };

  print(
    user["name"],
  );

  print(
    user["age"],
  );
}


// ============================================================================
// 56. MAP ADD / UPDATE
// ============================================================================

void mapUpdateExample() {
  final user =
      <String, dynamic>{
    "name": "Palash",
  };

  user["age"] = 25;

  user["name"] =
      "Mohammad Palash";

  print(user);
}


// ============================================================================
// 57. MAP REMOVE
// ============================================================================

void mapRemoveExample() {
  final user =
      <String, dynamic>{
    "name": "Palash",
    "age": 25,
  };

  user.remove("age");

  print(user);
}


// ============================================================================
// 58. CONTAINS KEY
// ============================================================================

void containsKeyExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  print(
    user.containsKey("name"),
  );
}


// ============================================================================
// 59. CONTAINS VALUE
// ============================================================================

void containsValueExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  print(
    user.containsValue("Palash"),
  );
}


// ============================================================================
// 60. MAP KEYS
// ============================================================================

void mapKeysExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  print(
    user.keys,
  );
}


// ============================================================================
// 61. MAP VALUES
// ============================================================================

void mapValuesExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  print(
    user.values,
  );
}


// ============================================================================
// 62. MAP ENTRIES
// ============================================================================

void mapEntriesExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  for (final entry
      in user.entries) {
    print(
      "${entry.key}: ${entry.value}",
    );
  }
}


// ============================================================================
// 63. MAP FOREACH
// ============================================================================

void mapForEachExample() {
  final user = {
    "name": "Palash",
    "age": 25,
  };

  user.forEach(
    (key, value) {
      print(
        "$key = $value",
      );
    },
  );
}


// ============================================================================
// 64. PUT IF ABSENT
// ============================================================================
//
// Adds a value only if the key doesn't already exist.
//
// ============================================================================

void putIfAbsentExample() {
  final user =
      <String, String>{
    "name": "Palash",
  };

  user.putIfAbsent(
    "role",
    () => "developer",
  );

  user.putIfAbsent(
    "name",
    () => "Other Name",
  );

  print(user);
}


// name remains Palash.
//
// ============================================================================


// ============================================================================
// 65. MAP UPDATE
// ============================================================================

void mapUpdateMethodExample() {
  final scores =
      <String, int>{
    "Math": 80,
  };

  scores.update(
    "Math",
    (value) => value + 10,
  );

  print(scores);
}


// ============================================================================
// 66. UPDATE ALL
// ============================================================================

void updateAllExample() {
  final scores =
      <String, int>{
    "Math": 80,
    "English": 70,
    "Physics": 90,
  };

  scores.updateAll(
    (key, value) =>
        value + 5,
  );

  print(scores);
}


// ============================================================================
// 67. MAP TRANSFORMATION
// ============================================================================

void transformationExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final discounted =
      prices
          .map(
            (price) =>
                price * 0.9,
          )
          .toList();

  print(discounted);
}


// ============================================================================
// 68. FILTERING
// ============================================================================

void filteringExample() {
  final prices = [
    100,
    500,
    1000,
    1500,
  ];

  final expensive =
      prices
          .where(
            (price) =>
                price >= 1000,
          )
          .toList();

  print(expensive);
}


// ============================================================================
// 69. EXPAND NESTED DATA
// ============================================================================

void nestedExpandExample() {
  final orders = [
    ["P001", "P002"],
    ["P003"],
    ["P004", "P005"],
  ];

  final products =
      orders
          .expand(
            (order) => order,
          )
          .toList();

  print(products);
}


// ============================================================================
// 70. REDUCE
// ============================================================================

void reduceTotalExample() {
  final prices = [
    100.0,
    200.0,
    300.0,
  ];

  final total =
      prices.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// ============================================================================
// 71. FOLD
// ============================================================================

void foldTotalExample() {
  final prices = [
    100.0,
    200.0,
    300.0,
  ];

  final total =
      prices.fold<double>(
    0,
    (sum, price) =>
        sum + price,
  );

  print(total);
}


// ============================================================================
// 72. CHAINING OPERATIONS
// ============================================================================
//
// This pattern is VERY common in Flutter.
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
    7,
    8,
  ];

  final result =
      numbers
          .where(
            (number) =>
                number.isEven,
          )
          .map(
            (number) =>
                number * 10,
          )
          .where(
            (number) =>
                number >= 40,
          )
          .toList();

  print(result);
}


// Flow:
//
// Original
//   ↓
// Filter even
//   ↓
// Multiply by 10
//   ↓
// Filter >= 40
//   ↓
// List
//
// ============================================================================
// 73. SORT
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


// Result:
//
// [10, 20, 30, 40, 50]
//
// ============================================================================
// 74. CUSTOM SORTING
// ============================================================================

void customSortExample() {
  final numbers = [
    10,
    50,
    20,
    40,
    30,
  ];

  numbers.sort(
    (a, b) => b.compareTo(a),
  );

  print(numbers);
}


// Descending order.
//
// ============================================================================
// 75. SORT OBJECTS
// ============================================================================

class Student {
  final String name;
  final int marks;

  Student({
    required this.name,
    required this.marks,
  });
}


void sortObjectsExample() {
  final students = [
    Student(
      name: "A",
      marks: 70,
    ),
    Student(
      name: "B",
      marks: 90,
    ),
    Student(
      name: "C",
      marks: 80,
    ),
  ];

  students.sort(
    (a, b) =>
        b.marks.compareTo(
      a.marks,
    ),
  );

  for (final student
      in students) {
    print(
      "${student.name}: ${student.marks}",
    );
  }
}


// ============================================================================
// 76. REVERSE SORTING
// ============================================================================

void reverseSortExample() {
  final names = [
    "Apple",
    "Mango",
    "Banana",
  ];

  names.sort();

  final reversed =
      names.reversed.toList();

  print(reversed);
}


// ============================================================================
// 77. GENERIC FUNCTIONS
// ============================================================================
//
// Generic means code can work with multiple types while remaining type-safe.
//
// ============================================================================

T firstItem<T>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================

void genericFunctionExample() {
  final number =
      firstItem<int>(
    [10, 20, 30],
  );

  final name =
      firstItem<String>(
    ["A", "B", "C"],
  );

  print(number);
  print(name);
}


// ============================================================================
// 78. GENERIC CLASSES
// ============================================================================

class Box<T> {
  final T value;

  Box(
    this.value,
  );
}


// ============================================================================

void genericClassExample() {
  final intBox =
      Box<int>(100);

  final stringBox =
      Box<String>("Hello");

  print(intBox.value);
  print(stringBox.value);
}


// ============================================================================
// 79. GENERIC METHODS
// ============================================================================

class Storage {
  T getValue<T>(
    T value,
  ) {
    return value;
  }
}


// ============================================================================
// 80. GENERIC REPOSITORY
// ============================================================================
//
// Generic repositories are useful in large applications.
//
// ============================================================================

abstract interface class GenericRepository<T> {
  Future<List<T>> getAll();

  Future<T?> getById(
    String id,
  );
}


// ============================================================================
// 81. GENERIC API RESPONSE
// ============================================================================

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.success(
    T data,
  ) {
    return ApiResponse<T>(
      success: true,
      data: data,
    );
  }

  factory ApiResponse.failure(
    String message,
  ) {
    return ApiResponse<T>(
      success: false,
      message: message,
    );
  }
}


// ============================================================================

void genericResponseExample() {
  final response =
      ApiResponse<List<String>>.success(
    [
      "Product 1",
      "Product 2",
    ],
  );

  print(
    response.data,
  );
}


// ============================================================================
// 82. GENERIC PAGINATION
// ============================================================================

class PaginatedResponse<T> {
  final List<T> items;
  final int page;
  final int totalPages;

  const PaginatedResponse({
    required this.items,
    required this.page,
    required this.totalPages,
  });

  bool get hasNextPage =>
      page < totalPages;
}


// ============================================================================
// Example:
//
// PaginatedResponse<ProductModel>
//
// PaginatedResponse<OrderModel>
//
// PaginatedResponse<CustomerModel>
//
// Same pagination structure,
// different data types.
//
// ============================================================================
// 83. GENERIC CONSTRAINTS
// ============================================================================
//
// Generic type parameters can be restricted.
//
// ============================================================================

class Repository<T extends ProductModel> {
  T process(T product) {
    return product;
  }
}


// ============================================================================
// T must be ProductModel or a subtype.
//
// ============================================================================
// 84. NULLABLE COLLECTIONS
// ============================================================================

void nullableCollectionExample() {
  List<String>? names;

  names = [
    "Palash",
    "Rahim",
  ];

  print(names);
}


// ============================================================================
// 85. NULLABLE ELEMENTS
// ============================================================================

void nullableElementsExample() {
  final names =
      <String?>[
    "Palash",
    null,
    "Rahim",
  ];

  print(names);
}


// ============================================================================
// 86. FILTER NULL VALUES
// ============================================================================

void filterNullExample() {
  final names =
      <String?>[
    "Palash",
    null,
    "Rahim",
    null,
  ];

  final validNames =
      names
          .whereType<String>()
          .toList();

  print(validNames);
}


// ============================================================================
// 87. WHERE TYPE
// ============================================================================
//
// whereType<T>() is especially useful when filtering mixed or nullable data.
//
// ============================================================================
// 88. JSON LIST
// ============================================================================
//
// API frequently returns:
//
// [
//   {...},
//   {...},
//   {...}
// ]
//
// ============================================================================

class SimpleProduct {
  final String id;
  final String name;

  const SimpleProduct({
    required this.id,
    required this.name,
  });

  factory SimpleProduct.fromJson(
    Map<String, dynamic> json,
  ) {
    return SimpleProduct(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}


// ============================================================================

void jsonListExample() {
  final jsonList =
      <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "iPhone",
    },
    {
      "id": "P002",
      "name": "Samsung",
    },
  ];

  final products =
      jsonList
          .map(
            SimpleProduct.fromJson,
          )
          .toList();

  print(products);
}


// ============================================================================
// 89. JSON MAP
// ============================================================================

void jsonMapExample() {
  final json =
      <String, dynamic>{
    "id": "P001",
    "name": "iPhone",
    "price": 120000,
  };

  print(json["name"]);
}


// ============================================================================
// 90. API RESPONSE PARSING
// ============================================================================

class ApiProductResponse {
  final List<SimpleProduct>
      products;

  const ApiProductResponse({
    required this.products,
  });

  factory ApiProductResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final data =
        json["data"]
            as List<dynamic>;

    final products =
        data
            .map(
              (item) =>
                  SimpleProduct.fromJson(
                item
                    as Map<String, dynamic>,
              ),
            )
            .toList();

    return ApiProductResponse(
      products: products,
    );
  }
}


// ============================================================================
// 91. PRODUCT COLLECTION
// ============================================================================

void productCollectionExample() {
  final products =
      <ErpProduct>[
    const ErpProduct(
      id: "P001",
      sku: "A001",
      name: "iPhone",
      sellingPrice: 120000,
      stock: 10,
    ),
    const ErpProduct(
      id: "P002",
      sku: "A002",
      name: "Samsung",
      sellingPrice: 90000,
      stock: 2,
    ),
    const ErpProduct(
      id: "P003",
      sku: "A003",
      name: "Nokia",
      sellingPrice: 20000,
      stock: 0,
    ),
  ];

  print(products);
}


// ============================================================================
// 92. INVENTORY FILTERING
// ============================================================================

void inventoryFilteringExample() {
  final products =
      <ErpProduct>[
    const ErpProduct(
      id: "P001",
      sku: "A001",
      name: "iPhone",
      sellingPrice: 120000,
      stock: 10,
    ),
    const ErpProduct(
      id: "P002",
      sku: "A002",
      name: "Samsung",
      sellingPrice: 90000,
      stock: 2,
    ),
    const ErpProduct(
      id: "P003",
      sku: "A003",
      name: "Nokia",
      sellingPrice: 20000,
      stock: 0,
    ),
  ];

  final lowStock =
      products
          .where(
            (product) =>
                product.isLowStock,
          )
          .toList();

  final outOfStock =
      products
          .where(
            (product) =>
                product.isOutOfStock,
          )
          .toList();

  print(lowStock);
  print(outOfStock);
}


// ============================================================================
// 93. CART CALCULATIONS
// ============================================================================

class CartItem {
  final String name;
  final double price;
  final int quantity;

  const CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });

  double get subtotal =>
      price * quantity;
}


// ============================================================================

void cartCalculationExample() {
  final cart =
      <CartItem>[
    const CartItem(
      name: "Phone",
      price: 100000,
      quantity: 1,
    ),
    const CartItem(
      name: "Charger",
      price: 2000,
      quantity: 2,
    ),
  ];

  final total =
      cart.fold<double>(
    0,
    (sum, item) =>
        sum + item.subtotal,
  );

  print(total);
}


// ============================================================================
// 94. PAGINATION
// ============================================================================

void paginationExample() {
  final products =
      List.generate(
    100,
    (index) =>
        "Product ${index + 1}",
  );

  const page = 2;
  const pageSize = 10;

  final start =
      (page - 1) * pageSize;

  final end =
      start + pageSize;

  final currentPage =
      products.sublist(
    start,
    end,
  );

  print(currentPage);
}


// ============================================================================
// IMPORTANT:
//
// In real applications, pagination should preferably happen on the server.
//
// Example:
//
// GET /products?page=2&limit=10
//
// Do not download 100,000 products just to show 10.
//
// ============================================================================
// 95. SEARCH
// ============================================================================

void searchExample() {
  final products = [
    "iPhone 15",
    "Samsung S25",
    "iPhone 16",
    "Google Pixel",
  ];

  const query = "iphone";

  final results =
      products
          .where(
            (product) =>
                product
                    .toLowerCase()
                    .contains(
                      query.toLowerCase(),
                    ),
          )
          .toList();

  print(results);
}


// ============================================================================
// 96. GROUPING
// ============================================================================
//
// Dart core doesn't provide a direct groupBy() method.
//
// You can implement grouping using Map.
//
// ============================================================================

void groupingExample() {
  final products = [
    {
      "name": "iPhone",
      "category": "Mobile",
    },
    {
      "name": "Samsung",
      "category": "Mobile",
    },
    {
      "name": "Laptop",
      "category": "Computer",
    },
  ];

  final grouped =
      <String, List<Map<String, String>>>{};

  for (final product
      in products) {
    final category =
        product["category"]!;

    grouped
        .putIfAbsent(
          category,
          () => [],
        )
        .add(product);
  }

  print(grouped);
}


// ============================================================================
// 97. DEDUPLICATION
// ============================================================================

void deduplicationExample() {
  final skus = [
    "SKU001",
    "SKU002",
    "SKU001",
    "SKU003",
    "SKU002",
  ];

  final uniqueSkus =
      skus.toSet().toList();

  print(uniqueSkus);
}


// ============================================================================
// 98. GENERIC REPOSITORY
// ============================================================================

abstract interface class DataRepository<T> {
  Future<List<T>> getAll();

  Future<T?> findById(
    String id,
  );
}


// ============================================================================

class ProductDataRepository
    implements DataRepository<SimpleProduct> {
  final List<SimpleProduct>
      products;

  ProductDataRepository(
    this.products,
  );

  @override
  Future<List<SimpleProduct>>
      getAll() async {
    return products;
  }

  @override
  Future<SimpleProduct?>
      findById(
    String id,
  ) async {
    for (final product
        in products) {
      if (product.id == id) {
        return product;
      }
    }

    return null;
  }
}


// ============================================================================
// 99. GENERIC API RESPONSE
// ============================================================================
//
// A single response structure can support:
//
// ApiResponse<UserModel>
// ApiResponse<ProductModel>
// ApiResponse<OrderModel>
// ApiResponse<List<ProductModel>>
// ApiResponse<Map<String, dynamic>>
//
// ============================================================================

void genericApiExamples() {
  final userResponse =
      ApiResponse<String>.success(
    "User created",
  );

  final productResponse =
      ApiResponse<List<String>>.success(
    [
      "iPhone",
      "Samsung",
    ],
  );

  print(
    userResponse.data,
  );

  print(
    productResponse.data,
  );
}


// ============================================================================
// 100. PRODUCTION COLLECTION PATTERNS
// ============================================================================
//
// NEVER blindly use:
//
// List<dynamic>
// Map<String, dynamic>
//
// everywhere in a large application.
//
// Prefer:
//
// List<ProductModel>
// List<OrderModel>
// List<CustomerModel>
//
// Map<String, int>
// Map<String, double>
//
// This gives:
//
//   • compile-time safety
//   • autocomplete
//   • fewer runtime errors
//   • easier refactoring
//   • better architecture
//
// ============================================================================


// ============================================================================
// ⭐ COLLECTION METHOD CHEAT SHEET
// ============================================================================
//
// map
//   → transform every item
//
// where
//   → filter items
//
// expand
//   → flatten nested collections
//
// take
//   → first N items
//
// skip
//   → skip first N items
//
// firstWhere
//   → first matching item
//
// lastWhere
//   → last matching item
//
// singleWhere
//   → exactly one matching item
//
// any
//   → at least one matches
//
// every
//   → all match
//
// reduce
//   → combine items
//
// fold
//   → combine with initial value
//
// join
//   → convert items to String
//
// toList
//   → create List
//
// toSet
//   → create Set and remove duplicates
//
// ============================================================================


// ============================================================================
// ⭐ LIST VS SET VS MAP
// ============================================================================
//
// LIST
// ----------------------------------------------------------------------------
//
// Ordered
// Duplicate values allowed
// Index-based
//
// Example:
//
// ["A", "B", "A"]
//
// Use when:
//
//   • order matters
//   • displaying UI lists
//   • API arrays
//   • products
//   • orders
//
//
//
// SET
// ----------------------------------------------------------------------------
//
// Unique values
// No duplicate values
//
// Example:
//
// {"admin", "employee"}
//
// Use when:
//
//   • permissions
//   • tags
//   • unique IDs
//   • deduplication
//
//
//
// MAP
// ----------------------------------------------------------------------------
//
// Key → Value
//
// Example:
//
// {
//   "name": "Palash",
//   "age": 25
// }
//
// Use when:
//
//   • JSON
//   • lookup tables
//   • configuration
//   • indexed data
//
// ============================================================================


// ============================================================================
// ⭐ MAP VS MODEL
// ============================================================================
//
// Map:
//
// Map<String, dynamic>
//
// Flexible but less type-safe.
//
//
//
// Model:
//
// ProductModel
//
// More type-safe.
//
//
//
// For professional Flutter:
//
// API JSON
//    ↓
// Model
//    ↓
// Business Logic
//    ↓
// UI
//
// Avoid passing raw Map<String, dynamic> everywhere.
//
// ============================================================================


// ============================================================================
// ⭐ LAZY ITERABLE CONCEPT
// ============================================================================
//
// Many Iterable operations are lazy.
//
// Example:
//
// final result = numbers
//     .where(...)
//     .map(...);
//
// The transformation doesn't necessarily happen immediately.
//
// Calling:
//
// .toList()
//
// materializes the result into a List.
//
//
//
// This matters when processing large collections.
//
// ============================================================================


// ============================================================================
// ⭐ PERFORMANCE WARNING
// ============================================================================
//
// Avoid unnecessary collection chains on very large datasets.
//
// Example:
//
// products
//   .where(...)
//   .map(...)
//   .toList();
//
// This is usually perfectly fine.
//
// But for huge datasets:
//
//   • consider server-side filtering
//   • pagination
//   • database queries
//   • indexed searches
//   • avoiding unnecessary copies
//
// ============================================================================


// ============================================================================
// ⭐ REAL ERP DATA FLOW
// ============================================================================
//
// MongoDB
//    ↓
// Node.js API
//    ↓
// JSON
//    ↓
// Flutter
//    ↓
// List<Map<String, dynamic>>
//    ↓
// List<ProductModel>
//    ↓
// Repository
//    ↓
// Service
//    ↓
// Controller / State
//    ↓
// UI ListView
//
// ============================================================================


// ============================================================================
// ⭐ EXAMPLE: ERP PRODUCT PIPELINE
// ============================================================================

void erpProductPipeline() {
  final products =
      <ErpProduct>[
    const ErpProduct(
      id: "P001",
      sku: "IPH-001",
      name: "iPhone",
      sellingPrice: 120000,
      stock: 10,
    ),
    const ErpProduct(
      id: "P002",
      sku: "SAM-001",
      name: "Samsung",
      sellingPrice: 90000,
      stock: 2,
    ),
    const ErpProduct(
      id: "P003",
      sku: "NOK-001",
      name: "Nokia",
      sellingPrice: 20000,
      stock: 0,
    ),
  ];

  final result =
      products
          // Remove out-of-stock products.
          .where(
            (product) =>
                !product.isOutOfStock,
          )

          // Keep only products cheaper than 100,000.
          .where(
            (product) =>
                product.sellingPrice <
                100000,
          )

          // Sort by stock.
          .toList()
        ..sort(
          (a, b) =>
              a.stock.compareTo(
            b.stock,
          ),
        );

  for (final product
      in result) {
    print(
      "${product.name}: ${product.stock}",
    );
  }
}


// ============================================================================
// ⭐ EXAMPLE: PRODUCT SEARCH + FILTER + SORT
// ============================================================================

void advancedProductSearch() {
  final products =
      <ErpProduct>[
    const ErpProduct(
      id: "P001",
      sku: "IPH-001",
      name: "iPhone 15",
      sellingPrice: 100000,
      stock: 10,
    ),
    const ErpProduct(
      id: "P002",
      sku: "IPH-002",
      name: "iPhone 16",
      sellingPrice: 120000,
      stock: 5,
    ),
    const ErpProduct(
      id: "P003",
      sku: "SAM-001",
      name: "Samsung S25",
      sellingPrice: 90000,
      stock: 20,
    ),
  ];

  const search = "iphone";

  final result =
      products
          .where(
            (product) =>
                product.name
                    .toLowerCase()
                    .contains(
                      search.toLowerCase(),
                    ),
          )
          .where(
            (product) =>
                product.stock > 0,
          )
          .toList()
        ..sort(
          (a, b) =>
              a.sellingPrice.compareTo(
            b.sellingPrice,
          ),
        );

  print(result);
}


// ============================================================================
// ⭐ GENERIC PAGINATION EXAMPLE
// ============================================================================

PaginatedResponse<T>
createPage<T>(
  List<T> items,
  int page,
  int pageSize,
) {
  final start =
      (page - 1) * pageSize;

  if (start >= items.length) {
    return PaginatedResponse<T>(
      items: [],
      page: page,
      totalPages:
          (items.length / pageSize)
              .ceil(),
    );
  }

  final end =
      (start + pageSize)
          .clamp(
            0,
            items.length,
          );

  return PaginatedResponse<T>(
    items:
        items.sublist(
      start,
      end,
    ),
    page: page,
    totalPages:
        (items.length / pageSize)
            .ceil(),
  );
}


// ============================================================================
// ⭐ IMPORTANT GENERIC CONCEPT
// ============================================================================
//
// Without generics:
//
// List<dynamic>
//
// You lose type safety.
//
//
//
// With generics:
//
// List<ProductModel>
//
// Dart knows:
//
//   "Every item is ProductModel"
//
//
//
// This is extremely important in professional Flutter applications.
//
// ============================================================================


// ============================================================================
// ⭐ COLLECTIONS + NULL SAFETY
// ============================================================================

void collectionNullSafety() {
  final products =
      <ProductModel?>[
    const ProductModel(
      id: "P001",
      name: "iPhone",
      price: 120000,
    ),
    null,
    const ProductModel(
      id: "P002",
      name: "Samsung",
      price: 90000,
    ),
  ];

  final validProducts =
      products
          .whereType<ProductModel>()
          .toList();

  print(validProducts);
}


// ============================================================================
// ⭐ COMMON MISTAKES
// ============================================================================
//
// ❌ Using dynamic everywhere
//
// ❌ Modifying a list while iterating over it incorrectly
//
// ❌ Calling firstWhere without considering "no match"
//
// ❌ Calling singleWhere when multiple matches are possible
//
// ❌ Using reduce() on an empty list
//
// ❌ Downloading huge datasets instead of server-side pagination
//
// ❌ Passing raw JSON maps throughout the entire app
//
// ❌ Creating unnecessary List copies
//
// ❌ Forgetting to call toList() when a List is required
//
// ============================================================================


// ============================================================================
// ⭐ MASTER CHECKLIST
// ============================================================================
//
// LIST
//
// [ ] List creation
// [ ] Indexing
// [ ] length
// [ ] first / last
// [ ] add
// [ ] addAll
// [ ] insert
// [ ] insertAll
// [ ] remove
// [ ] removeAt
// [ ] removeWhere
// [ ] retainWhere
// [ ] clear
// [ ] contains
// [ ] indexOf
// [ ] lastIndexOf
// [ ] sublist
// [ ] getRange
//
// ITERABLE
//
// [ ] Iterable
// [ ] for-in
// [ ] forEach
// [ ] map
// [ ] where
// [ ] whereType
// [ ] expand
// [ ] take
// [ ] takeWhile
// [ ] skip
// [ ] skipWhile
// [ ] firstWhere
// [ ] lastWhere
// [ ] singleWhere
// [ ] any
// [ ] every
// [ ] reduce
// [ ] fold
// [ ] join
// [ ] toList
// [ ] toSet
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
// [ ] forEach
// [ ] putIfAbsent
// [ ] update
// [ ] updateAll
// [ ] containsKey
// [ ] containsValue
//
// SORTING
//
// [ ] sort
// [ ] custom comparator
// [ ] object sorting
// [ ] reverse sorting
//
// GENERICS
//
// [ ] Generic function
// [ ] Generic class
// [ ] Generic method
// [ ] Generic repository
// [ ] Generic response
// [ ] Generic pagination
// [ ] Generic constraints
//
// REAL WORLD
//
// [ ] JSON List
// [ ] JSON Map
// [ ] API parsing
// [ ] Product filtering
// [ ] Search
// [ ] Sorting
// [ ] Deduplication
// [ ] Grouping
// [ ] Cart calculation
// [ ] Pagination
//
// ============================================================================
// ⭐ MOST IMPORTANT THINGS TO MASTER BEFORE MOVING ON
// ============================================================================
//
// 1. List
// 2. Map
// 3. Set
// 4. Iterable
// 5. map()
// 6. where()
// 7. expand()
// 8. firstWhere()
// 9. any()
// 10. every()
// 11. reduce()
// 12. fold()
// 13. sort()
// 14. Generic classes
// 15. Generic functions
// 16. Generic API responses
// 17. JSON → Model
// 18. Collection null safety
// 19. Pagination
// 20. Collection performance
//
// ============================================================================
// END OF PHASE 13
// ============================================================================
//
// NEXT:
//
// PHASE 14 — DART FUNCTIONS + CALLBACKS + FUNCTIONAL PROGRAMMING
//
// Topics will include:
//
//   • Functions deeply
//   • Parameters
//   • Optional parameters
//   • Named parameters
//   • Positional parameters
//   • Required parameters
//   • Default parameters
//   • Anonymous functions
//   • Arrow functions
//   • First-class functions
//   • Function variables
//   • Function types
//   • typedef
//   • Callbacks
//   • Higher-order functions
//   • Closures
//   • Lexical scope
//   • Returning functions
//   • Passing functions
//   • Async callbacks
//   • Flutter callbacks
//   • Event-driven programming
//   • Functional programming concepts
//
// ============================================================================
