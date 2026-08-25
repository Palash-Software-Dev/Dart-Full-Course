// ============================================================================
// DART MASTER ROADMAP
// PHASE 14 — FUNCTIONS, CALLBACKS & FUNCTIONAL PROGRAMMING
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// In this phase you will master Dart functions from BASIC → ADVANCED.
//
// Functions are extremely important in Flutter because Flutter is heavily
// based on callbacks, functions, closures and event-driven programming.
//
// You will use these concepts in:
//
//   • Flutter buttons
//   • onPressed
//   • onTap
//   • API callbacks
//   • State management
//   • Navigation
//   • Form validation
//   • Repository / Service layers
//   • Event handling
//   • Filtering / mapping collections
//   • Async programming
//   • Streams
//   • Dependency injection
//   • Higher-order functions
//
// ============================================================================
// PHASE 14 TOPICS
// ============================================================================
//
// BASIC FUNCTIONS
//
// 01. Function basics
// 02. Return values
// 03. void functions
// 04. Parameters
// 05. Multiple parameters
// 06. Return type
// 07. Type inference
//
// PARAMETERS
//
// 08. Positional parameters
// 09. Optional positional parameters
// 10. Named parameters
// 11. Required named parameters
// 12. Default parameters
// 13. Mixed parameter rules
//
// FUNCTION SYNTAX
//
// 14. Arrow functions
// 15. Anonymous functions
// 16. Function expressions
// 17. Function variables
// 18. Function types
//
// ADVANCED FUNCTIONS
//
// 19. First-class functions
// 20. Passing functions
// 21. Returning functions
// 22. Higher-order functions
// 23. Closures
// 24. Lexical scope
// 25. Capturing variables
// 26. Stateful closures
//
// TYPE SYSTEM
//
// 27. typedef
// 28. Function typedef
// 29. Generic function types
// 30. Nullable function types
// 31. Function type compatibility
//
// CALLBACKS
//
// 32. Callback basics
// 33. Callback with parameters
// 34. Callback with return value
// 35. Multiple callbacks
// 36. Callback in classes
// 37. Callback in constructors
//
// FUNCTIONAL PROGRAMMING
//
// 38. map()
// 39. where()
// 40. reduce()
// 41. fold()
// 42. forEach()
// 43. expand()
// 44. Function composition
// 45. Pure functions
// 46. Side effects
//
// FLUTTER
//
// 47. onPressed
// 48. onTap
// 49. onChanged
// 50. onSubmitted
// 51. Form validator
// 52. Navigation callback
// 53. Dialog callback
// 54. Custom widget callback
//
// ASYNC
//
// 55. Async callbacks
// 56. Future callback
// 57. Stream callback
// 58. Error callbacks
//
// REAL-WORLD
//
// 59. Search callback
// 60. Repository callback
// 61. Authentication callback
// 62. Permission callback
// 63. API callback
// 64. Generic callback
//
// ============================================================================


// ============================================================================
// 01. FUNCTION BASICS
// ============================================================================
//
// A function is a reusable block of code.
//
// Syntax:
//
// returnType functionName(parameters) {
//   code
// }
//
// ============================================================================

void sayHello() {
  print("Hello Dart");
}


// ============================================================================
// CALLING A FUNCTION
// ============================================================================

void basicFunctionExample() {
  sayHello();
}


// ============================================================================
// 02. RETURN VALUES
// ============================================================================
//
// A function can calculate something and return the result.
//
// ============================================================================

