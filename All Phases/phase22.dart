// ============================================================================
// DART MASTER ROADMAP
// PHASE 22 — MEMORY, OBJECT LIFECYCLE, IMMUTABILITY, REFERENCES,
//            PERFORMANCE, COPY, COLLECTIONS & MEMORY-SAFE DART
// ============================================================================
//
// GOAL:
// --------------------------------------------------------------------------
// Phase 22 is about understanding what actually happens to objects and data
// inside a Dart application.
//
// You already learned:
//   Phase 1  → Dart fundamentals
//   Phase 2  → Control flow
//   Phase 3  → Functions
//   Phase 4  → OOP
//   Phase 5+ → Advanced Dart
//   Phase 20 → Async / concurrency
//   Phase 21 → Advanced type system, patterns, generics, sealed classes
//
// Now we go deeper into:
//
//   • References
//   • Object identity
//   • Equality
//   • Immutability
//   • Mutable vs immutable objects
//   • const
//   • final
//   • Copying
//   • Shallow copy
//   • Deep copy
//   • Object lifecycle
//   • Garbage collection concepts
//   • Memory retention
//   • Closures and captured variables
//   • Collection performance
//   • List / Set / Map internals conceptually
//   • growable vs fixed-length collections
//   • Unmodifiable collections
//   • Iterable laziness
//   • Efficient collection operations
//   • Spread operators
//   • Collection-if / collection-for
//   • Records and immutability
//   • Flutter-specific memory considerations
//
// IMPORTANT:
// --------------------------------------------------------------------------
// Dart is garbage-collected. You normally do NOT manually free objects.
//
// But professional Flutter developers still need to understand:
//
//     "What keeps an object alive?"
//     "When does an object become unreachable?"
//     "Am I accidentally retaining a huge object?"
//     "Am I mutating shared state?"
//     "Did I accidentally copy or reference the same object?"
//     "Will this collection operation create unnecessary allocations?"
//
// ============================================================================


// ============================================================================
// 01. EVERYTHING IS AN OBJECT
// ============================================================================
//
// In Dart, almost everything you work with is an object.
//
// Examples:
//
// int
// double
// String
// List
// Map
// Set
// Function
// Class instances
//
// ============================================================================

void everythingIsObjectExample() {
  int number = 10;

  String text = "Hello";

  List<int> numbers = [
    1,
    2,
    3,
  ];

  print(
    number.runtimeType,
  );

  print(
    text.runtimeType,
  );

  print(
    numbers.runtimeType,
  );
}


// ============================================================================
// 02. VARIABLES STORE REFERENCES TO OBJECTS
// ============================================================================
//
// Important mental model:
//
// A variable points/references an object.
//
// Example:
//
// ============================================================================

void referenceExample() {
  final list1 = [
    1,
    2,
    3,
  ];

  final list2 = list1;

  list2.add(4);

  print(list1);
  print(list2);
}


// ============================================================================
// Output:
//
// [1, 2, 3, 4]
// [1, 2, 3, 4]
//
// Why?
//
// list1 and list2 refer to the SAME List object.
//
// ============================================================================


// ============================================================================
// 03. SAME OBJECT VS DIFFERENT OBJECT
// ============================================================================

void identityExample() {
  final list1 = [
    1,
    2,
    3,
  ];

  final list2 = list1;

  final list3 = [
    1,
    2,
    3,
  ];

  print(
    identical(
      list1,
      list2,
    ),
  );

  print(
    identical(
      list1,
      list3,
    ),
  );
}


// ============================================================================
// Output:
//
// true
// false
//
// `identical()` checks whether two references point to the exact same object.
//
// ============================================================================


// ============================================================================
// 04. IDENTICAL VS ==
// ============================================================================
//
// `identical(a, b)`
//
// asks:
//
// "Are these the exact same object?"
//
//
//
// `a == b`
//
// asks:
//
// "Are these values considered equal according to ==?"
//
// ============================================================================

void equalityExample() {
  final a = [
    1,
    2,
    3,
  ];

  final b = a;

  final c = [
    1,
    2,
    3,
  ];

  print(
    identical(a, b),
  );

  print(
    identical(a, c),
  );

  print(
    a == b,
  );

  print(
    a == c,
  );
}


// ============================================================================
// List's default == is not value-based deep equality.
//
// Therefore:
//
// a == c
//
// is normally false because they are different List objects.
//
// ============================================================================


// ============================================================================
// 05. CUSTOM VALUE EQUALITY
// ============================================================================
//
// For your own models, you may override == and hashCode.
//
// ============================================================================

class ProductValue {
  final String id;
  final String name;

  const ProductValue({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(
    Object other,
  ) {
    return other is ProductValue &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
    );
  }
}


// ============================================================================
// 06. VALUE EQUALITY
// ============================================================================

void valueEqualityExample() {
  const product1 = ProductValue(
    id: "P001",
    name: "Laptop",
  );

  const product2 = ProductValue(
    id: "P001",
    name: "Laptop",
  );

  print(
    identical(
      product1,
      product2,
    ),
  );

  print(
    product1 == product2,
  );
}


// ============================================================================
// IMPORTANT:
//
// `==` and `hashCode` should agree.
//
// If:
//
// a == b
//
// is true, then:
//
// a.hashCode == b.hashCode
//
// must also be true.
//
// ============================================================================


// ============================================================================
// 07. WHY hashCode MATTERS
// ============================================================================
//
// Set and Map depend heavily on equality/hashCode.
//
// ============================================================================

void hashCodeExample() {
  final products = <ProductValue>{
    const ProductValue(
      id: "P001",
      name: "Laptop",
    ),
    const ProductValue(
      id: "P001",
      name: "Laptop",
    ),
  };

  print(
    products.length,
  );
}


// ============================================================================
// Because ProductValue implements value equality,
// duplicate logical values can be recognized.
//
// ============================================================================


// ============================================================================
// 08. FINAL
// ============================================================================
//
// final means:
//
// The variable can be assigned only once.
//
// ============================================================================

void finalExample() {
  final name = "Palash";

  // name = "Flutter";
  //
  // ERROR
}


// ============================================================================
// IMPORTANT:
//
// final does NOT mean the object itself is immutable.
//
// ============================================================================

void finalDoesNotMeanImmutable() {
  final numbers = [
    1,
    2,
    3,
  ];

  numbers.add(4);

  print(numbers);
}


// ============================================================================
// The reference cannot change,
// but the List object can still change.
//
// ============================================================================


// ============================================================================
// 09. CONST
// ============================================================================
//
// const represents a compile-time constant.
//
// ============================================================================

void constExample() {
  const name = "Palash";

  const numbers = [
    1,
    2,
    3,
  ];

  print(name);
  print(numbers);
}


// ============================================================================
// 10. CONST OBJECT
// ============================================================================

class ImmutableProduct {
  final String id;
  final String name;

  const ImmutableProduct({
    required this.id,
    required this.name,
  });
}


// ============================================================================

void constObjectExample() {
  const product = ImmutableProduct(
    id: "P001",
    name: "Laptop",
  );

  print(product.name);
}


// ============================================================================
// 11. CONST OBJECT IDENTITY
// ============================================================================
//
// Dart can canonicalize identical const objects.
//
// ============================================================================

void constIdentityExample() {
  const product1 = ImmutableProduct(
    id: "P001",
    name: "Laptop",
  );

  const product2 = ImmutableProduct(
    id: "P001",
    name: "Laptop",
  );

  print(
    identical(
      product1,
      product2,
    ),
  );
}


// ============================================================================
// 12. IMMUTABILITY
// ============================================================================
//
// An immutable object cannot have its observable state changed after
// creation.
//
// Example:
//
// ============================================================================

class UserProfile {
  final String name;
  final int age;

  const UserProfile({
    required this.name,
    required this.age,
  });
}


// ============================================================================
//
// UserProfile fields cannot be reassigned.
//
// ============================================================================


// ============================================================================
// 13. SHALLOW IMMUTABILITY
// ============================================================================
//
// This is a very important concept.
//
// ============================================================================

class UserWithRoles {
  final String name;

  final List<String> roles;

  UserWithRoles({
    required this.name,
    required this.roles,
  });
}


// ============================================================================
//
// The field itself is final:
//
// roles = anotherList;
//
// is not allowed.
//
//
//
// But:
//
// roles.add("admin");
//
// IS allowed.
//
// Therefore the object is not deeply immutable.
//
// ============================================================================


// ============================================================================
// 14. TRUEER IMMUTABLE COLLECTION
// ============================================================================
//
// You can use an unmodifiable collection.
//
// ============================================================================

class SafeUser {
  final String name;

