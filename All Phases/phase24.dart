// ============================================================================
// DART MASTER ROADMAP
// PHASE 24 — FUNCTIONAL PROGRAMMING & ADVANCED COLLECTIONS
// ============================================================================
//
// GOAL:
// -----------------------------------------------------------------------------
// In Phase 24, you will learn how to use Dart functions and collections at an
// advanced/professional level.
//
// These concepts are extremely important for Flutter development because you
// will constantly work with:
//
//   • API response lists
//   • JSON collections
//   • Product lists
//   • Orders
//   • Customers
//   • Filtering
//   • Searching
//   • Sorting
//   • Mapping
//   • Grouping
//   • Pagination
//   • State transformations
//   • Validation
//   • Callbacks
//   • Streams
//   • Repository data
//
// Topics covered:
//
//   01. Functions as first-class objects
//   02. Function variables
//   03. Function parameters
//   04. Return functions
//   05. Higher-order functions
//   06. Anonymous functions
//   07. Closures
//   08. Lexical scope
//   09. Function tear-offs
//   10. Method tear-offs
//   11. Constructors as tear-offs
//   12. typedef
//   13. Generic function types
//   14. Callable classes
//   15. Function composition
//   16. Predicates
//   17. Transformations
//   18. map()
//   19. where()
//   20. firstWhere()
//   21. singleWhere()
//   22. any()
//   23. every()
//   24. take()
//   25. skip()
//   26. expand()
//   27. reduce()
//   28. fold()
//   29. forEach()
//   30. contains()
//   31. indexWhere()
//   32. lastWhere()
//   33. Iterable chaining
//   34. Lazy Iterable
//   35. Collection conversion
//   36. List/Set/Map transformations
//   37. Sorting
//   38. Grouping
//   39. Flattening
//   40. sync*
//   41. yield
//   42. async*
//   43. yield*
//   44. Functional pipelines
//   45. Reusable utilities
//   46. Flutter/API use cases
//
// ============================================================================


// ============================================================================
// 01. FUNCTIONS ARE FIRST-CLASS OBJECTS
// ============================================================================
//
// In Dart, functions are objects.
//
// That means you can:
//
//   • Store a function in a variable
//   • Pass a function to another function
//   • Return a function from a function
//
// This is one of the most important concepts behind Flutter callbacks.
//
// ============================================================================

int add(
  int a,
  int b,
) {
  return a + b;
}


// A function can be stored in a variable.

final operation = add;


// Now operation behaves like add.

void functionVariableExample() {
  final result = operation(
    10,
    20,
  );

  print(result);
}


// ============================================================================
// 02. FUNCTION VARIABLE TYPE
// ============================================================================
//
// You can explicitly describe a function type.
//
// ============================================================================

int Function(
  int,
  int,
) calculator = add;


// ============================================================================
// The type means:
//
// int Function(int, int)
//
// "A function that receives two integers and returns an integer."
//
// ============================================================================


// ============================================================================
// 03. FUNCTION AS PARAMETER
// ============================================================================

int calculate(
  int a,
  int b,
  int Function(
    int,
    int,
  ) operation,
) {
  return operation(
    a,
    b,
  );
}


// ============================================================================
// Example:
// ============================================================================

int multiply(
  int a,
  int b,
) {
  return a * b;
}


// ============================================================================

void functionParameterExample() {
  final result = calculate(
    5,
    10,
    multiply,
  );

  print(result);
}


// ============================================================================
// 04. ANONYMOUS FUNCTION
// ============================================================================
//
// A function without a name is called an anonymous function.
//
// ============================================================================

void anonymousFunctionExample() {
  final result = calculate(
    10,
    5,
    (
      a,
      b,
    ) {
      return a - b;
    },
  );

  print(result);
}


// ============================================================================
// 05. ARROW FUNCTION
// ============================================================================
//
// If a function contains only one expression:
//
// ============================================================================

int square(
  int value,
) =>
    value * value;


// ============================================================================
// Equivalent:
//
// int square(int value) {
//   return value * value;
// }
//
// ============================================================================
// 06. ARROW FUNCTION AS CALLBACK
// ============================================================================

void arrowCallbackExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final squares = numbers.map(
    (number) => number * number,
  );

  print(
    squares.toList(),
  );
}


// ============================================================================
// 07. HIGHER-ORDER FUNCTION
// ============================================================================
//
// A higher-order function:
//
//   • accepts a function
//   OR
//   • returns a function
//   OR
//   • does both.
//
// ============================================================================

List<int> transformNumbers(
  List<int> numbers,
  int Function(
    int,
  ) transformer,
) {
  return numbers
      .map(
        transformer,
      )
      .toList();
}


// ============================================================================

void higherOrderExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final result =
      transformNumbers(
    numbers,
    square,
  );

  print(result);
}


// ============================================================================
// 08. FUNCTION RETURNING FUNCTION
// ============================================================================

int Function(
  int,
) multiplier(
  int factor,
) {
  return (
    int value,
  ) {
    return value * factor;
  };
}


// ============================================================================

void returningFunctionExample() {
  final doubleValue =
      multiplier(2);

  final tripleValue =
      multiplier(3);

  print(
    doubleValue(10),
  );

  print(
    tripleValue(10),
  );
}


// ============================================================================
// 09. CLOSURES
// ============================================================================
//
// A closure is a function that remembers variables from its surrounding
// lexical scope even after the outer function has finished.
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

void closureExample() {
  final counter =
      createCounter();

  print(
    counter(),
  );

  print(
    counter(),
  );

  print(
    counter(),
  );
}


// ============================================================================
// Output:
//
// 1
// 2
// 3
//
// The returned function remembers `count`.
//
// ============================================================================
// 10. CLOSURE WITH TYPED RETURN
// ============================================================================

int Function() createTypedCounter() {
  int count = 0;

  return () {
    count++;

    return count;
  };
}


// ============================================================================
// 11. LEXICAL SCOPE
// ============================================================================
//
// A function can access variables from the scope where it was created.
//
// ============================================================================

void lexicalScopeExample() {
  final taxRate = 0.15;

  double calculatePrice(
    double price,
  ) {
    return price +
        price * taxRate;
  }

  print(
    calculatePrice(100),
  );
}


// ============================================================================
// 12. CLOSURE PRACTICAL USE
// ============================================================================
//
// Useful for:
//
//   • Creating configured functions
//   • Callbacks
//   • Event handlers
//   • Memoization
//   • State encapsulation
//   • Utility generators
//
// ============================================================================
// 13. FLUTTER CALLBACK EXAMPLE
// ============================================================================
//
// Flutter frequently uses:
//
//   onPressed
//   onChanged
//   onTap
//   onSubmitted
//
// Conceptually:
//
// ============================================================================

void executeCallback(
  void Function() callback,
) {
  callback();
}


// ============================================================================

void callbackExample() {
  executeCallback(
    () {
      print(
        "Button clicked",
      );
    },
  );
}


// ============================================================================
// 14. FUNCTION RETURNING VOID
// ============================================================================
//
// `void Function()` means:
//
// "A function that takes no arguments and returns nothing."
//
// ============================================================================
// 15. FUNCTION TYPE WITH MULTIPLE PARAMETERS
// ============================================================================