int addNumbers(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================

void returnValueExample() {
  final result =
      addNumbers(10, 20);

  print(result);
}


// ============================================================================
// IMPORTANT:
//
// print() displays something.
//
// return gives a value back to the caller.
//
// These are NOT the same thing.
//
// ============================================================================


// ============================================================================
// 03. VOID FUNCTIONS
// ============================================================================
//
// void means the function does not return a useful value.
//
// ============================================================================

void printUserName(
  String name,
) {
  print(name);
}


// ============================================================================
// 04. PARAMETERS
// ============================================================================

void greetUser(
  String name,
) {
  print(
    "Hello $name",
  );
}


// ============================================================================

void parameterExample() {
  greetUser("Palash");
}


// ============================================================================
// 05. MULTIPLE PARAMETERS
// ============================================================================

int multiply(
  int a,
  int b,
) {
  return a * b;
}


// ============================================================================
// 06. RETURN TYPE
// ============================================================================
//
// Explicit return type is preferred in public APIs and important functions.
//
// ============================================================================

double calculatePrice(
  double price,
  double quantity,
) {
  return price * quantity;
}


// ============================================================================
// 07. TYPE INFERENCE
// ============================================================================
//
// Dart can infer local variable types.
//
// ============================================================================

void typeInferenceExample() {
  final result =
      addNumbers(
    10,
    20,
  );

  print(result);
}


// ============================================================================
// 08. POSITIONAL PARAMETERS
// ============================================================================
//
// Parameters are assigned according to their position.
//
// ============================================================================

void createUser(
  String name,
  int age,
) {
  print(
    "$name is $age years old",
  );
}


// ============================================================================

void positionalExample() {
  createUser(
    "Palash",
    25,
  );
}


// ============================================================================
// 09. OPTIONAL POSITIONAL PARAMETERS
// ============================================================================
//
// [] makes parameters optional positional parameters.
//
// ============================================================================

void greet(
  String name, [
  String? message,
]) {
  print(
    "$name ${message ?? "Welcome"}",
  );
}


// ============================================================================

void optionalPositionalExample() {
  greet("Palash");

  greet(
    "Palash",
    "Good Morning",
  );
}


// ============================================================================
// DEFAULT OPTIONAL POSITIONAL PARAMETER
// ============================================================================

void connectToServer([
  String host = "localhost",
]) {
  print(
    "Connecting to $host",
  );
}


// ============================================================================
// 10. NAMED PARAMETERS
// ============================================================================
//
// Named parameters are written inside {}.
//
// They improve readability.
//
// ============================================================================

void registerUser({
  String? name,
  int? age,
}) {
  print(name);
  print(age);
}


// ============================================================================

void namedParameterExample() {
  registerUser(
    name: "Palash",
    age: 25,
  );
}


// ============================================================================
// 11. REQUIRED NAMED PARAMETERS
// ============================================================================
//
// required means caller MUST provide the value.
//
// This is extremely common in Flutter.
//
// ============================================================================

void createProduct({
  required String name,
  required double price,
}) {
  print(
    "$name = $price",
  );
}


// ============================================================================

void requiredParameterExample() {
  createProduct(
    name: "iPhone",
    price: 120000,
  );
}


// ============================================================================
// 12. DEFAULT PARAMETERS
// ============================================================================

void createOrder({
  String status = "pending",
  double deliveryCharge = 60,
}) {
  print(status);
  print(deliveryCharge);
}


// ============================================================================
// 13. MIXED PARAMETER RULES
// ============================================================================
//
// Dart allows required positional and named parameters together.
//
// ============================================================================

void mixedParameters(
  String productId, {
  required int quantity,
  double discount = 0,
}) {
  print(productId);
  print(quantity);
  print(discount);
}


// ============================================================================

void mixedParameterExample() {
  mixedParameters(
    "P001",
    quantity: 2,
    discount: 10,
  );
}


// ============================================================================
// 14. ARROW FUNCTIONS
// ============================================================================
//
// Arrow syntax is useful for simple one-expression functions.
//
// ============================================================================

int square(
  int number,
) =>
    number * number;


// ============================================================================

String makeGreeting(
  String name,
) =>
    "Hello $name";


// ============================================================================
// IMPORTANT:
//
// Arrow functions can contain ONE expression.
//
// Do not use arrow syntax for large multi-step logic.
//
// ============================================================================


// ============================================================================
// 15. ANONYMOUS FUNCTIONS
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
  ];

  numbers.forEach(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 16. FUNCTION EXPRESSIONS
// ============================================================================

void functionExpressionExample() {
  final add =
      (int a, int b) {
    return a + b;
  };

  print(
    add(10, 20),
  );
}


// ============================================================================
// 17. FUNCTION VARIABLES
// ============================================================================
//
// Functions are first-class objects in Dart.
//
// A function can be stored inside a variable.
//
// ============================================================================

void functionVariableExample() {
  int add(
    int a,
    int b,
  ) {
    return a + b;
  }

  final operation = add;

  print(
    operation(10, 20),
  );
}


// ============================================================================
// 18. FUNCTION TYPES
// ============================================================================
//
// The type:
//
// int Function(int, int)
//
// means:
//
// A function that:
//   • receives two int values
//   • returns int
//
// ============================================================================

int calculateSum(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================

void functionTypeExample() {
  int Function(int, int)
      operation = calculateSum;

  print(
    operation(10, 20),
  );
}


// ============================================================================
// 19. FIRST-CLASS FUNCTIONS
// ============================================================================
//
// Because functions are first-class objects:
//
//   • store them
//   • pass them
//   • return them
//   • assign them
//   • use them in collections
//
// ============================================================================

void firstClassFunctionExample() {
  final operations =
      <int Function(int, int)>[
    (a, b) => a + b,
    (a, b) => a - b,
    (a, b) => a * b,
  ];

  print(
    operations[0](10, 5),
  );

  print(
    operations[1](10, 5),
  );

  print(
    operations[2](10, 5),
  );
}


// ============================================================================
// 20. PASSING FUNCTIONS
// ============================================================================
//
// A function can receive another function as an argument.
//
// ============================================================================

int calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  return operation(
    a,
    b,
  );
}


// ============================================================================

void passingFunctionExample() {
  final result =
      calculate(
    10,
    20,
    (a, b) => a + b,
  );

  print(result);
}


// ============================================================================
// Another example
// ============================================================================

void executeOperation(
  int Function() operation,
) {
  print(
    operation(),
  );
}


// ============================================================================

void executeOperationExample() {
  executeOperation(
    () => 100,
  );
}


// ============================================================================
// 21. RETURNING FUNCTIONS
// ============================================================================
//
// A function can return another function.
//
// ============================================================================

int Function(int)
createMultiplier(
  int multiplier,
) {
  return (int value) {
    return value * multiplier;
  };
}


// ============================================================================

void returningFunctionExample() {
  final doubleNumber =
      createMultiplier(2);

  final tripleNumber =
      createMultiplier(3);

  print(
    doubleNumber(10),
  );

  print(
    tripleNumber(10),
  );
}


// ============================================================================
// 22. HIGHER-ORDER FUNCTIONS
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
  int Function(int) transformer,
) {
  return numbers
      .map(transformer)
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
    (number) => number * 10,
  );

  print(result);
}