  final List<String> roles;

  SafeUser({
    required this.name,
    required List<String> roles,
  }) : roles =
            List.unmodifiable(
          roles,
        );
}


// ============================================================================
// Now:
//
// user.roles.add("admin")
//
// throws an error.
//
// ============================================================================


// ============================================================================
// 15. LIST.FROM VS LIST.UNMODIFIABLE
// ============================================================================
//
// List.from creates a new mutable List.
//
// List.unmodifiable creates a new unmodifiable List.
//
// ============================================================================

void listCopyExample() {
  final original = [
    1,
    2,
    3,
  ];

  final mutableCopy =
      List<int>.from(
    original,
  );

  final immutableCopy =
      List<int>.unmodifiable(
    original,
  );

  mutableCopy.add(4);

  print(mutableCopy);
  print(immutableCopy);
}


// ============================================================================
// 16. SHALLOW COPY
// ============================================================================
//
// Copying a collection does not necessarily copy the objects inside it.
//
// ============================================================================

class Address {
  String city;

  Address(
    this.city,
  );
}


// ============================================================================

void shallowCopyExample() {
  final address =
      Address("Dhaka");

  final list1 = [
    address,
  ];

  final list2 =
      List<Address>.from(
    list1,
  );

  list2.first.city =
      "Chattogram";

  print(
    list1.first.city,
  );

  print(
    list2.first.city,
  );
}


// ============================================================================
// Both print:
//
// Chattogram
//
// Why?
//
// The Lists are different,
// but both contain the same Address object.
//
// ============================================================================


// ============================================================================
// 17. DEEP COPY
// ============================================================================
//
// Deep copy means nested mutable objects are copied too.
//
// ============================================================================

void deepCopyExample() {
  final original =
      Address("Dhaka");

  final copied =
      Address(
    original.city,
  );

  copied.city =
      "Chattogram";

  print(
    original.city,
  );

  print(
    copied.city,
  );
}


// ============================================================================
// Output:
//
// Dhaka
// Chattogram
//
// ============================================================================


// ============================================================================
// 18. MODEL COPYWITH
// ============================================================================
//
// Flutter applications frequently use immutable models with copyWith.
//
// ============================================================================

class ProductModel {
  final String id;
  final String name;
  final double price;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}


// ============================================================================
// 19. COPYWITH EXAMPLE
// ============================================================================

void copyWithExample() {
  const product =
      ProductModel(
    id: "P001",
    name: "Laptop",
    price: 100000,
  );

  final updated =
      product.copyWith(
    price: 95000,
  );

  print(
    product.price,
  );

  print(
    updated.price,
  );
}


// ============================================================================
// Original object remains unchanged.
//
// This is extremely useful for:
//
//   • Flutter state
//   • Bloc/Cubit
//   • Riverpod
//   • Provider
//   • Redux-like patterns
//   • Clean Architecture
//
// ============================================================================


// ============================================================================
// 20. IMMUTABLE STATE
// ============================================================================

class CartState {
  final List<ProductModel> products;

  CartState({
    required List<ProductModel> products,
  }) : products =
            List.unmodifiable(
          products,
        );

  CartState copyWith({
    List<ProductModel>? products,
  }) {
    return CartState(
      products:
          products ?? this.products,
    );
  }
}


// ============================================================================
// 21. STATE UPDATE WITHOUT MUTATION
// ============================================================================

void immutableStateExample() {
  final state =
      CartState(
    products: const [],
  );

  final newProducts = [
    ...state.products,
    const ProductModel(
      id: "P001",
      name: "Phone",
      price: 50000,
    ),
  ];

  final newState =
      state.copyWith(
    products: newProducts,
  );

  print(
    state.products.length,
  );

  print(
    newState.products.length,
  );
}


// ============================================================================
// Output:
//
// 0
// 1
//
// ============================================================================


// ============================================================================
// 22. SPREAD OPERATOR
// ============================================================================
//
// `...` expands a collection.
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
// 23. NULL-AWARE SPREAD
// ============================================================================

void nullAwareSpreadExample() {
  List<int>? numbers;

  final result = [
    ...?numbers,
    10,
    20,
  ];

  print(result);
}


// ============================================================================
// 24. COLLECTION IF
// ============================================================================

void collectionIfExample(
  bool isAdmin,
) {
  final roles = [
    "user",
    if (isAdmin)
      "admin",
  ];

  print(roles);
}


// ============================================================================
// 25. COLLECTION FOR
// ============================================================================

void collectionForExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled = [
    for (final number
        in numbers)
      number * 2,
  ];

  print(doubled);
}


// ============================================================================
// 26. SPREAD + IMMUTABLE UPDATE
// ============================================================================
//
// One of the most common Flutter state patterns.
//
// ============================================================================

List<String> addItem(
  List<String> oldItems,
  String item,
) {
  return [
    ...oldItems,
    item,
  ];
}


// ============================================================================
// 27. REMOVE ITEM IMMUTABLY
// ============================================================================

List<String> removeItem(
  List<String> items,
  String item,
) {
  return [
    for (final value
        in items)
      if (value != item)
        value,
  ];
}


// ============================================================================
// 28. UPDATE ITEM IMMUTABLY
// ============================================================================

List<ProductModel>
    updateProductPrice(
  List<ProductModel> products,
  String productId,
  double newPrice,
) {
  return [
    for (final product
        in products)
      if (product.id == productId)
        product.copyWith(
          price: newPrice,
        )
      else
        product,
  ];
}


// ============================================================================
// 29. WHY IMMUTABLE STATE IS USEFUL
// ============================================================================
//
// It makes state changes predictable.
//
// BAD:
//
// state.products.add(product);
//
// GOOD:
//
// state = state.copyWith(
//   products: [
//     ...state.products,
//     product,
//   ],
// );
//
// ============================================================================


// ============================================================================
// 30. OBJECT LIFECYCLE
// ============================================================================
//
// Conceptually an object goes through:
//
//     Created
//       ↓
//     Referenced
//       ↓
//     Used
//       ↓
//     No longer reachable
//       ↓
//     Eligible for garbage collection
//
// ============================================================================
// IMPORTANT:
//
// "Eligible for garbage collection"
// does NOT mean:
//
// "destroyed immediately".
//
// The runtime decides when garbage collection occurs.
//
// ============================================================================


// ============================================================================
// 31. GARBAGE COLLECTION
// ============================================================================
//
// Dart uses automatic garbage collection.
//
// You generally do NOT write:
//
// delete object;
//
// free(object);
//
// destroy(object);
//
//
//
// Instead:
//
// remove references when you no longer need objects.
//
// ============================================================================


// ============================================================================
// 32. REACHABILITY
// ============================================================================
//
// An object that is still reachable from active program state may remain
// alive.
//
// An unreachable object can eventually be reclaimed.
//
// ============================================================================


// ============================================================================
// 33. MEMORY RETENTION
// ============================================================================
//
// One common mistake is unintentionally keeping references alive.
//
// Example:
//
// ============================================================================

final globalProducts =
    <ProductModel>[];


// ============================================================================
//
// If you keep thousands of objects here forever,
// they can remain reachable for the lifetime of the application.
//
// ============================================================================


// ============================================================================
// 34. GLOBAL COLLECTION WARNING
// ============================================================================
//
// Avoid unnecessary global mutable collections.
//
// BAD:
//
// final cache = <Object>[];
//
// and continuously adding objects without cleanup.
//
//
//
// Better:
//
// Use controlled caching with:
//
//   • size limits
//   • expiration
//   • explicit clear
//   • appropriate lifecycle
//
// ============================================================================


// ============================================================================
// 35. CLOSURES CAN RETAIN VARIABLES
// ============================================================================
//
// Closures capture variables from surrounding scopes.
//
// ============================================================================

Function createLargeClosure() {
  final largeData =
      List.generate(
    100000,
    (index) => index,
  );

  return () {
    print(
      largeData.length,
    );
  };
}


// ============================================================================
//
// As long as the returned closure remains reachable,
// the captured data may remain reachable too.
//
// ============================================================================


