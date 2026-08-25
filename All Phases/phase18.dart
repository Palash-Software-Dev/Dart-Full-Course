// ============================================================================
// DART MASTER ROADMAP
// PHASE 18 — COLLECTIONS & GENERICS DEEP DIVE
// ============================================================================
//
// GOAL:
// Learn Dart collections and generics deeply enough for professional
// Flutter + full-stack application development.
//
// This phase is extremely important because Flutter applications constantly
// process:
//
//   • API response lists
//   • Products
//   • Orders
//   • Customers
//   • Employees
//   • Categories
//   • Permissions
//   • JSON arrays
//   • Pagination
//   • Search results
//   • Filters
//   • Reports
//   • Dropdown options
//   • Tables
//   • ERP data
//
// ============================================================================
// TOPICS
// ============================================================================
//
// COLLECTIONS
//
// 01. Iterable
// 02. List
// 03. Set
// 04. Map
// 05. Collection literals
// 06. growable vs fixed-length lists
// 07. const collections
// 08. collection if
// 09. collection for
// 10. spread operator (...)
// 11. null-aware spread (...?)
//
// LIST
//
// 12. List creation
// 13. indexing
// 14. first / last
// 15. length
// 16. add
// 17. addAll
// 18. insert
// 19. insertAll
// 20. remove
// 21. removeAt
// 22. removeWhere
// 23. retainWhere
// 24. clear
// 25. contains
// 26. indexOf
// 27. sublist
// 28. reversed
//
// SET
//
// 29. uniqueness
// 30. add
// 31. addAll
// 32. remove
// 33. contains
// 34. union
// 35. intersection
// 36. difference
//
// MAP
//
// 37. key/value
// 38. add
// 39. update
// 40. putIfAbsent
// 41. remove
// 42. containsKey
// 43. containsValue
// 44. keys
// 45. values
// 46. entries
// 47. map transformation
//
// ITERABLE
//
// 48. lazy operations
// 49. toList
// 50. toSet
// 51. where
// 52. map
// 53. expand
// 54. take
// 55. skip
// 56. takeWhile
// 57. skipWhile
// 58. followedBy
//
// SEARCH / AGGREGATION
//
// 59. reduce
// 60. fold
// 61. any
// 62. every
// 63. firstWhere
// 64. lastWhere
// 65. singleWhere
// 66. first
// 67. last
//
// GENERICS
//
// 68. generic functions
// 69. generic classes
// 70. generic methods
// 71. generic interfaces
// 72. generic typedef
// 73. type constraints
// 74. nullable generics
// 75. generic repositories
//
// ADVANCED
//
// 76. records
// 77. records with collections
// 78. nested collections
// 79. grouping
// 80. pagination
// 81. API response collections
// 82. ERP examples
//
// ============================================================================


// ============================================================================
// 01. ITERABLE
// ============================================================================
//
// Iterable is one of the most important collection concepts in Dart.
//
// List, Set and many other collection operations work through Iterable.
//
//
//
// Think:
//
// Iterable
//    ↑
//    ├── List
//    └── Set
//
// ============================================================================

void iterableExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final Iterable<int> result =
      numbers.where(
    (number) => number > 2,
  );

  print(result);
}


// ============================================================================
// IMPORTANT:
//
// Iterable is not necessarily a List.
//
// If you need a List:
//
// result.toList()
//
// ============================================================================


// ============================================================================
// 02. LIST
// ============================================================================
//
// List is an ordered collection.
//
// Duplicate values are allowed.
//
// ============================================================================

void listExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  print(names);
}


// ============================================================================
// 03. SET
// ============================================================================
//
// Set stores unique values.
//
// Duplicate values are automatically removed.
//
// ============================================================================

void setExample() {
  final numbers = {
    1,
    2,
    3,
    3,
    2,
  };

  print(numbers);
}


// ============================================================================
// Result:
//
// {1, 2, 3}
//
// ============================================================================


// ============================================================================
// 04. MAP
// ============================================================================
//
// Map stores key-value pairs.
//
// ============================================================================

void mapExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
    "age": 25,
  };

  print(user);
}


// ============================================================================
// 05. COLLECTION LITERALS
// ============================================================================
//
// List:
//
// [1, 2, 3]
//
// Set:
//
// {1, 2, 3}
//
// Map:
//
// {"name": "Palash"}
//
// ============================================================================


// ============================================================================
// 06. GROWABLE VS FIXED-LENGTH LIST
// ============================================================================
//
// Normal list:
//
// final numbers = <int>[1, 2, 3];
//
// is growable.
//
// ============================================================================

void growableListExample() {
  final numbers = <int>[
    1,
    2,
    3,
  ];

  numbers.add(4);

  print(numbers);
}


// ============================================================================
// Fixed-length:
//
// ============================================================================

void fixedLengthListExample() {
  final numbers =
      List<int>.filled(
    3,
    0,
    growable: false,
  );

  numbers[0] = 10;
  numbers[1] = 20;
  numbers[2] = 30;

  print(numbers);

  // numbers.add(40);
  //
  // This would throw an error because
  // the list length is fixed.
}