typedef Operation = int Function(
  int a,
  int b,
);


// ============================================================================

int subtract(
  int a,
  int b,
) {
  return a - b;
}


// ============================================================================

void typedefExample() {
  Operation operation =
      subtract;

  print(
    operation(
      20,
      5,
    ),
  );
}


// ============================================================================
// 16. WHY TYPEDEF?
// ============================================================================
//
// Without typedef:
//
// int Function(int, int)
//
// can become difficult to read.
//
// With typedef:
//
// Operation
//
// is clearer.
//
// ============================================================================
// 17. TYPEDEF FOR CALLBACK
// ============================================================================

typedef OnProductSelected =
    void Function(
  ProductModel product,
);


// ============================================================================

void selectProduct(
  ProductModel product,
  OnProductSelected onSelected,
) {
  onSelected(
    product,
  );
}


// ============================================================================
// 18. GENERIC FUNCTION TYPE
// ============================================================================

typedef Transformer<T> =
    T Function(T value);


// ============================================================================

T transform<T>(
  T value,
  Transformer<T> transformer,
) {
  return transformer(
    value,
  );
}


// ============================================================================

void genericFunctionExample() {
  final number =
      transform<int>(
    10,
    (value) => value * 2,
  );

  final text =
      transform<String>(
    "hello",
    (value) => value.toUpperCase(),
  );

  print(number);
  print(text);
}


// ============================================================================
// 19. FUNCTION TEAR-OFF
// ============================================================================
//
// Passing a named function without calling it:
//
// add
//
// is a tear-off.
//
//
//
// Calling:
//
// add(1, 2)
//
// executes it.
//
//
//
// Passing:
//
// add
//
// gives another reference to the function.
//
// ============================================================================

void tearOffExample() {
  final operation = add;

  print(
    operation(
      2,
      3,
    ),
  );
}


// ============================================================================
// 20. METHOD TEAR-OFF
// ============================================================================

class Calculator {
  int add(
    int a,
    int b,
  ) {
    return a + b;
  }
}


// ============================================================================

void methodTearOffExample() {
  final calculator =
      Calculator();

  final operation =
      calculator.add;

  print(
    operation(
      5,
      10,
    ),
  );
}


// ============================================================================
// 21. CONSTRUCTOR TEAR-OFF
// ============================================================================
//
// A constructor can also be referenced as a function.
//
// ============================================================================

class User {
  final String name;

  const User(
    this.name,
  );
}


// ============================================================================

void constructorTearOffExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final users =
      names.map(
    User.new,
  );

  print(
    users.toList(),
  );
}


// ============================================================================
// 22. MAP()
// ============================================================================
//
// map transforms every element.
//
// Input:
//
// [1, 2, 3]
//
// Output:
//
// [2, 4, 6]
//
// ============================================================================

void mapExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled =
      numbers.map(
    (number) => number * 2,
  );

  print(
    doubled.toList(),
  );
}


// ============================================================================
// IMPORTANT:
//
// map() returns an Iterable.
//
// It does NOT necessarily create a List immediately.
//
// Use:
//
// .toList()
//
// when you specifically need a List.
//
// ============================================================================
// 23. MAP WITH OBJECTS
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
      price: 80000,
    ),
  ];

  final names = products.map(
    (product) => product.name,
  );

  print(
    names.toList(),
  );
}


// ============================================================================
// 24. WHERE()
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

  final evenNumbers =
      numbers.where(
    (number) =>
        number.isEven,
  );

  print(
    evenNumbers.toList(),
  );
}


// ============================================================================
// 25. WHERE WITH OBJECTS
// ============================================================================

void expensiveProducts() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 80000,
    ),
    const ProductModel(
      id: "3",
      name: "Mouse",
      price: 1500,
    ),
  ];

  final expensive =
      products.where(
    (product) =>
        product.price > 30000,
  );

  print(
    expensive.toList(),
  );
}


// ============================================================================
// 26. MAP + WHERE CHAIN
// ============================================================================

void mapWhereExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 80000,
    ),
    const ProductModel(
      id: "3",
      name: "Mouse",
      price: 1500,
    ),
  ];

  final names =
      products
          .where(
            (product) =>
                product.price > 30000,
          )
          .map(
            (product) =>
                product.name,
          )
          .toList();

  print(names);
}


// ============================================================================
// 27. FIRSTWHERE()
// ============================================================================
//
// Returns the first matching element.
//
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
    (number) =>
        number.isEven,
  );

  print(result);
}


// ============================================================================
// IMPORTANT:
//
// firstWhere() throws StateError if no element matches unless you provide
// orElse.
//
// ============================================================================

void firstWhereSafeExample() {
  final numbers = [
    1,
    3,
    5,
  ];

  final result =
      numbers.firstWhere(
    (number) =>
        number.isEven,
    orElse: () => -1,
  );

  print(result);
}


// ============================================================================
// 28. SINGLEWHERE()
// ============================================================================
//
// Expects exactly ONE matching element.
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
// IMPORTANT:
//
// singleWhere() throws if:
//
//   • zero elements match
//   • more than one element matches
//
// Use it only when uniqueness is guaranteed.
//
// ============================================================================
// 29. ANY()
// ============================================================================
//
// Returns true if at least one element matches.
//
// ============================================================================

void anyExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Mouse",
      price: 1500,
    ),
  ];

  final hasExpensiveProduct =
      products.any(
    (product) =>
        product.price > 40000,
  );

  print(
    hasExpensiveProduct,
  );
}


// ============================================================================
// 30. EVERY()
// ============================================================================
//
// Returns true if every element matches.
//
// ============================================================================

void everyExample() {
  final numbers = [
    2,
    4,
    6,
    8,
  ];

  final allEven =
      numbers.every(
    (number) =>
        number.isEven,
  );

  print(allEven);
}


// ============================================================================
// 31. ANY VS EVERY
// ============================================================================
//
// any:
//
// "Does at least one match?"
//
// every:
//
// "Do all match?"
//
// ============================================================================
// 32. CONTAINS()
// ============================================================================

void containsExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  print(
    numbers.contains(20),
  );
}


// ============================================================================
// 33. INDEXWHERE()
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
    (number) =>
        number > 25,
  );

  print(index);
}


// ============================================================================
// 34. LASTWHERE()
// ============================================================================

void lastWhereExample() {
  final numbers = [
    10,
    20,
    30,
    40,
    20,
  ];

  final result =
      numbers.lastWhere(
    (number) =>
        number == 20,
  );

  print(result);
}


// ============================================================================
// 35. TAKE()
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
    numbers
        .take(3)
        .toList(),
  );
}


// ============================================================================
// 36. SKIP()
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
    numbers
        .skip(2)
        .toList(),
  );
}


// ============================================================================
// 37. TAKE + SKIP FOR PAGINATION
// ============================================================================
//
// Example:
//
// page = 2
// pageSize = 10
//
// skip:
//
// (page - 1) * pageSize
//
// take:
//
// pageSize
//
// ============================================================================

List<T> paginate<T>(
  List<T> items,
  int page,
  int pageSize,
) {
  return items
      .skip(
        (page - 1) *
            pageSize,
      )
      .take(
        pageSize,
      )
      .toList();
}


