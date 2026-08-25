// ============================================================================
// DART MASTER ROADMAP
// PHASE 17 — ADVANCED FUNCTIONS, CALLBACKS & FUNCTIONAL DART
// ============================================================================
//
// GOAL:
// Learn how functions work deeply in Dart and how they are used in
// professional Flutter development.
//
// This phase is VERY important because Flutter uses functions everywhere:
//
//   • Button callbacks
//   • onTap
//   • onPressed
//   • onChanged
//   • Validators
//   • API callbacks
//   • State management
//   • List transformations
//   • Async operations
//   • Event handling
//   • Dependency injection
//
// ============================================================================
// TOPICS
// ============================================================================
//
// 01. Functions as first-class objects
// 02. Function variables
// 03. Function types
// 04. Anonymous functions
// 05. Arrow functions
// 06. Returning functions
// 07. Passing functions as arguments
// 08. Higher-order functions
// 09. Callbacks
// 10. typedef
// 11. Optional positional parameters
// 12. Optional named parameters
// 13. Required named parameters
// 14. Default parameters
// 15. Closures
// 16. Lexical scope
// 17. Local functions
// 18. Function composition
// 19. Tear-offs
// 20. Callable classes
// 21. map()
// 22. where()
// 23. reduce()
// 24. fold()
// 25. any()
// 26. every()
// 27. firstWhere()
// 28. singleWhere()
// 29. expand()
// 30. forEach()
// 31. sort()
// 32. async callbacks
// 33. Future callbacks
// 34. Stream callbacks
// 35. Flutter callback patterns
// 36. Production examples
//
// ============================================================================


// ============================================================================
// 01. FUNCTIONS AS FIRST-CLASS OBJECTS
// ============================================================================
//
// In Dart, functions are objects.
//
// This means a function can be:
//
//   • stored in a variable
//   • passed to another function
//   • returned from another function
//   • stored inside collections
//
// ============================================================================