// ============================================================================
// 23. CLOSURES
// ============================================================================
//
// A closure is a function that remembers variables from its surrounding
// scope even after the surrounding function has finished executing.
//
// This is a VERY important concept.
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

  print(counter());
  print(counter());
  print(counter());
}


// Result:
//
// 1
// 2
// 3
//
// The returned function remembers count.
//
// ============================================================================
// 24. LEXICAL SCOPE
// ============================================================================
//
// Inner functions can access variables from outer scopes.
//
// ============================================================================

void lexicalScopeExample() {
  final name = "Palash";

  void printName() {
    print(name);
  }

  printName();
}


// ============================================================================
// 25. CAPTURING VARIABLES
// ============================================================================

Function createGreeting(
  String name,
) {
  return () {
    print(
      "Hello $name",
    );
  };
}


// ============================================================================

void capturedVariableExample() {
  final greeting =
      createGreeting(
    "Palash",
  );

  greeting();
}


// ============================================================================
// 26. STATEFUL CLOSURE
// ============================================================================
//
// A closure can maintain private state.
//
// ============================================================================

Function createBankAccount(
  double initialBalance,
) {
  double balance =
      initialBalance;

  return () {
    balance += 100;

    return balance;
  };
}


// ============================================================================

void statefulClosureExample() {
  final account =
      createBankAccount(1000);

  print(account());
  print(account());
  print(account());
}


// ============================================================================
// 27. TYPEDEF
// ============================================================================
//
// typedef creates a reusable name for a type.
//
// ============================================================================

typedef Operation =
    int Function(
  int a,
  int b,
);


// ============================================================================
// 28. FUNCTION TYPEDEF
// ============================================================================

int add(
  int a,
  int b,
) {
  return a + b;
}


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
      add;

  print(
    operation(10, 5),
  );

  operation =
      subtract;

  print(
    operation(10, 5),
  );
}


// ============================================================================
// WHY TYPEDEF?
// ============================================================================
//
// Without typedef:
//
// int Function(int, int)
//
// With typedef:
//
// Operation
//
// This makes large codebases easier to understand.
//
// ============================================================================
// 29. GENERIC FUNCTION TYPE
// ============================================================================

typedef Transformer<T> =
    T Function(T value);


// ============================================================================

T transform<T>(
  T value,
  Transformer<T> transformer,
) {
  return transformer(value);
}


// ============================================================================

void genericFunctionTypeExample() {
  final result =
      transform<int>(
    10,
    (value) => value * 2,
  );

  final name =
      transform<String>(
    "palash",
    (value) =>
        value.toUpperCase(),
  );

  print(result);
  print(name);
}


// ============================================================================
// 30. NULLABLE FUNCTION TYPES
// ============================================================================
//
// A callback itself can be null.
//
// ============================================================================

typedef VoidCallback =
    void Function();


void nullableCallbackExample(
  VoidCallback? callback,
) {
  callback?.call();
}


