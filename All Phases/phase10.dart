// ============================================================================
// DART MASTER ROADMAP
// PHASE 10 — COLLECTIONS, GENERICS & ADVANCED TYPE SYSTEM
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// In Phase 10 you will master Dart's collection system and advanced type
// system.
//
// These topics are extremely important for professional Flutter development.
//
// You will use them constantly when working with:
//
//   • API responses
//   • JSON data
//   • Product lists
//   • Orders
//   • ERP tables
//   • Search/filtering
//   • Pagination
//   • State management
//   • Repository layers
//   • Generic API responses
//   • Error/result handling
//   • Sealed classes
//   • Pattern matching
//   • Modern Dart architecture
//
// ============================================================================
// PHASE 10 TOPICS
// ============================================================================
//
// COLLECTIONS
//
// 01. List
// 02. Growable List
// 03. Fixed-length List
// 04. List.from
// 05. List.of
// 06. List.generate
// 07. List.filled
// 08. List.unmodifiable
// 09. List.empty
// 10. List properties
// 11. List methods
//
// SET
//
// 12. Set
// 13. Set uniqueness
// 14. Set.from
// 15. Set.of
// 16. Set operations
//
// MAP
//
// 17. Map
// 18. Map keys
// 19. Map values
// 20. Map entries
// 21. Map methods
// 22. Map transformation
//
// ITERABLE
//
// 23. Iterable
// 24. Lazy operations
// 25. Eager vs lazy
//
// COLLECTION METHODS
//
// 26. where
// 27. whereType
// 28. map
// 29. expand
// 30. followedBy
// 31. take
// 32. skip
// 33. takeWhile
// 34. skipWhile
// 35. first
// 36. last
// 37. firstWhere
// 38. singleWhere
// 39. indexWhere
// 40. any
// 41. every
// 42. contains
// 43. reduce
// 44. fold
// 45. join
// 46. forEach
//
// COLLECTION SYNTAX
//
// 47. Spread operator
// 48. Null-aware spread
// 49. Collection if
// 50. Collection for
//
// GENERICS
//
// 51. Generic class
// 52. Generic method
// 53. Generic function
// 54. Generic repository
// 55. Generic API response
// 56. Type constraints
//
// MODERN DART
//
// 57. Records
// 58. Record positional fields
// 59. Record named fields
// 60. Record destructuring
// 61. Patterns
// 62. Pattern matching
// 63. if-case
// 64. switch expressions
// 65. Sealed classes
// 66. Exhaustive switch
// 67. Enhanced enums
// 68. Typedef
// 69. Function types
//
// TYPE SYSTEM
//
// 70. dynamic
// 71. Object
// 72. Object?
// 73. Never
// 74. Null
// 75. Type promotion
// 76. Type checking
// 77. Type casting
// 78. as
// 79. is
// 80. is!
// 81. Type inference
//
// ADVANCED COLLECTION + TYPE DESIGN
//
// 82. Immutable collections concept
// 83. Unmodifiable views
// 84. Generic constraints
// 85. Covariance concept
// 86. Contravariance concept
// 87. Invariance concept
// 88. Type-safe API models
//
// REAL FLUTTER USE
//
// 89. JSON list parsing
// 90. Nested JSON parsing
// 91. Filtering products
// 92. Searching products
// 93. Sorting products
// 94. Grouping data
// 95. Pagination
// 96. API Result state
// 97. Repository generics
// 98. State modeling
// 99. ERP examples
// 100. Final architecture example
//
// ============================================================================


// ============================================================================
// 01. LIST
// ============================================================================
//
// List stores ordered values.
//
// Duplicate values are allowed.
//
// ============================================================================

void listBasicExample() {
  final numbers = <int>[
    10,
    20,
    30,
    40,
  ];

  print(numbers);
  print(numbers[0]);
  print(numbers[2]);
}


// ============================================================================
// IMPORTANT:
//
// List index starts from 0.
//
// numbers:
//
// 10 → index 0
// 20 → index 1
// 30 → index 2
// 40 → index 3
//
// ============================================================================


// ============================================================================
// 02. GROWABLE LIST
// ============================================================================
//
// A growable list can change its length.
//
// ============================================================================

void growableListExample() {
  final names = <String>[
    "Palash",
    "Rahim",
  ];

  names.add("Karim");

  names.addAll([
    "Hasan",
    "Sakib",
  ]);

  print(names);
}


// ============================================================================
// 03. FIXED-LENGTH LIST
// ============================================================================
//
// Fixed-length list cannot change its length.
//
// ============================================================================

void fixedLengthListExample() {
  final numbers =
      List<int>.filled(
    5,
    0,
    growable: false,
  );

  numbers[0] = 10;
  numbers[1] = 20;

  print(numbers);

  // numbers.add(30);
  // INVALID
}


// ============================================================================
// 04. LIST.FROM
// ============================================================================
//
// Creates a new list from another iterable.
//
// ============================================================================

void listFromExample() {
  final numbers = [1, 2, 3];

  final copy =
      List<int>.from(numbers);

  copy.add(4);

  print(numbers);
  print(copy);
}


// ============================================================================
// 05. LIST.OF
// ============================================================================
//
// Creates a list with a specified type.
//
// ============================================================================

void listOfExample() {
  final numbers =
      List<int>.of([
    1,
    2,
    3,
  ]);

  print(numbers);
}


// ============================================================================
// 06. LIST.GENERATE
// ============================================================================
//
// Generates list values dynamically.
//
// ============================================================================

void listGenerateExample() {
  final numbers =
      List<int>.generate(
    5,
    (index) => index * 10,
  );

  print(numbers);
}


// RESULT:
//
// [0, 10, 20, 30, 40]
//
// ============================================================================


// ============================================================================
// 07. LIST.FILLED
// ============================================================================

void listFilledExample() {
  final numbers =
      List<int>.filled(
    5,
    100,
  );

  print(numbers);
}


// RESULT:
//
// [100, 100, 100, 100, 100]
//
// ============================================================================


