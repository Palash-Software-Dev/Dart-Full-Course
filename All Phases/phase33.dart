// ============================================================================
// DART MASTER ROADMAP
// PHASE 33 — COLLECTIONS MASTERY & DATA MANIPULATION
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// Collections are one of the MOST IMPORTANT parts of Dart/Flutter.
//
// In real Flutter applications, you will constantly work with:
//
// • API response lists
// • Products
// • Orders
// • Customers
// • Employees
// • Warehouses
// • Categories
// • Permissions
// • Notifications
// • JSON data
// • Search results
// • Pagination
// • Reports
// • Dashboard statistics
//
// You should become extremely comfortable with:
//
// List
// Set
// Map
// Iterable
//
// ============================================================================
// TOPICS
// ----------------------------------------------------------------------------
//
// 01. Collection fundamentals
// 02. List
// 03. Growable List
// 04. Fixed-length List
// 05. List indexing
// 06. List properties
// 07. Add/remove/update
// 08. List constructors
// 09. List.generate
// 10. List.filled
// 11. List.from
// 12. List.of
// 13. List.unmodifiable
// 14. Set
// 15. Set uniqueness
// 16. Set operations
// 17. Map
// 18. Map keys and values
// 19. Map constructors
// 20. Iterable
// 21. map()
// 22. where()
// 23. expand()
// 24. reduce()
// 25. fold()
// 26. any()
// 27. every()
// 28. contains()
// 29. first
// 30. last
// 31. firstWhere()
// 32. lastWhere()
// 33. singleWhere()
// 34. take()
// 35. skip()
// 36. takeWhile()
// 37. skipWhile()
// 38. toList()
// 39. toSet()
// 40. sorting
// 41. custom sorting
// 42. reversed
// 43. shuffle
// 44. sublist
// 45. removeWhere
// 46. retainWhere
// 47. JSON-like structures
// 48. Nested collections
// 49. API response processing
// 50. Search/filter/sort
// 51. Pagination merging
// 52. Grouping
// 53. Statistics
// 54. Performance
// 55. Immutable collections concepts
// 56. ERP examples
//
// ============================================================================


// ============================================================================
// 01. COLLECTION FUNDAMENTALS
// ----------------------------------------------------------------------------
//
// A collection stores multiple values.
//
// Main Dart collections:
//
// List<T>
// Set<T>
// Map<K, V>
//
// Iterable<T> is the common abstraction used for iterating over collections.
//
// ============================================================================


// ============================================================================
// 02. LIST
// ----------------------------------------------------------------------------
//
// List stores ordered values.
//
// Duplicates are allowed.
//
// ============================================================================

void listBasic() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products);
}


// ============================================================================
// 03. LIST WITH TYPE
// ----------------------------------------------------------------------------

void typedList() {
  final List<String> products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  final List<int> prices = [
    100,
    200,
    300,
  ];

  print(products);
  print(prices);
}


// ============================================================================
// 04. LIST INDEX
// ----------------------------------------------------------------------------
//
// Dart List indexes start at 0.
//
// 0 → first
// 1 → second
// 2 → third
//
// ============================================================================

void listIndex() {
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
// 05. LIST LENGTH
// ============================================================================

void listLength() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.length);
}


// ============================================================================
// 06. FIRST AND LAST
// ============================================================================

void firstLast() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(products.first);
  print(products.last);
}


// ============================================================================
// 07. isEmpty / isNotEmpty
// ============================================================================

void emptyCheck() {
  final products = <String>[];

  print(products.isEmpty);
  print(products.isNotEmpty);
}


// ============================================================================
// 08. ADD
// ============================================================================

void addExample() {
  final products = <String>[];

  products.add("Phone");
  products.add("Laptop");

  print(products);
}


// ============================================================================
// 09. ADD ALL
// ============================================================================

void addAllExample() {
  final products = <String>[
    "Phone",
  ];

  products.addAll([
    "Laptop",
    "Tablet",
  ]);

  print(products);
}


// ============================================================================
// 10. INSERT
// ----------------------------------------------------------------------------
//
// Inserts at a specific index.
//
// ============================================================================

void insertExample() {
  final products = [
    "Phone",
    "Tablet",
  ];

  products.insert(
    1,
    "Laptop",
  );

  print(products);
}


// ============================================================================
// RESULT:
//
// Phone
// Laptop
// Tablet
//
// ============================================================================


// ============================================================================
// 11. INSERT ALL
// ============================================================================

void insertAllExample() {
  final products = [
    "Phone",
    "Tablet",
  ];

  products.insertAll(
    1,
    [
      "Laptop",
      "Monitor",
    ],
  );

  print(products);
}


// ============================================================================
// 12. UPDATE
// ============================================================================

void updateExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  products[1] = "Desktop";

  print(products);
}


// ============================================================================
// 13. REMOVE
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
// 14. REMOVE AT
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
// 16. CLEAR
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
// 17. CONTAINS
// ============================================================================

void containsExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(
    products.contains("Laptop"),
  );
}


// ============================================================================
// 18. INDEX OF
// ============================================================================

void indexOfExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  print(
    products.indexOf("Laptop"),
  );
}


// ============================================================================
// 19. LIST.FILLED
// ----------------------------------------------------------------------------
//
// Creates a List containing the same value repeatedly.
//
// ============================================================================