int add(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================

void firstClassFunctionExample() {
  final operation = add;

  print(
    operation(10, 20),
  );
}


// ============================================================================
// Notice:
//
// final operation = add;
//
// We did NOT write:
//
// final operation = add(10, 20);
//
// Because:
//
// add
//
// means the function itself.
//
//
//
// add(10, 20)
//
// means execute the function.
//
// ============================================================================


// ============================================================================
// 02. FUNCTION VARIABLES
// ============================================================================
//
// You can store functions inside variables.
//
// ============================================================================

void functionVariableExample() {
  int multiply(
    int a,
    int b,
  ) {
    return a * b;
  }

  final calculator = multiply;

  print(
    calculator(5, 4),
  );
}


// ============================================================================
// 03. FUNCTION TYPES
// ============================================================================
//
// Function type describes:
//
//   • parameter types
//   • return type
//
// ============================================================================
//
// Example:
//
// int Function(int, int)
//
// means:
//
// A function that:
//
//   accepts int
//   accepts int
//   returns int
//
// ============================================================================

int subtract(
  int a,
  int b,
) {
  return a - b;
}


// ============================================================================

void functionTypeExample() {
  int Function(
    int,
    int,
  ) operation = subtract;

  print(
    operation(20, 5),
  );
}


// ============================================================================
// Another function:
//
// ============================================================================

double divide(
  double a,
  double b,
) {
  return a / b;
}


// ============================================================================

void functionTypeExample2() {
  double Function(
    double,
    double,
  ) operation = divide;

  print(
    operation(10, 2),
  );
}


// ============================================================================
// 04. ANONYMOUS FUNCTIONS
// ============================================================================
//
// Anonymous function = function without a name.
//
// ============================================================================

void anonymousFunctionExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  numbers.forEach(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// Here:
//
// (number) {
//
// }
//
// is an anonymous function.
//
// ============================================================================
// 05. ARROW FUNCTIONS
// ============================================================================
//
// Arrow function is a short form for a function with ONE expression.
//
// ============================================================================

int square(
  int number,
) =>
    number * number;


// ============================================================================
// Equivalent:
//
// int square(int number) {
//   return number * number;
// }
//
// ============================================================================
// Another example:
//
// ============================================================================

String greet(
  String name,
) =>
    "Hello $name";


// ============================================================================
// Arrow functions are very common in Flutter.
//
// Example:
//
// onPressed: () => print("Clicked"),
//
// ============================================================================
// 06. RETURNING FUNCTIONS
// ============================================================================
//
// A function can return another function.
//
// ============================================================================

int Function(int) createMultiplier(
  int multiplier,
) {
  return (
    int number,
  ) {
    return number *
        multiplier;
  };
}


// ============================================================================

void returningFunctionExample() {
  final doubleValue =
      createMultiplier(2);

  final tripleValue =
      createMultiplier(3);

  print(
    doubleValue(10),
  );

  print(
    tripleValue(10),
  );
}


// ============================================================================
// 07. PASSING FUNCTIONS AS ARGUMENTS
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

int addNumbers(
  int a,
  int b,
) =>
    a + b;


int multiplyNumbers(
  int a,
  int b,
) =>
    a * b;


// ============================================================================

void passingFunctionExample() {
  final sum = calculate(
    10,
    20,
    addNumbers,
  );

  final product = calculate(
    10,
    20,
    multiplyNumbers,
  );

  print(sum);
  print(product);
}


// ============================================================================
// 08. HIGHER-ORDER FUNCTIONS
// ============================================================================
//
// A higher-order function is a function that:
//
//   • accepts a function
//   OR
//   • returns a function
//   OR
//   • both
//
// ============================================================================

List<int> transformNumbers(
  List<int> numbers,
  int Function(int) transform,
) {
  return numbers
      .map(transform)
      .toList();
}


// ============================================================================

void higherOrderExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final doubled =
      transformNumbers(
    numbers,
    (number) => number * 2,
  );

  print(doubled);
}


// ============================================================================
// 09. CALLBACKS
// ============================================================================
//
// Callback means:
//
// "Give me a function and I will call it later."
//
// This is extremely important in Flutter.
//
// ============================================================================

void loadData(
  void Function(String) onSuccess,
) {
  final data =
      "Data loaded";

  onSuccess(data);
}


// ============================================================================

void callbackExample() {
  loadData(
    (data) {
      print(data);
    },
  );
}


// ============================================================================
// Another callback:
//
// ============================================================================

void performLogin(
  String email,
  String password, {
  required void Function(String)
      onSuccess,
  required void Function(String)
      onError,
}) {
  if (email.isEmpty ||
      password.isEmpty) {
    onError(
      "Invalid credentials",
    );

    return;
  }

  onSuccess(
    "Login successful",
  );
}


// ============================================================================

void loginCallbackExample() {
  performLogin(
    "user@example.com",
    "123456",
    onSuccess: (message) {
      print(message);
    },
    onError: (error) {
      print(error);
    },
  );
}


// ============================================================================
// 10. TYPEDEF
// ============================================================================
//
// typedef gives a name to a function type.
//
// ============================================================================

typedef Validator = String? Function(
  String?,
);


// ============================================================================

String? validateName(
  String? value,
) {
  if (value == null ||
      value.trim().isEmpty) {
    return "Name is required";
  }

  return null;
}


// ============================================================================

void typedefExample() {
  final Validator validator =
      validateName;

  print(
    validator("Palash"),
  );
}


// ============================================================================
// Another useful typedef:
//
// ============================================================================

typedef OnUserSelected =
    void Function(
  String userId,
);


// ============================================================================

void selectUser(
  String userId,
  OnUserSelected onSelected,
) {
  onSelected(userId);
}


// ============================================================================
// 11. OPTIONAL POSITIONAL PARAMETERS
// ============================================================================
//
// Use [].
//
// ============================================================================

void greetUser(
  String name, [
  String? title,
]) {
  print(
    "${title ?? "User"} $name",
  );
}


// ============================================================================

void optionalPositionalExample() {
  greetUser("Palash");

  greetUser(
    "Palash",
    "Mr.",
  );
}


// ============================================================================
// 12. OPTIONAL NAMED PARAMETERS
// ============================================================================
//
// Use {}.
//
// ============================================================================

void createProfile({
  String? phone,
  String? address,
}) {
  print(phone);
  print(address);
}


// ============================================================================

void optionalNamedExample() {
  createProfile();

  createProfile(
    phone: "01700000000",
  );

  createProfile(
    address: "Dhaka",
  );
}


// ============================================================================
// 13. REQUIRED NAMED PARAMETERS
// ============================================================================

void createProduct({
  required String name,
  required double price,
}) {
  print(name);
  print(price);
}


// ============================================================================
// 14. DEFAULT PARAMETERS
// ============================================================================

void createOrder({
  String status = "pending",
  double deliveryCharge = 0,
}) {
  print(status);
  print(deliveryCharge);
}


// ============================================================================

void defaultParameterExample() {
  createOrder();

  createOrder(
    status: "confirmed",
    deliveryCharge: 100,
  );
}


// ============================================================================
// 15. CLOSURES
// ============================================================================
//
// A closure is a function that remembers variables from the surrounding
// scope even after the surrounding function has finished.
//
// This is a VERY important concept.
//
// ============================================================================

Function createCounter() {
  int count = 0;

  return () {
    count++;

    print(count);
  };
}


// ============================================================================

void closureExample() {
  final counter =
      createCounter();

  counter();
  counter();
  counter();
}


// ============================================================================
// Output:
//
// 1
// 2
// 3
//
// The anonymous function remembers:
//
// count
//
// ============================================================================
// 16. LEXICAL SCOPE
// ============================================================================
//
// A function can access variables from its surrounding scope.
//
// ============================================================================

void lexicalScopeExample() {
  final companyName =
      "My ERP";

  void printCompany() {
    print(companyName);
  }

  printCompany();
}


// ============================================================================
// printCompany() can access companyName because it was created inside
// the surrounding lexical scope.
//
// ============================================================================
// 17. LOCAL FUNCTIONS
// ============================================================================
//
// Functions can exist inside another function.
//
// ============================================================================

void localFunctionExample() {
  int square(
    int value,
  ) {
    return value * value;
  }

  print(
    square(5),
  );
}


// ============================================================================
// Local functions are useful when logic is only needed in one place.
//
// ============================================================================
// 18. FUNCTION COMPOSITION
// ============================================================================
//
// One function's result can become another function's input.
//
// ============================================================================

int doubleNumber(
  int value,
) =>
    value * 2;


int addTen(
  int value,
) =>
    value + 10;


// ============================================================================

void compositionExample() {
  final value =
      5;

  final result =
      addTen(
        doubleNumber(
          value,
        ),
      );

  print(result);
}


// ============================================================================
// Result:
//
// 5
// ↓ double
// 10
// ↓ add 10
// 20
//
// ============================================================================
// 19. TEAR-OFFS
// ============================================================================
//
// Tear-off means referencing a function without calling it.
//
// ============================================================================

void printMessage(
  String message,
) {
  print(message);
}


// ============================================================================

void tearOffExample() {
  final callback =
      printMessage;

  callback(
    "Hello",
  );
}


// ============================================================================
// NOT:
//
// final callback = printMessage("Hello");
//
// That executes the function.
//
//
//
// YES:
//
// final callback = printMessage;
//
// That stores the function.
//
// ============================================================================
// 20. CALLABLE CLASSES
// ============================================================================
//
// A class can behave like a function by defining:
//
// call()
//
// ============================================================================

class Multiplier {
  final int factor;

  Multiplier(
    this.factor,
  );

  int call(
    int value,
  ) {
    return value * factor;
  }
}


// ============================================================================

void callableClassExample() {
  final double =
      Multiplier(2);

  print(
    double(10),
  );
}


// ============================================================================
// The object:
//
// double(10)
//
// behaves like a function.
//
// ============================================================================
// 21. map()
// ============================================================================
//
// map transforms every item.
//
// ============================================================================

void mapExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final discountedPrices =
      prices.map(
    (price) => price * 0.9,
  );

  print(
    discountedPrices.toList(),
  );
}