// ============================================================================
// 08. LIST.UNMODIFIABLE
// ============================================================================
//
// Creates a list that cannot be modified through that list reference.
//
// ============================================================================

void unmodifiableListExample() {
  final numbers =
      List<int>.unmodifiable([
    1,
    2,
    3,
  ]);

  print(numbers);

  // numbers.add(4);
  // ERROR
}


// ============================================================================
// 09. LIST.EMPTY
// ============================================================================

void emptyListExample() {
  final empty =
      List<String>.empty(
    growable: true,
  );

  empty.add("Hello");

  print(empty);
}


// ============================================================================
// 10. LIST PROPERTIES
// ============================================================================

void listPropertiesExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.length);
  print(numbers.isEmpty);
  print(numbers.isNotEmpty);
  print(numbers.first);
  print(numbers.last);
}


// ============================================================================
// 11. LIST METHODS
// ============================================================================

void listMethodsExample() {
  final numbers = <int>[
    10,
    20,
    30,
  ];

  numbers.add(40);

  numbers.addAll([
    50,
    60,
  ]);

  numbers.insert(
    0,
    5,
  );

  numbers.remove(20);

  numbers.removeAt(0);

  numbers.removeWhere(
    (number) => number > 40,
  );

  print(numbers);
}


// ============================================================================
// IMPORTANT LIST METHODS
// ----------------------------------------------------------------------------
//
// add()
// addAll()
// insert()
// insertAll()
// remove()
// removeAt()
// removeLast()
// removeWhere()
// retainWhere()
// clear()
// contains()
// indexOf()
// lastIndexOf()
// sort()
// shuffle()
// reversed
// sublist()
// getRange()
//
// ============================================================================


// ============================================================================
// 12. SET
// ============================================================================
//
// Set stores unique values.
//
// Duplicate values are automatically ignored.
//
// ============================================================================

void setBasicExample() {
  final numbers = <int>{
    1,
    2,
    3,
    3,
    3,
  };

  print(numbers);
}


// RESULT:
//
// {1, 2, 3}
//
// ============================================================================


// ============================================================================
// 13. SET UNIQUENESS
// ============================================================================

void removeDuplicatesExample() {
  final numbers = [
    1,
    2,
    2,
    3,
    3,
    4,
  ];

  final unique =
      numbers.toSet();

  print(unique);
}


// ============================================================================
// 14. SET.FROM
// ============================================================================

void setFromExample() {
  final numbers =
      Set<int>.from([
    1,
    2,
    2,
    3,
  ]);

  print(numbers);
}


// ============================================================================
// 15. SET.OF
// ============================================================================

void setOfExample() {
  final numbers =
      Set<int>.of([
    1,
    2,
    3,
  ]);

  print(numbers);
}


// ============================================================================
// 16. SET OPERATIONS
// ============================================================================

void setOperationsExample() {
  final a = {
    1,
    2,
    3,
    4,
  };

  final b = {
    3,
    4,
    5,
    6,
  };

  print(a.union(b));

  print(a.intersection(b));

  print(a.difference(b));

  print(b.difference(a));
}


// ============================================================================
// RESULT:
//
// union:
//
// {1,2,3,4,5,6}
//
// intersection:
//
// {3,4}
//
// a.difference(b):
//
// {1,2}
//
// ============================================================================


// ============================================================================
// 17. MAP
// ============================================================================
//
// Map stores key-value pairs.
//
// ============================================================================

void mapBasicExample() {
  final user = <String, dynamic>{
    "name": "Palash",
    "age": 25,
    "isActive": true,
  };

  print(user["name"]);
  print(user["age"]);
}


// ============================================================================
// 18. MAP KEYS
// ============================================================================

void mapKeysExample() {
  final data = {
    "name": "Palash",
    "age": 25,
  };

  print(data.keys);
}


// ============================================================================
// 19. MAP VALUES
// ============================================================================

void mapValuesExample() {
  final data = {
    "name": "Palash",
    "age": 25,
  };

  print(data.values);
}


// ============================================================================
// 20. MAP ENTRIES
// ============================================================================

void mapEntriesExample() {
  final data = {
    "name": "Palash",
    "age": 25,
  };

  for (final entry in data.entries) {
    print(
      "${entry.key}: ${entry.value}",
    );
  }
}


// ============================================================================
// 21. MAP METHODS
// ============================================================================

void mapMethodsExample() {
  final users =
      <String, String>{
    "u1": "Palash",
    "u2": "Rahim",
  };

  users["u3"] = "Karim";

  users.addAll({
    "u4": "Hasan",
    "u5": "Sakib",
  });

  users.remove("u2");

  users.putIfAbsent(
    "u6",
    () => "Nayeem",
  );

  print(users);
}


// ============================================================================
// IMPORTANT MAP METHODS:
//
// containsKey()
// containsValue()
// putIfAbsent()
// update()
// updateAll()
// remove()
// removeWhere()
// addAll()
// clear()
//
// ============================================================================


// ============================================================================
// 22. MAP TRANSFORMATION
// ============================================================================

void mapTransformationExample() {
  final prices = {
    "phone": 100000,
    "laptop": 150000,
    "watch": 20000,
  };

  final discounted =
      prices.map(
    (key, value) {
      return MapEntry(
        key,
        value * 0.9,
      );
    },
  );

  print(discounted);
}


// ============================================================================
// 23. ITERABLE
// ============================================================================
//
// Iterable is a very important Dart abstraction.
//
// List, Set, etc. implement Iterable behavior.
//
// ============================================================================

void iterableExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  Iterable<int> values =
      numbers;

  print(values);
}


// ============================================================================
// 24. LAZY OPERATIONS
// ============================================================================
//
// Many Iterable operations are lazy.
//
// Example:
//
// where()
// map()
//
// They don't necessarily process everything immediately.
//
// ============================================================================

void lazyExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final result =
      numbers.where(
    (number) {
      print("Checking $number");

      return number.isEven;
    },
  );

  print(result);
}