// ============================================================================
// 38. EXPAND()
// ============================================================================
//
// expand() transforms each element into multiple elements and flattens them.
//
// ============================================================================

void expandExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final result =
      numbers.expand(
    (number) => [
      number,
      number * 10,
    ],
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// Input:
//
// 1
// 2
// 3
//
// Each becomes:
//
// 1, 10
// 2, 20
// 3, 30
//
// Final:
//
// [1, 10, 2, 20, 3, 30]
//
// ============================================================================
// 39. NESTED COLLECTION FLATTENING
// ============================================================================

void flattenExample() {
  final nested = [
    [
      1,
      2,
    ],
    [
      3,
      4,
    ],
  ];

  final flattened =
      nested.expand(
    (list) => list,
  );

  print(
    flattened.toList(),
  );
}


// ============================================================================
// 40. REDUCE()
// ============================================================================
//
// reduce combines elements into one result.
//
// ============================================================================

void reduceExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final sum =
      numbers.reduce(
    (a, b) => a + b,
  );

  print(sum);
}


// ============================================================================
// IMPORTANT:
//
// reduce() requires a non-empty collection.
//
// ============================================================================
// 41. REDUCE PRODUCT
// ============================================================================

void reduceProductExample() {
  final numbers = [
    2,
    3,
    4,
  ];

  final result =
      numbers.reduce(
    (a, b) => a * b,
  );

  print(result);
}


// ============================================================================
// 42. FOLD()
// ============================================================================
//
// fold is similar to reduce,
// but it starts with an initial value.
//
// ============================================================================

void foldExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final sum =
      numbers.fold<int>(
    0,
    (
      total,
      number,
    ) =>
        total + number,
  );

  print(sum);
}


// ============================================================================
// 43. REDUCE VS FOLD
// ============================================================================
//
// reduce:
//
//   • No explicit initial value
//   • Requires non-empty iterable
//
// fold:
//
//   • Has initial value
//   • Can work with empty iterable
//   • Can change result type
//
// ============================================================================
// 44. FOLD TO STRING
// ============================================================================

void foldStringExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final result =
      names.fold<String>(
    "",
    (
      previous,
      name,
    ) {
      if (previous.isEmpty) {
        return name;
      }

      return "$previous, $name";
    },
  );

  print(result);
}


// ============================================================================
// 45. FOLD TO MAP
// ============================================================================

void foldMapExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 80000,
    ),
  ];

  final map =
      products.fold<
          Map<String, ProductModel>>(
    {},
    (
      result,
      product,
    ) {
      result[product.id] =
          product;

      return result;
    },
  );

  print(map);
}


// ============================================================================
// 46. FOREACH()
// ============================================================================
//
// forEach executes a function for every element.
//
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
// IMPORTANT:
//
// forEach is useful for side effects.
//
// For transformations, prefer map.
//
// BAD:
//
// final result = <int>[];
// numbers.forEach((number) {
//   result.add(number * 2);
// });
//
// BETTER:
//
// final result = numbers
//     .map((number) => number * 2)
//     .toList();
//
// ============================================================================
// 47. ITERABLE
// ============================================================================
//
// Iterable is one of the most important collection abstractions in Dart.
//
// List:
//
// [1, 2, 3]
//
// is an Iterable.
//
// Set:
//
// {1, 2, 3}
//
// is an Iterable.
//
// Many collection methods work on Iterable.
//
// ============================================================================
// 48. ITERABLE CHAINING
// ============================================================================

void iterableChainingExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
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
          .take(2)
          .toList();

  print(result);
}


// ============================================================================
// 49. LAZY ITERABLE
// ============================================================================
//
// Many Iterable operations are lazy.
//
// Example:
//
// ============================================================================

void lazyIterableExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final result =
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
    result.toList(),
  );
}


// ============================================================================
// The transformation doesn't necessarily happen when map() is called.
//
// Iteration triggers evaluation.
//
// ============================================================================
// 50. WHY LAZY EVALUATION MATTERS
// ============================================================================
//
// Consider:
//
// numbers
//   .where(...)
//   .map(...)
//   .take(10)
//
// The system may avoid processing unnecessary elements.
//
// This can improve efficiency.
//
// ============================================================================
// 51. EAGER CONVERSION
// ============================================================================
//
// Calling:
//
// .toList()
//
// materializes the results into a List.
//
// ============================================================================
// 52. TOSET()
//
// Converts Iterable to Set.
//
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
// 53. TOLIST()
// ============================================================================

void toListExample() {
  final numbers =
      <int>{
    1,
    2,
    3,
  };

  final list =
      numbers.toList();

  print(list);
}


// ============================================================================
// 54. MAP TRANSFORMATION
// ============================================================================
//
// Map has different transformation patterns than List.
//
// ============================================================================

void mapCollectionExample() {
  final prices = {
    "phone": 50000,
    "laptop": 80000,
    "mouse": 1500,
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
// 55. FILTER MAP ENTRIES
// ============================================================================

void mapFilterExample() {
  final prices = {
    "phone": 50000,
    "laptop": 80000,
    "mouse": 1500,
  };

  final expensive =
      Map.fromEntries(
    prices.entries.where(
      (entry) =>
          entry.value > 30000,
    ),
  );

  print(expensive);
}


// ============================================================================
// 56. SORTING
// ============================================================================
//
// List.sort() modifies the original list.
//
// ============================================================================

void sortingExample() {
  final numbers = [
    5,
    1,
    4,
    2,
    3,
  ];

  numbers.sort();

  print(numbers);
}


// ============================================================================
// 57. DESCENDING SORT
// ============================================================================

void descendingSortExample() {
  final numbers = [
    5,
    1,
    4,
    2,
    3,
  ];

  numbers.sort(
    (a, b) =>
        b.compareTo(a),
  );

  print(numbers);
}


// ============================================================================
// 58. SORT OBJECTS
// ============================================================================

void sortProductsByPrice() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 80000,
    ),
    const ProductModel(
      id: "3",
      name: "Mouse",
      price: 1500,
    ),
  ];

  products.sort(
    (a, b) =>
        a.price.compareTo(
      b.price,
    ),
  );

  print(products);
}


// ============================================================================
// 59. SORT WITHOUT MUTATING ORIGINAL
// ============================================================================
//
// If you don't want to modify the original list:
//
// ============================================================================

void immutableSortExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 80000,
    ),
  ];

  final sorted =
      [...products]
        ..sort(
          (a, b) =>
              a.price.compareTo(
            b.price,
          ),
        );

  print(sorted);
}


// ============================================================================
// 60. GROUPING
// ============================================================================
//
// Dart core library doesn't provide a universal groupBy method in the same
// style as some other languages/packages.
//
// You can implement it using fold.
//
// ============================================================================

Map<String, List<ProductModel>>
    groupProductsByCategory(
  List<ProductModel> products,
  String Function(ProductModel)
      keySelector,
) {
  return products.fold(
    {},
    (
      groups,
      product,
    ) {
      final key =
          keySelector(product);

      groups
          .putIfAbsent(
            key,
            () => [],
          )
          .add(product);

      return groups;
    },
  );
}