// ============================================================================
// 07. CONST COLLECTIONS
// ============================================================================
//
// const collection cannot be modified.
//
// ============================================================================

void constCollectionExample() {
  const numbers = [
    1,
    2,
    3,
  ];

  print(numbers);

  // numbers.add(4);
  //
  // Not allowed.
}


// ============================================================================
// 08. COLLECTION IF
// ============================================================================
//
// You can conditionally add an item to a collection.
//
// Very important in Flutter.
//
// ============================================================================

void collectionIfExample(
  bool isAdmin,
) {
  final menuItems = [
    "Dashboard",
    "Products",
    "Orders",

    if (isAdmin)
      "Admin Settings",
  ];

  print(menuItems);
}


// ============================================================================
// 09. COLLECTION FOR
// ============================================================================
//
// You can generate collection items using for.
//
// ============================================================================

void collectionForExample() {
  final numbers = [
    for (int i = 1; i <= 5; i++)
      i * 10,
  ];

  print(numbers);
}


// ============================================================================
// Flutter example:
//
// final widgets = [
//   for (final product in products)
//     ProductCard(product: product),
// ];
//
// ============================================================================
// 10. SPREAD OPERATOR (...)
// ============================================================================
//
// Spread inserts all elements of one collection into another.
//
// ============================================================================

void spreadExample() {
  final first = [
    1,
    2,
    3,
  ];

  final second = [
    4,
    5,
    6,
  ];

  final combined = [
    ...first,
    ...second,
  ];

  print(combined);
}


// ============================================================================
// 11. NULL-AWARE SPREAD (...?)
// ============================================================================
//
// If the collection is null,
// nothing is added.
//
// ============================================================================

void nullAwareSpreadExample() {
  List<String>? optionalNames;

  final names = [
    "Palash",
    ...?optionalNames,
    "Rahim",
  ];

  print(names);
}


// ============================================================================
// 12. LIST CREATION
// ============================================================================

void listCreationExamples() {
  final empty =
      <String>[];

  final names = <String>[
    "A",
    "B",
    "C",
  ];

  final generated =
      List<int>.generate(
    5,
    (index) => index + 1,
  );

  print(empty);
  print(names);
  print(generated);
}


// ============================================================================
// 13. INDEXING
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
// IMPORTANT:
//
// Dart indexes start at 0.
//
// First item:
//
// index = 0
//
// ============================================================================
// 14. FIRST / LAST
// ============================================================================

void firstLastExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  print(names.first);
  print(names.last);
}


// ============================================================================
// 15. LENGTH
// ============================================================================

void lengthExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  print(names.length);
}


// ============================================================================
// 16. ADD
// ============================================================================

void addExample() {
  final names = <String>[
    "A",
    "B",
  ];

  names.add("C");

  print(names);
}


// ============================================================================
// 17. ADD ALL
// ============================================================================

void addAllExample() {
  final names = <String>[
    "A",
  ];

  names.addAll([
    "B",
    "C",
    "D",
  ]);

  print(names);
}


// ============================================================================
// 18. INSERT
// ============================================================================

void insertExample() {
  final names = [
    "A",
    "C",
  ];

  names.insert(
    1,
    "B",
  );

  print(names);
}


// ============================================================================
// 19. INSERT ALL
// ============================================================================

void insertAllExample() {
  final names = [
    "A",
    "D",
  ];

  names.insertAll(
    1,
    [
      "B",
      "C",
    ],
  );

  print(names);
}


// ============================================================================
// 20. REMOVE
// ============================================================================

void removeExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  names.remove("B");

  print(names);
}


// ============================================================================
// 21. REMOVE AT
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
// 22. REMOVE WHERE
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


// ============================================================================
// 23. RETAIN WHERE
// ============================================================================
//
// Keeps matching values and removes everything else.
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


// ============================================================================
// 24. CLEAR
// ============================================================================

void clearExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  names.clear();

  print(names);
}


// ============================================================================
// 25. CONTAINS
// ============================================================================

void containsExample() {
  final permissions = {
    "read",
    "write",
    "delete",
  };

  print(
    permissions.contains(
      "write",
    ),
  );
}


// ============================================================================
// 26. INDEX OF
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

  print(
    names.indexOf("X"),
  );
}


// ============================================================================
// If not found:
//
// -1
//
// ============================================================================
// 27. SUBLIST
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


// ============================================================================
// start = 1
// end = 4
//
// Includes index 1
// Excludes index 4
//
// Result:
//
// [20, 30, 40]
//
// ============================================================================
// 28. REVERSED
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
// 29. SET UNIQUENESS
// ============================================================================

void setUniquenessExample() {
  final imeis = <String>{
    "123",
    "456",
    "123",
  };

  print(imeis);
}


// ============================================================================
// This is useful for:
//
//   • unique IMEI numbers
//   • unique SKU values
//   • unique IDs
//   • selected permissions
//
// ============================================================================
// 30. SET ADD
// ============================================================================