void filledExample() {
  final values = List<int>.filled(
    5,
    0,
  );

  print(values);
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
//
// List.filled() creates a fixed-length list by default.
//
// For a growable list:
//
// ============================================================================

void growableFilled() {
  final values = List<int>.filled(
    5,
    0,
    growable: true,
  );

  values.add(10);

  print(values);
}


// ============================================================================
// 20. LIST.GENERATE
// ----------------------------------------------------------------------------
//
// Creates values using an index.
//
// ============================================================================

void generateExample() {
  final numbers = List<int>.generate(
    5,
    (index) => index + 1,
  );

  print(numbers);
}


// ============================================================================
// RESULT:
//
// [1, 2, 3, 4, 5]
//
// ============================================================================


// ============================================================================
// 21. LIST.FROM
// ============================================================================

void listFromExample() {
  final original = [
    1,
    2,
    3,
  ];

  final copy = List<int>.from(
    original,
  );

  print(copy);
}


// ============================================================================
// 22. LIST.OF
// ============================================================================

void listOfExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final copy = List<int>.of(
    numbers,
  );

  print(copy);
}


// ============================================================================
// 23. LIST.UNMODIFIABLE
// ----------------------------------------------------------------------------
//
// Creates a list that cannot be modified.
//
// ============================================================================

void unmodifiableExample() {
  final products =
      List<String>.unmodifiable([
    "Phone",
    "Laptop",
  ]);

  print(products);

  // products.add("Tablet");
  //
  // This would throw an UnsupportedError.
}


// ============================================================================
// 24. SET
// ----------------------------------------------------------------------------
//
// Set stores unique values.
//
// Duplicate values are automatically removed.
//
// ============================================================================

void setExample() {
  final ids = <String>{
    "U001",
    "U002",
    "U001",
  };

  print(ids);
}


// ============================================================================
// RESULT:
//
// {U001, U002}
//
// ============================================================================


// ============================================================================
// 25. SET ADD
// ============================================================================

void setAdd() {
  final ids = <String>{};

  ids.add("U001");
  ids.add("U002");

  print(ids);
}


// ============================================================================
// 26. SET CONTAINS
// ============================================================================

void setContains() {
  final roles = {
    "admin",
    "employee",
    "vendor",
  };

  print(
    roles.contains("admin"),
  );
}


// ============================================================================
// 27. SET REMOVE
// ============================================================================

void setRemove() {
  final roles = {
    "admin",
    "employee",
    "vendor",
  };

  roles.remove("vendor");

  print(roles);
}


// ============================================================================
// 28. SET OPERATIONS
// ----------------------------------------------------------------------------
//
// Union
// Intersection
// Difference
//
// ============================================================================

void setOperations() {
  final a = {
    1,
    2,
    3,
  };

  final b = {
    3,
    4,
    5,
  };

  print(
    a.union(b),
  );

  print(
    a.intersection(b),
  );

  print(
    a.difference(b),
  );
}


// ============================================================================
// RESULT:
//
// union:
//
// {1, 2, 3, 4, 5}
//
// intersection:
//
// {3}
//
// difference:
//
// {1, 2}
//
// ============================================================================


// ============================================================================
// 29. MAP
// ----------------------------------------------------------------------------
//
// Map stores:
//
// KEY → VALUE
//
// Example:
//
// productId → productName
//
// ============================================================================

void mapExample() {
  final user = <String, dynamic>{
    "id": "U001",
    "name": "Palash",
    "age": 25,
  };

  print(user);
}


// ============================================================================
// 30. MAP ACCESS
// ============================================================================

void mapAccess() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(user["name"]);
}


// ============================================================================
// 31. MAP ADD
// ============================================================================

void mapAdd() {
  final user = <String, dynamic>{};

  user["id"] = "U001";
  user["name"] = "Palash";

  print(user);
}


// ============================================================================
// 32. MAP UPDATE
// ============================================================================

void mapUpdate() {
  final user = {
    "name": "Palash",
    "role": "employee",
  };

  user["role"] = "admin";

  print(user);
}


// ============================================================================
// 33. MAP REMOVE
// ============================================================================

void mapRemove() {
  final user = {
    "name": "Palash",
    "role": "admin",
  };

  user.remove("role");

  print(user);
}


// ============================================================================
// 34. MAP KEYS
// ============================================================================

void mapKeys() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(user.keys);
}


// ============================================================================
// 35. MAP VALUES
// ============================================================================

void mapValues() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(user.values);
}


// ============================================================================
// 36. MAP ENTRIES
// ============================================================================

void mapEntries() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  for (final entry in user.entries) {
    print(
      "${entry.key}: ${entry.value}",
    );
  }
}


// ============================================================================
// 37. MAP CONTAINSKEY
// ============================================================================

void containsKeyExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(
    user.containsKey("id"),
  );
}


// ============================================================================
// 38. MAP CONTAINSVALUE
// ============================================================================

void containsValueExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(
    user.containsValue("Palash"),
  );
}


// ============================================================================
// 39. ITERABLE
// ----------------------------------------------------------------------------
//
// Iterable represents something that can be iterated over.
//
// List, Set and many collection operations work through Iterable.
//
// Example:
//
// List<String> → Iterable<String>
//
// ============================================================================


// ============================================================================
// 40. FOR-IN
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
// 41. FOR-EACH
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
// 42. MAP()
// ----------------------------------------------------------------------------
//
// map() transforms every element.
//
// Example:
//
// String → uppercase String
//
// ============================================================================