// ============================================================================
// 31. FUNCTION TYPE COMPATIBILITY
// ============================================================================

int addThree(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================

void compatibilityExample() {
  int Function(int, int)
      operation = addThree;

  print(
    operation(1, 2),
  );
}


// ============================================================================
// 32. CALLBACK BASICS
// ============================================================================
//
// Callback = function passed to another function/class and called later.
//
// ============================================================================

void fetchData(
  void Function(String data)
      onSuccess,
) {
  onSuccess(
    "Data loaded successfully",
  );
}


// ============================================================================

void callbackExample() {
  fetchData(
    (data) {
      print(data);
    },
  );
}


// ============================================================================
// 33. CALLBACK WITH PARAMETERS
// ============================================================================

void loginUser(
  String email,
  void Function(String)
      onSuccess,
) {
  onSuccess(
    "Welcome $email",
  );
}


// ============================================================================

void loginCallbackExample() {
  loginUser(
    "user@example.com",
    (message) {
      print(message);
    },
  );
}


// ============================================================================
// 34. CALLBACK WITH RETURN VALUE
// ============================================================================

void processNumber(
  int number,
  int Function(int)
      transformer,
) {
  final result =
      transformer(number);

  print(result);
}


// ============================================================================

void callbackReturnExample() {
  processNumber(
    10,
    (number) => number * 5,
  );
}


// ============================================================================
// 35. MULTIPLE CALLBACKS
// ============================================================================

void authenticate({
  required String email,
  required void Function()
      onSuccess,
  required void Function(
    String message,
  ) onError,
}) {
  if (email.contains("@")) {
    onSuccess();
  } else {
    onError(
      "Invalid email",
    );
  }
}


// ============================================================================

void multipleCallbackExample() {
  authenticate(
    email: "user@example.com",
    onSuccess: () {
      print("Login successful");
    },
    onError: (message) {
      print(message);
    },
  );
}


// ============================================================================
// 36. CALLBACK IN CLASS
// ============================================================================

class Downloader {
  void download({
    required void Function(
      int progress,
    ) onProgress,
  }) {
    for (var i = 0; i <= 100; i += 25) {
      onProgress(i);
    }
  }
}


// ============================================================================

void classCallbackExample() {
  final downloader =
      Downloader();

  downloader.download(
    onProgress: (progress) {
      print(
        "Progress: $progress%",
      );
    },
  );
}


// ============================================================================
// 37. CALLBACK IN CONSTRUCTOR
// ============================================================================

class CustomButtonController {
  final VoidCallback
      onPressed;

  const CustomButtonController({
    required this.onPressed,
  });

  void press() {
    onPressed();
  }
}


// ============================================================================

void constructorCallbackExample() {
  final button =
      CustomButtonController(
    onPressed: () {
      print(
        "Button pressed",
      );
    },
  );

  button.press();
}


// ============================================================================
// 38. MAP WITH FUNCTION
// ============================================================================

void mapFunctionExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final result =
      numbers.map(
    (number) => number * 2,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 39. WHERE WITH FUNCTION
// ============================================================================

void whereFunctionExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final result =
      numbers.where(
    (number) => number.isEven,
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 40. REDUCE WITH FUNCTION
// ============================================================================

void reduceFunctionExample() {
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
// 41. FOLD WITH FUNCTION
// ============================================================================

void foldFunctionExample() {
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
// 42. FOREACH WITH FUNCTION
// ============================================================================

void forEachFunctionExample() {
  final names = [
    "A",
    "B",
    "C",
  ];

  names.forEach(
    print,
  );
}


// ============================================================================
// 43. EXPAND WITH FUNCTION
// ============================================================================

void expandFunctionExample() {
  final groups = [
    [1, 2],
    [3, 4],
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
// 44. FUNCTION COMPOSITION
// ============================================================================
//
// Function composition means:
//
// Output of one function
// becomes input of another.
//
// ============================================================================

int doubleValue(
  int value,
) {
  return value * 2;
}


int addTen(
  int value,
) {
  return value + 10;
}


// ============================================================================

int compose(
  int value,
) {
  final doubled =
      doubleValue(value);

  return addTen(doubled);
}


// ============================================================================

void compositionExample() {
  print(
    compose(5),
  );
}


// Flow:
//
// 5
// ↓
// double → 10
// ↓
// add 10 → 20
//
// ============================================================================
// 45. PURE FUNCTIONS
// ============================================================================
//
// A pure function:
//
//   • same input → same output
//   • no external side effects
//
// ============================================================================

int calculateTax(
  double price,
  double taxRate,
) {
  return (price * taxRate).round();
}


// ============================================================================
// This function doesn't modify external state.
//
// ============================================================================
// 46. SIDE EFFECTS
// ============================================================================
//
// A function has a side effect when it changes something outside itself.
//
// Examples:
//
//   • changing global variables
//   • writing to database
//   • API request
//   • printing
//   • changing UI state
//   • writing files
//
// ============================================================================

int globalCounter = 0;


void sideEffectExample() {
  globalCounter++;

  print(globalCounter);
}


// ============================================================================
// Pure business logic should be separated from side effects whenever
// practical.
//
// This becomes extremely important in large Flutter applications.
//
// ============================================================================
// 47. FLUTTER onPressed
// ============================================================================
//
// Flutter widgets commonly receive callbacks.
//
// Example:
//
// ElevatedButton(
//   onPressed: () {
//     print("Clicked");
//   },
//   child: Text("Save"),
// )
//
// onPressed is essentially a callback.
//
// ============================================================================


// ============================================================================
// 48. FLUTTER onTap
// ============================================================================
//
// GestureDetector(
//   onTap: () {
//     print("Tapped");
//   },
// )
//
// ============================================================================
// 49. FLUTTER onChanged
// ============================================================================
//
// TextField(
//   onChanged: (value) {
//     print(value);
//   },
// )
//
// ============================================================================
// 50. FLUTTER onSubmitted
// ============================================================================
//
// TextField(
//   onSubmitted: (value) {
//     print(value);
//   },
// )
//
// ============================================================================
// 51. FORM VALIDATOR
// ============================================================================
//
// Flutter validators are functions.
//
// Example:
//
// String? validateEmail(String? value) {
//   if (value == null || value.isEmpty) {
//     return "Email is required";
//   }
//
//   return null;
// }
//
// ============================================================================

String? validateRequired(
  String? value,
) {
  if (value == null ||
      value.trim().isEmpty) {
    return "This field is required";
  }

  return null;
}


// ============================================================================
// 52. NAVIGATION CALLBACK
// ============================================================================
//
// A function can be used to notify another layer that navigation should
// happen.
//
// ============================================================================

void onLoginSuccess(
  void Function() navigate,
) {
  navigate();
}


// ============================================================================
// 53. DIALOG CALLBACK
// ============================================================================

void showConfirmation(
  void Function() onConfirm,
  void Function() onCancel,
) {
  final confirmed = true;

  if (confirmed) {
    onConfirm();
  } else {
    onCancel();
  }
}


// ============================================================================
// 54. CUSTOM WIDGET CALLBACK
// ============================================================================
//
// This pattern is EXTREMELY important in Flutter.
//
// Parent:
//
// CustomProductCard(
//   onAddToCart: () {
//     ...
//   },
// )
//
// Child:
//
// calls onAddToCart();
//
// ============================================================================

class ProductCardController {
  final VoidCallback
      onAddToCart;

  const ProductCardController({
    required this.onAddToCart,
  });

  void addToCart() {
    onAddToCart();
  }
}


// ============================================================================
// 55. ASYNC CALLBACK
// ============================================================================
//
// A callback can return Future.
//
// ============================================================================

typedef AsyncCallback =
    Future<void> Function();


Future<void> executeAsync(
  AsyncCallback callback,
) async {
  await callback();
}


// ============================================================================

Future<void>
asyncCallbackExample() async {
  await executeAsync(
    () async {
      print(
        "Async operation",
      );
    },
  );
}


// ============================================================================
// 56. FUTURE CALLBACK
// ============================================================================

Future<String> fetchUserName()
    async {
  return "Palash";
}


// ============================================================================

Future<void>
futureCallbackExample() async {
  final future =
      fetchUserName();

  future.then(
    (name) {
      print(name);
    },
  );
}


// ============================================================================
// IMPORTANT:
//
// In modern Dart:
//
// await
//
// is usually easier to read than chaining many .then() calls.
//
// ============================================================================
// 57. STREAM CALLBACK
// ============================================================================
//
// Streams produce multiple values over time.
//
// ============================================================================

Stream<int> numberStream()
    async* {
  for (var i = 1; i <= 5; i++) {
    yield i;
  }
}


// ============================================================================

Future<void>
streamCallbackExample() async {
  await for (
    final number
    in numberStream()
  ) {
    print(number);
  }
}


// ============================================================================
// 58. ERROR CALLBACK
// ============================================================================

void loadData({
  required void Function(
    String data,
  ) onSuccess,
  required void Function(
    Object error,
  ) onError,
}) {
  try {
    final data =
        "Server data";

    onSuccess(data);
  } catch (error) {
    onError(error);
  }
}


// ============================================================================
// 59. SEARCH CALLBACK
// ============================================================================

void searchProducts(
  String query,
  List<String> products,
  void Function(
    List<String> results,
  ) onResult,
) {
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

  onResult(results);
}


// ============================================================================
// 60. REPOSITORY CALLBACK
// ============================================================================

class ProductRepository {
  Future<void> loadProducts({
    required void Function(
      List<SimpleProduct> products,
    ) onSuccess,
    required void Function(
      Object error,
    ) onError,
  }) async {
    try {
      final products =
          <SimpleProduct>[
        const SimpleProduct(
          id: "P001",
          name: "iPhone",
        ),
      ];

      onSuccess(products);
    } catch (error) {
      onError(error);
    }
  }
}


// ============================================================================
// 61. AUTHENTICATION CALLBACK
// ============================================================================

void authenticateUser({
  required String email,
  required String password,
  required void Function()
      onSuccess,
  required void Function(
    String message,
  ) onFailure,
}) {
  if (email.isNotEmpty &&
      password.isNotEmpty) {
    onSuccess();
  } else {
    onFailure(
      "Invalid credentials",
    );
  }
}


// ============================================================================
// 62. PERMISSION CALLBACK
// ============================================================================

void requestPermission({
  required void Function()
      onGranted,
  required void Function()
      onDenied,
}) {
  final granted = true;

  if (granted) {
    onGranted();
  } else {
    onDenied();
  }
}


// ============================================================================
// 63. API CALLBACK
// ============================================================================

Future<void> apiRequest({
  required void Function(
    Map<String, dynamic> data,
  ) onSuccess,
  required void Function(
    Object error,
  ) onError,
}) async {
  try {
    final response =
        <String, dynamic>{
      "success": true,
      "message": "OK",
    };

    onSuccess(response);
  } catch (error) {
    onError(error);
  }
}


// ============================================================================
// 64. GENERIC CALLBACK
// ============================================================================

typedef SuccessCallback<T> =
    void Function(T data);


void processData<T>({
  required T data,
  required SuccessCallback<T>
      onSuccess,
}) {
  onSuccess(data);
}


// ============================================================================

void genericCallbackExample() {
  processData<String>(
    data: "Hello",
    onSuccess: (data) {
      print(data);
    },
  );

  processData<int>(
    data: 100,
    onSuccess: (data) {
      print(data);
    },
  );
}


// ============================================================================
// ⭐ CALLBACK VS FUNCTION
// ============================================================================
//
// Function:
//
//   A reusable block of code.
//
// Callback:
//
//   A function passed somewhere else to be executed later or when an event
//   occurs.
//
//
//
// Example:
//
// void save() {}
//
// This is a function.
//
//
//
// button.onPressed = save;
//
// Here save is being used as a callback.
//
// ============================================================================
// ⭐ CALLBACK VS RETURN VALUE
// ============================================================================
//
// Returning:
//
// final result = calculate();
//
// Caller gets a value immediately.
//
//
//
// Callback:
//
// calculate(
//   onComplete: (result) {
//     ...
//   },
// );
//
// Another function gets notified when something happens.
//
// ============================================================================
// ⭐ FUNCTION REFERENCE VS FUNCTION CALL
// ============================================================================
//
// Correct:
//
// onPressed: save
//
// This passes the function.
//
//
//
// Usually wrong:
//
// onPressed: save()
//
// This executes save immediately.
//
//
//
// Similarly:
//
// onTap: () => save()
//
// creates a callback that executes save when tapped.
//
// ============================================================================
// ⭐ VERY IMPORTANT FLUTTER PATTERN
// ============================================================================
//
// Parent Widget
//      ↓
// passes callback
//      ↓
// Child Widget
//      ↓
// user performs action
//      ↓
// Child calls callback
//      ↓
// Parent receives event
//
// Example:
//
// Parent:
//
// ProductCard(
//   onAddToCart: () {
//     cart.add(product);
//   },
// );
//
// Child:
//
// widget.onAddToCart();
//
//
//
// This is one of the most important communication patterns in Flutter.
//
// ============================================================================
// ⭐ FUNCTIONAL PIPELINE
// ============================================================================

void functionalPipeline() {
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
                number * number,
          )
          .where(
            (number) =>
                number > 10,
          )
          .toList();

  print(result);
}


// Flow:
//
// [1,2,3,4,5,6]
//       ↓
// [2,4,6]
//       ↓
// [4,16,36]
//       ↓
// [16,36]
//
// ============================================================================
// ⭐ FUNCTION RETURNING FUNCTION
// ============================================================================

typedef Validator<T> =
    String? Function(T value);


Validator<String>
requiredValidator() {
  return (
    String value,
  ) {
    if (value
        .trim()
        .isEmpty) {
      return "Required";
    }

    return null;
  };
}


// ============================================================================
// ⭐ REUSABLE VALIDATOR
// ============================================================================

Validator<String>
minLengthValidator(
  int minLength,
) {
  return (
    String value,
  ) {
    if (value.length <
        minLength) {
      return
          "Minimum $minLength characters required";
    }

    return null;
  };
}


// ============================================================================

void validatorExample() {
  final validator =
      minLengthValidator(8);

  print(
    validator("Hello"),
  );

  print(
    validator("HelloWorld"),
  );
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — PERMISSION CHECK
// ============================================================================

typedef PermissionChecker =
    bool Function(String permission);


PermissionChecker
createPermissionChecker(
  Set<String> permissions,
) {
  return (
    String permission,
  ) {
    return permissions
        .contains(permission);
  };
}


// ============================================================================

void permissionExample() {
  final checker =
      createPermissionChecker({
    "product.read",
    "product.create",
    "order.read",
  });

  print(
    checker("product.read"),
  );

  print(
    checker("user.delete"),
  );
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — PRICE CALCULATOR
// ============================================================================

typedef PriceRule =
    double Function(double price);


PriceRule
createDiscountRule(
  double percentage,
) {
  return (
    double price,
  ) {
    return price -
        (price * percentage / 100);
  };
}


// ============================================================================

void priceRuleExample() {
  final discount10 =
      createDiscountRule(10);

  final discount20 =
      createDiscountRule(20);

  print(
    discount10(1000),
  );

  print(
    discount20(1000),
  );
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — ORDER PROCESSING
// ============================================================================

typedef OrderCallback =
    void Function(
  String orderId,
);


void processOrder({
  required String orderId,
  required OrderCallback
      onCompleted,
}) {
  // Simulate order processing.

  print(
    "Processing $orderId",
  );

  onCompleted(orderId);
}


// ============================================================================

void orderCallbackExample() {
  processOrder(
    orderId: "ORD-001",
    onCompleted: (orderId) {
      print(
        "Order completed: $orderId",
      );
    },
  );
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — GENERIC DATA PROCESSOR
// ============================================================================

List<T> processList<T>(
  List<T> items,
  bool Function(T item) condition,
) {
  return items
      .where(condition)
      .toList();
}


// ============================================================================

void genericProcessorExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final even =
      processList<int>(
    numbers,
    (number) => number.isEven,
  );

  print(even);
}


// ============================================================================
// ⭐ CALLBACK DESIGN BEST PRACTICE
// ============================================================================
//
// Prefer:
//
// void Function()
//
// instead of:
//
// Function
//
//
//
// Why?
//
// Function is too generic.
//
// void Function() clearly says:
//
//   "This callback accepts no arguments and returns nothing."
//
// ============================================================================
// ⭐ NULLABLE CALLBACK
// ============================================================================

class OptionalAction {
  final VoidCallback?
      onAction;

  const OptionalAction({
    this.onAction,
  });

  void execute() {
    onAction?.call();
  }
}


// ============================================================================
// ⭐ CALLBACK INVOCATION
// ============================================================================
//
// If callback is nullable:
//
// callback?.call();
//
// is clean and safe.
//
// Alternative:
//
// if (callback != null) {
//   callback!();
// }
//
// ============================================================================
// ⭐ CLOSURE + CALLBACK COMBINATION
// ============================================================================

VoidCallback
createLogger(
  String prefix,
) {
  return () {
    print(
      "[$prefix] Event occurred",
    );
  };
}


// ============================================================================

void closureCallbackExample() {
  final logger =
      createLogger("AUTH");

  logger();
}


// ============================================================================
// ⭐ CALLBACK CHAIN
// ============================================================================

void callbackChain({
  required void Function(
    String,
  ) onResult,
}) {
  final first =
      "Hello";

  final second =
      first.toUpperCase();

  onResult(second);
}


// ============================================================================
// ⭐ FUNCTIONAL IMMUTABILITY STYLE
// ============================================================================
//
// Instead of changing the original list:
//
// final updated = [
//   ...products,
//   newProduct,
// ];
//
// Functions can create new collections.
//
// This style becomes very useful with Flutter state management.
//
// ============================================================================

void immutableListExample() {
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
// ⭐ SPREAD OPERATOR + FUNCTIONAL STYLE
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
// ⭐ COLLECTION-IF
// ============================================================================
//
// Flutter uses this pattern heavily.
//
// ============================================================================

void collectionIfExample(
  bool isAdmin,
) {
  final permissions = [
    "read",
    if (isAdmin)
      "delete",
  ];

  print(permissions);
}


// ============================================================================
// ⭐ COLLECTION-FOR
// ============================================================================

void collectionForExample() {
  final numbers = [
    for (var i = 1; i <= 5; i++)
      i * 10,
  ];

  print(numbers);
}


// ============================================================================
// ⭐ FLUTTER-LIKE UI DATA GENERATION
// ============================================================================

void generateMenuItems() {
  final roles = [
    "Admin",
    "Employee",
    "Vendor",
  ];

  final menuItems = [
    for (final role in roles)
      "Dashboard - $role",
  ];

  print(menuItems);
}


// ============================================================================
// ⭐ MASTER FUNCTION CHECKLIST
// ============================================================================
//
// BASIC
//
// [ ] Function
// [ ] Return value
// [ ] void
// [ ] Parameters
// [ ] Return type
//
// PARAMETERS
//
// [ ] Positional
// [ ] Optional positional
// [ ] Named
// [ ] Required named
// [ ] Default values
// [ ] Mixed parameters
//
// SYNTAX
//
// [ ] Arrow function
// [ ] Anonymous function
// [ ] Function expression
// [ ] Function variable
// [ ] Function type
//
// ADVANCED
//
// [ ] First-class function
// [ ] Passing function
// [ ] Returning function
// [ ] Higher-order function
// [ ] Closure
// [ ] Lexical scope
// [ ] Capturing variables
//
// TYPE SYSTEM
//
// [ ] typedef
// [ ] Generic function type
// [ ] Nullable callback
// [ ] Function compatibility
//
// CALLBACKS
//
// [ ] Callback
// [ ] Callback parameters
// [ ] Callback return value
// [ ] Multiple callbacks
// [ ] Class callback
// [ ] Constructor callback
//
// FUNCTIONAL
//
// [ ] map
// [ ] where
// [ ] reduce
// [ ] fold
// [ ] expand
// [ ] composition
// [ ] pure function
// [ ] side effect
//
// FLUTTER
//
// [ ] onPressed
// [ ] onTap
// [ ] onChanged
// [ ] onSubmitted
// [ ] validator
// [ ] custom widget callback
//
// ASYNC
//
// [ ] Future callback
// [ ] Async callback
// [ ] Stream callback
// [ ] Error callback
//
// REAL WORLD
//
// [ ] Search
// [ ] Permission
// [ ] Authentication
// [ ] API
// [ ] Repository
// [ ] Generic callback
//
// ============================================================================
// ⭐ MOST IMPORTANT CONCEPTS TO MASTER
// ============================================================================
//
// 1. Named parameters
// 2. Required parameters
// 3. Arrow functions
// 4. Anonymous functions
// 5. Function variables
// 6. Function types
// 7. typedef
// 8. Callbacks
// 9. Higher-order functions
// 10. Closures
// 11. Returning functions
// 12. Generic callbacks
// 13. Async callbacks
// 14. Flutter callbacks
// 15. Pure functions vs side effects
//
// ============================================================================
// END OF PHASE 14
// ============================================================================
//
// NEXT:
//
// PHASE 15 — NULL SAFETY + SOUND NULL SAFETY
//
// Topics:
//
//   • null
//   • nullable types
//   • non-nullable types
//   • ?
//   • !
//   • ?? 
//   • ??=
//   • late
//   • required
//   • null-aware access
//   • null-aware method calls
//   • null-aware operators
//   • null promotion
//   • type promotion
//   • nullable collections
//   • nullable objects
//   • null safety with classes
//   • null safety with JSON
//   • null safety with API
//   • null safety with Flutter
//   • common null-safety mistakes
//   • production null-safety patterns
//
// ============================================================================


// ============================================================================
// SUPPORTING MODELS USED ABOVE
// ============================================================================
//
// These are placed at the bottom so the examples above remain focused.
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
}


class ErpProduct {
  final String id;
  final String sku;
  final String name;
  final double sellingPrice;
  final int stock;

  const ErpProduct({
    required this.id,
    required this.sku,
    required this.name,
    required this.sellingPrice,
    required this.stock,
  });

  bool get isOutOfStock =>
      stock <= 0;

  bool get isLowStock =>
      stock > 0 && stock <= 5;
}


// ============================================================================
// END
// ============================================================================