// ============================================================================
// 36. CLOSURE MEMORY RULE
// ============================================================================
//
// Don't accidentally retain large objects in long-lived callbacks,
// listeners, caches, or global references.
//
// ============================================================================


// ============================================================================
// 37. STREAM SUBSCRIPTIONS
// ============================================================================
//
// In Flutter, subscriptions/listeners must often be cancelled.
//
// Example:
//
// StreamSubscription subscription;
//
// subscription.cancel();
//
//
//
// Why?
//
// Because a live subscription can keep references and continue work.
//
// ============================================================================


// ============================================================================
// 38. CONTROLLER LIFECYCLE
// ============================================================================
//
// Controllers such as:
//
// TextEditingController
// AnimationController
// ScrollController
//
// often require explicit disposal in Flutter.
//
//
//
// Example concept:
//
// @override
// void dispose() {
//   controller.dispose();
//   super.dispose();
// }
//
// ============================================================================
//
// IMPORTANT:
//
// This is Flutter lifecycle management,
// not manual Dart garbage collection.
//
// ============================================================================


// ============================================================================
// 39. TIMER LIFECYCLE
// ============================================================================
//
// A Timer can keep executing until cancelled.
//
// ============================================================================

import 'dart:async';


// ============================================================================

Timer? timer;


// ============================================================================

void startTimer() {
  timer =
      Timer.periodic(
    const Duration(
      seconds: 1,
    ),
    (_) {
      print("Tick");
    },
  );
}


// ============================================================================

void stopTimer() {
  timer?.cancel();
  timer = null;
}


// ============================================================================
// 40. MEMORY LEAK CONCEPT
// ============================================================================
//
// In a garbage-collected language, a "memory leak" can still happen.
//
// Usually it means:
//
// An object is no longer logically needed,
// but something still references it.
//
// Therefore the garbage collector cannot reclaim it.
//
// ============================================================================


// ============================================================================
// 41. COMMON FLUTTER RETENTION PROBLEMS
// ============================================================================
//
// Examples:
//
//   • Uncancelled StreamSubscription
//   • Timers not cancelled
//   • Long-lived callbacks
//   • Global caches
//   • Static references
//   • Large lists kept unnecessarily
//   • Controllers not disposed
//   • Event listeners not removed
//
// ============================================================================
// 42. STATIC REFERENCES
// ============================================================================

class GlobalCache {
  static final data =
      <ProductModel>[];
}


// ============================================================================
//
// Because `data` is static,
// it can remain reachable for a very long time.
//
// Use static state carefully.
//
// ============================================================================


// ============================================================================
// 43. LIST BASICS
// ============================================================================
//
// List:
//
// Ordered collection.
//
// ============================================================================

void listBasics() {
  final list = [
    10,
    20,
    30,
  ];

  print(
    list[0],
  );

  print(
    list.length,
  );
}


// ============================================================================
// 44. GROWABLE LIST
// ============================================================================

void growableListExample() {
  final list =
      <int>[];

  list.add(1);
  list.add(2);
  list.add(3);

  print(list);
}


// ============================================================================
// 45. FIXED-LENGTH LIST
// ============================================================================

void fixedLengthListExample() {
  final list =
      List<int>.filled(
    3,
    0,
  );

  list[0] = 10;

  // list.add(20);
  //
  // ERROR:
  // The list length cannot change.
}


// ============================================================================
// 46. FILLED LIST
// ============================================================================

void filledListExample() {
  final list =
      List<int>.filled(
    5,
    0,
  );

  print(list);
}


// ============================================================================
// 47. GENERATED LIST
// ============================================================================

void generatedListExample() {
  final list =
      List<int>.generate(
    10,
    (index) => index * 10,
  );

  print(list);
}


// ============================================================================
// 48. EMPTY VS GENERATED
// ============================================================================
//
// Empty:
//
// <int>[]
//
// Generated:
//
// List.generate(...)
//
// Choose based on whether you need values immediately.
//
// ============================================================================


// ============================================================================
// 49. SET
// ============================================================================
//
// Set stores unique values.
//
// ============================================================================

void setExample() {
  final ids = <String>{
    "P001",
    "P002",
    "P001",
  };

  print(ids);
}


// ============================================================================
// 50. SET MEMBERSHIP
// ============================================================================
//
// Set is useful when you frequently ask:
//
// "Does this value exist?"
//
// ============================================================================

void setLookupExample() {
  final ids = <String>{
    "P001",
    "P002",
    "P003",
  };

  print(
    ids.contains("P002"),
  );
}


// ============================================================================
// 51. MAP
// ============================================================================
//
// Map stores key-value pairs.
//
// ============================================================================

void mapExample() {
  final prices =
      <String, double>{
    "P001": 100,
    "P002": 200,
  };

  print(
    prices["P001"],
  );
}


// ============================================================================
// 52. MAP LOOKUP
// ============================================================================
//
// Map is ideal when you already know the key.
//
// ============================================================================

void mapLookupExample() {
  final productPrices =
      <String, double>{
    "P001": 100000,
    "P002": 50000,
  };

  final price =
      productPrices["P001"];

  print(price);
}


// ============================================================================
// 53. LIST VS SET VS MAP
// ============================================================================
//
// List:
//
//   Ordered
//   Allows duplicates
//   Index-based
//
// Set:
//
//   Unique values
//   Membership-oriented
//
// Map:
//
//   Key → Value
//
// ============================================================================
// 54. CHOOSING COLLECTIONS
// ============================================================================
//
// Need order?
//
// → List
//
// Need uniqueness?
//
// → Set
//
// Need key lookup?
//
// → Map
//
// ============================================================================
// 55. UNMODIFIABLE COLLECTIONS
// ============================================================================

void unmodifiableCollectionExample() {
  final list =
      List.unmodifiable(
    [
      1,
      2,
      3,
    ],
  );

  final set =
      Set.unmodifiable(
    {
      1,
      2,
      3,
    },
  );

  final map =
      Map.unmodifiable(
    {
      "a": 1,
      "b": 2,
    },
  );

  print(list);
  print(set);
  print(map);
}


// ============================================================================
// 56. ITERABLE
// ============================================================================
//
// Iterable represents a sequence that can be iterated.
//
// List, Set and many other collections implement Iterable.
//
// ============================================================================

void iterableExample() {
  Iterable<int> numbers = [
    1,
    2,
    3,
  ];

  for (final number
      in numbers) {
    print(number);
  }
}


// ============================================================================
// 57. MAP IS LAZY
// ============================================================================
//
// Iterable.map() produces a lazy iterable.
//
// The transformation isn't necessarily performed immediately for every item.
//
// ============================================================================

void lazyMapExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled =
      numbers.map(
    (number) {
      print(
        "Processing $number",
      );

      return number * 2;
    },
  );

  print(
    "Map created",
  );

  print(
    doubled.toList(),
  );
}


// ============================================================================
// You may observe that mapping happens when the iterable is consumed.
//
// ============================================================================


// ============================================================================
// 58. WHERE IS ALSO LAZY
// ============================================================================

void lazyWhereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final even =
      numbers.where(
    (number) {
      print(
        "Checking $number",
      );

      return number.isEven;
    },
  );

  print(
    even.toList(),
  );
}


// ============================================================================
// 59. AVOID UNNECESSARY toList()
// ============================================================================
//
// If you only need to iterate:
//
// for (final item in iterable)
//
// may be enough.
//
// Don't create a new List unless you actually need one.
//
// ============================================================================


// ============================================================================
// 60. FIRST / LAST
// ============================================================================

void firstLastExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(
    numbers.first,
  );

  print(
    numbers.last,
  );
}


// ============================================================================
// 61. FIRSTWHERE
// ============================================================================

void firstWhereExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      numbers.firstWhere(
    (number) =>
        number > 15,
  );

  print(result);
}


// ============================================================================
// 62. firstWhere OR ELSE
// ============================================================================

void firstWhereOrElseExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      numbers.firstWhere(
    (number) =>
        number > 100,
    orElse: () => -1,
  );

  print(result);
}


// ============================================================================
// 63. ANY
// ============================================================================

void anyExample() {
  final products = [
    100,
    200,
    300,
  ];

  final exists =
      products.any(
    (price) =>
        price > 250,
  );

  print(exists);
}


// ============================================================================
// 64. EVERY
// ============================================================================

void everyExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final valid =
      prices.every(
    (price) =>
        price > 0,
  );

  print(valid);
}