void setAddExample() {
  final roles = <String>{
    "admin",
  };

  roles.add("employee");
  roles.add("admin");

  print(roles);
}


// ============================================================================
// 31. SET ADD ALL
// ============================================================================

void setAddAllExample() {
  final roles = <String>{
    "admin",
  };

  roles.addAll([
    "employee",
    "vendor",
  ]);

  print(roles);
}


// ============================================================================
// 32. SET REMOVE
// ============================================================================

void setRemoveExample() {
  final roles = {
    "admin",
    "employee",
    "vendor",
  };

  roles.remove("vendor");

  print(roles);
}


// ============================================================================
// 33. SET CONTAINS
// ============================================================================

void setContainsExample() {
  final permissions = {
    "read",
    "write",
  };

  if (permissions.contains("delete")) {
    print("Can delete");
  } else {
    print("Cannot delete");
  }
}


// ============================================================================
// 34. UNION
// ============================================================================
//
// Combines two sets.
//
// ============================================================================

void unionExample() {
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

  final result =
      a.union(b);

  print(result);
}


// ============================================================================
// 35. INTERSECTION
// ============================================================================
//
// Values common to both sets.
//
// ============================================================================

void intersectionExample() {
  final a = {
    1,
    2,
    3,
  };

  final b = {
    2,
    3,
    4,
  };

  print(
    a.intersection(b),
  );
}


// ============================================================================
// 36. DIFFERENCE
// ============================================================================
//
// Values present in first set but not second.
//
// ============================================================================

void differenceExample() {
  final a = {
    1,
    2,
    3,
  };

  final b = {
    2,
    3,
    4,
  };

  print(
    a.difference(b),
  );
}


// ============================================================================
// 37. MAP KEY / VALUE
// ============================================================================

void mapKeyValueExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
    "role": "admin",
  };

  print(
    user["name"],
  );
}


// ============================================================================
// 38. MAP ADD
// ============================================================================

void mapAddExample() {
  final user =
      <String, dynamic>{};

  user["id"] = "U001";
  user["name"] = "Palash";

  print(user);
}


// ============================================================================
// 39. MAP UPDATE
// ============================================================================
//
// Assigning an existing key updates it.
//
// ============================================================================

void mapUpdateExample() {
  final user = {
    "name": "Palash",
    "role": "employee",
  };

  user["role"] = "admin";

  print(user);
}


// ============================================================================
// 40. putIfAbsent
// ============================================================================
//
// Adds a value only if the key doesn't exist.
//
// ============================================================================

void putIfAbsentExample() {
  final settings = {
    "theme": "dark",
  };

  settings.putIfAbsent(
    "language",
    () => "English",
  );

  settings.putIfAbsent(
    "theme",
    () => "light",
  );

  print(settings);
}


// ============================================================================
// 41. MAP REMOVE
// ============================================================================

void mapRemoveExample() {
  final user = {
    "name": "Palash",
    "role": "admin",
  };

  user.remove("role");

  print(user);
}


// ============================================================================
// 42. containsKey
// ============================================================================

void containsKeyExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(
    user.containsKey("email"),
  );
}


// ============================================================================
// 43. containsValue
// ============================================================================

void containsValueExample() {
  final user = {
    "role": "admin",
  };

  print(
    user.containsValue("admin"),
  );
}


// ============================================================================
// 44. keys
// ============================================================================

void mapKeysExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(
    user.keys.toList(),
  );
}


// ============================================================================
// 45. values
// ============================================================================

void mapValuesExample() {
  final user = {
    "id": "U001",
    "name": "Palash",
  };

  print(
    user.values.toList(),
  );
}


// ============================================================================
// 46. entries
// ============================================================================
//
// entries contains MapEntry objects.
//
// ============================================================================

void mapEntriesExample() {
  final user = {
    "name": "Palash",
    "role": "admin",
  };

  for (final entry in user.entries) {
    print(
      "${entry.key}: ${entry.value}",
    );
  }
}


// ============================================================================
// 47. MAP TRANSFORMATION
// ============================================================================
//
// Map itself has map().
//
// ============================================================================

void mapTransformationExample() {
  final prices = {
    "phone": 50000,
    "laptop": 100000,
  };

  final discounted =
      prices.map(
    (
      key,
      value,
    ) {
      return MapEntry(
        key,
        value * 0.9,
      );
    },
  );

  print(discounted);
}


// ============================================================================
// 48. LAZY ITERABLE OPERATIONS
// ============================================================================
//
// Some Iterable operations are lazy.
//
// Example:
//
// where()
// map()
// take()
// skip()
//
// They don't necessarily calculate everything immediately.
//
// ============================================================================

void lazyIterableExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final result = numbers
      .where(
        (number) => number.isEven,
      )
      .map(
        (number) => number * 10,
      );

  print(
    result.toList(),
  );
}


// ============================================================================
// 49. toList()
// ============================================================================