void mapMethodExample() {
  final products = [
    "phone",
    "laptop",
    "tablet",
  ];

  final upperProducts =
      products.map(
    (product) => product.toUpperCase(),
  );

  print(
    upperProducts.toList(),
  );
}


// ============================================================================
// 43. MAP() WITH NUMBERS
// ============================================================================

void mapNumbers() {
  final prices = [
    100,
    200,
    300,
  ];

  final increased =
      prices.map(
    (price) => price + 50,
  );

  print(
    increased.toList(),
  );
}


// ============================================================================
// 44. WHERE()
// ----------------------------------------------------------------------------
//
// Filters elements.
//
// ============================================================================

void whereExample() {
  final prices = [
    100,
    250,
    50,
    500,
  ];

  final expensive =
      prices.where(
    (price) => price >= 200,
  );

  print(
    expensive.toList(),
  );
}


// ============================================================================
// 45. MAP + WHERE
// ----------------------------------------------------------------------------
//
// Very common in Flutter.
//
// ============================================================================

void mapWhereExample() {
  final prices = [
    100,
    200,
    300,
    400,
  ];

  final result = prices
      .where(
        (price) => price >= 200,
      )
      .map(
        (price) => price * 0.9,
      )
      .toList();

  print(result);
}


// ============================================================================
// 46. EXPAND()
// ----------------------------------------------------------------------------
//
// expand() converts nested collections into one sequence.
//
// ============================================================================

void expandExample() {
  final categories = [
    ["Phone", "Laptop"],
    ["Gold", "Silver"],
    ["Chair", "Table"],
  ];

  final products =
      categories.expand(
    (category) => category,
  );

  print(
    products.toList(),
  );
}


// ============================================================================
// RESULT:
//
// [Phone, Laptop, Gold, Silver, Chair, Table]
//
// ============================================================================


// ============================================================================
// 47. REDUCE()
// ----------------------------------------------------------------------------
//
// reduce() combines elements into one value.
//
// ============================================================================

void reduceExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final total = numbers.reduce(
    (a, b) => a + b,
  );

  print(total);
}


// ============================================================================
// RESULT:
//
// 60
//
// ============================================================================


// ============================================================================
// IMPORTANT REDUCE RULE
// ----------------------------------------------------------------------------
//
// reduce() requires a non-empty collection.
//
// Calling reduce() on:
//
// []
//
// throws an error.
//
// For safer accumulation with an initial value, use fold().
//
// ============================================================================


// ============================================================================
// 48. FOLD()
// ----------------------------------------------------------------------------
//
// fold() starts with an initial value.
//
// ============================================================================

void foldExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final total = numbers.fold<int>(
    0,
    (sum, number) => sum + number,
  );

  print(total);
}


// ============================================================================
// WHY FOLD IS POWERFUL
// ----------------------------------------------------------------------------
//
// You can start from:
//
// 0
// ""
// []
// {}
//
// and build a result.
//
// ============================================================================


// ============================================================================
// 49. FOLD TO CREATE MAP
// ============================================================================

void foldMapExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  final result =
      products.asMap().entries.fold<
          Map<int, String>>(
    {},
    (map, entry) {
      map[entry.key] = entry.value;
      return map;
    },
  );

  print(result);
}


// ============================================================================
// 50. ANY()
// ----------------------------------------------------------------------------
//
// Returns true if at least one element matches.
//
// ============================================================================

void anyExample() {
  final prices = [
    100,
    200,
    500,
  ];

  final hasExpensive =
      prices.any(
    (price) => price > 400,
  );

  print(hasExpensive);
}


// ============================================================================
// 51. EVERY()
// ----------------------------------------------------------------------------
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

  final allPositive =
      prices.every(
    (price) => price > 0,
  );

  print(allPositive);
}


// ============================================================================
// 52. CONTAINS()
// ============================================================================

void iterableContains() {
  final roles = [
    "admin",
    "employee",
    "vendor",
  ];

  print(
    roles.contains("admin"),
  );
}


// ============================================================================
// 53. FIRSTWHERE()
// ----------------------------------------------------------------------------
//
// Finds the first element satisfying a condition.
//
// ============================================================================

void firstWhereExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final result =
      prices.firstWhere(
    (price) => price > 150,
  );

  print(result);
}


// ============================================================================
// 54. FIRSTWHERE OR ELSE
// ----------------------------------------------------------------------------
//
// If no match exists, orElse prevents an exception.
//
// ============================================================================

void firstWhereSafe() {
  final prices = [
    100,
    200,
    300,
  ];

  final result =
      prices.firstWhere(
    (price) => price > 1000,
    orElse: () => 0,
  );

  print(result);
}


// ============================================================================
// 55. LASTWHERE()
// ============================================================================

void lastWhereExample() {
  final prices = [
    100,
    200,
    300,
    400,
  ];

  final result =
      prices.lastWhere(
    (price) => price > 150,
  );

  print(result);
}


// ============================================================================
// 56. SINGLEWHERE()
// ----------------------------------------------------------------------------
//
// Requires exactly one matching element.
//
// If zero or multiple elements match,
// an error occurs.
//
// ============================================================================

void singleWhereExample() {
  final ids = [
    "U001",
    "U002",
    "U003",
  ];

  final result =
      ids.singleWhere(
    (id) => id == "U002",
  );

  print(result);
}


// ============================================================================
// 57. TAKE()
// ----------------------------------------------------------------------------
//
// Takes the first N elements.
//
// ============================================================================

void takeExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Monitor",
  ];

  print(
    products.take(2).toList(),
  );
}


// ============================================================================
// 58. SKIP()
// ----------------------------------------------------------------------------
//
// Skips the first N elements.
//
// ============================================================================

void skipExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Monitor",
  ];

  print(
    products.skip(2).toList(),
  );
}


// ============================================================================
// 59. TAKEWHILE()
// ============================================================================

void takeWhileExample() {
  final numbers = [
    1,
    2,
    3,
    6,
    4,
  ];

  final result =
      numbers.takeWhile(
    (number) => number < 5,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// RESULT:
//
// [1, 2, 3]
//
// It stops when the condition becomes false.
//
// ============================================================================


// ============================================================================
// 60. SKIPWHILE()
// ============================================================================

void skipWhileExample() {
  final numbers = [
    1,
    2,
    3,
    6,
    4,
  ];

  final result =
      numbers.skipWhile(
    (number) => number < 5,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 61. TOLIST()
// ----------------------------------------------------------------------------
//
// Converts an Iterable to List.
//
// ============================================================================

void toListExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final result =
      numbers.map(
    (number) => number * 2,
  );

  final list =
      result.toList();

  print(list);
}


// ============================================================================
// 62. TOSET()
// ----------------------------------------------------------------------------
//
// Removes duplicates.
//
// ============================================================================

void toSetExample() {
  final ids = [
    "U001",
    "U002",
    "U001",
    "U003",
  ];

  final uniqueIds =
      ids.toSet();

  print(uniqueIds);
}


// ============================================================================
// 63. SORTING
// ----------------------------------------------------------------------------
//
// sort() modifies the original List.
//
// ============================================================================

void sortingExample() {
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
// 64. DESCENDING SORT
// ============================================================================

void descendingSort() {
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
// 65. STRING SORTING
// ============================================================================

void stringSorting() {
  final products = [
    "Laptop",
    "Phone",
    "Camera",
    "Tablet",
  ];

  products.sort();

  print(products);
}


// ============================================================================
// 66. CUSTOM OBJECT SORTING
// ============================================================================

class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  });
}


void productSorting() {
  final products = [
    Product(
      name: "Phone",
      price: 500,
    ),
    Product(
      name: "Laptop",
      price: 1000,
    ),
    Product(
      name: "Tablet",
      price: 300,
    ),
  ];

  products.sort(
    (a, b) => a.price.compareTo(
      b.price,
    ),
  );

  for (final product in products) {
    print(
      "${product.name}: ${product.price}",
    );
  }
}


// ============================================================================
// 67. SORT WITHOUT MUTATING ORIGINAL
// ----------------------------------------------------------------------------
//
// Use List.from() before sorting.
//
// ============================================================================

void safeSorting() {
  final numbers = [
    50,
    10,
    30,
  ];

  final sorted =
      List<int>.from(numbers)
        ..sort();

  print(
    "Original: $numbers",
  );

  print(
    "Sorted: $sorted",
  );
}


// ============================================================================
// 68. REVERSED
// ============================================================================

void reversedExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  print(
    numbers.reversed.toList(),
  );
}


// ============================================================================
// 69. SHUFFLE
// ----------------------------------------------------------------------------
//
// Randomly rearranges the list.
//
// ============================================================================

void shuffleExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  numbers.shuffle();

  print(numbers);
}


// ============================================================================
// 70. SUBLIST
// ----------------------------------------------------------------------------
//
// Extracts part of a List.
//
// ============================================================================

void sublistExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
    "Monitor",
  ];

  final result =
      products.sublist(
    1,
    3,
  );

  print(result);
}


// ============================================================================
// RESULT:
//
// [Laptop, Tablet]
//
// Start index = inclusive
// End index = exclusive
//
// ============================================================================


// ============================================================================
// 71. REMOVEWHERE()
// ----------------------------------------------------------------------------
//
// Removes every element matching a condition.
//
// ============================================================================

void removeWhereExample() {
  final prices = [
    100,
    500,
    200,
    800,
  ];

  prices.removeWhere(
    (price) => price > 400,
  );

  print(prices);
}


// ============================================================================
// 72. RETAINWHERE()
// ----------------------------------------------------------------------------
//
// Keeps only elements matching the condition.
//
// ============================================================================

void retainWhereExample() {
  final prices = [
    100,
    500,
    200,
    800,
  ];

  prices.retainWhere(
    (price) => price <= 400,
  );

  print(prices);
}


// ============================================================================
// 73. NULL-SAFE COLLECTION ACCESS
// ----------------------------------------------------------------------------
//
// APIs may return:
//
// null
//
// Therefore:
//
// final name = user["name"] as String?;
//
// is safer than assuming data exists.
//
// ============================================================================


// ============================================================================
// 74. JSON-LIKE DATA
// ----------------------------------------------------------------------------
//
// APIs commonly return:
//
// Map<String, dynamic>
//
// ============================================================================

void jsonLikeData() {
  final response =
      <String, dynamic>{
    "id": "P001",
    "name": "iPhone",
    "price": 1200,
    "tags": [
      "mobile",
      "apple",
    ],
  };

  print(response["name"]);
  print(response["price"]);
}


// ============================================================================
// 75. NESTED JSON
// ============================================================================