// ============================================================================
// 25. EAGER VS LAZY
// ============================================================================
//
// Iterable:
//
// numbers.where(...)
//
// is lazy.
//
//
//
// List:
//
// numbers.where(...).toList()
//
// materializes the result into a List.
//
// ============================================================================


// ============================================================================
// 26. WHERE
// ============================================================================
//
// Filters elements.
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

  final even =
      numbers
          .where(
            (number) =>
                number.isEven,
          )
          .toList();

  print(even);
}


// ============================================================================
// 27. WHERETYPE
// ============================================================================
//
// Filters based on type.
//
// ============================================================================

void whereTypeExample() {
  final values = <dynamic>[
    10,
    "Hello",
    20,
    true,
    "Dart",
  ];

  final strings =
      values.whereType<String>();

  print(strings);
}


// ============================================================================
// 28. MAP
// ============================================================================
//
// Transforms every element.
//
// ============================================================================

void mapIterableExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final squared =
      numbers
          .map(
            (number) =>
                number * number,
          )
          .toList();

  print(squared);
}


// ============================================================================
// 29. EXPAND
// ============================================================================
//
// Converts each element into multiple elements.
//
// ============================================================================

void expandExample() {
  final nested = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  final flat =
      nested
          .expand(
            (list) => list,
          )
          .toList();

  print(flat);
}


// RESULT:
//
// [1,2,3,4,5,6]
//
// ============================================================================


// ============================================================================
// 30. FOLLOWEDBY
// ============================================================================

void followedByExample() {
  final first = [
    1,
    2,
  ];

  final result =
      first
          .followedBy([
            3,
            4,
          ])
          .toList();

  print(result);
}


// ============================================================================
// 31. TAKE
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


// RESULT:
//
// [1,2,3]
//
// ============================================================================


// ============================================================================
// 32. SKIP
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


// RESULT:
//
// [3,4,5]
//
// ============================================================================


// ============================================================================
// 33. TAKEWHILE
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
      numbers
          .takeWhile(
            (number) =>
                number.isEven,
          )
          .toList();

  print(result);
}


// RESULT:
//
// [2,4,6]
//
// It stops when 7 is found.
//
// ============================================================================


// ============================================================================
// 34. SKIPWHILE
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
      numbers
          .skipWhile(
            (number) =>
                number.isEven,
          )
          .toList();

  print(result);
}


// RESULT:
//
// [7,8]
//
// ============================================================================


// ============================================================================
// 35. FIRST
// ============================================================================

void firstExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.first);
}


// ============================================================================
// 36. LAST
// ============================================================================

void lastExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(numbers.last);
}


// ============================================================================
// WARNING:
//
// Calling first/last on an empty collection throws an error.
//
// Use:
//
// isEmpty
//
// when necessary.
//
// ============================================================================


// ============================================================================
// 37. FIRSTWHERE
// ============================================================================
//
// Finds first matching element.
//
// ============================================================================

class EmployeeData10 {
  final String id;
  final String name;
  final int age;

  const EmployeeData10({
    required this.id,
    required this.name,
    required this.age,
  });
}

void firstWhereExample() {
  final employees = [
    const EmployeeData10(
      id: "E1",
      name: "Palash",
      age: 25,
    ),
    const EmployeeData10(
      id: "E2",
      name: "Rahim",
      age: 30,
    ),
  ];

  final employee =
      employees.firstWhere(
    (employee) =>
        employee.id == "E2",
  );

  print(employee.name);
}


// ============================================================================
// FIRSTWHERE WITH OR ELSE
// ============================================================================

void firstWhereOrElseExample() {
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
// 38. SINGLEWHERE
// ============================================================================
//
// Expects exactly one matching item.
//
// If multiple matching items exist, it throws an error.
//
// ============================================================================

void singleWhereExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final result =
      numbers.singleWhere(
    (number) => number == 2,
  );

  print(result);
}


// ============================================================================
// Use singleWhere only when you know the result should be unique.
//
// ============================================================================


// ============================================================================
// 39. INDEXWHERE
// ============================================================================

void indexWhereExample() {
  final numbers = [
    10,
    20,
    30,
    40,
  ];

  final index =
      numbers.indexWhere(
    (number) => number == 30,
  );

  print(index);
}


// ============================================================================
// RESULT:
//
// 2
//
// ============================================================================


// ============================================================================
// 40. ANY
// ============================================================================
//
// Returns true if at least one item matches.
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
// 41. EVERY
// ============================================================================
//
// Returns true if every item matches.
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
// 42. CONTAINS
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
}


// ============================================================================
// 43. REDUCE
// ============================================================================
//
// Combines elements into one value.
//
// ============================================================================

void reduceExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final total =
      numbers.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// RESULT:
//
// 10
//
// ============================================================================
//
// IMPORTANT:
//
// reduce() requires a non-empty collection.
//
// ============================================================================


// ============================================================================
// 44. FOLD
// ============================================================================
//
// Similar to reduce, but allows an initial value.
//
// ============================================================================

void foldExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final total =
      numbers.fold<int>(
    100,
    (sum, number) =>
        sum + number,
  );

  print(total);
}


// RESULT:
//
// 110
//
// ============================================================================
//
// fold() is usually safer when the collection might be empty.
//
// ============================================================================


// ============================================================================
// 45. JOIN
// ============================================================================

void joinExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final text =
      names.join(", ");

  print(text);
}


// RESULT:
//
// Palash, Rahim, Karim
//
// ============================================================================


// ============================================================================
// 46. FOREACH
// ============================================================================

void forEachExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  numbers.forEach(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 47. SPREAD OPERATOR
// ============================================================================
//
// ... expands another collection.
//
// ============================================================================

void spreadExample() {
  final first = [
    1,
    2,
  ];

  final second = [
    3,
    4,
  ];

  final combined = [
    ...first,
    ...second,
  ];

  print(combined);
}


// ============================================================================
// 48. NULL-AWARE SPREAD
// ============================================================================

void nullAwareSpreadExample() {
  List<int>? numbers;

  final result = [
    1,
    2,
    ...?numbers,
    3,
  ];

  print(result);
}


// ============================================================================
// If numbers is null, nothing is added.
//
// ============================================================================


// ============================================================================
// 49. COLLECTION IF
// ============================================================================

void collectionIfExample(
  bool isAdmin,
) {
  final menu = [
    "Home",
    "Profile",
    if (isAdmin) "Admin Panel",
  ];

  print(menu);
}


// ============================================================================
// 50. COLLECTION FOR
// ============================================================================

void collectionForExample() {
  final numbers = [
    for (int i = 1; i <= 5; i++) i * 10,
  ];

  print(numbers);
}


// ============================================================================
// COLLECTION IF + FOR
// ============================================================================

void collectionIfForExample(
  bool isAdmin,
) {
  final users = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final result = [
    for (final user in users)
      if (user != "Rahim") user,
    if (isAdmin) "Admin",
  ];

  print(result);
}


// ============================================================================
// 51. GENERIC CLASS
// ============================================================================
//
// Generics allow a class to work with different types safely.
//
// ============================================================================

class Box<T> {
  final T value;

  const Box(this.value);

  T getValue() {
    return value;
  }
}


// ============================================================================
// Usage:
//
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
// 52. GENERIC METHOD
// ============================================================================

T identity<T>(T value) {
  return value;
}


// ============================================================================
// Usage:
//
// ============================================================================

void genericMethodExample() {
  final number =
      identity<int>(100);

  final name =
      identity<String>("Palash");

  print(number);
  print(name);
}


// ============================================================================
// 53. GENERIC FUNCTION
// ============================================================================

List<T> duplicate<T>(T value) {
  return [
    value,
    value,
  ];
}


// ============================================================================
// 54. GENERIC REPOSITORY
// ============================================================================

abstract class GenericRepository<T> {
  Future<List<T>> getAll();

  Future<T?> findById(
    String id,
  );
}


// ============================================================================
// Product repository:
//
// ============================================================================

class ProductRepository10
    implements GenericRepository<ProductModel> {
  @override
  Future<List<ProductModel>>
      getAll() async {
    return const [];
  }

  @override
  Future<ProductModel?> findById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// User repository:
//
// ============================================================================

class UserRepository10
    implements GenericRepository<UserModel> {
  @override
  Future<List<UserModel>>
      getAll() async {
    return const [];
  }

  @override
  Future<UserModel?> findById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// 55. GENERIC API RESPONSE
// ============================================================================

class ApiResponse10<T> {
  final bool success;
  final T? data;
  final String? message;

  const ApiResponse10({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse10.success(
    T data,
  ) {
    return ApiResponse10(
      success: true,
      data: data,
    );
  }

  factory ApiResponse10.error(
    String message,
  ) {
    return ApiResponse10(
      success: false,
      message: message,
    );
  }
}


// ============================================================================
// Examples:
//
// ApiResponse10<UserModel>
//
// ApiResponse10<List<UserModel>>
//
// ApiResponse10<ProductModel>
//
// ApiResponse10<List<ProductModel>>
//
// ============================================================================


// ============================================================================
// 56. TYPE CONSTRAINTS
// ============================================================================
//
// Generic type can be restricted.
//
// ============================================================================

class NumericBox<T extends num> {
  final T value;

  NumericBox(this.value);

  double doubled() {
    return value.toDouble() * 2;
  }
}


// ============================================================================
// Valid:
//
// NumericBox<int>(10)
//
// NumericBox<double>(10.5)
//
// Invalid:
//
// NumericBox<String>("Hello")
//
// ============================================================================


// ============================================================================
// 57. RECORDS
// ============================================================================
//
// Records allow returning multiple values without creating a dedicated
// class.
//
// Modern Dart feature.
//
// ============================================================================

(String, int) getUserInfo() {
  return (
    "Palash",
    25,
  );
}


// ============================================================================
// Usage:
//
// ============================================================================

void recordBasicExample() {
  final result =
      getUserInfo();

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 58. POSITIONAL RECORD FIELDS
// ============================================================================

void positionalRecordExample() {
  final user = (
    "Palash",
    25,
    true,
  );

  print(user.$1);
  print(user.$2);
  print(user.$3);
}


// ============================================================================
// 59. NAMED RECORD FIELDS
// ============================================================================

void namedRecordExample() {
  final user = (
    name: "Palash",
    age: 25,
    isActive: true,
  );

  print(user.name);
  print(user.age);
  print(user.isActive);
}


// ============================================================================
// Named records are usually easier to understand.
//
// ============================================================================


// ============================================================================
// 60. RECORD DESTRUCTURING
// ============================================================================

void recordDestructuringExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  final (
    :name,
    :age,
  ) = user;

  print(name);
  print(age);
}


// ============================================================================
// 61. PATTERNS
// ============================================================================
//
// Patterns allow matching and destructuring values.
//
// ============================================================================

void patternExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  final (
    name: name,
    age: age,
  ) = user;

  print(name);
  print(age);
}


// ============================================================================
// 62. PATTERN MATCHING
// ============================================================================

void patternMatchingExample(
  Object value,
) {
  switch (value) {
    case int number:
      print(
        "Integer: $number",
      );

    case String text:
      print(
        "String: $text",
      );

    default:
      print("Other type");
  }
}


// ============================================================================
// 63. IF-CASE
// ============================================================================
//
// if-case performs pattern matching.
//
// ============================================================================

void ifCaseExample(
  Object value,
) {
  if (value case int number) {
    print(
      "Number: $number",
    );
  }
}


// ============================================================================
// 64. SWITCH EXPRESSIONS
// ============================================================================
//
// switch can return a value.
//
// ============================================================================

String getRoleLabel(
  UserRole role,
) {
  return switch (role) {
    UserRole.admin =>
      "Administrator",

    UserRole.branchManager =>
      "Branch Manager",

    UserRole.vendor =>
      "Vendor",
  };
}


// ============================================================================
// 65. SEALED CLASSES
// ============================================================================
//
// Sealed classes are extremely useful for modeling finite states.
//
// Especially useful for:
//
//   • API state
//   • Loading state
//   • Success
//   • Error
//   • Authentication
//   • Network state
//
// ============================================================================

sealed class ApiState<T> {}

class ApiLoading<T>
    extends ApiState<T> {}

class ApiSuccess<T>
    extends ApiState<T> {
  final T data;

  ApiSuccess(this.data);
}

class ApiError<T>
    extends ApiState<T> {
  final String message;

  ApiError(this.message);
}


// ============================================================================
// 66. EXHAUSTIVE SWITCH
// ============================================================================

String getApiStateText(
  ApiState<String> state,
) {
  return switch (state) {
    ApiLoading() =>
      "Loading...",

    ApiSuccess(data: final data) =>
      "Success: $data",

    ApiError(message: final message) =>
      "Error: $message",
  };
}


// ============================================================================
// IMPORTANT:
//
// Because ApiState is sealed, Dart knows all possible subclasses.
//
// This helps prevent forgotten cases.
//
// ============================================================================


// ============================================================================
// 67. ENHANCED ENUMS
// ============================================================================
//
// Enums can contain fields, constructors, and methods.
//
// ============================================================================

enum OrderStatus {
  pending("Pending"),
  confirmed("Confirmed"),
  shipped("Shipped"),
  delivered("Delivered"),
  cancelled("Cancelled");

  final String label;

  const OrderStatus(
    this.label,
  );
}


// ============================================================================
// Usage:
//
// ============================================================================

void enhancedEnumExample() {
  print(
    OrderStatus.pending.label,
  );

  print(
    OrderStatus.delivered.label,
  );
}


// ============================================================================
// 68. TYPEDEF
// ============================================================================
//
// typedef creates an alias for a type.
//
// ============================================================================

typedef JsonMap =
    Map<String, dynamic>;


// ============================================================================
// Usage:
//
// ============================================================================

JsonMap createUserJson() {
  return {
    "name": "Palash",
    "age": 25,
  };
}


// ============================================================================
// 69. FUNCTION TYPES
// ============================================================================
//
// Functions themselves have types.
//
// ============================================================================

typedef ValidatorFunction =
    bool Function(String value);

bool validateEmail(
  String value,
) {
  return value.contains("@");
}


// ============================================================================
// Function as dependency:
//
// ============================================================================

class FormValidator {
  final ValidatorFunction validator;

  FormValidator(this.validator);

  bool validate(String value) {
    return validator(value);
  }
}


// ============================================================================
// 70. DYNAMIC
// ============================================================================
//
// dynamic disables much compile-time type checking.
//
// ============================================================================

void dynamicExample() {
  dynamic value = 10;

  value = "Hello";

  value = true;

  print(value);
}


// ============================================================================
// Use dynamic carefully.
//
// Especially avoid unnecessary dynamic in large Flutter applications.
//
// ============================================================================


// ============================================================================
// 71. OBJECT
// ============================================================================
//
// Object represents any non-null value.
//
// ============================================================================

void objectTypeExample() {
  Object value = "Hello";

  value = 100;

  value = true;

  print(value);
}


// ============================================================================
// Difference:
//
// dynamic:
//
// Dart allows almost anything without compile-time member checking.
//
// Object:
//
// value can hold different objects, but you cannot call arbitrary
// methods without type checking/promotion.
//
// ============================================================================


// ============================================================================
// 72. OBJECT?
// ============================================================================
//
// Object? can contain any value including null.
//
// ============================================================================

void objectNullableExample() {
  Object? value = null;

  value = "Hello";

  print(value);
}


// ============================================================================
// 73. NEVER
// ============================================================================
//
// Never represents a value that never successfully returns.
//
// Common use:
//
//   • Functions that always throw
//   • Infinite loops
//
// ============================================================================

Never throwError(
  String message,
) {
  throw Exception(message);
}


// ============================================================================
// 74. NULL
// ============================================================================
//
// null represents absence of a value.
//
// ============================================================================

void nullExample() {
  String? name;

  print(name);
}


// ============================================================================
// 75. TYPE PROMOTION
// ============================================================================

void typePromotionExample(
  String? name,
) {
  if (name != null) {
    print(
      name.length,
    );
  }
}


// ============================================================================
// Dart understands inside this block that name is non-null.
//
// ============================================================================


// ============================================================================
// 76. TYPE CHECKING — IS
// ============================================================================

void isExample(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// 77. TYPE CASTING
// ============================================================================

void castingExample(
  Object value,
) {
  final name =
      value as String;

  print(name.length);
}


// ============================================================================
// IMPORTANT:
//
// "as" performs a runtime cast.
//
// If the value is not actually String, it throws.
//
// ============================================================================


// ============================================================================
// 78. AS
// ============================================================================

void asExample() {
  final value =
      <String, dynamic>{
    "name": "Palash",
  };

  final name =
      value["name"] as String;

  print(name);
}


// ============================================================================
// 79. IS
// ============================================================================

void isCheckExample(
  Object value,
) {
  print(value is String);
  print(value is int);
}


// ============================================================================
// 80. IS!
// ============================================================================

void isNotExample(
  Object value,
) {
  if (value is! String) {
    print("Not a String");
  }
}


// ============================================================================
// 81. TYPE INFERENCE
// ============================================================================
//
// Dart can often determine the type automatically.
//
// ============================================================================

void typeInferenceExample() {
  final name = "Palash";

  final age = 25;

  final numbers = [
    1,
    2,
    3,
  ];

  print(name);
  print(age);
  print(numbers);
}


// ============================================================================
// Prefer:
//
// final name = "Palash";
//
// instead of:
//
// final String name = "Palash";
//
// when the type is obvious.
//
// ============================================================================


// ============================================================================
// 82. IMMUTABLE COLLECTION CONCEPT
// ============================================================================
//
// Prefer immutable data when state should not be changed accidentally.
//
// ============================================================================

class ProductListState {
  final List<ProductModel> products;

  const ProductListState(
    this.products,
  );
}


// ============================================================================
// NOTE:
//
// final prevents replacing the list reference.
//
// It does not automatically make the list itself immutable.
//
// ============================================================================


// ============================================================================
// 83. UNMODIFIABLE VIEW
// ============================================================================

void unmodifiableViewExample() {
  final original = [
    1,
    2,
    3,
  ];

  final view =
      List<int>.unmodifiable(
    original,
  );

  print(view);
}


// ============================================================================
// 84. GENERIC CONSTRAINTS
// ============================================================================

abstract class Entity {
  String get id;
}

class UserEntity
    implements Entity {
  @override
  final String id;

  UserEntity(this.id);
}

class EntityRepository<T extends Entity> {
  final List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  T? findById(String id) {
    for (final item in items) {
      if (item.id == id) {
        return item;
      }
    }

    return null;
  }
}


// ============================================================================
// 85. COVARIANCE CONCEPT
// ============================================================================
//
// Dart's generic type system has variance rules.
//
// Example:
//
// List<Dog> can be used where List<Animal> is expected in many read-only
// contexts because List is covariant.
//
// But mutation creates safety considerations.
//
// ============================================================================

void covarianceExample() {
  final dogs =
      <Dog>[
    Dog(),
  ];

  List<Animal> animals =
      dogs;

  print(animals);
}


// ============================================================================
// 86. CONTRAVARIANCE CONCEPT
// ============================================================================
//
// Function parameter types behave differently from normal collection
// covariance.
//
// Example concept:
//
// void Function(Animal)
//
// can accept an Animal.
//
// A function capable of handling any Animal can also handle a Dog.
//
// ============================================================================

void handleAnimal(
  Animal animal,
) {
  print(
    "Handling animal",
  );
}

void contravarianceExample() {
  void Function(Animal)
      handler = handleAnimal;

  handler(Dog());
}


// ============================================================================
// 87. INVARIANCE CONCEPT
// ============================================================================
//
// Some generic abstractions may effectively require exact type matching
// because both reading and writing can affect safety.
//
// Understand variance conceptually before using advanced generic APIs.
//
// ============================================================================


// ============================================================================
// 88. TYPE-SAFE API MODEL
// ============================================================================

class ProductResponse {
  final List<ProductModel> products;
  final int total;

  const ProductResponse({
    required this.products,
    required this.total,
  });

  factory ProductResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawProducts =
        json["products"]
            as List<dynamic>? ??
            [];

    return ProductResponse(
      products: rawProducts
          .map(
            (item) =>
                ProductModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      total:
          json["total"] as int? ?? 0,
    );
  }
}


// ============================================================================
// 89. JSON LIST PARSING
// ============================================================================

List<ProductModel>
    parseProducts(
  List<dynamic> jsonList,
) {
  return jsonList
      .map(
        (json) =>
            ProductModel.fromJson(
          json as Map<String, dynamic>,
        ),
      )
      .toList();
}


// ============================================================================
// 90. NESTED JSON PARSING
// ============================================================================

class CategoryModel {
  final String id;
  final String name;
  final List<ProductModel> products;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.products,
  });

  factory CategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final productsJson =
        json["products"]
            as List<dynamic>? ??
            [];

    return CategoryModel(
      id: json["id"] as String,
      name: json["name"] as String,
      products: productsJson
          .map(
            (product) =>
                ProductModel.fromJson(
              product
                  as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}


// ============================================================================
// 91. FILTERING PRODUCTS
// ============================================================================

List<ProductModel> filterProducts(
  List<ProductModel> products,
  double maxPrice,
) {
  return products
      .where(
        (product) =>
            product.price <= maxPrice,
      )
      .toList();
}


// ============================================================================
// 92. SEARCHING PRODUCTS
// ============================================================================

List<ProductModel> searchProducts(
  List<ProductModel> products,
  String query,
) {
  final search =
      query.toLowerCase().trim();

  return products
      .where(
        (product) =>
            product.name
                .toLowerCase()
                .contains(search),
      )
      .toList();
}


// ============================================================================
// 93. SORTING PRODUCTS
// ============================================================================

List<ProductModel>
    sortProductsByPrice(
  List<ProductModel> products,
) {
  final result =
      List<ProductModel>.from(
    products,
  );

  result.sort(
    (a, b) =>
        a.price.compareTo(
      b.price,
    ),
  );

  return result;
}


// ============================================================================
// DESCENDING ORDER
// ============================================================================

List<ProductModel>
    sortProductsByPriceDescending(
  List<ProductModel> products,
) {
  final result =
      List<ProductModel>.from(
    products,
  );

  result.sort(
    (a, b) =>
        b.price.compareTo(
      a.price,
    ),
  );

  return result;
}


// ============================================================================
// 94. GROUPING DATA
// ============================================================================
//
// Example:
//
// Group products by category.
//
// ============================================================================

class ProductWithCategory {
  final String name;
  final String category;

  const ProductWithCategory({
    required this.name,
    required this.category,
  });
}

Map<String, List<ProductWithCategory>>
    groupProductsByCategory(
  List<ProductWithCategory> products,
) {
  final result =
      <String, List<ProductWithCategory>>{};

  for (final product in products) {
    result
        .putIfAbsent(
          product.category,
          () => [],
        )
        .add(product);
  }

  return result;
}


// ============================================================================
// 95. PAGINATION
// ============================================================================
//
// Pagination is essential for ERP/API applications.
//
// Example:
//
// page = 1
// limit = 20
//
// page = 2
// limit = 20
//
// ============================================================================

List<T> paginate<T>(
  List<T> items,
  int page,
  int limit,
) {
  if (page < 1) {
    throw ArgumentError(
      "Page must be >= 1",
    );
  }

  if (limit <= 0) {
    throw ArgumentError(
      "Limit must be > 0",
    );
  }

  final start =
      (page - 1) * limit;

  if (start >= items.length) {
    return [];
  }

  final end =
      (start + limit)
          .clamp(
            0,
            items.length,
          );

  return items.sublist(
    start,
    end,
  );
}


// ============================================================================
// 96. API RESULT STATE
// ============================================================================
//
// Generic sealed state.
//
// ============================================================================

sealed class Result<T> {
  const Result();
}

class LoadingResult<T>
    extends Result<T> {
  const LoadingResult();
}

class SuccessResult<T>
    extends Result<T> {
  final T data;

  const SuccessResult(
    this.data,
  );
}

class FailureResult<T>
    extends Result<T> {
  final String message;

  const FailureResult(
    this.message,
  );
}


// ============================================================================
// Handling result:
//
// ============================================================================

String describeResult(
  Result<List<ProductModel>> result,
) {
  return switch (result) {
    LoadingResult() =>
      "Loading",

    SuccessResult(
      data: final products,
    ) =>
      "Loaded ${products.length} products",

    FailureResult(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 97. GENERIC REPOSITORY
// ============================================================================

abstract class CrudRepository<T> {
  Future<List<T>> getAll();

  Future<T?> getById(
    String id,
  );

  Future<void> create(
    T item,
  );

  Future<void> update(
    String id,
    T item,
  );

  Future<void> delete(
    String id,
  );
}


// ============================================================================
// Product implementation:
//
// ============================================================================

class ProductCrudRepository
    implements CrudRepository<ProductModel> {
  @override
  Future<List<ProductModel>>
      getAll() async {
    return const [];
  }

  @override
  Future<ProductModel?> getById(
    String id,
  ) async {
    return null;
  }

  @override
  Future<void> create(
    ProductModel item,
  ) async {}

  @override
  Future<void> update(
    String id,
    ProductModel item,
  ) async {}

  @override
  Future<void> delete(
    String id,
  ) async {}
}


// ============================================================================
// 98. STATE MODELING
// ============================================================================

sealed class ProductState {}

class ProductInitial
    extends ProductState {}

class ProductLoading
    extends ProductState {}

class ProductLoaded
    extends ProductState {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

class ProductFailure
    extends ProductState {
  final String message;

  ProductFailure(this.message);
}


// ============================================================================
// 99. ERP EXAMPLE — INVENTORY
// ============================================================================

class InventoryProduct {
  final String id;
  final String name;
  final int stock;
  final double price;

  const InventoryProduct({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
  });

  bool get isOutOfStock =>
      stock == 0;

  bool get isLowStock =>
      stock > 0 && stock <= 5;
}


// ============================================================================
// Filter low-stock products:
//
// ============================================================================

List<InventoryProduct>
    getLowStockProducts(
  List<InventoryProduct> products,
) {
  return products
      .where(
        (product) =>
            product.isLowStock,
      )
      .toList();
}


// ============================================================================
// ERP EXAMPLE — TOTAL INVENTORY VALUE
// ============================================================================

double calculateInventoryValue(
  List<InventoryProduct> products,
) {
  return products.fold(
    0,
    (total, product) =>
        total +
        (product.stock *
            product.price),
  );
}


// ============================================================================
// ERP EXAMPLE — UNIQUE IMEI
// ============================================================================

void uniqueImeiExample() {
  final imeis = [
    "123",
    "456",
    "123",
    "789",
    "456",
  ];

  final uniqueImeis =
      imeis.toSet();

  print(uniqueImeis);
}


// ============================================================================
// This is useful when validating:
//
// "Has this IMEI already been used?"
//
// ============================================================================


// ============================================================================
// ERP EXAMPLE — BRANCH IDS
// ============================================================================

void branchFilterExample() {
  final branchIds = {
    "BR001",
    "BR002",
    "BR003",
  };

  final userBranches = {
    "BR002",
    "BR003",
  };

  final allowed =
      branchIds.intersection(
    userBranches,
  );

  print(allowed);
}


// ============================================================================
// 100. FINAL ARCHITECTURE EXAMPLE
// ============================================================================
//
// API
//  ↓
// JSON
//  ↓
// List<dynamic>
//  ↓
// map()
//  ↓
// ProductModel.fromJson()
//  ↓
// List<ProductModel>
//  ↓
// Repository
//  ↓
// Service
//  ↓
// Controller
//  ↓
// Sealed ProductState
//  ↓
// Flutter UI
//
// ============================================================================


// ============================================================================
// COMPLETE MINI EXAMPLE
// ============================================================================

class ProductRepositoryFinal10 {
  Future<List<ProductModel>>
      getProducts() async {
    return const [
      ProductModel(
        id: "P001",
        name: "Phone",
        price: 100000,
      ),
      ProductModel(
        id: "P002",
        name: "Laptop",
        price: 150000,
      ),
      ProductModel(
        id: "P003",
        name: "Watch",
        price: 20000,
      ),
    ];
  }
}


// ============================================================================

class ProductServiceFinal10 {
  final ProductRepositoryFinal10
      repository;

  ProductServiceFinal10(
    this.repository,
  );

  Future<List<ProductModel>>
      getProducts() {
    return repository.getProducts();
  }
}


// ============================================================================

class ProductControllerFinal10 {
  final ProductServiceFinal10 service;

  ProductControllerFinal10(
    this.service,
  );

  ProductState state =
      ProductInitial();

  Future<void> loadProducts()
      async {
    state =
        ProductLoading();

    try {
      final products =
          await service.getProducts();

      state =
          ProductLoaded(products);
    } catch (e) {
      state =
          ProductFailure(
        e.toString(),
      );
    }
  }
}


// ============================================================================
// USING COLLECTION OPERATIONS WITH STATE
// ============================================================================

List<ProductModel>
    getCheapProducts(
  ProductState state,
) {
  if (state
      case ProductLoaded(
        products: final products,
      )) {
    return products
        .where(
          (product) =>
              product.price < 100000,
        )
        .toList();
  }

  return [];
}


// ============================================================================
// PHASE 10 MASTER CHECKLIST
// ============================================================================
//
// COLLECTIONS
//
// [ ] List
// [ ] Growable List
// [ ] Fixed List
// [ ] List.from
// [ ] List.of
// [ ] List.generate
// [ ] List.filled
// [ ] List.unmodifiable
// [ ] Set
// [ ] Set operations
// [ ] Map
// [ ] Map keys
// [ ] Map values
// [ ] Map entries
// [ ] Iterable
//
// ITERABLE METHODS
//
// [ ] where
// [ ] whereType
// [ ] map
// [ ] expand
// [ ] followedBy
// [ ] take
// [ ] skip
// [ ] takeWhile
// [ ] skipWhile
// [ ] first
// [ ] last
// [ ] firstWhere
// [ ] singleWhere
// [ ] indexWhere
// [ ] any
// [ ] every
// [ ] contains
// [ ] reduce
// [ ] fold
// [ ] join
// [ ] forEach
//
// COLLECTION SYNTAX
//
// [ ] spread
// [ ] null-aware spread
// [ ] collection-if
// [ ] collection-for
//
// GENERICS
//
// [ ] Generic class
// [ ] Generic method
// [ ] Generic function
// [ ] Generic repository
// [ ] Generic API response
// [ ] Generic constraints
//
// MODERN DART
//
// [ ] Records
// [ ] Named records
// [ ] Positional records
// [ ] Destructuring
// [ ] Patterns
// [ ] Pattern matching
// [ ] if-case
// [ ] switch expressions
// [ ] Sealed classes
// [ ] Exhaustive switch
// [ ] Enhanced enums
// [ ] typedef
// [ ] Function types
//
// TYPE SYSTEM
//
// [ ] dynamic
// [ ] Object
// [ ] Object?
// [ ] Never
// [ ] Null
// [ ] Type promotion
// [ ] is
// [ ] is!
// [ ] as
// [ ] Type inference
//
// REAL APPLICATION
//
// [ ] JSON list parsing
// [ ] Nested JSON parsing
// [ ] Filtering
// [ ] Searching
// [ ] Sorting
// [ ] Grouping
// [ ] Pagination
// [ ] API states
// [ ] Generic repository
// [ ] ERP inventory operations
//
// ============================================================================
// ⭐ MOST IMPORTANT TOPICS TO MASTER
// ============================================================================
//
// 1. List
//
// 2. Set
//
// 3. Map
//
// 4. Iterable
//
// 5. where()
//
// 6. map()
//
// 7. expand()
//
// 8. firstWhere()
//
// 9. any()
//
// 10. every()
//
// 11. reduce()
//
// 12. fold()
//
// 13. spread operator
//
// 14. collection-if
//
// 15. collection-for
//
// 16. Generics
//
// 17. Generic API response
//
// 18. Records
//
// 19. Patterns
//
// 20. Sealed classes
//
// 21. switch expressions
//
// 22. Enhanced enums
//
// 23. Type safety
//
// 24. JSON → Model conversion
//
// 25. Filtering/searching/sorting API data
//
// ============================================================================
// ⭐ FULL-STACK FLUTTER CONNECTION
// ============================================================================
//
// Suppose Node.js returns:
//
// [
//   {
//     "id": "P001",
//     "name": "iPhone",
//     "price": 120000
//   },
//   {
//     "id": "P002",
//     "name": "Samsung",
//     "price": 90000
//   }
// ]
//
// Flutter:
//
// JSON
//   ↓
// List<dynamic>
//   ↓
// map()
//   ↓
// ProductModel.fromJson()
//   ↓
// List<ProductModel>
//   ↓
// where()
//   ↓
// Search/filter
//   ↓
// sort()
//   ↓
// UI
//
// This entire workflow depends heavily on Phase 10.
//
// ============================================================================
// ⭐ ERP CONNECTION
// ============================================================================
//
// Product list
//   → List<ProductModel>
//
// Unique IMEI
//   → Set<String>
//
// API JSON
//   → Map<String, dynamic>
//
// API response
//   → ApiResponse<T>
//
// Loading/success/error
//   → sealed class
//
// Product categories
//   → Map<String, List<ProductModel>>
//
// Pagination
//   → List slicing
//
// Search
//   → where()
//
// Price calculation
//   → fold()
//
// Total stock
//   → fold()
//
// Branch filtering
//   → Set intersection
//
// ============================================================================
// ⭐ MEMORY MAP
// ============================================================================
//
// List
//   = ordered collection
//
// Set
//   = unique collection
//
// Map
//   = key → value
//
// Iterable
//   = collection processing abstraction
//
// where()
//   = filter
//
// map()
//   = transform
//
// expand()
//   = flatten
//
// reduce()
//   = combine without initial value
//
// fold()
//   = combine with initial value
//
// Generics
//   = reusable type-safe code
//
// Record
//   = lightweight multiple-value structure
//
// Pattern
//   = match/extract data
//
// Sealed class
//   = finite state/type hierarchy
//
// typedef
//   = type alias
//
// ============================================================================
// ⭐ PHASE 10 FINAL FLOW
// ============================================================================
//
// COLLECTIONS
//      ↓
// ITERABLE
//      ↓
// FILTER / MAP / REDUCE / FOLD
//      ↓
// GENERICS
//      ↓
// TYPE SAFETY
//      ↓
// RECORDS
//      ↓
// PATTERNS
//      ↓
// SEALED CLASSES
//      ↓
// API MODELING
//      ↓
// FLUTTER STATE
//      ↓
// ERP/SaaS APPLICATION
//
// ============================================================================
//
// END OF PHASE 10
// ============================================================================
//
// NEXT:
//
// PHASE 11 — DART FUNCTIONS, ASYNC PROGRAMMING & CONCURRENCY DEEP DIVE
//
// Major topics:
//
//   • Functions deep dive
//   • First-class functions
//   • Anonymous functions
//   • Closures
//   • Higher-order functions
//   • Callbacks
//   • typedef functions
//   • Future
//   • async / await
//   • Future chaining
//   • Future.wait
//   • Future.any
//   • Future.timeout
//   • Error handling with async
//   • Stream
//   • async*
/*   • yield
//   • yield*
//   • StreamController
//   • Broadcast streams
//   • Stream transformations
//   • Isolates
//   • compute()
//   • Event loop
//   • Microtask queue
//   • Event queue
//   • Concurrency vs parallelism
//   • Real API/network examples
//   • Flutter async architecture
//
// ============================================================================
// END
// ============================================================================