void toListExample() {
  final iterable =
      [1, 2, 3].where(
    (number) => number > 1,
  );

  final list =
      iterable.toList();

  print(list);
}


// ============================================================================
// 50. toSet()
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


// ============================================================================
// 51. where()
// ============================================================================

void iterableWhereExample() {
  final numbers = [
    10,
    20,
    30,
    40,
  ];

  final result =
      numbers.where(
    (number) => number >= 30,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 52. map()
// ============================================================================

void iterableMapExample() {
  final names = [
    "palash",
    "rahim",
    "karim",
  ];

  final upper =
      names.map(
    (name) =>
        name.toUpperCase(),
  );

  print(
    upper.toList(),
  );
}


// ============================================================================
// 53. expand()
// ============================================================================

void iterableExpandExample() {
  final groups = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  final result =
      groups.expand(
    (group) => group,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 54. take()
// ============================================================================
//
// Takes the first N elements.
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

  print(
    numbers.take(3).toList(),
  );
}


// ============================================================================
// 55. skip()
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

  print(
    numbers.skip(2).toList(),
  );
}


// ============================================================================
// 56. takeWhile()
// ============================================================================

void takeWhileExample() {
  final numbers = [
    1,
    2,
    3,
    0,
    4,
  ];

  final result =
      numbers.takeWhile(
    (number) => number > 0,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// It stops when the condition becomes false.
//
// ============================================================================
// 57. skipWhile()
// ============================================================================

void skipWhileExample() {
  final numbers = [
    1,
    2,
    0,
    3,
    4,
  ];

  final result =
      numbers.skipWhile(
    (number) => number > 0,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 58. followedBy()
// ============================================================================

void followedByExample() {
  final first = [
    1,
    2,
  ];

  final result =
      first.followedBy([
    3,
    4,
  ]);

  print(
    result.toList(),
  );
}


// ============================================================================
// 59. REDUCE
// ============================================================================

void collectionReduceExample() {
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


// ============================================================================
// 60. FOLD
// ============================================================================

void collectionFoldExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final total =
      numbers.fold<int>(
    100,
    (total, number) =>
        total + number,
  );

  print(total);
}


// ============================================================================
// Result:
//
// 160
//
// ============================================================================
// 61. ANY
// ============================================================================

void collectionAnyExample() {
  final stock = [
    0,
    0,
    5,
  ];

  final available =
      stock.any(
    (value) => value > 0,
  );

  print(available);
}


// ============================================================================
// 62. EVERY
// ============================================================================

void collectionEveryExample() {
  final stock = [
    5,
    10,
    20,
  ];

  final valid =
      stock.every(
    (value) => value > 0,
  );

  print(valid);
}


// ============================================================================
// 63. FIRSTWHERE
// ============================================================================

void collectionFirstWhereExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      numbers.firstWhere(
    (number) => number > 15,
    orElse: () => -1,
  );

  print(result);
}


// ============================================================================
// 64. LASTWHERE
// ============================================================================

void lastWhereExample() {
  final numbers = [
    10,
    20,
    30,
    40,
  ];

  final result =
      numbers.lastWhere(
    (number) => number > 15,
    orElse: () => -1,
  );

  print(result);
}


// ============================================================================
// 65. SINGLEWHERE
// ============================================================================

void singleWhereCollectionExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      numbers.singleWhere(
    (number) => number == 20,
  );

  print(result);
}


// ============================================================================
// 66. FIRST
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
// WARNING:
//
// Empty collection:
//
// [].first
//
// throws an error.
//
// ============================================================================
// 67. LAST
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
// 68. GENERIC FUNCTIONS
// ============================================================================
//
// Generics allow reusable code for multiple types.
//
// ============================================================================

T getFirst<T>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================

void genericFunctionExample() {
  final number =
      getFirst<int>(
    [10, 20, 30],
  );

  final name =
      getFirst<String>(
    [
      "Palash",
      "Rahim",
    ],
  );

  print(number);
  print(name);
}


// ============================================================================
// 69. GENERIC CLASSES
// ============================================================================

class Box<T> {
  T value;

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
// 70. GENERIC METHODS
// ============================================================================

class Storage {
  T get<T>(T value) {
    return value;
  }
}


// ============================================================================

void genericMethodExample() {
  final storage =
      Storage();

  print(
    storage.get<int>(100),
  );

  print(
    storage.get<String>(
      "Hello",
    ),
  );
}


// ============================================================================
// 71. GENERIC INTERFACES
// ============================================================================

abstract class Repository<T> {
  Future<List<T>>
      getAll();

  Future<T?>
      getById(
    String id,
  );
}


// ============================================================================
// 72. GENERIC TYPEDEF
// ============================================================================

typedef Mapper<T, R> = R Function(
  T value,
);


// ============================================================================

String productNameMapper(
  ProductItem product,
) {
  return product.name;
}


// ============================================================================

void genericTypedefExample() {
  final Mapper<ProductItem, String>
      mapper =
      productNameMapper;

  final product =
      ProductItem(
    name: "Laptop",
    price: 100000,
  );

  print(
    mapper(product),
  );
}


// ============================================================================
// 73. TYPE CONSTRAINTS
// ============================================================================
//
// "T extends SomeType"
//
// means:
//
// T must be SomeType or a subclass.
//
// ============================================================================

class NumericBox<T extends num> {
  final T value;

  NumericBox(
    this.value,
  );
}


// ============================================================================

void typeConstraintExample() {
  final intBox =
      NumericBox<int>(10);

  final doubleBox =
      NumericBox<double>(
    10.5,
  );

  print(intBox.value);
  print(doubleBox.value);

  // NumericBox<String>("Hello");
  //
  // Not allowed because String
  // does not extend num.
}


// ============================================================================
// 74. NULLABLE GENERICS
// ============================================================================

class NullableBox<T> {
  final T? value;

  NullableBox(
    this.value,
  );
}


// ============================================================================

void nullableGenericExample() {
  final box =
      NullableBox<String>(
    null,
  );

  print(box.value);
}


// ============================================================================
// 75. GENERIC REPOSITORIES
// ============================================================================

abstract class GenericRepository<T> {
  Future<List<T>>
      getAll();

  Future<T?> getById(
    String id,
  );

  Future<T> create(
    T item,
  );

  Future<T> update(
    T item,
  );

  Future<void> delete(
    String id,
  );
}


// ============================================================================
// PRODUCT REPOSITORY
// ============================================================================

class ProductRepository
    implements
        GenericRepository<ProductItem> {
  @override
  Future<List<ProductItem>>
      getAll() async {
    return [];
  }

  @override
  Future<ProductItem?> getById(
    String id,
  ) async {
    return null;
  }

  @override
  Future<ProductItem> create(
    ProductItem item,
  ) async {
    return item;
  }

  @override
  Future<ProductItem> update(
    ProductItem item,
  ) async {
    return item;
  }

  @override
  Future<void> delete(
    String id,
  ) async {}
}


// ============================================================================
// 76. RECORDS
// ============================================================================
//
// Dart records allow grouping multiple values without creating a class.
//
// ============================================================================

void recordExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  print(user.name);
  print(user.age);
}


// ============================================================================
// Positional record:
//
// ============================================================================

void positionalRecordExample() {
  final result = (
    "Palash",
    25,
  );

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 77. RECORDS WITH COLLECTIONS
// ============================================================================

void recordCollectionExample() {
  final users = [
    (
      id: "U001",
      name: "Palash",
    ),
    (
      id: "U002",
      name: "Rahim",
    ),
  ];

  for (final user in users) {
    print(
      "${user.id}: ${user.name}",
    );
  }
}


// ============================================================================
// 78. NESTED COLLECTIONS
// ============================================================================
//
// Real ERP data is often nested.
//
// Example:
//
// Company
//   → Branches
//      → Warehouses
//         → Products
//
// ============================================================================

void nestedCollectionExample() {
  final warehouses = [
    {
      "name": "Main Warehouse",
      "products": [
        "Phone",
        "Laptop",
      ],
    },
    {
      "name": "Branch Warehouse",
      "products": [
        "Tablet",
        "Monitor",
      ],
    },
  ];

  for (final warehouse
      in warehouses) {
    print(
      warehouse["name"],
    );

    print(
      warehouse["products"],
    );
  }
}


// ============================================================================
// 79. GROUPING
// ============================================================================
//
// Example:
//
// Group products by category.
//
// ============================================================================

class CategoryProduct {
  final String name;
  final String category;

  const CategoryProduct({
    required this.name,
    required this.category,
  });
}


// ============================================================================

Map<String, List<CategoryProduct>>
groupByCategory(
  List<CategoryProduct>
      products,
) {
  final grouped =
      <String, List<CategoryProduct>>{};

  for (final product in products) {
    grouped
        .putIfAbsent(
          product.category,
          () => [],
        )
        .add(product);
  }

  return grouped;
}


// ============================================================================
// 80. PAGINATION
// ============================================================================
//
// Example:
//
// Page 1:
// items 0 - 9
//
// Page 2:
// items 10 - 19
//
// ============================================================================

List<T> paginate<T>(
  List<T> items, {
  required int page,
  required int pageSize,
}) {
  if (page < 1) {
    return [];
  }

  if (pageSize <= 0) {
    return [];
  }

  final start =
      (page - 1) * pageSize;

  if (start >= items.length) {
    return [];
  }

  final end =
      (start + pageSize)
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

void paginationExample() {
  final products =
      List.generate(
    25,
    (index) => "Product ${index + 1}",
  );

  print(
    paginate(
      products,
      page: 1,
      pageSize: 10,
    ),
  );

  print(
    paginate(
      products,
      page: 2,
      pageSize: 10,
    ),
  );
}


// ============================================================================
// 81. API RESPONSE COLLECTIONS
// ============================================================================
//
// Typical API:
//
// {
//   "data": [
//     {...},
//     {...}
//   ],
//   "total": 100,
//   "page": 1
// }
//
// ============================================================================

class PaginatedResponse<T> {
  final List<T> data;
  final int total;
  final int page;

  const PaginatedResponse({
    required this.data,
    required this.total,
    required this.page,
  });
}


// ============================================================================
// Generic API response:
//
// ============================================================================

class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
  });
}


// ============================================================================
// 82. ERP EXAMPLES
// ============================================================================


// ============================================================================
// PRODUCT SEARCH
// ============================================================================

List<ProductItem> searchProducts(
  List<ProductItem> products,
  String query,
) {
  final normalized =
      query.trim().toLowerCase();

  if (normalized.isEmpty) {
    return products;
  }

  return products
      .where(
        (product) =>
            product.name
                .toLowerCase()
                .contains(
                  normalized,
                ),
      )
      .toList();
}


// ============================================================================
// PRODUCT FILTER
// ============================================================================

List<ProductItem> filterProducts(
  List<ProductItem> products, {
  double? minimumPrice,
  double? maximumPrice,
}) {
  return products.where(
    (product) {
      if (minimumPrice != null &&
          product.price <
              minimumPrice) {
        return false;
      }

      if (maximumPrice != null &&
          product.price >
              maximumPrice) {
        return false;
      }

      return true;
    },
  ).toList();
}


// ============================================================================
// PRODUCT SORT
// ============================================================================

List<ProductItem> sortProducts(
  List<ProductItem> products, {
  bool ascending = true,
}) {
  final result =
      List<ProductItem>.from(
    products,
  );

  result.sort(
    (a, b) {
      final comparison =
          a.price.compareTo(
        b.price,
      );

      return ascending
          ? comparison
          : -comparison;
    },
  );

  return result;
}


// ============================================================================
// UNIQUE IMEI
// ============================================================================

Set<String> uniqueImeis(
  List<String> imeis,
) {
  return imeis.toSet();
}


// ============================================================================
// CHECK DUPLICATE IMEI
// ============================================================================

bool hasDuplicateImeis(
  List<String> imeis,
) {
  return imeis.length !=
      imeis.toSet().length;
}


// ============================================================================
// TOTAL STOCK
// ============================================================================

int calculateTotalStock(
  List<int> stocks,
) {
  return stocks.fold<int>(
    0,
    (total, stock) =>
        total + stock,
  );
}


// ============================================================================
// OUT-OF-STOCK PRODUCTS
// ============================================================================

List<ProductItem>
getOutOfStockProducts(
  List<ProductStock> products,
) {
  return products
      .where(
        (product) =>
            product.stock <= 0,
      )
      .map(
        (product) =>
            ProductItem(
          name: product.name,
          price: product.price,
        ),
      )
      .toList();
}


// ============================================================================

class ProductStock {
  final String name;
  final double price;
  final int stock;

  const ProductStock({
    required this.name,
    required this.price,
    required this.stock,
  });
}


// ============================================================================
// LOW STOCK PRODUCTS
// ============================================================================

List<ProductStock>
getLowStockProducts(
  List<ProductStock> products, {
  int threshold = 5,
}) {
  return products
      .where(
        (product) =>
            product.stock <=
            threshold,
      )
      .toList();
}


// ============================================================================
// GROUP PRODUCTS BY CATEGORY
// ============================================================================

Map<String, List<CategoryProduct>>
groupProducts(
  List<CategoryProduct>
      products,
) {
  final result =
      <String, List<CategoryProduct>>{};

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
// CONVERT MODEL LIST TO JSON
// ============================================================================

List<Map<String, dynamic>>
productsToJson(
  List<ProductItem> products,
) {
  return products
      .map(
        (product) => {
          "name": product.name,
          "price": product.price,
        },
      )
      .toList();
}


// ============================================================================
// CONVERT JSON TO MODEL LIST
// ============================================================================

List<ProductItem>
productsFromJson(
  List<Map<String, dynamic>>
      jsonList,
) {
  return jsonList
      .map(
        (json) {
          return ProductItem(
            name:
                json["name"] as String,
            price:
                (json["price"] as num)
                    .toDouble(),
          );
        },
      )
      .toList();
}


// ============================================================================
// ⭐ COLLECTION PIPELINE
// ============================================================================
//
// This pattern will become extremely common in Flutter:
//
// API data
//   ↓
// List<Model>
//   ↓
// where()
//   ↓
// map()
//   ↓
// sort()
//   ↓
// toList()
//
// ============================================================================

void collectionPipelineExample() {
  final products = [
    ProductItem(
      name: "Phone",
      price: 50000,
    ),
    ProductItem(
      name: "Laptop",
      price: 100000,
    ),
    ProductItem(
      name: "Tablet",
      price: 30000,
    ),
    ProductItem(
      name: "Monitor",
      price: 20000,
    ),
  ];

  final result = products
      .where(
        (product) =>
            product.price >=
            30000,
      )
      .map(
        (product) =>
            product.name,
      )
      .toList();

  print(result);
}


// ============================================================================
// ⭐ COLLECTION IF + FOR + SPREAD
// ============================================================================

void advancedCollectionLiteralExample(
  bool isAdmin,
  List<String> extraItems,
) {
  final menu = [
    "Dashboard",
    "Products",

    if (isAdmin)
      "Admin Panel",

    ...extraItems,

    for (final item in [
      "Orders",
      "Customers",
    ])
      item,
  ];

  print(menu);
}


// ============================================================================
// ⭐ GENERIC PAGINATED API
// ============================================================================

class PageResult<T> {
  final List<T> items;
  final int page;
  final int pageSize;
  final int total;

  const PageResult({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  bool get hasNextPage {
    return page * pageSize <
        total;
  }
}


// ============================================================================
// ⭐ GENERIC API REPOSITORY
// ============================================================================

abstract class ApiRepository<T> {
  Future<PageResult<T>>
      getPage({
    required int page,
    required int pageSize,
  });
}


// ============================================================================
// ⭐ GENERIC CACHE
// ============================================================================

class Cache<T> {
  final Map<String, T>
      _storage = {};

  void put(
    String key,
    T value,
  ) {
    _storage[key] = value;
  }

  T? get(
    String key,
  ) {
    return _storage[key];
  }

  bool contains(
    String key,
  ) {
    return _storage.containsKey(
      key,
    );
  }

  void remove(
    String key,
  ) {
    _storage.remove(key);
  }

  void clear() {
    _storage.clear();
  }
}


// ============================================================================

void genericCacheExample() {
  final userCache =
      Cache<String>();

  userCache.put(
    "currentUser",
    "Palash",
  );

  print(
    userCache.get(
      "currentUser",
    ),
  );

  final productCache =
      Cache<ProductItem>();

  productCache.put(
    "P001",
    ProductItem(
      name: "Laptop",
      price: 100000,
    ),
  );

  print(
    productCache.get("P001"),
  );
}


// ============================================================================
// ⭐ NULL-SAFE COLLECTIONS
// ============================================================================

void nullSafeCollectionExample(
  List<String?> names,
) {
  final validNames =
      names
          .whereType<String>()
          .where(
            (name) =>
                name.isNotEmpty,
          )
          .toList();

  print(validNames);
}


// ============================================================================
// ⭐ COLLECTIONS + RECORDS
// ============================================================================
//
// Records are useful for temporary grouped values.
//
// ============================================================================

List<(
  String name,
  double price,
)> productSummary(
  List<ProductItem> products,
) {
  return products
      .map(
        (product) => (
          product.name,
          product.price,
        ),
      )
      .toList();
}


// ============================================================================
// ⭐ MASTER COLLECTION EXAMPLE
// ============================================================================

void masterCollectionExample() {
  final products = [
    ProductStock(
      name: "Phone",
      price: 50000,
      stock: 10,
    ),
    ProductStock(
      name: "Laptop",
      price: 100000,
      stock: 3,
    ),
    ProductStock(
      name: "Tablet",
      price: 30000,
      stock: 0,
    ),
    ProductStock(
      name: "Monitor",
      price: 20000,
      stock: 7,
    ),
  ];

  // Filter low-stock products.
  final lowStock = products
      .where(
        (product) =>
            product.stock <= 5,
      )
      .toList();

  // Sort by price.
  lowStock.sort(
    (a, b) =>
        a.price.compareTo(
      b.price,
    ),
  );

  // Extract product names.
  final names = lowStock
      .map(
        (product) =>
            product.name,
      )
      .toList();

  // Calculate stock.
  final totalStock =
      lowStock.fold<int>(
    0,
    (total, product) =>
        total + product.stock,
  );

  print(names);
  print(totalStock);
}


// ============================================================================
// ⭐ WHICH COLLECTION SHOULD YOU USE?
// ============================================================================
//
// LIST
//
// Use when:
//
//   • order matters
//   • duplicates are allowed
//   • indexing is needed
//
// Examples:
//
//   products
//   orders
//   customers
//
//
//
// SET
//
// Use when:
//
//   • values must be unique
//
// Examples:
//
//   • IMEI
//   • permissions
//   • selected IDs
//   • tags
//
//
//
// MAP
//
// Use when:
//
//   • key → value relationship
//
// Examples:
//
//   user data
//   configuration
//   lookup tables
//   JSON
//
//
//
// ITERABLE
//
// Use when:
//
//   • processing/transformation
//
// ============================================================================
// ⭐ LIST VS SET
// ============================================================================
//
// List:
//
// [A, B, A]
//
// Set:
//
// {A, B}
//
//
//
// If you need:
//
// "Can this IMEI already exist?"
//
// Set is often useful.
//
// ============================================================================
// ⭐ MAP VS MODEL
// ============================================================================
//
// Map:
//
// dynamic/unstructured data.
//
//
//
// Model:
//
// strongly typed structured data.
//
//
//
// For production Flutter:
//
// API JSON
//      ↓
// Model
//
// is usually better than passing dynamic Maps everywhere.
//
// ============================================================================
// ⭐ COMMON MISTAKES
// ============================================================================
//
// 01.
//
// Calling .first on an empty collection.
//
//
//
// 02.
//
// Calling reduce() on an empty list.
//
//
//
// 03.
//
// Forgetting .toList() when a List is required.
//
//
//
// 04.
//
// Modifying a list while iterating over it.
//
//
//
// 05.
//
// Assuming Set preserves the exact semantics you need.
//
//
//
// 06.
//
// Using Map<String, dynamic> everywhere instead of models.
//
//
//
// 07.
//
// Forgetting sort() mutates a list.
//
//
//
// 08.
//
// Forgetting where/map can be lazy.
//
//
//
// 09.
//
// Using dynamic instead of generics.
//
//
//
// 10.
//
// Returning nullable values without handling them.
//
// ============================================================================
// ⭐ PHASE 18 MASTER CHECKLIST
// ============================================================================
//
// COLLECTION BASICS
//
// [ ] Iterable
// [ ] List
// [ ] Set
// [ ] Map
// [ ] Collection literals
// [ ] Growable list
// [ ] Fixed-length list
// [ ] const collections
// [ ] collection if
// [ ] collection for
// [ ] spread
// [ ] null-aware spread
//
// LIST
//
// [ ] indexing
// [ ] first
// [ ] last
// [ ] length
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
// [ ] sublist
// [ ] reversed
//
// SET
//
// [ ] uniqueness
// [ ] add
// [ ] remove
// [ ] contains
// [ ] union
// [ ] intersection
// [ ] difference
//
// MAP
//
// [ ] keys
// [ ] values
// [ ] entries
// [ ] update
// [ ] putIfAbsent
// [ ] containsKey
// [ ] containsValue
// [ ] map transformation
//
// ITERABLE
//
// [ ] lazy operations
// [ ] toList
// [ ] toSet
// [ ] where
// [ ] map
// [ ] expand
// [ ] take
// [ ] skip
// [ ] takeWhile
// [ ] skipWhile
// [ ] followedBy
//
// SEARCH
//
// [ ] reduce
// [ ] fold
// [ ] any
// [ ] every
// [ ] firstWhere
// [ ] lastWhere
// [ ] singleWhere
//
// GENERICS
//
// [ ] generic functions
// [ ] generic classes
// [ ] generic methods
// [ ] generic interfaces
// [ ] generic typedef
// [ ] type constraints
// [ ] nullable generics
// [ ] generic repository
// [ ] generic cache
//
// MODERN DART
//
// [ ] records
// [ ] collection + records
//
// REAL-WORLD
//
// [ ] grouping
// [ ] pagination
// [ ] API collections
// [ ] ERP filtering
// [ ] ERP searching
// [ ] ERP sorting
// [ ] ERP stock calculations
//
// ============================================================================
// ⭐ YOU SHOULD NOW BE ABLE TO EXPLAIN:
// ============================================================================
//
// 1. List vs Set vs Map
//
// 2. List vs Iterable
//
// 3. Iterable vs List
//
// 4. spread (...) vs null-aware spread (...?)
//
// 5. collection if
//
// 6. collection for
//
// 7. map() vs where()
//
// 8. reduce() vs fold()
//
// 9. any() vs every()
//
// 10. firstWhere() vs singleWhere()
//
// 11. When to use Set for unique IDs/IMEIs
//
// 12. How generic classes work
//
// 13. What T means in generic code
//
// 14. What T extends num means
//
// 15. How generic repositories work
//
// 16. How pagination works
//
// 17. How to transform API JSON collections into models
//
// ============================================================================
// ⭐ MOST IMPORTANT FOR YOUR FULL-STACK FLUTTER GOAL
// ============================================================================
//
// MASTER THESE:
//
// 1. List
// 2. Map
// 3. Set
// 4. Iterable
// 5. where()
// 6. map()
// 7. fold()
// 8. any()
// 9. every()
// 10. firstWhere()
// 11. sort()
// 12. spread operator
// 13. collection if
// 14. collection for
// 15. generics
// 16. generic repositories
// 17. API response collections
// 18. pagination
// 19. grouping
// 20. JSON → Model → List<Model>
//
// ============================================================================
// END OF PHASE 18
// ============================================================================
//
// NEXT:
//
// PHASE 19 — ASYNCHRONOUS DART DEEP DIVE
//
// Topics:
//
//   • Synchronous vs asynchronous execution
//   • Future
//   • async
//   • await
//   • Future states
//   • Future chaining
//   • then()
//   • catchError()
//   • whenComplete()
//   • try/catch with async
//   • Future.wait()
//   • Future.any()
//   • Future timeout
//   • Stream
//   • async*
//   • yield
//   • yield*
//   • StreamController
//   • broadcast streams
//   • subscriptions
//   • cancel()
//   • debounce concepts
//   • API requests
//   • loading/error/success state
//   • Flutter async patterns
//   • real ERP API examples
//
// ============================================================================
// END