void nestedJson() {
  final response =
      <String, dynamic>{
    "id": "P001",
    "name": "iPhone",
    "category": {
      "id": "C001",
      "name": "Mobile",
    },
    "variants": [
      {
        "sku": "IP15-128",
        "price": 1200,
      },
      {
        "sku": "IP15-256",
        "price": 1400,
      },
    ],
  };

  final category =
      response["category"]
          as Map<String, dynamic>;

  print(
    category["name"],
  );
}


// ============================================================================
// 76. API LIST RESPONSE
// ----------------------------------------------------------------------------

void apiListResponse() {
  final response = <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "Phone",
    },
    {
      "id": "P002",
      "name": "Laptop",
    },
  ];

  final names = response
      .map(
        (json) =>
            json["name"] as String,
      )
      .toList();

  print(names);
}


// ============================================================================
// 77. MAP JSON TO MODEL
// ============================================================================

class ProductModel {
  final String id;
  final String name;

  ProductModel({
    required this.id,
    required this.name,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}


void parseProducts() {
  final response =
      <Map<String, dynamic>>[
    {
      "id": "P001",
      "name": "Phone",
    },
    {
      "id": "P002",
      "name": "Laptop",
    },
  ];

  final products =
      response
          .map(
            ProductModel.fromJson,
          )
          .toList();

  print(products.length);
}


// ============================================================================
// 78. SEARCH
// ----------------------------------------------------------------------------

void searchProducts(
  List<ProductModel> products,
  String query,
) {
  final normalized =
      query.trim().toLowerCase();

  final result = products
      .where(
        (product) =>
            product.name
                .toLowerCase()
                .contains(normalized),
      )
      .toList();

  print(result);
}


// ============================================================================
// 79. FILTER
// ----------------------------------------------------------------------------

void filterProducts(
  List<Product> products,
) {
  final result = products
      .where(
        (product) =>
            product.price >= 500,
      )
      .toList();

  print(result);
}


// ============================================================================
// 80. SEARCH + FILTER + SORT
// ----------------------------------------------------------------------------

void advancedProductQuery(
  List<Product> products,
  String query,
) {
  final result = products
      .where(
        (product) =>
            product.name
                .toLowerCase()
                .contains(
                  query
                      .toLowerCase(),
                ),
      )
      .where(
        (product) =>
            product.price >= 500,
      )
      .toList()
    ..sort(
      (a, b) =>
          a.price.compareTo(
        b.price,
      ),
    );

  print(result);
}


// ============================================================================
// 81. PAGINATION
// ----------------------------------------------------------------------------
//
// Suppose API gives:
//
// Page 1 → 20 products
// Page 2 → 20 products
// Page 3 → 20 products
//
// We need to merge them.
//
// ============================================================================

void mergePagination() {
  final allProducts =
      <ProductModel>[];

  final pageOne = [
    ProductModel(
      id: "P001",
      name: "Phone",
    ),
  ];

  final pageTwo = [
    ProductModel(
      id: "P002",
      name: "Laptop",
    ),
  ];

  allProducts.addAll(
    pageOne,
  );

  allProducts.addAll(
    pageTwo,
  );

  print(allProducts.length);
}


// ============================================================================
// 82. REMOVE DUPLICATES DURING PAGINATION
// ----------------------------------------------------------------------------
//
// Sometimes API pagination can accidentally overlap:
//
// Page 1:
//
// P001
// P002
//
// Page 2:
//
// P002
// P003
//
// We should avoid duplicate products.
//
// ============================================================================

void uniquePagination() {
  final productsById =
      <String, ProductModel>{};

  final pages = [
    [
      ProductModel(
        id: "P001",
        name: "Phone",
      ),
      ProductModel(
        id: "P002",
        name: "Laptop",
      ),
    ],
    [
      ProductModel(
        id: "P002",
        name: "Laptop",
      ),
      ProductModel(
        id: "P003",
        name: "Tablet",
      ),
    ],
  ];

  for (final page in pages) {
    for (final product in page) {
      productsById[product.id] =
          product;
    }
  }

  final uniqueProducts =
      productsById.values.toList();

  print(
    uniqueProducts.length,
  );
}


// ============================================================================
// 83. GROUPING
// ----------------------------------------------------------------------------
//
// Example:
//
// Products grouped by category.
//
// ============================================================================

void groupingExample() {
  final products = [
    {
      "name": "iPhone",
      "category": "Mobile",
    },
    {
      "name": "Galaxy",
      "category": "Mobile",
    },
    {
      "name": "Dell",
      "category": "Laptop",
    },
  ];

  final grouped =
      <String, List<Map<String, String>>>{};

  for (final product in products) {
    final category =
        product["category"]!;

    grouped.putIfAbsent(
      category,
      () => [],
    );

    grouped[category]!.add(
      product,
    );
  }

  print(grouped);
}


// ============================================================================
// 84. PUTIFABSENT
// ----------------------------------------------------------------------------
//
// Very useful when creating grouped Maps.
//
// ============================================================================

void putIfAbsentExample() {
  final map =
      <String, List<String>>{};

  map.putIfAbsent(
    "Mobile",
    () => [],
  );

  map["Mobile"]!.add(
    "Phone",
  );

  print(map);
}


// ============================================================================
// 85. COUNTING
// ----------------------------------------------------------------------------
//
// Count occurrences.
//
// ============================================================================

void countingExample() {
  final categories = [
    "Mobile",
    "Laptop",
    "Mobile",
    "Tablet",
    "Mobile",
  ];

  final counts =
      <String, int>{};

  for (final category in categories) {
    counts[category] =
        (counts[category] ?? 0) + 1;
  }

  print(counts);
}


// ============================================================================
// 86. SUM
// ----------------------------------------------------------------------------

void sumExample() {
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
// 87. AVERAGE
// ----------------------------------------------------------------------------

void averageExample() {
  final prices = [
    100.0,
    200.0,
    300.0,
  ];

  if (prices.isEmpty) {
    return;
  }

  final total =
      prices.fold<double>(
    0,
    (sum, price) =>
        sum + price,
  );

  final average =
      total / prices.length;

  print(average);
}


// ============================================================================
// 88. MINIMUM
// ============================================================================

void minimumExample() {
  final prices = [
    100,
    50,
    300,
    20,
  ];

  final minimum =
      prices.reduce(
    (a, b) => a < b ? a : b,
  );

  print(minimum);
}


// ============================================================================
// 89. MAXIMUM
// ============================================================================

void maximumExample() {
  final prices = [
    100,
    50,
    300,
    20,
  ];

  final maximum =
      prices.reduce(
    (a, b) => a > b ? a : b,
  );

  print(maximum);
}


// ============================================================================
// 90. COLLECTION CASCADES
// ----------------------------------------------------------------------------
//
// Cascade notation can make collection modifications readable.
//
// ============================================================================

void cascadeExample() {
  final numbers = <int>[]
    ..add(10)
    ..add(20)
    ..add(30);

  print(numbers);
}


// ============================================================================
// 91. COLLECTION SPREAD
// ----------------------------------------------------------------------------
//
// Spread operator:
//
// ...
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
// 92. NULL-AWARE SPREAD
// ----------------------------------------------------------------------------
//
// ...?
//
// ============================================================================

void nullAwareSpread() {
  List<int>? numbers;

  final result = [
    ...?numbers,
    10,
    20,
  ];

  print(result);
}


// ============================================================================
// 93. COLLECTION IF
// ----------------------------------------------------------------------------
//
// Useful in Flutter widget lists.
//
// ============================================================================

void collectionIfExample(
  bool isAdmin,
) {
  final actions = [
    "View",
    "Edit",
    if (isAdmin) "Delete",
  ];

  print(actions);
}


// ============================================================================
// 94. COLLECTION FOR
// ----------------------------------------------------------------------------

void collectionForExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled = [
    for (final number in numbers)
      number * 2,
  ];

  print(doubled);
}


// ============================================================================
// 95. FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
// This is extremely useful:
//
// children: [
//
//   const Text("Dashboard"),
//
//   if (isAdmin)
//     const AdminPanel(),
//
//   for (final product in products)
//     ProductCard(
//       product: product,
//     ),
//
// ]
//
// ============================================================================


// ============================================================================
// 96. PERFORMANCE — O(n)
// ----------------------------------------------------------------------------
//
// Many collection operations scan elements.
//
// Example:
//
// list.where(...)
//
// Usually:
//
// O(n)
//
// Meaning:
//
// If there are 100 elements,
// roughly 100 elements may need checking.
//
// ============================================================================


// ============================================================================
// 97. SET LOOKUP
// ----------------------------------------------------------------------------
//
// Sets are useful for membership checks.
//
// Example:
//
// roles.contains("admin")
//
// A Set is generally more appropriate than repeatedly scanning a List when
// you mainly care about uniqueness and membership.
//
// ============================================================================


// ============================================================================
// 98. MAP LOOKUP
// ----------------------------------------------------------------------------
//
// Map is excellent when you know the key.
//
// Example:
//
// productsById["P001"]
//
// This is especially useful for:
//
// • Caching
// • Entity lookup
// • Pagination deduplication
// • Indexing
//
// ============================================================================


// ============================================================================
// 99. LIST VS SET VS MAP
// ----------------------------------------------------------------------------
//
// LIST:
//
// Ordered collection.
// Duplicates allowed.
//
// Use for:
//
// • Product lists
// • Orders
// • Search results
//
// SET:
//
// Unique values.
//
// Use for:
//
// • Permissions
// • IDs
// • Tags
//
// MAP:
//
// Key → value.
//
// Use for:
//
// • ID → object
// • Configuration
// • JSON
// • Lookup tables
//
// ============================================================================


// ============================================================================
// 100. ITERABLE LAZINESS
// ----------------------------------------------------------------------------
//
// Many Iterable operations are lazy.
//
// Example:
//
// final result = products
//     .where(...)
//     .map(...);
//
// The operations may not execute until the Iterable is consumed.
//
// Calling:
//
// .toList()
//
// materializes the result.
//
// ============================================================================


// ============================================================================
// 101. WHY LAZINESS MATTERS
// ----------------------------------------------------------------------------
//
// This allows chaining:
//
// products
//   .where(...)
//   .map(...)
//   .take(...)
//   .toList();
//
// Rather than creating unnecessary intermediate Lists.
//
// ============================================================================


// ============================================================================
// 102. IMMUTABILITY
// ----------------------------------------------------------------------------
//
// Prefer not to mutate shared application state unnecessarily.
//
// Instead of:
//
// products.add(newProduct);
//
// you may create:
//
// final updatedProducts = [
//   ...products,
//   newProduct,
// ];
//
// This is particularly useful in Flutter state management.
//
// ============================================================================


// ============================================================================
// 103. IMMUTABLE UPDATE
// ----------------------------------------------------------------------------

void immutableAdd() {
  final products = [
    "Phone",
    "Laptop",
  ];

  final updated = [
    ...products,
    "Tablet",
  ];

  print(products);
  print(updated);
}


// ============================================================================
// 104. IMMUTABLE REMOVE
// ----------------------------------------------------------------------------

void immutableRemove() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  final updated =
      products
          .where(
            (product) =>
                product != "Laptop",
          )
          .toList();

  print(updated);
}


// ============================================================================
// 105. IMMUTABLE UPDATE OBJECT
// ----------------------------------------------------------------------------
//
// With immutable models, use copyWith().
//
// ============================================================================

class Customer {
  final String id;
  final String name;
  final bool active;