// ============================================================================
// 61. GROUPING EXAMPLE
// ============================================================================
//
// Imagine ProductModel has category:
//
// Phone
// Laptop
// Phone
//
// Result:
//
// {
//   Phone: [...],
//   Laptop: [...]
// }
//
// ============================================================================
// 62. PARTITIONING
// ============================================================================
//
// Sometimes you want:
//
// matching items
// +
// non-matching items
//
// ============================================================================

class Partition<T> {
  final List<T> matching;
  final List<T> nonMatching;

  const Partition({
    required this.matching,
    required this.nonMatching,
  });
}


// ============================================================================

Partition<T> partition<T>(
  Iterable<T> items,
  bool Function(T) predicate,
) {
  final matching =
      <T>[];

  final nonMatching =
      <T>[];

  for (final item in items) {
    if (predicate(item)) {
      matching.add(item);
    } else {
      nonMatching.add(item);
    }
  }

  return Partition(
    matching: matching,
    nonMatching: nonMatching,
  );
}


// ============================================================================
// 63. SEARCH UTILITY
// ============================================================================

T? find<T>(
  Iterable<T> items,
  bool Function(T) predicate,
) {
  for (final item in items) {
    if (predicate(item)) {
      return item;
    }
  }

  return null;
}


// ============================================================================
// 64. SAFE FIND
// ============================================================================
//
// Unlike firstWhere(), this utility returns null when nothing is found.
//
// ============================================================================
// 65. MAP + NULL SAFETY
// ============================================================================

ProductModel? findProductById(
  List<ProductModel> products,
  String id,
) {
  return find(
    products,
    (product) =>
        product.id == id,
  );
}


// ============================================================================
// 66. DISTINCT VALUES
// ============================================================================

List<T> distinct<T>(
  Iterable<T> items,
) {
  return items.toSet().toList();
}


// ============================================================================
// IMPORTANT:
//
// For custom objects, Set uniqueness depends on == and hashCode.
//
// ============================================================================
// 67. CUSTOM EQUALITY
// ============================================================================
//
// If ProductModel doesn't override:
//
//   ==
//   hashCode
//
// then two separate instances containing identical data may still be
// considered different objects.
//
// This is important when using Set for deduplication.
//
// ============================================================================
// 68. CUSTOM UNIQUE BY ID
// ============================================================================

List<ProductModel>
    uniqueProductsById(
  Iterable<ProductModel>
      products,
) {
  final seen =
      <String>{};

  return products.where(
    (product) {
      return seen.add(
        product.id,
      );
    },
  ).toList();
}


// ============================================================================
// 69. FIRST N EXPENSIVE PRODUCTS
// ============================================================================

List<ProductModel>
    firstExpensiveProducts(
  List<ProductModel> products,
  double minimumPrice,
  int count,
) {
  return products
      .where(
        (product) =>
            product.price >=
            minimumPrice,
      )
      .take(count)
      .toList();
}


// ============================================================================
// 70. TOTAL PRODUCT VALUE
// ============================================================================

double totalInventoryValue(
  Iterable<ProductModel>
      products,
) {
  return products.fold(
    0,
    (
      total,
      product,
    ) =>
        total + product.price,
  );
}


// ============================================================================
// 71. AVERAGE
// ============================================================================

double average(
  Iterable<num> values,
) {
  if (values.isEmpty) {
    return 0;
  }

  final total =
      values.fold<num>(
    0,
    (
      sum,
      value,
    ) =>
        sum + value,
  );

  return total / values.length;
}


// ============================================================================
// 72. MINIMUM
// ============================================================================

T minBy<T, V extends Comparable<V>>(
  Iterable<T> items,
  V Function(T) selector,
) {
  final iterator =
      items.iterator;

  if (!iterator.moveNext()) {
    throw StateError(
      "Collection is empty",
    );
  }

  var result =
      iterator.current;

  while (
      iterator.moveNext()) {
    final current =
        iterator.current;

    if (selector(current)
            .compareTo(
          selector(result),
        ) <
        0) {
      result = current;
    }
  }

  return result;
}


// ============================================================================
// 73. MAXIMUM
// ============================================================================

T maxBy<T, V extends Comparable<V>>(
  Iterable<T> items,
  V Function(T) selector,
) {
  final iterator =
      items.iterator;

  if (!iterator.moveNext()) {
    throw StateError(
      "Collection is empty",
    );
  }

  var result =
      iterator.current;

  while (
      iterator.moveNext()) {
    final current =
        iterator.current;

    if (selector(current)
            .compareTo(
          selector(result),
        ) >
        0) {
      result = current;
    }
  }

  return result;
}


// ============================================================================
// 74. MIN/MAX PRODUCT
// ============================================================================

void minMaxProductExample(
  List<ProductModel> products,
) {
  final cheapest =
      minBy(
    products,
    (product) =>
        product.price,
  );

  final mostExpensive =
      maxBy(
    products,
    (product) =>
        product.price,
  );

  print(cheapest);
  print(mostExpensive);
}


// ============================================================================
// 75. SYNC*
// ============================================================================
//
// sync* creates a synchronous generator.
//
// It returns an Iterable.
//
// ============================================================================

Iterable<int>
    generateNumbers() sync* {
  yield 1;
  yield 2;
  yield 3;
}


// ============================================================================
// 76. YIELD
// ============================================================================
//
// yield emits one value from a generator.
//
// ============================================================================

void yieldExample() {
  final numbers =
      generateNumbers();

  print(
    numbers.toList(),
  );
}


// ============================================================================
// 77. GENERATOR WITH LOOP
// ============================================================================

Iterable<int>
    countTo(
  int maximum,
) sync* {
  for (
    int i = 1;
    i <= maximum;
    i++
  ) {
    yield i;
  }
}


// ============================================================================
// 78. LAZY GENERATOR
// ============================================================================

Iterable<int>
    lazyNumbers(
  int maximum,
) sync* {
  for (
    int i = 1;
    i <= maximum;
    i++
  ) {
    print(
      "Generating $i",
    );

    yield i;
  }
}


// ============================================================================
// 79. YIELD*
//
// yield* delegates to another iterable.
//
// ============================================================================

Iterable<int>
    combinedNumbers() sync* {
  yield 1;
  yield 2;

  yield* [
    3,
    4,
    5,
  ];
}


// ============================================================================
// 80. GENERATOR FOR PAGINATION
// ============================================================================