// ============================================================================
// map() does NOT modify the original list.
//
// It creates an Iterable.
//
// ============================================================================
// 22. where()
// ============================================================================
//
// where() filters items.
//
// ============================================================================

void whereExample() {
  final prices = [
    100,
    500,
    1000,
    2000,
  ];

  final expensive =
      prices.where(
    (price) => price >= 1000,
  );

  print(
    expensive.toList(),
  );
}


// ============================================================================
// 23. reduce()
// ============================================================================
//
// reduce combines items into one value.
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


// ============================================================================
// IMPORTANT:
//
// reduce() requires the collection to contain at least one element.
//
// Empty list + reduce() = error.
//
// ============================================================================
// 24. fold()
// ============================================================================
//
// fold() is safer when you need an initial value.
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
// fold() can work with an empty list because it has an initial value.
//
// ============================================================================
// 25. any()
// ============================================================================
//
// Returns true if at least ONE item matches.
//
// ============================================================================

void anyExample() {
  final stock = [
    0,
    5,
    10,
  ];

  final hasStock =
      stock.any(
    (value) => value > 0,
  );

  print(hasStock);
}


// ============================================================================
// 26. every()
// ============================================================================
//
// Returns true if ALL items match.
//
// ============================================================================

void everyExample() {
  final stock = [
    5,
    10,
    20,
  ];

  final allAvailable =
      stock.every(
    (value) => value > 0,
  );

  print(allAvailable);
}