  const Customer({
    required this.id,
    required this.name,
    required this.active,
  });

  Customer copyWith({
    String? id,
    String? name,
    bool? active,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }
}


// ============================================================================
// 106. COPYWITH
// ============================================================================

void copyWithExample() {
  const customer = Customer(
    id: "C001",
    name: "Palash",
    active: true,
  );

  final updated =
      customer.copyWith(
    active: false,
  );

  print(customer.active);
  print(updated.active);
}


// ============================================================================
// 107. ERP ORDER TOTAL
// ----------------------------------------------------------------------------
//
// Collections are fundamental to calculating order totals.
//
// ============================================================================

class OrderItem {
  final String productName;
  final int quantity;
  final double unitPrice;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });

  double get total =>
      quantity * unitPrice;
}


void calculateOrderTotal() {
  final items = [
    OrderItem(
      productName: "Phone",
      quantity: 2,
      unitPrice: 500,
    ),
    OrderItem(
      productName: "Case",
      quantity: 3,
      unitPrice: 20,
    ),
  ];

  final total =
      items.fold<double>(
    0,
    (sum, item) =>
        sum + item.total,
  );

  print(total);
}


// ============================================================================
// 108. INVENTORY FILTER
// ----------------------------------------------------------------------------

class StockItem {
  final String productName;
  final int stock;