Iterable<List<T>>
    chunks<T>(
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
// 81. CHUNK EXAMPLE
// ============================================================================

void chunksExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  final result =
      chunks(
    numbers,
    3,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// Result:
//
// [1, 2, 3]
// [4, 5, 6]
// [7]
//
// This is useful for:
//
//   • Batch API requests
//   • Bulk processing
//   • Upload batches
//   • Large datasets
//
// ============================================================================
// 82. ASYNC*
// ============================================================================
//
// async* creates an asynchronous generator.
//
// It returns Stream.
//
// ============================================================================

Stream<int>
    generateAsyncNumbers() async* {
  yield 1;

  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  yield 2;

  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  yield 3;
}


// ============================================================================
// 83. ASYNC YIELD
// ============================================================================

Future<void>
    asyncGeneratorExample() async {
  await for (
    final number
    in generateAsyncNumbers()
  ) {
    print(number);
  }
}


// ============================================================================
// 84. YIELD* WITH STREAM
// ============================================================================

Stream<int>
    combinedAsyncNumbers() async* {
  yield 1;

  yield* Stream.fromIterable(
    [
      2,
      3,
      4,
    ],
  );
}


// ============================================================================
// 85. GENERATORS IN FLUTTER
// ============================================================================
//
// Possible uses:
//
//   • Paginated data
//   • Infinite sequences
//   • Batch processing
//   • Lazy processing
//   • Stream-based API data
//
// ============================================================================
// 86. FUNCTION COMPOSITION
// ============================================================================
//
// Composition means combining functions.
//
// Example:
//
// input
//   ↓
// trim
//   ↓
// lowercase
//   ↓
// validate
//
// ============================================================================

String trimText(
  String value,
) {
  return value.trim();
}


// ============================================================================

String lowerText(
  String value,
) {
  return value.toLowerCase();
}


// ============================================================================

String normalizeText(
  String value,
) {
  return lowerText(
    trimText(value),
  );
}


// ============================================================================
// 87. GENERIC COMPOSE
// ============================================================================

T compose<A, T>(
  T Function(A) first,
  T Function(T) second,
  A input,
) {
  return second(
    first(input),
  );
}


// ============================================================================
// 88. PRACTICAL PIPELINE
// ============================================================================

String normalizeName(
  String name,
) {
  return compose(
    trimText,
    lowerText,
    name,
  );
}


// ============================================================================
// 89. PIPELINE CONCEPT
// ============================================================================
//
// Data:
//
// "  PALASH  "
//
// ↓
//
// trim
//
// "PALASH"
//
// ↓
//
// lowercase
//
// "palash"
//
// ============================================================================
// 90. FUNCTION COMPOSITION IN COLLECTIONS
// ============================================================================

void compositionWithCollections() {
  final names = [
    " Palash ",
    " RAHIM",
    " karim ",
  ];

  final normalized =
      names
          .map(trimText)
          .map(lowerText)
          .toList();

  print(normalized);
}


// ============================================================================
// 91. PREDICATE
// ============================================================================
//
// A predicate is a function that returns bool.
//
// ============================================================================

typedef Predicate<T> =
    bool Function(T value);


// ============================================================================

bool isAdult(
  int age,
) {
  return age >= 18;
}


// ============================================================================

void predicateExample() {
  final ages = [
    12,
    18,
    25,
    10,
  ];

  final adults =
      ages.where(
    isAdult,
  );

  print(
    adults.toList(),
  );
}


// ============================================================================
// 92. REUSABLE PREDICATES
// ============================================================================

Predicate<ProductModel>
    priceGreaterThan(
  double price,
) {
  return (
    product,
  ) =>
      product.price >
      price;
}


// ============================================================================

void reusablePredicateExample(
  List<ProductModel>
      products,
) {
  final expensive =
      products.where(
    priceGreaterThan(
      50000,
    ),
  );

  print(
    expensive.toList(),
  );
}


// ============================================================================
// 93. TRANSFORMER
// ============================================================================

typedef TransformerFunction<T, R> =
    R Function(T value);


// ============================================================================

List<R> transformList<T, R>(
  Iterable<T> items,
  TransformerFunction<T, R>
      transformer,
) {
  return items
      .map(
        transformer,
      )
      .toList();
}


// ============================================================================
// 94. TRANSFORM LIST EXAMPLE
// ============================================================================

void transformListExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final lengths =
      transformList(
    names,
    (name) => name.length,
  );

  print(lengths);
}


// ============================================================================
// 95. FILTER UTILITY
// ============================================================================

List<T> filter<T>(
  Iterable<T> items,
  Predicate<T> predicate,
) {
  return items
      .where(
        predicate,
      )
      .toList();
}


// ============================================================================
// 96. REDUCE UTILITY
// ============================================================================

R reduceTo<T, R>(
  Iterable<T> items,
  R initial,
  R Function(
    R result,
    T item,
  ) reducer,
) {
  return items.fold(
    initial,
    reducer,
  );
}


// ============================================================================
// 97. REUSABLE COLLECTION PIPELINE
// ============================================================================

List<String> getExpensiveProductNames(
  List<ProductModel>
      products,
) {
  return products
      .where(
        priceGreaterThan(
          30000,
        ),
      )
      .map(
        (product) =>
            product.name,
      )
      .toList();
}


// ============================================================================
// 98. NULLABLE SEARCH
// ============================================================================

T? firstOrNull<T>(
  Iterable<T> items,
) {
  for (final item in items) {
    return item;
  }

  return null;
}


// ============================================================================
// 99. SAFE FIRST MATCH
// ============================================================================

T? firstWhereOrNull<T>(
  Iterable<T> items,
  Predicate<T> predicate,
) {
  for (final item in items) {
    if (predicate(item)) {
      return item;
    }
  }

  return null;
}


// ============================================================================
// 100. NULLABLE LAST MATCH
// ============================================================================

T? lastWhereOrNull<T>(
  Iterable<T> items,
  Predicate<T> predicate,
) {
  T? result;

  for (final item in items) {
    if (predicate(item)) {
      result = item;
    }
  }

  return result;
}


// ============================================================================
// 101. MAP VALUES
// ============================================================================

Iterable<V> mapValues<K, V>(
  Map<K, V> map,
) {
  return map.values;
}


// ============================================================================
// 102. MAP KEYS
// ============================================================================

Iterable<K> mapKeys<K, V>(
  Map<K, V> map,
) {
  return map.keys;
}


// ============================================================================
// 103. MAP ENTRIES
// ============================================================================

Iterable<MapEntry<K, V>>
    mapEntries<K, V>(
  Map<K, V> map,
) {
  return map.entries;
}


// ============================================================================
// 104. MAP TO LIST
// ============================================================================

List<String> productMapToNames(
  Map<String, ProductModel>
      products,
) {
  return products.values
      .map(
        (product) =>
            product.name,
      )
      .toList();
}


// ============================================================================
// 105. FLUTTER SEARCH EXAMPLE
// ============================================================================

List<ProductModel>
    searchProducts(
  List<ProductModel>
      products,
  String query,
) {
  final normalized =
      query
          .trim()
          .toLowerCase();

  if (normalized.isEmpty) {
    return products;
  }

  return products.where(
    (product) {
      return product.name
          .toLowerCase()
          .contains(
            normalized,
          );
    },
  ).toList();
}


// ============================================================================
// 106. MULTI-FILTER SEARCH
// ============================================================================

List<ProductModel>
    filterProducts({
  required List<ProductModel>
      products,
  String? query,
  double? minimumPrice,
  double? maximumPrice,
}) {
  final normalizedQuery =
      query
          ?.trim()
          .toLowerCase();

  return products.where(
    (product) {
      final matchesQuery =
          normalizedQuery ==
                  null ||
              normalizedQuery.isEmpty ||
              product.name
                  .toLowerCase()
                  .contains(
                    normalizedQuery,
                  );

      final matchesMin =
          minimumPrice ==
                  null ||
              product.price >=
                  minimumPrice;

      final matchesMax =
          maximumPrice ==
                  null ||
              product.price <=
                  maximumPrice;

      return matchesQuery &&
          matchesMin &&
          matchesMax;
    },
  ).toList();
}


// ============================================================================
// 107. SORT + FILTER + MAP
// ============================================================================

List<String>
    getTopAffordableProducts(
  List<ProductModel>
      products,
) {
  return [
    ...products,
  ]
      .where(
        (product) =>
            product.price <=
            50000,
      )
      .toList()
    ..sort(
      (a, b) =>
          a.price.compareTo(
        b.price,
      ),
    );
}


// ============================================================================
// 108. IMPORTANT:
//
// `sort()` mutates the list.
//
// Here we copied:
//
// [...products]
//
// first.
//
// ============================================================================
// 109. COLLECTION PIPELINE
// ============================================================================
//
// A common Flutter data pipeline:
//
// API data
//   ↓
// filter
//   ↓
// sort
//   ↓
// map
//   ↓
// toList
//
// ============================================================================
// 110. EXAMPLE
// ============================================================================

List<String>
    getProductDisplayNames(
  List<ProductModel>
      products,
) {
  return products
      .where(
        (product) =>
            product.price > 0,
      )
      .map(
        (product) =>
            "${product.name} - ৳${product.price}",
      )
      .toList();
}


// ============================================================================
// 111. GROUP ORDERS BY STATUS
// ============================================================================

Map<String, List<Order>>
    groupOrdersByStatus(
  List<Order> orders,
) {
  return orders.fold(
    {},
    (
      groups,
      order,
    ) {
      groups
          .putIfAbsent(
            order.status,
            () => [],
          )
          .add(order);

      return groups;
    },
  );
}


// ============================================================================
// 112. COUNT BY STATUS
// ============================================================================

Map<String, int>
    countOrdersByStatus(
  Iterable<Order> orders,
) {
  return orders.fold(
    {},
    (
      counts,
      order,
    ) {
      counts[order.status] =
          (counts[order.status] ??
                  0) +
              1;

      return counts;
    },
  );
}


// ============================================================================
// 113. TOTAL SALES
// ============================================================================

double totalOrderValue(
  Iterable<Order> orders,
) {
  return orders.fold(
    0,
    (
      total,
      order,
    ) =>
        total + order.total,
  );
}


// ============================================================================
// 114. HIGHEST VALUE ORDER
// ============================================================================

Order highestValueOrder(
  List<Order> orders,
) {
  return maxBy(
    orders,
    (order) =>
        order.total,
  );
}


// ============================================================================
// 115. ERP DASHBOARD DATA
// ============================================================================
//
// Functional collection operations are excellent for dashboard calculations:
//
//   • Total sales
//   • Total orders
//   • Pending orders
//   • Completed orders
//   • Low-stock products
//   • Top products
//   • Average order value
//
// ============================================================================
// 116. TOP PRODUCTS
// ============================================================================

List<ProductModel>
    topProductsByPrice(
  List<ProductModel>
      products,
  int count,
) {
  final sorted =
      [...products]
        ..sort(
          (a, b) =>
              b.price.compareTo(
            a.price,
          ),
        );

  return sorted
      .take(count)
      .toList();
}


// ============================================================================
// 117. FUNCTION COMBINATORS
// ============================================================================
//
// You can create functions that combine predicates.
//
// ============================================================================

Predicate<T> and<T>(
  Predicate<T> first,
  Predicate<T> second,
) {
  return (value) =>
      first(value) &&
      second(value);
}


// ============================================================================

Predicate<T> or<T>(
  Predicate<T> first,
  Predicate<T> second,
) {
  return (value) =>
      first(value) ||
      second(value);
}


// ============================================================================
// 118. COMBINED PRODUCT FILTER
// ============================================================================

void combinedPredicateExample(
  List<ProductModel>
      products,
) {
  final expensive =
      priceGreaterThan(
    30000,
  );

  final phone =
      (
        product,
      ) =>
          product.name
              .toLowerCase()
              .contains(
                "phone",
              );

  final condition =
      and(
    expensive,
    phone,
  );

  final result =
      products.where(
    condition,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 119. NEGATE PREDICATE
// ============================================================================

Predicate<T> not<T>(
  Predicate<T> predicate,
) {
  return (value) =>
      !predicate(value);
}


// ============================================================================
// 120. FUNCTION COMPOSITION ADVANCED
// ============================================================================

T pipe<T>(
  T value,
  List<
          T Function(T)>
      functions,
) {
  var result = value;

  for (final function
      in functions) {
    result =
        function(result);
  }

  return result;
}


// ============================================================================
// 121. PIPE EXAMPLE
// ============================================================================

void pipeExample() {
  final result = pipe(
    "  PALASH  ",
    [
      trimText,
      lowerText,
    ],
  );

  print(result);
}


// ============================================================================
// 122. MEMOIZATION CONCEPT
// ============================================================================
//
// Memoization means caching the result of expensive computations.
//
// Example:
//
// same input
// ↓
// instead of calculating again
// ↓
// return cached result
//
// ============================================================================
// 123. SIMPLE MEMOIZED FUNCTION
// ============================================================================

int Function(int)
    memoizeInt(
  int Function(int)
      function,
) {
  final cache =
      <int, int>{};

  return (input) {
    final cached =
        cache[input];

    if (cached != null) {
      return cached;
    }

    final result =
        function(input);

    cache[input] =
        result;

    return result;
  };
}


// ============================================================================
// 124. MEMOIZATION WARNING
// ============================================================================
//
// Don't cache everything.
//
// Consider:
//
//   • Memory usage
//   • Cache invalidation
//   • Data freshness
//   • Input size
//
// In Flutter apps, caching belongs to a deliberate architecture.
//
// ============================================================================
// 125. SIDE EFFECTS
// ============================================================================
//
// A pure function:
//
//   • Same input → same output
//   • Doesn't modify external state
//   • Doesn't perform unexpected side effects
//
// Example:
//
// ============================================================================

int pureAdd(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================
// 126. IMPURE FUNCTION
// ============================================================================

int counter = 0;

int impureIncrement() {
  counter++;

  return counter;
}


// ============================================================================
// 127. PURE VS IMPURE
// ============================================================================
//
// Pure:
//
// calculateDiscount(price)
//
// Impure:
//
// calculateDiscountAndSaveToDatabase(price)
//
//
//
// Keeping transformation logic pure makes testing easier.
//
// ============================================================================
// 128. FUNCTIONAL STYLE DOES NOT MEAN "NO OOP"
// ============================================================================
//
// Dart supports both:
//
//   • Object-oriented programming
//   • Functional programming
//
// Professional Flutter code commonly combines both.
//
// Example:
//
// Model classes → OOP
//
// map/where/fold → functional collection processing
//
// ============================================================================
// 129. FUNCTIONAL PROGRAMMING IN FLUTTER
// ============================================================================
//
// You will frequently write:
//
// products
//   .where(...)
//   .map(...)
//   .toList()
//
// orders
//   .where(...)
//   .fold(...)
//
// users
//   .firstWhere(...)
//
// streams
//   .map(...)
//   .where(...)
//
// ============================================================================
// 130. API JSON PIPELINE
// ============================================================================
//
// Example conceptual flow:
//
// List<dynamic>
//      ↓
// map(json → Model)
//      ↓
// List<Model>
//      ↓
// where(condition)
//      ↓
// sort()
//      ↓
// UI
//
// ============================================================================
// 131. JSON TO MODEL
// ============================================================================

List<ProductModel>
    productsFromJson(
  List<Map<String, dynamic>>
      jsonList,
) {
  return jsonList
      .map(
        ProductModel.fromJson,
      )
      .toList();
}


// ============================================================================
// 132. API FILTERING
// ============================================================================

List<ProductModel>
    availableProducts(
  List<ProductModel>
      products,
) {
  return products.where(
    (product) =>
        product.price > 0,
  ).toList();
}


// ============================================================================
// 133. STREAM PIPELINE
// ============================================================================

Stream<String>
    productNameStream(
  Stream<ProductModel>
      stream,
) {
  return stream
      .where(
        (product) =>
            product.price > 0,
      )
      .map(
        (product) =>
            product.name,
      );
}


// ============================================================================
// 134. STREAM TRANSFORMATION
// ============================================================================
//
// Stream methods mirror many Iterable concepts:
//
//   • map
//   • where
//   • expand
//   • asyncMap
//
// ============================================================================
// 135. ASYNCMAP
// ============================================================================
//
// asyncMap allows asynchronous transformation.
//
// ============================================================================

Stream<String>
    loadProductNames(
  Stream<String>
      ids,
) {
  return ids.asyncMap(
    (id) async {
      await Future.delayed(
        const Duration(
          milliseconds: 50,
        ),
      );

      return "Product $id";
    },
  );
}


// ============================================================================
// 136. ASYNCMAP USE CASES
// ============================================================================
//
// Useful when each stream event requires an asynchronous operation.
//
// Example:
//
// Search IDs
//   ↓
// API request
//   ↓
// Product
//
// ============================================================================
// 137. ASYNC EXPANSION
// ============================================================================
//
// Advanced stream pipelines can combine:
//
//   asyncMap
//   where
//   map
//   expand
//
// This becomes useful for realtime and paginated data.
//
// ============================================================================
// 138. COLLECTION PERFORMANCE
// ============================================================================
//
// Avoid unnecessary conversions:
//
// BAD:
//
// .toList()
// .where(...)
// .toList()
// .map(...)
// .toList()
//
// when one final list is enough.
//
//
//
// Better:
//
// iterable
//   .where(...)
//   .map(...)
//   .toList()
//
// ============================================================================
// 139. DON'T OVERCHAIN
// ============================================================================
//
// A very long chain can become difficult to understand.
//
// If logic becomes complex:
//
// extract named functions.
//
// ============================================================================
// 140. READABILITY
// ============================================================================
//
// Instead of:
//
// products
//   .where(...complex...)
//   .map(...complex...)
//   .where(...complex...)
//   .toList();
//
// consider:
//
// final validProducts =
//     products.where(
//   isValidProduct,
// );
//
// final discountedProducts =
//     validProducts.map(
//   applyDiscount,
// );
//
// ============================================================================
// 141. REUSABLE FUNCTIONS
// ============================================================================

bool isValidProduct(
  ProductModel product,
) {
  return product.name
          .trim()
          .isNotEmpty &&
      product.price >= 0;
}


// ============================================================================

String productLabel(
  ProductModel product,
) {
  return "${product.name} - ${product.price}";
}


// ============================================================================
// 142. CLEAN PIPELINE
// ============================================================================

List<String> validProductLabels(
  List<ProductModel>
      products,
) {
  return products
      .where(
        isValidProduct,
      )
      .map(
        productLabel,
      )
      .toList();
}


// ============================================================================
// 143. CALLBACK DESIGN
// ============================================================================
//
// Good callback:
//
// typedef OnSaved =
//     Future<void> Function(Product product);
//
//
//
// This clearly describes what happens.
//
// ============================================================================

typedef OnProductSaved =
    Future<void> Function(
  ProductModel product,
);


// ============================================================================
// 144. ASYNC CALLBACK
// ============================================================================

Future<void> saveProductAndNotify(
  ProductModel product,
  OnProductSaved onSaved,
) async {
  await onSaved(
    product,
  );
}


// ============================================================================
// 145. FUNCTION PARAMETERS WITH NAMED CALLBACK
// ============================================================================

void processProduct({
  required ProductModel product,
  required void Function(
    ProductModel,
  ) onSuccess,
}) {
  onSuccess(
    product,
  );
}


// ============================================================================
// 146. NULLABLE CALLBACK
// ============================================================================

void processOptionalCallback({
  required ProductModel product,
  void Function(
    ProductModel,
  )? onComplete,
}) {
  onComplete?.call(
    product,
  );
}


// ============================================================================
// 147. CALLBACK CALL
// ============================================================================
//
// Instead of:
//
// if (callback != null) {
//   callback!(product);
// }
//
// use:
//
// callback?.call(product);
//
// ============================================================================
// 148. CALLABLE CLASS
// ============================================================================
//
// A class can behave like a function by implementing:
//
// call()
//
// ============================================================================

class PriceFormatter {
  const PriceFormatter();

  String call(
    double price,
  ) {
    return "৳${price.toStringAsFixed(2)}";
  }
}


// ============================================================================
// 149. CALLABLE CLASS USAGE
// ============================================================================

void callableClassExample() {
  final formatter =
      PriceFormatter();

  print(
    formatter(1500),
  );
}


// ============================================================================
// 150. WHY CALLABLE CLASSES?
// ============================================================================
//
// They are useful when:
//
//   • A function needs configuration/state
//   • You want dependency injection
//   • You want a readable function-like API
//
// ============================================================================
// 151. CONFIGURED FUNCTION OBJECT
// ============================================================================

class ProductFilter {
  final double
      minimumPrice;

  const ProductFilter(
    this.minimumPrice,
  );

  bool call(
    ProductModel product,
  ) {
    return product.price >=
        minimumPrice;
  }
}


// ============================================================================
// 152. PRODUCT FILTER USAGE
// ============================================================================

void productFilterObjectExample(
  List<ProductModel>
      products,
) {
  final filter =
      ProductFilter(
    50000,
  );

  final result =
      products.where(
    filter,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 153. FUNCTIONAL ERROR HANDLING
// ============================================================================
//
// Functional collection operations can also work with Result types.
//
// ============================================================================

List<T> successfulValues<T>(
  Iterable<Result<T>>
      results,
) {
  return results
      .whereType<Success<T>>()
      .map(
        (result) =>
            result.data,
      )
      .toList();
}


// ============================================================================
// 154. FAILED VALUES
// ============================================================================

List<AppException>
    failedErrors<T>(
  Iterable<Result<T>>
      results,
) {
  return results
      .whereType<Failure<T>>()
      .map(
        (result) =>
            result.exception,
      )
      .toList();
}


// ============================================================================
// 155. PRACTICAL ERP BATCH PROCESSING
// ============================================================================
//
// Suppose you have 100 products.
//
// You can:
//
//   1. Filter invalid products
//   2. Convert to DTO
//   3. Split into batches
//   4. Send batches to API
//
// ============================================================================

List<List<ProductModel>>
    prepareBatches(
  List<ProductModel>
      products,
) {
  final valid =
      products.where(
    isValidProduct,
  );

  return chunks(
    valid.toList(),
    20,
  ).toList();
}


// ============================================================================
// 156. BATCH SIZE
// ============================================================================
//
// Why batch?
//
// Sending 10,000 objects in one request can be expensive.
//
// Batching can help:
//
//   • Memory
//   • Network
//   • Server processing
//   • Error recovery
//
// ============================================================================
// 157. COLLECTION TRANSFORMATION SUMMARY
// ============================================================================
//
// map
//   → transform every item
//
// where
//   → filter items
//
// firstWhere
//   → first matching item
//
// singleWhere
//   → exactly one matching item
//
// any
//   → at least one?
//
// every
//   → all?
//
// take
//   → first N
//
// skip
//   → skip N
//
// expand
//   → flatten transformations
//
// reduce
//   → combine items
//
// fold
//   → combine with initial value
//
// forEach
//   → side effect
//
// ============================================================================
// 158. MOST IMPORTANT DIFFERENCE
// ============================================================================
//
// map:
//
// input → output
//
// where:
//
// input → keep/remove
//
// fold:
//
// many → one
//
// expand:
//
// one → many
//
// forEach:
//
// item → side effect
//
// ============================================================================
// 159. INTERVIEW QUESTIONS
// ============================================================================
//
// 1. What does it mean that functions are first-class objects?
//
// 2. What is a higher-order function?
//
// 3. What is a closure?
//
// 4. What is lexical scope?
//
// 5. What is a function tear-off?
//
// 6. What is the difference between calling a function and passing a
//    function reference?
//
// 7. What is typedef?
//
// 8. What is a callable class?
//
// 9. What does map() do?
//
// 10. What does where() do?
//
// 11. What is the difference between firstWhere() and singleWhere()?
//
// 12. What does any() do?
//
// 13. What does every() do?
//
// 14. What is the difference between reduce() and fold()?
//
// 15. Why does reduce() fail on an empty iterable?
//
// 16. What does expand() do?
//
// 17. What is lazy evaluation?
//
// 18. Why does map() return Iterable?
//
// 19. When should you call toList()?
//
// 20. What does sync* do?
//
// 21. What does async* do?
//
// 22. What is yield?
//
// 23. What is yield*?
//
// 24. What is the difference between Iterable and Stream?
//
// 25. What is a predicate?
//
// 26. What is function composition?
//
// 27. What is memoization?
//
// 28. What is a pure function?
//
// 29. What is an impure function?
//
// 30. Why are functional collection operations useful in Flutter?
//
// ============================================================================
// 160. PHASE 24 MASTER CHECKLIST
// ============================================================================
//
// FUNCTIONS
// [✓] First-class functions
// [✓] Function variables
// [✓] Function parameters
// [✓] Returning functions
// [✓] Higher-order functions
// [✓] Anonymous functions
// [✓] Arrow functions
// [✓] Closures
// [✓] Lexical scope
// [✓] Tear-offs
// [✓] Constructor tear-offs
// [✓] typedef
// [✓] Generic function types
// [✓] Callable classes
//
// COLLECTIONS
// [✓] Iterable
// [✓] map
// [✓] where
// [✓] firstWhere
// [✓] singleWhere
// [✓] any
// [✓] every
// [✓] take
// [✓] skip
// [✓] expand
// [✓] reduce
// [✓] fold
// [✓] forEach
// [✓] contains
// [✓] indexWhere
// [✓] lastWhere
// [✓] Iterable chaining
// [✓] Lazy evaluation
// [✓] List conversion
// [✓] Set conversion
// [✓] Map transformation
//
// ADVANCED
// [✓] Sorting
// [✓] Grouping
// [✓] Partitioning
// [✓] Distinct values
// [✓] Min/max
// [✓] Predicates
// [✓] Transformers
// [✓] Function composition
// [✓] Pipelines
// [✓] Memoization concept
// [✓] Pure functions
// [✓] Side effects
//
// GENERATORS
// [✓] sync*
// [✓] yield
// [✓] yield*
// [✓] async*
// [✓] Stream transformation
// [✓] asyncMap
//
// FLUTTER/ERP
// [✓] API transformation
// [✓] Product filtering
// [✓] Product searching
// [✓] Pagination
// [✓] Order grouping
// [✓] Dashboard calculations
// [✓] Batch processing
// [✓] Callback design
//
// ============================================================================
// 161. PHASE 24 GOLDEN RULES
// ============================================================================
//
// RULE 1:
// Functions are objects in Dart.
//
// RULE 2:
// A higher-order function accepts or returns functions.
//
// RULE 3:
// A closure remembers variables from its surrounding scope.
//
// RULE 4:
// A tear-off references a function without invoking it.
//
// RULE 5:
// Use typedef when complex function types need a meaningful name.
//
// RULE 6:
// map() transforms.
//
// RULE 7:
// where() filters.
//
// RULE 8:
// fold() combines.
//
// RULE 9:
// expand() converts one item into multiple items.
//
// RULE 10:
// forEach() is primarily for side effects.
//
// RULE 11:
// Don't use forEach when map() expresses a transformation more clearly.
//
// RULE 12:
// Remember that many Iterable operations are lazy.
//
// RULE 13:
// Use toList() when you actually need a concrete List.
//
// RULE 14:
// Be careful with List.sort() because it mutates the list.
//
// RULE 15:
// Use a copied list when you need non-mutating sorting.
//
// RULE 16:
// Use sync* for synchronous lazy generation.
//
// RULE 17:
// Use async* for asynchronous streams.
//
// RULE 18:
// Use predicates to create reusable filtering logic.
//
// RULE 19:
// Keep complicated collection pipelines readable.
//
// RULE 20:
// Functional programming and OOP are complementary in Dart.
//
// RULE 21:
// In Flutter, collection transformations are everywhere:
//
// API
//   ↓
// Model
//   ↓
// Filter
//   ↓
// Sort
//   ↓
// Map
//   ↓
// UI
//
// RULE 22:
// For your ERP, these concepts will be heavily used for:
//
//   Products
//   Orders
//   Customers
//   Vendors
//   Inventory
//   Warehouses
//   Branches
//   Reports
//   Analytics
//   Permissions
//   Notifications
//
// ============================================================================
// END OF PHASE 24
// ============================================================================
//
// NEXT:
//
// PHASE 25 — DART CONCURRENCY, ISOLATES & ADVANCED ASYNCHRONOUS PROGRAMMING
//
// Topics:
//
//   • Dart event loop
//   • Event queue
//   • Microtask queue
//   • Future scheduling
//   • async/await internals
//   • Future.wait
//   • Future.any
//   • Future timeout
//   • parallel vs sequential work
//   • isolate fundamentals
//   • Isolate.run
//   • compute-style workloads
//   • SendPort
//   • ReceivePort
//   • message passing
//   • isolate lifecycle
//   • CPU-heavy JSON processing
//   • large file processing
//   • background computation
//   • concurrency architecture
//   • Flutter performance
//   • avoiding UI jank
//
// ============================================================================