// ============================================================================
// 65. CONTAINS
// ============================================================================

void containsExample() {
  final ids = [
    "P001",
    "P002",
  ];

  print(
    ids.contains("P001"),
  );
}


// ============================================================================
// 66. TAKE
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
// 67. SKIP
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
// 68. TAKEWHILE
// ============================================================================

void takeWhileExample() {
  final numbers = [
    1,
    2,
    3,
    7,
    8,
  ];

  print(
    numbers
        .takeWhile(
          (number) =>
              number < 5,
        )
        .toList(),
  );
}


// ============================================================================
// 69. SKIPWHILE
// ============================================================================

void skipWhileExample() {
  final numbers = [
    1,
    2,
    3,
    7,
    8,
  ];

  print(
    numbers
        .skipWhile(
          (number) =>
              number < 5,
        )
        .toList(),
  );
}


// ============================================================================
// 70. REDUCE
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


// ============================================================================
// 71. REDUCE VS FOLD
// ============================================================================
//
// reduce:
//
// Requires a non-empty collection.
//
// fold:
//
// Can provide an initial value.
//
// Example:
//
// reduce:
//
// [1, 2, 3]
//
// fold:
//
// [] with initial 0
//
// ============================================================================


// ============================================================================
// 72. FOLD
// ============================================================================

void foldAdvancedExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 100000,
    ),
  ];

  final total =
      products.fold<double>(
    0,
    (
      sum,
      product,
    ) =>
        sum + product.price,
  );

  print(total);
}


// ============================================================================
// 73. COLLECTION PERFORMANCE
// ============================================================================
//
// Conceptually:
//
// List index access:
//
// list[index]
//
// is typically efficient.
//
//
//
// Searching a List:
//
// list.contains(value)
//
// may require checking many items.
//
//
//
// Set membership:
//
// set.contains(value)
//
// is generally optimized for fast lookup.
//
//
//
// Map key lookup:
//
// map[key]
//
// is generally optimized for fast lookup.
//
//
//
// Exact implementation details are runtime-dependent,
// so don't treat these as absolute guarantees.
//
// ============================================================================
// 74. BAD LOOKUP PATTERN
// ============================================================================

void inefficientLookupExample(
  List<ProductModel> products,
  List<String> ids,
) {
  for (final id in ids) {
    final product =
        products.firstWhere(
      (product) =>
          product.id == id,
      orElse: () =>
          throw Exception(
        "Not found",
      ),
    );

    print(product.name);
  }
}


// ============================================================================
// If both collections are large,
// repeated searching can become expensive.
//
// ============================================================================
// 75. BETTER LOOKUP MAP
// ============================================================================

Map<String, ProductModel>
    indexProducts(
  List<ProductModel> products,
) {
  return {
    for (final product
        in products)
      product.id: product,
  };
}


// ============================================================================

void efficientLookupExample() {
  final products = [
    const ProductModel(
      id: "P001",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "P002",
      name: "Laptop",
      price: 100000,
    ),
  ];

  final byId =
      indexProducts(products);

  print(
    byId["P002"]?.name,
  );
}


// ============================================================================
// 76. INDEXING DATA
// ============================================================================
//
// This pattern is extremely useful in ERP systems.
//
// Instead of repeatedly searching:
//
// products.firstWhere(...)
//
// build:
//
// Map<String, Product>
//
// Then:
//
// productsById[id]
//
// ============================================================================
// 77. MEMORY VS SPEED
// ============================================================================
//
// Creating an index Map consumes additional memory.
//
// But it can significantly reduce repeated searching.
//
// Therefore:
//
// Performance optimization is about trade-offs.
//
// Faster lookup
//      ↕
// More memory
//
// ============================================================================
// 78. DON'T OPTIMIZE PREMATURELY
// ============================================================================
//
// First write:
//
// Correct
// Readable
// Maintainable
//
// Then profile real bottlenecks.
//
// Don't turn every List into a Map just because it might be faster.
//
// ============================================================================
// 79. COLLECTION COPY COST
// ============================================================================
//
// This:
//
// final newList = [
//   ...oldList,
//   item,
// ];
//
// creates a new List.
//
//
//
// That's often exactly what immutable state management wants.
//
// But doing it thousands of times with huge collections can be expensive.
//
// ============================================================================
// 80. LARGE LIST WARNING
// ============================================================================
//
// Avoid repeatedly rebuilding enormous lists when unnecessary.
//
// Example:
//
// 100,000 items
//
// repeated:
//
// [...items, newItem]
//
// can create substantial allocation and copying work.
//
// ============================================================================
// 81. CHUNK PROCESSING
// ============================================================================
//
// For large datasets, process in chunks.
//
// ============================================================================

Iterable<List<T>> chunks<T>(
  List<T> items,
  int size,
) sync* {
  for (
    int i = 0;
    i < items.length;
    i += size
  ) {
    final end =
        (i + size <
                items.length)
            ? i + size
            : items.length;

    yield items.sublist(
      i,
      end,
    );
  }
}


// ============================================================================
// 82. CHUNK EXAMPLE
// ============================================================================

void chunkExample() {
  final numbers =
      List.generate(
    10,
    (index) => index,
  );

  for (final chunk
      in chunks(numbers, 3)) {
    print(chunk);
  }
}


// ============================================================================
// 83. SUBLIST
// ============================================================================
//
// sublist creates a new List containing the selected elements.
//
// ============================================================================

void sublistExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final part =
      numbers.sublist(
    1,
    4,
  );

  print(part);
}


// ============================================================================
// 84. WHERE DOES NOT MUTATE ORIGINAL
// ============================================================================

void whereDoesNotMutate() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final even =
      numbers
          .where(
            (number) =>
                number.isEven,
          )
          .toList();

  print(numbers);
  print(even);
}


// ============================================================================
// 85. SORT MUTATES LIST
// ============================================================================
//
// IMPORTANT:
//
// List.sort() modifies the List.
//
// ============================================================================

void sortMutationExample() {
  final numbers = [
    3,
    1,
    2,
  ];

  numbers.sort();

  print(numbers);
}


// ============================================================================
// 86. IMMUTABLE SORT
// ============================================================================
//
// If you don't want to mutate the original:
//
// ============================================================================

void immutableSortExample() {
  final original = [
    3,
    1,
    2,
  ];

  final sorted = [
    ...original,
  ]..sort();

  print(original);
  print(sorted);
}


// ============================================================================
// 87. REVERSED
// ============================================================================
//
// reversed returns an Iterable.
//
// ============================================================================

void reversedExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final reversed =
      numbers.reversed.toList();

  print(reversed);
}


// ============================================================================
// 88. MAP TRANSFORMATION
// ============================================================================

void productNameExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 100000,
    ),
  ];

  final names =
      products
          .map(
            (product) =>
                product.name,
          )
          .toList();

  print(names);
}


// ============================================================================
// 89. CHAINING ITERABLE OPERATIONS
// ============================================================================

void chainExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 100000,
    ),
    const ProductModel(
      id: "3",
      name: "Mouse",
      price: 1500,
    ),
  ];

  final expensiveNames =
      products
          .where(
            (product) =>
                product.price >
                10000,
          )
          .map(
            (product) =>
                product.name,
          )
          .toList();

  print(expensiveNames);
}


// ============================================================================
// 90. ITERABLE CHAINING IS LAZY
// ============================================================================
//
// map and where generally return lazy Iterable views.
//
// The actual work occurs as the iterable is consumed.
//
// This can be useful for avoiding unnecessary intermediate collections.
//
// ============================================================================
// 91. AVOID UNNECESSARY INTERMEDIATE LISTS
// ============================================================================
//
// Less efficient style:
//
// final filtered =
//     products.where(...).toList();
//
// final names =
//     filtered.map(...).toList();
//
//
//
// Often better:
//
// final names = products
//     .where(...)
//     .map(...)
//     .toList();
//
// ============================================================================
// 92. COLLECTION PIPELINE
// ============================================================================
//
// Input
//   ↓
// where
//   ↓
// map
//   ↓
// take
//   ↓
// toList
//
// This is a useful functional collection pattern.
//
// ============================================================================
// 93. MAP ENTRIES
// ============================================================================

void mapEntriesExample() {
  final prices =
      <String, double>{
    "P001": 100,
    "P002": 200,
  };

  for (final entry
      in prices.entries) {
    print(
      "${entry.key}: ${entry.value}",
    );
  }
}