  StockItem({
    required this.productName,
    required this.stock,
  });
}


void lowStockItems() {
  final items = [
    StockItem(
      productName: "Phone",
      stock: 10,
    ),
    StockItem(
      productName: "Laptop",
      stock: 2,
    ),
    StockItem(
      productName: "Tablet",
      stock: 20,
    ),
  ];

  final lowStock =
      items.where(
    (item) => item.stock < 5,
  );

  for (final item in lowStock) {
    print(
      item.productName,
    );
  }
}


// ============================================================================
// 109. ERP REPORT
// ----------------------------------------------------------------------------
//
// Example:
//
// Calculate total sales by branch.
//
// ============================================================================

class Sale {
  final String branchId;
  final double amount;

  Sale({
    required this.branchId,
    required this.amount,
  });
}


void salesByBranch() {
  final sales = [
    Sale(
      branchId: "B001",
      amount: 1000,
    ),
    Sale(
      branchId: "B001",
      amount: 500,
    ),
    Sale(
      branchId: "B002",
      amount: 700,
    ),
  ];

  final totals =
      <String, double>{};

  for (final sale in sales) {
    totals[sale.branchId] =
        (totals[sale.branchId] ?? 0) +
            sale.amount;
  }

  print(totals);
}


// ============================================================================
// 110. PERMISSIONS
// ----------------------------------------------------------------------------

void permissionExample() {
  final permissions = <String>{
    "product.view",
    "product.create",
    "order.view",
  };

  final canCreate =
      permissions.contains(
    "product.create",
  );

  print(canCreate);
}


// ============================================================================
// 111. SEARCH + SORT + PAGINATION CONCEPT
// ----------------------------------------------------------------------------
//
// Real ERP list:
//
// API data
// ↓
// Convert JSON → models
// ↓
// Search
// ↓
// Filter
// ↓
// Sort
// ↓
// Pagination
// ↓
// UI
//
// Depending on the app, some operations should happen on the server instead
// of the client when the dataset is large.
//
// ============================================================================


// ============================================================================
// 112. CLIENT VS SERVER FILTERING
// ----------------------------------------------------------------------------
//
// SMALL DATA:
//
// Client-side filtering may be fine.
//
// LARGE DATA:
//
// Server-side filtering is usually better.
//
// Example:
//
// GET /products?search=phone&page=2
//
// Don't download 100,000 products just to find 10.
//
// ============================================================================


// ============================================================================
// 113. COLLECTION BEST PRACTICES
// ----------------------------------------------------------------------------
//
// ✓ Use List for ordered data.
// ✓ Use Set for uniqueness.
// ✓ Use Map for key-based lookup.
// ✓ Use Iterable chaining when appropriate.
// ✓ Use fold for safe aggregation.
// ✓ Use where for filtering.
// ✓ Use map for transformation.
// ✓ Use Future.wait for independent async collection operations.
// ✓ Avoid unnecessary list copies.
// ✓ Avoid mutating shared state.
// ✓ Use typed collections.
// ✓ Handle empty collections.
// ✓ Handle nullable API values.
// ✓ Use IDs as Map keys for efficient lookup.
//
// ============================================================================