// ============================================================================
// 27. firstWhere()
// ============================================================================
//
// Finds the first matching item.
//
// ============================================================================

void firstWhereExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  final result =
      products.firstWhere(
    (product) =>
        product.startsWith("L"),
  );

  print(result);
}


// ============================================================================
// IMPORTANT:
//
// firstWhere() throws if nothing matches.
//
// Use orElse when appropriate.
//
// ============================================================================

void firstWhereSafeExample() {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  final result =
      products.firstWhere(
    (product) =>
        product.startsWith("X"),
    orElse: () => "Not found",
  );

  print(result);
}


// ============================================================================
// 28. singleWhere()
// ============================================================================
//
// Finds exactly one matching element.
//
// If zero or multiple elements match,
// it throws an error.
//
// ============================================================================

void singleWhereExample() {
  final ids = [
    "A",
    "B",
    "C",
  ];

  final result =
      ids.singleWhere(
    (id) => id == "B",
  );

  print(result);
}


// ============================================================================
// 29. expand()
// ============================================================================
//
// Converts nested collections into one flat collection.
//
// ============================================================================

void expandExample() {
  final categories = [
    [
      "Phone",
      "Laptop",
    ],
    [
      "TV",
      "Fridge",
    ],
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
// 30. forEach()
// ============================================================================
//
// Runs a function for every item.
//
// ============================================================================

void forEachExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  names.forEach(
    (name) {
      print(name);
    },
  );
}


// ============================================================================
// 31. sort()
// ============================================================================
//
// sort() changes the original list.
//
// ============================================================================

void sortExample() {
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
// Custom sorting:
//
// ============================================================================

void customSortExample() {
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

class ProductItem {
  final String name;
  final double price;

  const ProductItem({
    required this.name,
    required this.price,
  });

  @override
  String toString() {
    return "$name: $price";
  }
}


// ============================================================================
// 32. ASYNC CALLBACKS
// ============================================================================
//
// Callback itself can return Future.
//
// ============================================================================

typedef AsyncCallback =
    Future<void> Function();


// ============================================================================

Future<void> executeAsync(
  AsyncCallback callback,
) async {
  await callback();
}


// ============================================================================

void asyncCallbackExample() {
  executeAsync(
    () async {
      print(
        "Async operation",
      );
    },
  );
}


// ============================================================================
// 33. FUTURE CALLBACKS
// ============================================================================
//
// Future.then() accepts callbacks.
//
// ============================================================================

Future<String> fetchName() async {
  return "Palash";
}


// ============================================================================

void futureCallbackExample() {
  fetchName().then(
    (name) {
      print(name);
    },
  );
}


// ============================================================================
// In modern Dart:
//
// Prefer async/await for most application code.
//
// ============================================================================

Future<void>
betterFutureExample() async {
  final name =
      await fetchName();

  print(name);
}


// ============================================================================
// 34. STREAM CALLBACKS
// ============================================================================

Stream<int> numbersStream() async* {
  yield 1;
  yield 2;
  yield 3;
}


// ============================================================================

void streamCallbackExample() {
  numbersStream().listen(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 35. FLUTTER CALLBACK PATTERNS
// ============================================================================
//
// Flutter uses callbacks constantly.
//
// Typical examples:
//
// onPressed
// onTap
// onChanged
// onSubmitted
// onSaved
// validator
// onSelected
// onDismissed
//
// ============================================================================
// Example:
//
// ============================================================================

class ButtonExample {
  final void Function() onPressed;

  ButtonExample({
    required this.onPressed,
  });

  void press() {
    onPressed();
  }
}


// ============================================================================

void flutterCallbackExample() {
  final button =
      ButtonExample(
    onPressed: () {
      print(
        "Button clicked",
      );
    },
  );

  button.press();
}


// ============================================================================
// CALLBACK WITH DATA
// ============================================================================

class UserSelector {
  final void Function(
    String userId,
  ) onSelected;

  UserSelector({
    required this.onSelected,
  });

  void select(
    String id,
  ) {
    onSelected(id);
  }
}


// ============================================================================

void userSelectorExample() {
  final selector =
      UserSelector(
    onSelected: (id) {
      print(
        "Selected: $id",
      );
    },
  );

  selector.select(
    "U001",
  );
}


// ============================================================================
// OPTIONAL CALLBACK
// ============================================================================

class SaveButton {
  final Future<void>
      Function()? onSave;

  SaveButton({
    this.onSave,
  });

  Future<void> save() async {
    await onSave?.call();
  }
}


// ============================================================================
// IMPORTANT:
//
// onSave?.call()
//
// is safer than:
//
// onSave!();
//
// ============================================================================
// 36. PRODUCTION EXAMPLE — SEARCH
// ============================================================================

class ProductSearchService {
  final List<ProductItem>
      products;

  ProductSearchService({
    required this.products,
  });

  List<ProductItem> search(
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
}


// ============================================================================
// PRODUCTION EXAMPLE — FILTER
// ============================================================================

List<ProductItem>
filterByPrice(
  List<ProductItem> products, {
  double? minimum,
  double? maximum,
}) {
  return products.where(
    (product) {
      if (minimum != null &&
          product.price <
              minimum) {
        return false;
      }

      if (maximum != null &&
          product.price >
              maximum) {
        return false;
      }

      return true;
    },
  ).toList();
}


// ============================================================================
// PRODUCTION EXAMPLE — SORT
// ============================================================================

List<ProductItem>
sortProductsByPrice(
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
// IMPORTANT:
//
// We copied the list before sorting.
//
// Why?
//
// sort() mutates the list.
//
// In Flutter state management,
// unnecessary mutation can create bugs.
//
// ============================================================================
// PRODUCTION EXAMPLE — MAP API DATA
// ============================================================================

List<ProductItem>
mapProducts(
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
// PRODUCTION EXAMPLE — TOTAL ORDER VALUE
// ============================================================================

double calculateOrderTotal(
  List<double> prices,
) {
  return prices.fold<double>(
    0,
    (total, price) =>
        total + price,
  );
}


// ============================================================================
// PRODUCTION EXAMPLE — CHECK STOCK
// ============================================================================

bool hasAvailableStock(
  List<ProductItem> products,
) {
  return products.any(
    (product) =>
        product.price > 0,
  );
}


// ============================================================================
// PRODUCTION EXAMPLE — VALIDATE ALL
// ============================================================================

bool areAllPricesValid(
  List<ProductItem> products,
) {
  return products.every(
    (product) =>
        product.price >= 0,
  );
}


// ============================================================================
// PRODUCTION EXAMPLE — FIND PRODUCT
// ============================================================================

ProductItem?
findProductByName(
  List<ProductItem> products,
  String name,
) {
  for (final product in products) {
    if (product.name == name) {
      return product;
    }
  }

  return null;
}


// ============================================================================
// FUNCTIONAL PIPELINE
// ============================================================================
//
// A very common Dart pattern:
//
// data
//   ↓
// where()
//   ↓
// map()
//   ↓
// toList()
//
// ============================================================================

void functionalPipelineExample() {
  final prices = [
    100,
    200,
    300,
    400,
    500,
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
// READ THIS AS:
//
// 1. Take prices
//
// 2. Keep prices >= 200
//
// 3. Apply 10% discount
//
// 4. Convert to List
//
// ============================================================================
// CALLBACK VS FUNCTION
// ============================================================================
//
// Function:
//
// The reusable behavior itself.
//
// Callback:
//
// A function passed somewhere so that it can be called later.
//
// Example:
//
// void onLogin() {}
//
//
//
// performLogin(
//   onSuccess: onLogin,
// );
//
// onLogin is acting as a callback.
//
// ============================================================================
// FUNCTION VS METHOD
// ============================================================================
//
// Function:
//
// Exists independently.
//
// int add(int a, int b) {}
//
//
//
// Method:
//
// Function belonging to a class/object.
//
// class Calculator {
//   int add(int a, int b) {}
// }
//
// ============================================================================
// IMPORTANT DIFFERENCE:
// ============================================================================
//
// add
//
// means:
//
// reference to function.
//
//
//
// add()
//
// means:
//
// execute function.
//
//
//
// This distinction is critical when working with Flutter callbacks.
//
// ============================================================================
// ⭐ CALLBACK DESIGN
// ============================================================================
//
// Good:
//
// void save({
//   required VoidCallback onSuccess,
//   required void Function(String) onError,
// }) {}
//
//
//
// Bad:
//
// dynamic callback;
//
//
//
// Prefer strongly typed callbacks.
//
// ============================================================================
// ⭐ TYPEDEF DESIGN
// ============================================================================

typedef OnError = void Function(
  String message,
);


typedef OnSuccess<T> = void Function(
  T data,
);


// ============================================================================

void genericCallbackExample() {
  void handleSuccess(
    String message,
  ) {
    print(message);
  }

  final OnSuccess<String>
      callback = handleSuccess;

  callback(
    "Success",
  );
}


// ============================================================================
// ⭐ GENERIC HIGHER-ORDER FUNCTION
// ============================================================================

List<T> transform<T>(
  List<T> items,
  T Function(T) callback,
) {
  return items
      .map(callback)
      .toList();
}


// ============================================================================

void genericTransformExample() {
  final numbers =
      transform<int>(
    [1, 2, 3],
    (value) => value * 10,
  );

  final names =
      transform<String>(
    ["a", "b"],
    (value) =>
        value.toUpperCase(),
  );

  print(numbers);
  print(names);
}


// ============================================================================
// ⭐ FUNCTION RETURNING FUNCTION
// ============================================================================

String Function(String)
createPrefixer(
  String prefix,
) {
  return (
    String value,
  ) {
    return "$prefix$value";
  };
}


// ============================================================================

void prefixerExample() {
  final adminPrefix =
      createPrefixer(
    "ADMIN: ",
  );

  final userPrefix =
      createPrefixer(
    "USER: ",
  );

  print(
    adminPrefix("Palash"),
  );

  print(
    userPrefix("Rahim"),
  );
}


// ============================================================================
// ⭐ REAL FLUTTER FORM VALIDATOR
// ============================================================================
//
// Flutter TextFormField commonly uses:
//
// validator:
//
// String? Function(String?)
//
// ============================================================================

String? emailValidator(
  String? value,
) {
  if (value == null ||
      value.trim().isEmpty) {
    return "Email is required";
  }

  if (!value.contains("@")) {
    return "Enter a valid email";
  }

  return null;
}


// ============================================================================
// ⭐ REAL FLUTTER onChanged PATTERN
// ============================================================================
//
// onChanged:
//
// void Function(String)
//
// ============================================================================

void handleSearchChanged(
  String value,
) {
  print(
    "Searching: $value",
  );
}


// ============================================================================
// ⭐ REAL FLUTTER onPressed PATTERN
// ============================================================================
//
// onPressed:
//
// VoidCallback?
//
// ============================================================================

void handleLogin() {
  print(
    "Login pressed",
  );
}


// ============================================================================
// ⭐ REAL ERP CALLBACK FLOW
// ============================================================================
//
// Product screen:
//
// onProductSelected
//
//        ↓
//
// Product controller
//
//        ↓
//
// Product service
//
//        ↓
//
// API
//
// ============================================================================

typedef OnProductSelected =
    void Function(
  ProductItem product,
);


class ProductListController {
  final OnProductSelected
      onProductSelected;

  ProductListController({
    required this.onProductSelected,
  });

  void selectProduct(
    ProductItem product,
  ) {
    onProductSelected(
      product,
    );
  }
}


// ============================================================================
// ⭐ FUNCTIONAL DART MASTER EXAMPLE
// ============================================================================

void masterFunctionalExample() {
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

  final expensiveProducts =
      products
          .where(
            (product) =>
                product.price >=
                50000,
          )
          .map(
            (product) =>
                product.name,
          )
          .toList();

  print(
    expensiveProducts,
  );
}


// ============================================================================
// ⭐ WHEN TO USE WHICH COLLECTION FUNCTION?
// ============================================================================
//
// map()
//
// Use when:
//
//   "I want to transform every item."
//
// Example:
//
// prices.map(
//   (price) => price * 2,
// );
//
//
//
// where()
//
// Use when:
//
//   "I want to filter items."
//
//
//
// reduce()
//
// Use when:
//
//   "I want to combine items into one value."
//
// Use carefully because empty collections throw.
//
//
//
// fold()
//
// Use when:
//
//   "I want to combine items with an initial value."
//
//
//
// any()
//
// Use when:
//
//   "Does at least one match?"
//
//
//
// every()
//
// Use when:
//
//   "Do all match?"
//
//
//
// firstWhere()
//
// Use when:
//
//   "Find the first matching item."
//
//
//
// singleWhere()
//
// Use when:
//
//   "There must be exactly one matching item."
//
//
//
// expand()
//
// Use when:
//
//   "Flatten nested collections."
//
// ============================================================================
// ⭐ PERFORMANCE NOTE
// ============================================================================
//
// map(), where(), expand() return Iterable.
//
// They are lazy.
//
// The operations are generally evaluated when you iterate.
//
// Calling:
//
// .toList()
//
// materializes the result into a List.
//
// ============================================================================
// ⭐ COMMON MISTAKES
// ============================================================================
//
// MISTAKE 1:
//
// numbers.map(...);
//
// and expecting the original list to change.
//
// It does NOT mutate the original list.
//
//
//
// MISTAKE 2:
//
// Using reduce() on an empty list.
//
//
//
// MISTAKE 3:
//
// Using firstWhere() without considering the case where no item exists.
//
//
//
// MISTAKE 4:
//
// Using sort() without realizing that it mutates the list.
//
//
//
// MISTAKE 5:
//
// Using dynamic callback types.
//
// Prefer:
//
// void Function(String)
//
// instead of:
//
// dynamic
//
//
//
// MISTAKE 6:
//
// Confusing:
//
// function
//
// with:
//
// function()
//
// ============================================================================
// ⭐ PHASE 17 MASTER CHECKLIST
// ============================================================================
//
// FUNCTIONS
//
// [ ] First-class functions
// [ ] Function variables
// [ ] Function types
// [ ] Anonymous functions
// [ ] Arrow functions
// [ ] Return function
// [ ] Pass function
//
// ADVANCED
//
// [ ] Higher-order functions
// [ ] Callbacks
// [ ] typedef
// [ ] Closures
// [ ] Lexical scope
// [ ] Local functions
// [ ] Function composition
// [ ] Tear-offs
// [ ] Callable classes
//
// PARAMETERS
//
// [ ] Optional positional
// [ ] Optional named
// [ ] Required named
// [ ] Default parameters
//
// COLLECTIONS
//
// [ ] map()
// [ ] where()
// [ ] reduce()
// [ ] fold()
// [ ] any()
// [ ] every()
// [ ] firstWhere()
// [ ] singleWhere()
// [ ] expand()
// [ ] forEach()
// [ ] sort()
//
// ASYNC
//
// [ ] Async callbacks
// [ ] Future callbacks
// [ ] Stream callbacks
//
// FLUTTER
//
// [ ] onPressed
// [ ] onTap
// [ ] onChanged
// [ ] validator
// [ ] onSelected
// [ ] optional callbacks
//
// ============================================================================
// ⭐ YOU SHOULD NOW BE ABLE TO EXPLAIN:
// ============================================================================
//
// 1. What is a first-class function?
//
// 2. What is a callback?
//
// 3. What is a higher-order function?
//
// 4. What is a closure?
//
// 5. What does typedef do?
//
// 6. What is the difference between:
//
//    function
//
//    and:
//
//    function()
//
// 7. What does map() do?
//
// 8. What does where() do?
//
// 9. reduce() vs fold()
//
// 10. any() vs every()
//
// 11. firstWhere() vs singleWhere()
//
// 12. What is a tear-off?
//
// 13. What is a callable class?
//
// 14. How are callbacks used in Flutter?
//
// 15. How do you type a callback safely?
//
// ============================================================================
// ⭐ MOST IMPORTANT FLUTTER PATTERNS FROM THIS PHASE
// ============================================================================
//
// VoidCallback
//
// void Function(String)
//
// String? Function(String?)
//
// Future<void> Function()
//
// typedef OnUserSelected =
//     void Function(String userId);
//
//
//
// These patterns will appear repeatedly throughout Flutter development.
//
// ============================================================================
// END OF PHASE 17
// ============================================================================
//
// NEXT:
//
// PHASE 18 — COLLECTIONS & GENERICS DEEP DIVE
//
// Topics:
//
//   • List deep dive
//   • Set deep dive
//   • Map deep dive
//   • Iterable
//   • Collection literals
//   • Spread operator
//   • Null-aware spread
//   • Collection if
//   • Collection for
//   • Records
//   • Generic classes
//   • Generic methods
//   • Type constraints
//   • Iterable transformations
//   • Nested collections
//   • Sorting
//   • Searching
//   • Grouping
//   • Pagination data
//   • API response collections
//   • ERP data manipulation
//
// ============================================================================