// ============================================================================
// 94. MAP UPDATE
// ============================================================================

void mapUpdateExample() {
  final prices =
      <String, double>{
    "P001": 100,
  };

  prices.update(
    "P001",
    (value) => value + 50,
  );

  print(prices);
}


// ============================================================================
// 95. MAP PUT IF ABSENT
// ============================================================================

void mapPutIfAbsentExample() {
  final prices =
      <String, double>{};

  prices.putIfAbsent(
    "P001",
    () => 100,
  );

  print(prices);
}


// ============================================================================
// 96. CACHE PATTERN
// ============================================================================

class ProductCache {
  final Map<String, ProductModel>
      _cache = {};

  ProductModel? get(
    String id,
  ) {
    return _cache[id];
  }

  void put(
    ProductModel product,
  ) {
    _cache[product.id] =
        product;
  }

  void clear() {
    _cache.clear();
  }
}


// ============================================================================
// 97. CACHE WARNING
// ============================================================================
//
// A cache is useful.
//
// But an unlimited cache can consume increasing memory.
//
// Production caches should consider:
//
//   • maximum size
//   • expiration
//   • invalidation
//   • lifecycle
//   • memory pressure
//
// ============================================================================
// 98. COPY OF MAP
// ============================================================================

void mapCopyExample() {
  final original =
      <String, int>{
    "a": 1,
    "b": 2,
  };

  final copy =
      Map<String, int>.from(
    original,
  );

  copy["c"] = 3;

  print(original);
  print(copy);
}


// ============================================================================
// 99. SHALLOW MAP COPY
// ============================================================================
//
// Again:
//
// Map.from()
//
// copies the Map structure.
//
// It does NOT automatically deep-copy nested objects.
//
// ============================================================================
// 100. NESTED DATA
// ============================================================================

void nestedDataExample() {
  final original =
      <String, dynamic>{
    "user": {
      "name": "Palash",
    },
  };

  final copy =
      Map<String, dynamic>.from(
    original,
  );

  final user =
      copy["user"]
          as Map<String, dynamic>;

  user["name"] =
      "Updated";

  print(
    original["user"],
  );
}


// ============================================================================
// Both structures may reflect the nested mutation because the inner Map
// was still shared.
//
// ============================================================================
// 101. DEEP COPY STRATEGIES
// ============================================================================
//
// Depending on the model, deep copy can be implemented with:
//
//   • copyWith
//   • constructors
//   • factory methods
//   • serialization
//   • generated model code
//
// Don't blindly serialize/deserialize everything just to copy an object.
// That can be expensive.
//
// ============================================================================
// 102. MODEL FACTORY COPY
// ============================================================================

class AddressModel {
  final String city;
  final String country;

  const AddressModel({
    required this.city,
    required this.country,
  });

  AddressModel copyWith({
    String? city,
    String? country,
  }) {
    return AddressModel(
      city: city ?? this.city,
      country:
          country ?? this.country,
    );
  }
}


// ============================================================================
// 103. NESTED COPYWITH
// ============================================================================

class CustomerModel {
  final String name;
  final AddressModel address;

  const CustomerModel({
    required this.name,
    required this.address,
  });

  CustomerModel copyWith({
    String? name,
    AddressModel? address,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      address:
          address ?? this.address,
    );
  }
}


// ============================================================================

void nestedCopyExample() {
  const customer =
      CustomerModel(
    name: "Palash",
    address: AddressModel(
      city: "Dhaka",
      country: "Bangladesh",
    ),
  );

  final updated =
      customer.copyWith(
    address:
        customer.address.copyWith(
      city: "Chattogram",
    ),
  );

  print(
    customer.address.city,
  );

  print(
    updated.address.city,
  );
}


// ============================================================================
// 104. OBJECT GRAPH
// ============================================================================
//
// A real application doesn't have isolated objects.
//
// It has an object graph.
//
// Example:
//
// Customer
//    ↓
// Address
//    ↓
// Country
//
// Product
//    ↓
// Category
//    ↓
// Brand
//
// Understanding references becomes important here.
//
// ============================================================================
// 105. SHARED REFERENCES
// ============================================================================

void sharedReferenceExample() {
  final address =
      Address(
    "Dhaka",
  );

  final customer1 =
      UserWithRoles(
    name: "User 1",
    roles: [],
  );

  final customer2 =
      UserWithRoles(
    name: "User 2",
    roles: [],
  );

  print(
    address.city,
  );

  print(
    customer1.name,
  );

  print(
    customer2.name,
  );
}


// ============================================================================
// The important concept:
//
// Multiple objects can reference the same nested object.
//
// Be careful when that nested object is mutable.
//
// ============================================================================
// 106. ALIASING
// ============================================================================
//
// Aliasing means multiple variables/references refer to the same object.
//
// ============================================================================

void aliasingExample() {
  final first =
      <String>[
    "A",
    "B",
  ];

  final second = first;

  second.add("C");

  print(first);
}


// ============================================================================
// 107. AVOID UNEXPECTED ALIASING
// ============================================================================
//
// If a method should not expose mutable internal state:
//
// BAD:
//
// List<String> get items => _items;
//
// GOOD:
//
// List<String> get items =>
//     List.unmodifiable(_items);
//
// ============================================================================
// 108. ENCAPSULATION
// ============================================================================

class SafeCart {
  final List<ProductModel>
      _products = [];

  List<ProductModel>
      get products =>
          List.unmodifiable(
            _products,
          );

  void add(
    ProductModel product,
  ) {
    _products.add(product);
  }
}


// ============================================================================
// External code cannot directly mutate the internal list.
//
// ============================================================================
// 109. MUTABLE INTERNAL STATE
// ============================================================================
//
// Encapsulation protects internal data.
//
// This is extremely important in large applications.
//
// ============================================================================
// 110. CONST COLLECTIONS
// ============================================================================

void constCollectionExample() {
  const numbers = [
    1,
    2,
    3,
  ];

  // numbers.add(4);
  //
  // ERROR
}


// ============================================================================
// 111. CONST NESTED COLLECTION
// ============================================================================

void nestedConstExample() {
  const data = {
    "name": "Palash",
    "skills": [
      "Dart",
      "Flutter",
    ],
  };

  print(data);
}


// ============================================================================
// 112. FINAL COLLECTION VS CONST COLLECTION
// ============================================================================
//
// final:
//
// reference assigned once
// object may still mutate
//
// const:
//
// compile-time constant
// constant object is immutable
//
// ============================================================================
// 113. FINAL LIST
// ============================================================================

void finalList() {
  final list = [
    1,
    2,
    3,
  ];

  list.add(4);
}


// ============================================================================
// 114. CONST LIST
// ============================================================================

void constList() {
  const list = [
    1,
    2,
    3,
  ];

  // list.add(4);
  //
  // ERROR
}


// ============================================================================
// 115. MEMORY-EFFICIENT API MODELS
// ============================================================================
//
// For large API responses:
//
// Avoid unnecessarily storing duplicate derived data.
//
// Example:
//
// If you already have:
//
// firstName
// lastName
//
// you may not need to permanently store:
//
// fullName
//
// unless there is a real reason.
//
// ============================================================================
// 116. LAZY COMPUTED PROPERTY
// ============================================================================

class Person {
  final String firstName;
  final String lastName;

  const Person({
    required this.firstName,
    required this.lastName,
  });

  String get fullName =>
      "$firstName $lastName";
}


// ============================================================================
// 117. LAZY GETTER
// ============================================================================
//
// Getter calculates the value when requested.
//
// It doesn't necessarily mean the result is cached.
//
// ============================================================================
// 118. LATE FINAL
// ============================================================================
//
// `late final` allows initialization later,
// but only once.
//
// ============================================================================

class Config {
  late final String baseUrl;

  void initialize(
    String url,
  ) {
    baseUrl = url;
  }
}


// ============================================================================
// After assignment:
//
// baseUrl
//
// cannot be reassigned.
//
// ============================================================================
// 119. LATE MEMORY CONCEPT
// ============================================================================
//
// `late` does not magically reduce memory.
//
// It mainly changes initialization timing/semantics.
//
// Use it when deferred initialization is actually appropriate.
//
// ============================================================================
// 120. LAZY INITIALIZATION
// ============================================================================

class ExpensiveService {
  late final List<int> data =
      List.generate(
    100000,
    (index) => index,
  );
}