// ============================================================================
// 114. COMMON MISTAKES
// ----------------------------------------------------------------------------
//
// ❌ Using dynamic everywhere.
//
// ❌ Calling reduce() on possibly empty lists.
//
// ❌ Assuming firstWhere() always finds something.
//
// ❌ Modifying a list while iterating over it.
//
// ❌ Using List when uniqueness is required.
//
// ❌ Repeatedly searching a huge List when a Map would be better.
//
// ❌ Loading huge API datasets into memory unnecessarily.
//
// ❌ Sorting the original state accidentally.
//
// ❌ Ignoring null values from APIs.
//
// ============================================================================


// ============================================================================
// 115. INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. Difference between List, Set and Map?
//
// 02. What is Iterable?
//
// 03. What does map() do?
//
// 04. What does where() do?
//
// 05. map() vs where()?
//
// 06. reduce() vs fold()?
//
// 07. Why can reduce() fail?
//
// 08. What does expand() do?
//
// 09. What does any() do?
//
// 10. What does every() do?
//
// 11. firstWhere() vs singleWhere()?
//
// 12. What is lazy evaluation?
//
// 13. What does toList() do?
//
// 14. Why use Set for permissions?
//
// 15. Why use Map for product lookup?
//
// 16. How do you remove duplicates?
//
// 17. How do you sort objects?
//
// 18. How do you merge paginated API responses?
//
// 19. How do you prevent duplicate pagination data?
//
// 20. How would you calculate an ERP order total?
//
// 21. How would you group sales by branch?
//
// 22. Client-side filtering vs server-side filtering?
//
// 23. Why should large datasets be paginated?
//
// 24. Why is immutability useful in Flutter?
//
// ============================================================================
// 116. PRACTICE TASKS
// ----------------------------------------------------------------------------
//
// TASK 01
// Create a List of 20 products.
//
// Implement:
//
// • Search
// • Filter by price
// • Sort ascending
// • Sort descending
// • Get first 5
//
//
//
// TASK 02
// Create:
//
// List<String> permissions
//
// Remove duplicates using Set.
//
//
//
// TASK 03
// Create:
//
// Map<String, Product>
//
// Key:
//
// productId
//
// Then implement:
//
// getProductById()
//
//
//
// TASK 04
// Create 3 pages of product data.
//
// Merge them.
//
// Remove duplicates.
//
//
//
// TASK 05
// Create sales records.
//
// Calculate:
//
// • Total sales
// • Average sale
// • Highest sale
// • Lowest sale
// • Sales per branch
//
//
//
// TASK 06
// Create an ERP order.
//
// Calculate:
//
// • Subtotal
// • Discount
// • Tax
// • Delivery charge
// • Grand total
//
// ============================================================================
// 117. MASTER EXAMPLE
// ----------------------------------------------------------------------------
//
// This combines:
//
// List
// map
// where
// sort
// fold
// Map
//
// ============================================================================

void masterCollectionExample() {
  final products = [
    Product(
      name: "Phone",
      price: 1000,
    ),
    Product(
      name: "Laptop",
      price: 1500,
    ),
    Product(
      name: "Tablet",
      price: 700,
    ),
    Product(
      name: "Mouse",
      price: 50,
    ),
  ];

  final result = products
      .where(
        (product) =>
            product.price >= 500,
      )
      .map(
        (product) => Product(
          name: product.name,
          price: product.price * 0.9,
        ),
      )
      .toList()
    ..sort(
      (a, b) =>
          a.price.compareTo(
        b.price,
      ),
    );

  for (final product in result) {
    print(
      "${product.name}: ${product.price}",
    );
  }
}


// ============================================================================
// 118. FINAL MENTAL MODEL
// ----------------------------------------------------------------------------
//
// LIST
// ↓
// Ordered data
//
// SET
// ↓
// Unique data
//
// MAP
// ↓
// Key → value
//
// ITERABLE
// ↓
// Collection processing
//
// map()
// ↓
// Transform
//
// where()
// ↓
// Filter
//
// reduce()
// ↓
// Combine without explicit initial value
//
// fold()
// ↓
// Combine with initial value
//
// any()
// ↓
// At least one?
//
// every()
// ↓
// All?
//
// firstWhere()
// ↓
// First matching item
//
// expand()
// ↓
// Flatten nested collections
//
// sort()
// ↓
// Order data
//
// toSet()
// ↓
// Remove duplicates
//
// Map<Id, Model>
// ↓
// Fast logical lookup/cache pattern
//
// ============================================================================
// 119. FULL-STACK FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
// JSON API
// ↓
// List<Map<String, dynamic>>
// ↓
// Model.fromJson()
// ↓
// List<Model>
// ↓
// where()
// ↓
// map()
// ↓
// sort()
// ↓
// pagination/state
// ↓
// Flutter ListView
//
// This workflow will appear CONSTANTLY in your Flutter career.
//
// ============================================================================
// PHASE 33 COMPLETE
// ============================================================================
//
// NEXT:
//
// PHASE 34 — DART NULL SAFETY + TYPE SYSTEM MASTERY
//
// Topics:
//
// • Null safety
// • nullable types
// • non-nullable types
// • ?
// • !
// • ?? 
// • ??=
// • ?. 
// • late
// • required
// • type promotion
// • null-aware operators
// • dynamic
// • Object
// • Object?
// • Never
// • void
// • type inference
// • var
// • final
// • const
// • generic type safety
// • runtimeType
// • is
// • as
// • type casting
// • pattern/type checks
// • API null safety
// • Flutter null-safe architecture
//
// ============================================================================
// END OF PHASE 33
// ============================================================================