// ============================================================================
// The value can be initialized when first accessed.
//
// ============================================================================
// 121. PERFORMANCE PRINCIPLE
// ============================================================================
//
// Do not optimize by guessing.
//
// Instead:
//
//   1. Identify bottleneck.
//   2. Measure.
//   3. Change.
//   4. Measure again.
//
// ============================================================================
// 122. MICRO-BENCHMARK
// ============================================================================
//
// For simple Dart code, you can use Stopwatch.
//
// ============================================================================

void benchmarkExample() {
  final stopwatch =
      Stopwatch()..start();

  var total = 0;

  for (
    int i = 0;
    i < 1000000;
    i++
  ) {
    total += i;
  }

  stopwatch.stop();

  print(
    "Total: $total",
  );

  print(
    "Elapsed: ${stopwatch.elapsedMicroseconds} µs",
  );
}


// ============================================================================
// 123. STOPWATCH
// ============================================================================
//
// Stopwatch is useful for measuring elapsed time.
//
// Don't use print-heavy loops when benchmarking because logging itself can
// distort the measurement.
//
// ============================================================================
// 124. AVOID UNNECESSARY WORK
// ============================================================================
//
// BAD:
//
// final result = hugeList
//     .map(...)
//     .where(...)
//     .map(...)
//     .toList();
//
// if some transformations are unnecessary.
//
//
//
// Better:
//
// Keep only transformations actually required.
//
// ============================================================================
// 125. DON'T CREATE TEMPORARY OBJECTS UNNECESSARILY
// ============================================================================
//
// In performance-sensitive code, repeated object allocation can matter.
//
// But don't sacrifice readability without evidence.
//
// ============================================================================
// 126. REUSE IMMUTABLE CONSTANTS
// ============================================================================

const emptyProducts =
    <ProductModel>[];


// ============================================================================
// This can be useful for shared constant defaults.
//
// ============================================================================
// 127. CONST CONSTRUCTOR BENEFIT
// ============================================================================
//
// const constructors allow compile-time constant instances when possible.
//
// Flutter uses this heavily.
//
// Example:
//
// const SizedBox()
//
// const Text()
//
// const EdgeInsets.all()
//
// ============================================================================
// 128. FLUTTER REBUILD CONCEPT
// ============================================================================
//
// A Flutter widget can be rebuilt frequently.
//
// Therefore:
//
//   • Keep build methods reasonably cheap.
//   • Use const widgets where appropriate.
//   • Avoid expensive synchronous work inside build.
//   • Don't repeatedly parse huge datasets in build.
//   • Don't create unnecessary heavy objects on every build.
//
// ============================================================================
// 129. BAD BUILD PATTERN
// ============================================================================
//
// Conceptually:
//
// build() {
//   final hugeData = expensiveCalculation();
//   ...
// }
//
// If build runs repeatedly,
// expensiveCalculation() runs repeatedly.
//
// ============================================================================
// 130. BETTER ARCHITECTURE
// ============================================================================
//
// Move expensive work into:
//
//   • repository
//   • use case
//   • controller
//   • isolate/background processing
//   • cached computation
//
// depending on the problem.
//
// ============================================================================
// 131. LARGE JSON
// ============================================================================
//
// Parsing huge JSON payloads on the UI isolate can cause frame drops.
//
// For sufficiently large workloads:
//
// consider moving expensive parsing/transformation to another isolate.
//
// This connects directly with Phase 20.
//
// ============================================================================
// 132. MEMORY-SAFE IMAGE HANDLING
// ============================================================================
//
// Images can consume substantial memory.
//
// Avoid unnecessarily loading huge original images when a smaller display
// size is sufficient.
//
// In Flutter, use appropriate image caching/resizing strategies.
//
// ============================================================================
// 133. PAGINATION
// ============================================================================
//
// Never assume that an API should return millions of records to the client.
//
// Instead:
//
// Page 1
// Page 2
// Page 3
//
// or:
//
// cursor-based pagination.
//
// ============================================================================
// 134. ERP EXAMPLE
// ============================================================================
//
// Suppose your ERP has:
//
// 500,000 products.
//
// Don't load all products into Flutter memory simply to display:
//
// 20 products.
//
// Better:
//
// API
// ↓
// pagination
// ↓
// 20–50 records
// ↓
// UI
//
// ============================================================================
// 135. CACHE ONLY WHAT YOU NEED
// ============================================================================
//
// Cache:
//
// frequently accessed
// expensive-to-fetch
// appropriate-size
//
// Don't cache everything.
//
// ============================================================================
// 136. CACHE INVALIDATION
// ============================================================================
//
// If product price changes:
//
// cached price may become stale.
//
// Therefore caching requires a strategy.
//
// Possible approaches:
//
//   • TTL
//   • manual invalidation
//   • versioning
//   • refresh
//   • server-driven invalidation
//
// ============================================================================
// 137. IMMUTABLE DTO
// ============================================================================

class ProductDto {
  final String id;
  final String name;
  final double price;

  const ProductDto({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductDto(
      id: json["id"] as String,
      name:
          json["name"] as String,
      price:
          (json["price"] as num)
              .toDouble(),
    );
  }
}


// ============================================================================
// 138. WHY IMMUTABLE DTO?
// ============================================================================
//
// Once parsed:
//
// product.id
// product.name
// product.price
//
// cannot accidentally be changed.
//
// This makes data flow safer.
//
// ============================================================================
// 139. DOMAIN MODEL VS DTO
// ============================================================================
//
// DTO:
//
// Represents external/API data.
//
// Domain model:
//
// Represents application/business meaning.
//
// They don't always need to be the same class.
//
// ============================================================================
// 140. COPY BETWEEN DTO AND DOMAIN
// ============================================================================

class ProductDomain {
  final String id;
  final String name;
  final double price;

  const ProductDomain({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductDomain.fromDto(
    ProductDto dto,
  ) {
    return ProductDomain(
      id: dto.id,
      name: dto.name,
      price: dto.price,
    );
  }
}


// ============================================================================
// 141. MEMORY RULE FOR MODELS
// ============================================================================
//
// Don't duplicate large data structures without a reason.
//
// If:
//
// DTO → Domain → UI Model
//
// all contain huge lists or nested data,
// memory usage can increase substantially.
//
//
//
// Use separate models when architecture benefits,
// but understand the cost.
//
// ============================================================================
// 142. STRING MEMORY
// ============================================================================
//
// Strings are immutable.
//
// You cannot change a String in place.
//
// ============================================================================

void stringImmutableExample() {
  final text =
      "Hello";

  final updated =
      text + " World";

  print(text);
  print(updated);
}


// ============================================================================
// 143. STRINGBUFFER-LIKE PATTERN
// ============================================================================
//
// For building large strings repeatedly,
// consider using StringBuffer.
//
// ============================================================================

void stringBufferExample() {
  final buffer =
      StringBuffer();

  for (
    int i = 0;
    i < 100;
    i++
  ) {
    buffer.write(i);
    buffer.write(",");
  }

  final result =
      buffer.toString();

  print(result);
}


// ============================================================================
// 144. WHY STRINGBUFFER?
// ============================================================================
//
// Repeated string concatenation in large loops can create unnecessary
// intermediate strings.
//
// StringBuffer can be more appropriate for large incremental construction.
//
// ============================================================================
// 145. OBJECT ALLOCATION
// ============================================================================
//
// Every new object represents work for the runtime.
//
// Example:
//
// for (...) {
//   final object = SomeObject();
// }
//
// This may allocate many objects.
//
// Again:
//
// Allocation itself isn't automatically bad.
//
// Measure before optimizing.
//
// ============================================================================
// 146. ALLOCATION VS READABILITY
// ============================================================================
//
// Never write ugly code just to avoid a tiny allocation without evidence.
//
// Maintainability matters.
//
// ============================================================================
// 147. MEMORY PRESSURE
// ============================================================================
//
// Memory pressure can come from:
//
//   • large lists
//   • images
//   • caches
//   • decoded JSON
//   • duplicate models
//   • retained closures
//   • long-lived listeners
//   • unnecessary copies
//
// ============================================================================
// 148. LARGE DATA PROCESSING
// ============================================================================
//
// For huge datasets:
//
// Don't:
//
// load everything
// copy everything
// transform everything
// keep everything
//
// Instead:
//
// paginate
// stream
// chunk
// filter early
// process incrementally
//
// ============================================================================
// 149. FILTER EARLY
// ============================================================================
//
// Instead of:
//
// allProducts
// ↓
// transform 500,000
// ↓
// filter 20
//
// Prefer:
//
// filter relevant data
// ↓
// transform only required data
//
// ============================================================================
// 150. EXAMPLE
// ============================================================================

void filterEarlyExample(
  List<ProductModel> products,
) {
  final result = products
      .where(
        (product) =>
            product.price >
            50000,
      )
      .map(
        (product) =>
            product.name,
      )
      .take(20)
      .toList();

  print(result);
}


// ============================================================================
// Because the Iterable pipeline is lazy,
// downstream operations can avoid processing more items than needed in many
// cases.
//
// ============================================================================
// 151. AVOID MULTIPLE FULL PASSES
// ============================================================================
//
// If you repeatedly do:
//
// where
// map
// reduce
// where
// map
//
// understand how many elements are being processed.
//
// Sometimes one loop can be faster.
//
// ============================================================================
// 152. SINGLE-PASS PROCESSING
// ============================================================================

double calculatePositiveTotal(
  List<double> values,
) {
  double total = 0;

  for (final value
      in values) {
    if (value > 0) {
      total += value;
    }
  }

  return total;
}


// ============================================================================
// This can avoid intermediate collections.
//
// But don't replace clear pipelines unnecessarily.
//
// ============================================================================
// 153. PERFORMANCE DECISION
// ============================================================================
//
// Readability first.
//
// Optimization when profiling proves it matters.
//
// ============================================================================
// 154. OBJECT IDENTITY IN FLUTTER
// ============================================================================
//
// Understanding identity is useful when working with:
//
//   • state
//   • caches
//   • model comparison
//   • widget keys
//   • collections
//
// ============================================================================
// 155. MODEL EQUALITY
// ============================================================================
//
// If two models represent the same logical entity,
// decide what equality means.
//
// Example:
//
// Product equality may depend on:
//
// id
//
// rather than:
//
// every field.
//
// ============================================================================
// 156. ID-BASED EQUALITY
// ============================================================================

class Entity {
  final String id;

  const Entity(
    this.id,
  );

  @override
  bool operator ==(
    Object other,
  ) {
    return other is Entity &&
        other.id == id;
  }

  @override
  int get hashCode =>
      id.hashCode;
}


// ============================================================================
// 157. HASHCODE WARNING
// ============================================================================
//
// Do not use mutable fields in hashCode if objects are stored in hash-based
// collections and those fields can change.
//
// Otherwise collection behavior can become incorrect/unexpected.
//
// ============================================================================
// 158. IMMUTABLE ENTITY
// ============================================================================
//
// Immutable objects make equality/hash behavior safer.
//
// ============================================================================
// 159. SET WITH MUTABLE OBJECTS
// ============================================================================
//
// Avoid changing fields that participate in equality/hashCode while the
// object is inside a Set or is being used as a Map key.
//
// ============================================================================
// 160. MAP KEYS
// ============================================================================
//
// Good Map keys are generally:
//
//   • stable
//   • immutable
//   • equality/hashCode consistent
//
// ============================================================================
// 161. RECORD VALUE SEMANTICS
// ============================================================================
//
// Records provide structural value equality.
//
// ============================================================================

void recordEqualityExample() {
  final a = (
    name: "Palash",
    age: 25,
  );

  final b = (
    name: "Palash",
    age: 25,
  );

  print(
    a == b,
  );
}


// ============================================================================
// 162. RECORDS ARE IMMUTABLE
// ============================================================================
//
// Record fields cannot be reassigned.
//
// However, if a record contains a mutable object,
// that nested object can still be mutable.
//
// ============================================================================
// 163. RECORD WITH MUTABLE LIST
// ============================================================================

void recordNestedMutation() {
  final record = (
    name: "Palash",
    numbers: <int>[
      1,
      2,
    ],
  );

  record.numbers.add(3);

  print(
    record.numbers,
  );
}


// ============================================================================
// The record itself is immutable,
// but the List inside it is mutable.
//
// ============================================================================
// 164. SHALLOW VS DEEP IMMUTABILITY
// ============================================================================
//
// Very important:
//
// final
// const
// immutable class
// unmodifiable List
//
// are not all the same thing.
//
// Always ask:
//
// "Are nested objects immutable too?"
//
// ============================================================================
// 165. PRACTICAL IMMUTABLE MODEL
// ============================================================================

class ImmutableOrder {
  final String id;
  final List<String> itemIds;

  ImmutableOrder({
    required this.id,
    required List<String> itemIds,
  }) : itemIds =
            List.unmodifiable(
          itemIds,
        );
}


// ============================================================================
// 166. IMMUTABLE NESTED MODEL
// ============================================================================

class ImmutableCustomer {
  final String id;
  final ImmutableOrder order;

  const ImmutableCustomer({
    required this.id,
    required this.order,
  });
}


// ============================================================================
// 167. MEMORY-SAFE STATE PRINCIPLE
// ============================================================================
//
// Prefer:
//
// immutable state
// +
// explicit replacement
// +
// controlled collections
//
// over:
//
// globally shared mutable state.
//
// ============================================================================
// 168. ERP STATE EXAMPLE
// ============================================================================
//
// Product list
// ↓
// immutable state
//
// Product filters
// ↓
// immutable state
//
// Cart
// ↓
// immutable state
//
// Order draft
// ↓
// immutable state
//
// This makes complex UI behavior easier to reason about.
//
// ============================================================================
// 169. PRODUCT FILTER STATE
// ============================================================================

class ProductFilterState {
  final String search;
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;

  const ProductFilterState({
    this.search = "",
    this.categoryId,
    this.minPrice,
    this.maxPrice,
  });

  ProductFilterState copyWith({
    String? search,
    String? categoryId,
    double? minPrice,
    double? maxPrice,
  }) {
    return ProductFilterState(
      search:
          search ?? this.search,
      categoryId:
          categoryId ?? this.categoryId,
      minPrice:
          minPrice ?? this.minPrice,
      maxPrice:
          maxPrice ?? this.maxPrice,
    );
  }
}


// ============================================================================
// 170. NULLABLE copyWith PROBLEM
// ============================================================================
//
// Notice:
//
// categoryId ?? this.categoryId
//
// means you cannot easily distinguish:
//
// "don't change categoryId"
//
// from:
//
// "set categoryId to null"
//
// This is a real problem in advanced immutable models.
//
// Later you can solve this using more advanced patterns/helpers/code
// generation.
//
// ============================================================================
// 171. MEMORY + PAGINATION
// ============================================================================
//
// Don't keep every page forever unless necessary.
//
// Example:
//
// Page 1 → 50
// Page 2 → 50
// Page 3 → 50
//
// If user scrolls to page 100,
// keeping all 5,000 items may be fine.
//
// But keeping millions of records may not be.
//
// Design according to actual requirements.
//
// ============================================================================
// 172. CACHE WINDOW
// ============================================================================
//
// For very large datasets:
//
// keep only relevant pages.
//
// Example:
//
// current page
// previous page
// next page
//
// This can reduce memory usage.
//
// ============================================================================
// 173. IMAGE CACHE CONCEPT
// ============================================================================
//
// Image caching improves performance,
// but too much cached image data can increase memory usage.
//
// Always balance:
//
// speed
// ↕
// memory
//
// ============================================================================
// 174. BACKGROUND PROCESSING
// ============================================================================
//
// CPU-heavy processing can block UI if done on the main isolate.
//
// Examples:
//
//   • huge JSON transformation
//   • large report generation
//   • expensive calculations
//   • massive sorting/filtering
//
// Consider isolates when appropriate.
//
// ============================================================================
// 175. MEMORY + ISOLATE
// ============================================================================
//
// Isolates have separate memory/state.
//
// Objects are not simply shared between isolates like normal references.
//
// Data must be communicated between isolates.
//
// This connects Phase 20 with Phase 22.
//
// ============================================================================
// 176. DO NOT STORE UI CONTROLLERS IN DOMAIN MODELS
// ============================================================================
//
// Avoid mixing:
//
// TextEditingController
// BuildContext
// AnimationController
//
// into long-lived domain/data objects.
//
// Keep responsibilities separate.
//
// ============================================================================
// 177. LIFECYCLE BOUNDARIES
// ============================================================================
//
// Think in terms of lifetime:
//
// Screen lifetime
// ↓
// Controller lifetime
// ↓
// Repository lifetime
// ↓
// Application lifetime
//
// Don't let short-lived objects accidentally become application-long-lived.
//
// ============================================================================
// 178. APPLICATION-LIFETIME OBJECTS
// ============================================================================
//
// Examples:
//
// API client
// database connection manager
// auth session
// cache
//
// These can intentionally live longer.
//
// But they should still have controlled resources.
//
// ============================================================================
// 179. SCREEN-LIFETIME OBJECTS
// ============================================================================
//
// Examples:
//
// TextEditingController
// AnimationController
// ScrollController
// subscriptions
//
// These generally belong to screen/widget lifecycle.
//
// ============================================================================
// 180. MEMORY MANAGEMENT RULE
// ============================================================================
//
// Always ask:
//
// "How long should this object live?"
//
// This is one of the most important questions in production application
// architecture.
//
// ============================================================================
// 181. FINAL CHECKLIST
// ============================================================================
//
// You should now understand:
//
// REFERENCES
// [✓] Variables reference objects
// [✓] Aliasing
// [✓] Object identity
// [✓] identical()
// [✓] ==
// [✓] hashCode
//
// IMMUTABILITY
// [✓] final
// [✓] const
// [✓] immutable objects
// [✓] shallow immutability
// [✓] deep immutability concept
// [✓] unmodifiable collections
// [✓] copyWith
//
// COPYING
// [✓] shallow copy
// [✓] deep copy
// [✓] nested copy
// [✓] spread copy
//
// MEMORY
// [✓] object lifecycle
// [✓] reachability
// [✓] garbage collection concept
// [✓] memory retention
// [✓] closure retention
// [✓] static references
// [✓] cache memory
//
// COLLECTIONS
// [✓] List
// [✓] Set
// [✓] Map
// [✓] Iterable
// [✓] lazy operations
// [✓] map
// [✓] where
// [✓] fold
// [✓] reduce
// [✓] any
// [✓] every
// [✓] take
// [✓] skip
// [✓] sublist
// [✓] spread
// [✓] collection-if
// [✓] collection-for
//
// PERFORMANCE
// [✓] allocation
// [✓] collection copying
// [✓] indexing
// [✓] pagination
// [✓] caching
// [✓] chunk processing
// [✓] filtering early
// [✓] avoiding unnecessary work
// [✓] benchmarking
//
// FLUTTER
// [✓] controller lifecycle
// [✓] dispose()
// [✓] stream subscription lifecycle
// [✓] timers
// [✓] immutable state
// [✓] const widgets
// [✓] expensive build work
// [✓] large JSON
// [✓] isolates
// [✓] image memory
//
// ============================================================================
// 182. INTERVIEW QUESTIONS
// ============================================================================
//
// 1. What is the difference between final and const?
//
// 2. Does final make an object immutable?
//
// 3. What is object identity?
//
// 4. What does identical() do?
//
// 5. What is the difference between == and identical()?
//
// 6. Why must hashCode agree with ==?
//
// 7. What is aliasing?
//
// 8. What is shallow copy?
//
// 9. What is deep copy?
//
// 10. Why is copyWith useful in Flutter?
//
// 11. What is an unmodifiable List?
//
// 12. What is garbage collection?
//
// 13. When is an object eligible for garbage collection?
//
// 14. Can Dart applications have memory leaks?
//
// 15. How can a closure retain memory?
//
// 16. Why should StreamSubscription be cancelled?
//
// 17. Why should Flutter controllers be disposed?
//
// 18. What is the difference between List, Set and Map?
//
// 19. Why is Set useful for membership checks?
//
// 20. Why is Map useful for ID-based lookup?
//
// 21. What is a lazy Iterable?
//
// 22. Is map() immediately executed?
//
// 23. What is the difference between map() and where()?
//
// 24. What is fold()?
//
// 25. What is the difference between fold() and reduce()?
//
// 26. Why can repeated list copying become expensive?
//
// 27. Why is pagination important?
//
// 28. Why can a cache increase memory usage?
//
// 29. Why shouldn't huge JSON be processed on the UI isolate?
//
// 30. What is the relationship between memory and isolates?
//
// ============================================================================
// 183. FINAL MASTER RULES
// ============================================================================
//
// RULE 1:
// A variable normally holds a reference to an object.
//
// RULE 2:
// Assignment of a List/Map/Object variable does not automatically clone it.
//
// RULE 3:
// `final` protects the variable binding, not necessarily the object.
//
// RULE 4:
// `const` creates compile-time constants when applicable.
//
// RULE 5:
// Prefer immutable models for complex Flutter state.
//
// RULE 6:
// Use copyWith + new collections for predictable state updates.
//
// RULE 7:
// Understand shallow vs deep copying.
//
// RULE 8:
// Don't expose mutable internal collections unnecessarily.
//
// RULE 9:
// Cancel subscriptions and timers when their lifecycle ends.
//
// RULE 10:
// Dispose Flutter controllers when required.
//
// RULE 11:
// Don't keep unnecessary global/static references.
//
// RULE 12:
// Don't build unlimited caches.
//
// RULE 13:
// Use List for ordered data.
//
// RULE 14:
// Use Set for uniqueness/membership.
//
// RULE 15:
// Use Map for key-based lookup.
//
// RULE 16:
// Understand lazy Iterable operations.
//
// RULE 17:
// Avoid unnecessary intermediate collections in performance-sensitive
// code.
//
// RULE 18:
// Use pagination for large API datasets.
//
// RULE 19:
// Use isolates for genuinely expensive CPU work.
//
// RULE 20:
// Measure performance instead of guessing.
//
// RULE 21:
// Memory management is mostly about controlling object lifetime and
// references, not manually deleting objects.
//
// RULE 22:
// In a large Flutter/ERP application, always ask:
//
//     "Who owns this object?"
//     "How long should it live?"
//     "Can it be mutated?"
//     "Who can reference it?"
//     "Can I safely release it?"
//
// ============================================================================
// 184. PHASE 22 PRACTICE PROJECT
// ============================================================================
//
// Build an immutable Product Management module.
//
// Requirements:
//
// 1. ProductModel must be immutable.
//
// 2. Product list must be unmodifiable.
//
// 3. Implement copyWith.
//
// 4. Implement == and hashCode.
//
// 5. Create ProductState using sealed classes.
//
// 6. Create:
//
//      Loading
//      Success
//      Error
//
// 7. Create a product index:
//
//      Map<String, ProductModel>
//
// 8. Implement:
//
//      addProduct()
//      removeProduct()
//      updateProduct()
//
// 9. Do all state updates immutably.
//
// 10. Add pagination simulation.
//
// 11. Add a small cache.
//
// 12. Add cache clear.
//
// 13. Measure a simple operation using Stopwatch.
//
// 14. Process a large generated list.
//
// 15. Compare:
//
//      List search
//
//      vs
//
//      Map lookup
//
// ============================================================================
// 185. FINAL ARCHITECTURE YOU SHOULD UNDERSTAND
// ============================================================================
//
//                  FLUTTER UI
//                      │
//                      ▼
//               IMMUTABLE STATE
//                      │
//                      ▼
//                  USE CASE
//                      │
//                      ▼
//              REPOSITORY
//                      │
//                      ▼
//                DATA SOURCE
//                      │
//                      ▼
//                     API
//
// Along the way:
//
//   Immutable models
//   copyWith
//   sealed states
//   typed IDs
//   controlled collections
//   pagination
//   caching
//   lifecycle management
//   background processing
//
// ============================================================================
// END OF PHASE 22
// ============================================================================
//
// NEXT:
//
// PHASE 23 — DART ERROR HANDLING & PRODUCTION-SAFE EXCEPTION ARCHITECTURE
//
// Topics will include:
//
//   • Exception hierarchy
//   • Error vs Exception
//   • throw
//   • rethrow
//   • try/catch/finally
//   • stack traces
//   • custom exceptions
//   • custom failures
//   • error propagation
//   • async errors
//   • Future error handling
//   • Stream errors
//   • Result pattern
//   • repository error handling
//   • API errors
//   • HTTP status mapping
//   • validation errors
//   • global error handling
//   • Flutter error boundaries
//   • production logging
//   • safe error messages
//   • retry strategies
//   • timeout handling
//   • cancellation
//   • ERP-grade error architecture
//
// ============================================================================