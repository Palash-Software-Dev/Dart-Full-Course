// ============================================================================
// DART MASTER ROADMAP
// PHASE 3 — FUNCTIONS
// ============================================================================
//
// PURPOSE:
// Functions are one of the MOST important concepts in Dart.
//
// Almost everything you build in Flutter and full-stack development will
// depend on functions:
//
//   • Button callbacks
//   • API calls
//   • Form validation
//   • Authentication
//   • Calculations
//   • Data transformation
//   • Business logic
//   • State management
//   • JSON processing
//   • Database operations
//   • Utility/helper functions
//   • Repository/service methods
//   • Event handlers
//
// If you understand functions deeply, learning Flutter becomes much easier.
//
// ============================================================================
//
// PHASE 3 TOPICS:
//
//   1. What is a function?
//   2. Function syntax
//   3. Calling functions
//   4. Return types
//   5. void functions
//   6. Returning values
//   7. Parameters
//   8. Positional parameters
//   9. Multiple parameters
//  10. Optional positional parameters
//  11. Named parameters
//  12. required named parameters
//  13. Default parameters
//  14. Named + default parameters
//  15. Arrow functions
//  16. Anonymous functions
//  17. Function variables
//  18. Function types
//  19. Passing functions as arguments
//  20. Callbacks
//  21. Higher-order functions
//  22. Closures
//  23. Lexical scope
//  24. Local variables
//  25. Global variables
//  26. Recursive functions
//  27. Null-aware function parameters
//  28. Generic function basics
//  29. Real-world Flutter functions
//  30. Real-world ERP/API functions
//
// ============================================================================


// ============================================================================
// 1. WHAT IS A FUNCTION?
// ============================================================================
//
// A function is a reusable block of code that performs a specific task.
//
// Instead of writing the same code repeatedly:
//
//   print("Hello Palash");
//   print("Hello Palash");
//   print("Hello Palash");
//
// We can create one function:
//
//   void sayHello() {
//     print("Hello Palash");
//   }
//
// Then call it whenever necessary.
//
// ============================================================================


// ============================================================================
// 2. BASIC FUNCTION SYNTAX
// ============================================================================
//
// General syntax:
//
//   returnType functionName(parameters) {
//     // function body
//   }
//
// Example:
//
//   void sayHello() {
//     print("Hello");
//   }
//
// Breakdown:
//
//   void       → function does not return a value
//   sayHello   → function name
//   ()         → parameters
//   {}         → function body
//
// ============================================================================

void sayHello() {
  print("Hello Dart");
}


// ============================================================================
// 3. CALLING A FUNCTION
// ============================================================================
//
// Defining a function does NOT execute it.
//
// You must call it.
//
// Syntax:
//
//   functionName();
//
// ============================================================================

void functionCallExample() {
  sayHello();
  sayHello();
  sayHello();
}


// ============================================================================
// 4. WHY FUNCTIONS ARE IMPORTANT
// ============================================================================
//
// Without functions:
//
//   calculate price
//   calculate discount
//   validate email
//   validate password
//   login
//   fetch products
//   logout
//
// could become repeated and difficult-to-maintain code.
//
// With functions:
//
//   calculatePrice()
//   calculateDiscount()
//   validateEmail()
//   validatePassword()
//   login()
//   fetchProducts()
//   logout()
//
// Each task gets its own reusable unit.
//
// This is the foundation of clean architecture.
//
// ============================================================================


// ============================================================================
// 5. VOID FUNCTION
// ============================================================================
//
// void means the function does not return a value.
//
// It performs an action.
//
// ============================================================================

void showMessage() {
  print("Welcome to the application");
}


// ============================================================================
// 6. FUNCTION WITH RETURN VALUE
// ============================================================================
//
// A function can calculate something and return the result.
//
// Example:
//
//   int add(int a, int b) {
//     return a + b;
//   }
//
// ============================================================================

int add(int a, int b) {
  return a + b;
}


// ============================================================================
// 7. USING THE RETURN VALUE
// ============================================================================

void returnValueExample() {
  int result = add(10, 20);

  print(result);

  print(add(50, 100));
}


// ============================================================================
// 8. RETURN TYPES
// ============================================================================
//
// A function can return:
//
//   int
//   double
//   String
//   bool
//   List
//   Map
//   Object
//   custom class
//   Future
//   etc.
//
// Example:
// ============================================================================

String getName() {
  return "Palash";
}


int getAge() {
  return 24;
}


double getPrice() {
  return 999.99;
}


bool isLoggedIn() {
  return true;
}


// ============================================================================
// 9. PARAMETERS
// ============================================================================
//
// Parameters allow a function to receive data.
//
// Example:
//
//   void greet(String name) {
//     print("Hello $name");
//   }
//
// Here:
//
//   String name
//
// is a parameter.
//
// ============================================================================

void greet(String name) {
  print("Hello $name");
}


// ============================================================================
// 10. ARGUMENTS
// ============================================================================
//
// When calling a function, the actual value passed to a parameter is called
// an argument.
//
// Example:
//
//   greet("Palash");
//
// "Palash" is the argument.
//
// ============================================================================

void argumentExample() {
  greet("Palash");
  greet("Rahim");
  greet("Karim");
}


// ============================================================================
// 11. MULTIPLE PARAMETERS
// ============================================================================
//
// A function can have multiple parameters.
//
// ============================================================================

void introduce(String name, int age) {
  print("Name: $name");
  print("Age: $age");
}


void multipleParameterExample() {
  introduce("Palash", 24);
}


// ============================================================================
// 12. MULTIPLE PARAMETERS WITH RETURN
// ============================================================================

double calculateTotal(double price, int quantity) {
  return price * quantity;
}


void calculateTotalExample() {
  double total = calculateTotal(500, 3);

  print(total);
}


// ============================================================================
// 13. FUNCTION WITH DIFFERENT TYPES
// ============================================================================

String createUserLabel(String name, int age) {
  return "$name - $age years old";
}


// ============================================================================
// 14. POSITIONAL PARAMETERS
// ============================================================================
//
// Normal parameters are positional.
//
// Their values are assigned according to their position.
//
// Example:
//
//   void user(String name, int age)
//
// Call:
//
//   user("Palash", 24);
//
// Position:
//
//   "Palash" → name
//   24       → age
//
// ============================================================================

void positionalExample(String name, int age) {
  print(name);
  print(age);
}


// ============================================================================
// 15. POSITION MATTERS
// ============================================================================
//
// WRONG:
//
//   positionalExample(24, "Palash");
//
// Because:
//
//   name expects String
//   age expects int
//
// Correct:
//
//   positionalExample("Palash", 24);
//
// ============================================================================


// ============================================================================
// 16. OPTIONAL POSITIONAL PARAMETERS
// ============================================================================
//
// Dart allows positional parameters to be optional.
//
// Syntax:
//
//   [Type? parameter]
//
// Example:
//
//   void greetUser(String name, [String? title])
//
// ============================================================================

void greetUser(String name, [String? title]) {
  if (title != null) {
    print("Hello $title $name");
  } else {
    print("Hello $name");
  }
}


// ============================================================================
// 17. USING OPTIONAL POSITIONAL PARAMETERS
// ============================================================================

void optionalPositionalExample() {
  greetUser("Palash");

  greetUser(
    "Palash",
    "Mr.",
  );
}


// ============================================================================
// 18. OPTIONAL POSITIONAL PARAMETER WITH DEFAULT VALUE
// ============================================================================
//
// You can give an optional positional parameter a default value.
//
// ============================================================================

void welcomeUser(
  String name, [
  String greeting = "Hello",
]) {
  print("$greeting $name");
}


// ============================================================================
// 19. DEFAULT POSITIONAL PARAMETER EXAMPLE
// ============================================================================

void defaultPositionalExample() {
  welcomeUser("Palash");

  welcomeUser(
    "Palash",
    "Welcome",
  );
}


// ============================================================================
// 20. NAMED PARAMETERS
// ============================================================================
//
// Named parameters are written inside:
//
//   {}
//
// Example:
//
//   void createUser({
//     String? name,
//     int? age,
//   })
//
// Calling:
//
//   createUser(
//     name: "Palash",
//     age: 24,
//   );
//
// Named parameters make code much more readable.
//
// ============================================================================

void createUser({
  String? name,
  int? age,
}) {
  print("Name: $name");
  print("Age: $age");
}


// ============================================================================
// 21. NAMED PARAMETER EXAMPLE
// ============================================================================

void namedParameterExample() {
  createUser(
    name: "Palash",
    age: 24,
  );
}


// ============================================================================
// 22. ORDER DOES NOT MATTER FOR NAMED PARAMETERS
// ============================================================================
//
// With named parameters:
//
//   createUser(
//     age: 24,
//     name: "Palash",
//   );
//
// is also valid.
//
// Because parameters are identified by name.
//
// ============================================================================

void namedOrderExample() {
  createUser(
    age: 24,
    name: "Palash",
  );
}


// ============================================================================
// 23. REQUIRED NAMED PARAMETERS
// ============================================================================
//
// In production Flutter code, required named parameters are extremely
// common.
//
// Syntax:
//
//   required Type parameter
//
// Example:
//
//   void createProduct({
//     required String name,
//     required double price,
//   })
//
// ============================================================================

void createProduct({
  required String name,
  required double price,
}) {
  print("Product: $name");
  print("Price: $price");
}


// ============================================================================
// 24. REQUIRED NAMED PARAMETER EXAMPLE
// ============================================================================

void requiredParameterExample() {
  createProduct(
    name: "Laptop",
    price: 75000,
  );
}


// ============================================================================
// 25. WHY REQUIRED NAMED PARAMETERS ARE IMPORTANT
// ============================================================================
//
// Flutter constructors use this pattern heavily.
//
// Example:
//
//   ProductCard(
//     name: "Laptop",
//     price: 75000,
//   );
//
// This is much easier to read than:
//
//   ProductCard("Laptop", 75000);
//
// Required named parameters also prevent accidentally forgetting important
// values.
//
// ============================================================================


// ============================================================================
// 26. DEFAULT NAMED PARAMETERS
// ============================================================================
//
// Named parameters can have default values.
//
// ============================================================================

void createAccount({
  required String name,
  String role = "user",
  bool isVerified = false,
}) {
  print("Name: $name");
  print("Role: $role");
  print("Verified: $isVerified");
}


// ============================================================================
// 27. DEFAULT NAMED PARAMETER EXAMPLE
// ============================================================================

void defaultNamedExample() {
  createAccount(
    name: "Palash",
  );

  createAccount(
    name: "Rahim",
    role: "admin",
    isVerified: true,
  );
}


// ============================================================================
// 28. NULLABLE NAMED PARAMETERS
// ============================================================================
//
// A named parameter can be nullable.
//
// ============================================================================

void updateProfile({
  required String name,
  String? phone,
  String? address,
}) {
  print("Name: $name");
  print("Phone: $phone");
  print("Address: $address");
}


// ============================================================================
// 29. OPTIONAL + REQUIRED NAMED PARAMETERS
// ============================================================================
//
// This pattern is very common in Flutter.
//
// ============================================================================

void updateProduct({
  required String productId,
  String? name,
  double? price,
  int? stock,
}) {
  print("Product ID: $productId");
  print("Name: $name");
  print("Price: $price");
  print("Stock: $stock");
}


// ============================================================================
// 30. POSITIONAL + NAMED PARAMETERS
// ============================================================================
//
// Dart allows positional parameters before named parameters.
//
// Example:
//
//   void function(
//     String id, {
//     required String name,
//   })
//
// ============================================================================

void findUser(
  String userId, {
  bool includeOrders = false,
}) {
  print("User ID: $userId");
  print("Include orders: $includeOrders");
}


// ============================================================================
// 31. POSITIONAL + NAMED EXAMPLE
// ============================================================================

void positionalNamedExample() {
  findUser(
    "USR001",
    includeOrders: true,
  );
}


// ============================================================================
// 32. ARROW FUNCTIONS
// ============================================================================
//
// If a function contains only ONE expression, Dart allows a shorter syntax.
//
// Normal:
//
//   int square(int number) {
//     return number * number;
//   }
//
// Arrow:
//
//   int square(int number) => number * number;
//
// The => syntax means the expression is returned.
//
// ============================================================================

int square(int number) => number * number;


// ============================================================================
// 33. ARROW FUNCTION EXAMPLES
// ============================================================================

String fullName(String firstName, String lastName) =>
    "$firstName $lastName";


bool isAdult(int age) =>
    age >= 18;


double calculateVat(double amount) =>
    amount * 0.15;


// ============================================================================
// 34. IMPORTANT ARROW FUNCTION RULE
// ============================================================================
//
// Arrow functions are for a SINGLE expression.
//
// You cannot use multiple normal statements inside one => expression.
//
// For complex logic, use:
//
//   {
//     ...
//   }
//
// ============================================================================


// ============================================================================
// 35. ANONYMOUS FUNCTIONS
// ============================================================================
//
// An anonymous function is a function without a name.
//
// Example:
//
//   () {
//     print("Hello");
//   }
//
// Anonymous functions are commonly used as callbacks.
//
// ============================================================================

void anonymousFunctionExample() {
  final sayHello = () {
    print("Hello");
  };

  sayHello();
}


// ============================================================================
// 36. ANONYMOUS FUNCTION WITH PARAMETER
// ============================================================================

void anonymousParameterExample() {
  final greet = (String name) {
    print("Hello $name");
  };

  greet("Palash");
}


// ============================================================================
// 37. ANONYMOUS FUNCTION WITH RETURN VALUE
// ============================================================================

void anonymousReturnExample() {
  final addNumbers = (int a, int b) {
    return a + b;
  };

  print(addNumbers(10, 20));
}


// ============================================================================
// 38. FUNCTION AS A VARIABLE
// ============================================================================
//
// Functions can be stored inside variables.
//
// ============================================================================

void functionVariableExample() {
  int addNumbers(int a, int b) {
    return a + b;
  }

  final operation = addNumbers;

  print(operation(10, 20));
}


// ============================================================================
// 39. FUNCTION TYPE
// ============================================================================
//
// You can explicitly define the type of a function.
//
// Syntax:
//
//   ReturnType Function(ParameterTypes)
//
// Example:
//
//   int Function(int, int)
//
// means:
//
//   A function that:
//     accepts two int values
//     returns an int
//
// ============================================================================

void functionTypeExample() {
  int addNumbers(int a, int b) {
    return a + b;
  }

  int Function(int, int) operation = addNumbers;

  print(operation(10, 20));
}


// ============================================================================
// 40. DIFFERENT FUNCTIONS — SAME FUNCTION TYPE
// ============================================================================

int multiplyNumbers(int a, int b) {
  return a * b;
}


int subtractNumbers(int a, int b) {
  return a - b;
}


void sameFunctionTypeExample() {
  int Function(int, int) operation;

  operation = multiplyNumbers;

  print(operation(5, 4));

  operation = subtractNumbers;

  print(operation(10, 4));
}


// ============================================================================
// 41. PASSING FUNCTION AS ARGUMENT
// ============================================================================
//
// Functions can be passed into other functions.
//
// This is extremely important for:
//
//   • Callbacks
//   • Flutter events
//   • State management
//   • List processing
//   • Async operations
//
// ============================================================================

void executeOperation(
  int a,
  int b,
  int Function(int, int) operation,
) {
  print(operation(a, b));
}


// ============================================================================
// 42. FUNCTION AS ARGUMENT EXAMPLE
// ============================================================================

void functionArgumentExample() {
  executeOperation(
    10,
    5,
    add,
  );

  executeOperation(
    10,
    5,
    multiplyNumbers,
  );
}


// ============================================================================
// 43. CALLBACK
// ============================================================================
//
// A callback is a function passed to another function so that it can be
// executed later or at a particular point.
//
// ============================================================================

void performTask(
  String task,
  void Function() onComplete,
) {
  print("Performing: $task");

  onComplete();
}


// ============================================================================
// 44. CALLBACK EXAMPLE
// ============================================================================

void callbackExample() {
  performTask(
    "Downloading data",
    () {
      print("Task completed");
    },
  );
}


// ============================================================================
// 45. CALLBACK IN FLUTTER
// ============================================================================
//
// Flutter uses callbacks everywhere.
//
// Common examples:
//
//   onPressed
//   onTap
//   onChanged
//   onSubmitted
//   onSelected
//   onRefresh
//
// Example:
//
//   ElevatedButton(
//     onPressed: () {
//       print("Button clicked");
//     },
//     child: const Text("Login"),
//   );
//
// onPressed receives a function.
//
// ============================================================================


// ============================================================================
// 46. CALLBACK WITH PARAMETER
// ============================================================================
//
// A callback can receive information.
//
// ============================================================================

void processUser(
  String name,
  void Function(String) onComplete,
) {
  print("Processing $name");

  onComplete(name);
}


// ============================================================================
// 47. CALLBACK WITH PARAMETER EXAMPLE
// ============================================================================

void callbackParameterExample() {
  processUser(
    "Palash",
    (name) {
      print("$name processed successfully");
    },
  );
}


// ============================================================================
// 48. HIGHER-ORDER FUNCTIONS
// ============================================================================
//
// A higher-order function is a function that:
//
//   • Takes another function as an argument
//   OR
//   • Returns a function
//
// Example of taking a function:
//
//   executeOperation(..., add)
//
// ============================================================================


// ============================================================================
// 49. HIGHER-ORDER FUNCTION THAT RETURNS A FUNCTION
// ============================================================================

int Function(int) createMultiplier(int multiplier) {
  return (int number) {
    return number * multiplier;
  };
}


// ============================================================================
// 50. USING THE RETURNED FUNCTION
// ============================================================================

void higherOrderReturnExample() {
  final doubleValue = createMultiplier(2);

  final tripleValue = createMultiplier(3);

  print(doubleValue(10)); // 20
  print(tripleValue(10)); // 30
}


// ============================================================================
// 51. CLOSURE
// ============================================================================
//
// A closure is a function that remembers variables from the surrounding
// scope even after the surrounding function has finished executing.
//
// This is a powerful concept.
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
// 52. CLOSURE EXAMPLE
// ============================================================================

void closureExample() {
  final counter = createCounter();

  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}


// ============================================================================
// 53. WHY CLOSURES MATTER
// ============================================================================
//
// Closures are useful for:
//
//   • Maintaining state
//   • Callbacks
//   • Functional programming
//   • Event handlers
//   • Creating configurable functions
//
// You will encounter the concept again when learning advanced Dart and
// Flutter patterns.
//
// ============================================================================


// ============================================================================
// 54. LEXICAL SCOPE
// ============================================================================
//
// Scope determines where a variable can be accessed.
//
// A variable declared inside a function is normally accessible only inside
// that function.
//
// ============================================================================

void scopeExample() {
  String message = "Hello";

  print(message);
}


// ============================================================================
// 55. LOCAL VARIABLE
// ============================================================================
//
// message exists only inside scopeExample().
//
// You cannot directly access it from another function.
//
// ============================================================================


// ============================================================================
// 56. GLOBAL VARIABLE
// ============================================================================
//
// A variable declared outside functions can be accessed from multiple
// places, depending on its visibility.
//
// ============================================================================

const String appName = "My ERP";


void globalVariableExample() {
  print(appName);
}


// ============================================================================
// 57. LOCAL VS GLOBAL
// ============================================================================
//
// Prefer local variables when data is only needed locally.
//
// Avoid unnecessary mutable global variables in large applications.
//
// Global mutable state can make applications difficult to understand,
// test and maintain.
//
// In Flutter, structured state-management patterns are generally preferred.
//
// ============================================================================


// ============================================================================
// 58. VARIABLE SHADOWING
// ============================================================================
//
// A local variable can have the same name as a variable from an outer scope.
//
// The inner variable "shadows" the outer variable.
//
// ============================================================================

String name = "Global";


void shadowingExample() {
  String name = "Local";

  print(name);
}


// ============================================================================
// 59. RECURSIVE FUNCTION
// ============================================================================
//
// A recursive function calls itself.
//
// Every recursive function needs a base condition so that it eventually
// stops.
//
// ============================================================================

int factorial(int number) {
  if (number <= 1) {
    return 1;
  }

  return number * factorial(number - 1);
}


// ============================================================================
// 60. RECURSION EXAMPLE
// ============================================================================

void recursionExample() {
  print(factorial(5));

  // 5 * 4 * 3 * 2 * 1
  //
  // Result:
  // 120
}


// ============================================================================
// 61. RECURSION WARNING
// ============================================================================
//
// Recursion is useful for some problems, but it is not automatically better
// than loops.
//
// For large/simple repetitive operations, an iterative solution may be
// easier and safer.
//
// ============================================================================


// ============================================================================
// 62. NULLABLE FUNCTION PARAMETER
// ============================================================================
//
// A parameter can accept null by using ?.
//
// ============================================================================

void printPhone(String? phone) {
  if (phone == null) {
    print("No phone number");
  } else {
    print("Phone: $phone");
  }
}


// ============================================================================
// 63. NULLABLE PARAMETER EXAMPLE
// ============================================================================

void nullableParameterExample() {
  printPhone(null);

  printPhone("01700000000");
}


// ============================================================================
// 64. NULLABLE RETURN TYPE
// ============================================================================
//
// A function can return null by using ?.
//
// ============================================================================

String? findUsername(bool found) {
  if (found) {
    return "Palash";
  }

  return null;
}


// ============================================================================
// 65. NULLABLE RETURN EXAMPLE
// ============================================================================

void nullableReturnExample() {
  final username = findUsername(false);

  print(username ?? "Guest");
}


// ============================================================================
// 66. FUNCTION WITH MAP RETURN
// ============================================================================
//
// Functions can return complex data structures.
//
// ============================================================================

Map<String, dynamic> createUserData() {
  return {
    "id": "USR001",
    "name": "Palash",
    "role": "admin",
    "isVerified": true,
  };
}


// ============================================================================
// 67. FUNCTION WITH LIST RETURN
// ============================================================================

List<String> getSkills() {
  return [
    "Dart",
    "Flutter",
    "Node.js",
    "MongoDB",
  ];
}


// ============================================================================
// 68. FUNCTION THAT FILTERS DATA
// ============================================================================
//
// This is a basic example of business logic.
//
// ============================================================================

List<int> getEvenNumbers(List<int> numbers) {
  final result = <int>[];

  for (final number in numbers) {
    if (number % 2 == 0) {
      result.add(number);
    }
  }

  return result;
}


// ============================================================================
// 69. FILTER FUNCTION EXAMPLE
// ============================================================================

void filterExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  final evenNumbers = getEvenNumbers(numbers);

  print(evenNumbers);
}


// ============================================================================
// 70. FUNCTION FOR PRODUCT TOTAL
// ============================================================================

double calculateProductTotal({
  required double price,
  required int quantity,
}) {
  return price * quantity;
}


// ============================================================================
// 71. FUNCTION FOR DISCOUNT
// ============================================================================

double calculateDiscount({
  required double subtotal,
  required double discountPercent,
}) {
  return subtotal * discountPercent / 100;
}


// ============================================================================
// 72. FUNCTION FOR FINAL PRICE
// ============================================================================

double calculateFinalPrice({
  required double subtotal,
  required double discountPercent,
}) {
  final discount =
      calculateDiscount(
        subtotal: subtotal,
        discountPercent: discountPercent,
      );

  return subtotal - discount;
}


// ============================================================================
// 73. BUSINESS LOGIC EXAMPLE
// ============================================================================

void pricingExample() {
  final subtotal = calculateProductTotal(
    price: 500,
    quantity: 3,
  );

  final finalPrice = calculateFinalPrice(
    subtotal: subtotal,
    discountPercent: 10,
  );

  print("Subtotal: $subtotal");
  print("Final price: $finalPrice");
}


// ============================================================================
// 74. FUNCTION FOR STOCK VALIDATION
// ============================================================================
//
// In your ERP, negative stock should not be allowed.
//
// ============================================================================

bool hasEnoughStock({
  required int availableStock,
  required int requestedQuantity,
}) {
  if (availableStock < 0) {
    return false;
  }

  return availableStock >= requestedQuantity;
}


// ============================================================================
// 75. STOCK VALIDATION EXAMPLE
// ============================================================================

void stockValidationExample() {
  final canSell = hasEnoughStock(
    availableStock: 10,
    requestedQuantity: 5,
  );

  print(canSell);
}


// ============================================================================
// 76. FUNCTION FOR EMAIL VALIDATION
// ============================================================================
//
// This is a simple learning example.
//
// Real production validation can be more sophisticated.
//
// ============================================================================

bool isValidEmail(String email) {
  return email.contains("@") &&
      email.contains(".");
}


// ============================================================================
// 77. FUNCTION FOR PASSWORD VALIDATION
// ============================================================================

bool isValidPassword(String password) {
  return password.length >= 6;
}


// ============================================================================
// 78. FORM VALIDATION FUNCTION
// ============================================================================

bool isValidLoginForm({
  required String email,
  required String password,
}) {
  if (!isValidEmail(email)) {
    return false;
  }

  if (!isValidPassword(password)) {
    return false;
  }

  return true;
}


// ============================================================================
// 79. API-LIKE FUNCTION
// ============================================================================
//
// In real Flutter applications, API functions will later become async and
// return Future.
//
// For now, this example focuses only on function structure.
//
// ============================================================================

Map<String, dynamic> createApiResponse({
  required bool success,
  required String message,
  dynamic data,
}) {
  return {
    "success": success,
    "message": message,
    "data": data,
  };
}


// ============================================================================
// 80. API RESPONSE EXAMPLE
// ============================================================================

void apiResponseFunctionExample() {
  final response = createApiResponse(
    success: true,
    message: "User created successfully",
    data: {
      "id": "USR001",
      "name": "Palash",
    },
  );

  print(response);
}


// ============================================================================
// 81. FUNCTION COMPOSITION
// ============================================================================
//
// One function can call another function.
//
// This allows large business logic to be divided into smaller pieces.
//
// ============================================================================

double calculateOrderTotal({
  required double price,
  required int quantity,
  required double discountPercent,
}) {
  final subtotal = calculateProductTotal(
    price: price,
    quantity: quantity,
  );

  return calculateFinalPrice(
    subtotal: subtotal,
    discountPercent: discountPercent,
  );
}


// ============================================================================
// 82. FUNCTION COMPOSITION EXAMPLE
// ============================================================================

void functionCompositionExample() {
  final total = calculateOrderTotal(
    price: 1000,
    quantity: 2,
    discountPercent: 10,
  );

  print(total);
}


// ============================================================================
// 83. FUNCTION RETURNING BOOLEAN
// ============================================================================
//
// Boolean-returning functions are excellent for business rules.
//
// Example:
//
//   if (canAccessDashboard(user)) {
//     ...
//   }
//
// ============================================================================

bool canAccessDashboard({
  required bool isLoggedIn,
  required bool isBlocked,
}) {
  return isLoggedIn && !isBlocked;
}


// ============================================================================
// 84. FUNCTION + IF
// ============================================================================

void dashboardAccessExample() {
  final access = canAccessDashboard(
    isLoggedIn: true,
    isBlocked: false,
  );

  if (access) {
    print("Open Dashboard");
  } else {
    print("Access denied");
  }
}


// ============================================================================
// 85. FUNCTION WITH CALLBACK — FLUTTER STYLE
// ============================================================================
//
// This pattern is extremely important.
//
// ============================================================================

void saveUser({
  required String name,
  required void Function(Map<String, dynamic>) onSuccess,
  required void Function(String) onError,
}) {
  if (name.isEmpty) {
    onError("Name is required");
    return;
  }

  final user = {
    "name": name,
  };

  onSuccess(user);
}


// ============================================================================
// 86. CALLBACK FUNCTION EXAMPLE
// ============================================================================

void saveUserExample() {
  saveUser(
    name: "Palash",

    onSuccess: (user) {
      print("User saved: $user");
    },

    onError: (message) {
      print("Error: $message");
    },
  );
}


// ============================================================================
// 87. EARLY RETURN
// ============================================================================
//
// return can be used to stop a function early.
//
// This is called an early return.
//
// It often makes validation/business logic cleaner.
//
// ============================================================================

bool canPurchase({
  required bool isLoggedIn,
  required int stock,
  required int quantity,
}) {
  if (!isLoggedIn) {
    return false;
  }

  if (stock <= 0) {
    return false;
  }

  if (quantity <= 0) {
    return false;
  }

  if (quantity > stock) {
    return false;
  }

  return true;
}


// ============================================================================
// 88. EARLY RETURN EXAMPLE
// ============================================================================

void purchaseExample() {
  final allowed = canPurchase(
    isLoggedIn: true,
    stock: 10,
    quantity: 3,
  );

  print(allowed);
}


// ============================================================================
// 89. GENERIC FUNCTION — BASIC INTRODUCTION
// ============================================================================
//
// Generics allow a function/class to work with different types while
// preserving type safety.
//
// Example:
//
//   T identity<T>(T value) {
//     return value;
//   }
//
// Here T represents a type.
//
// ============================================================================

T identity<T>(T value) {
  return value;
}


// ============================================================================
// 90. GENERIC FUNCTION EXAMPLE
// ============================================================================

void genericFunctionExample() {
  final String name = identity<String>("Palash");

  final int age = identity<int>(24);

  final double price = identity<double>(99.99);

  print(name);
  print(age);
  print(price);
}


// ============================================================================
// 91. TYPE INFERENCE WITH GENERIC FUNCTION
// ============================================================================
//
// Dart can often infer the generic type.
//
// Therefore:
//
//   identity("Palash")
//
// automatically becomes:
//
//   identity<String>("Palash")
//
// ============================================================================

void genericInferenceExample() {
  final name = identity("Palash");

  final age = identity(24);

  print(name);
  print(age);
}


// ============================================================================
// 92. PRACTICAL FUNCTION DESIGN
// ============================================================================
//
// A good function should generally:
//
//   • Have one clear responsibility
//   • Have a meaningful name
//   • Use appropriate types
//   • Avoid unnecessary global state
//   • Return useful results
//   • Be easy to test
//   • Avoid excessive complexity
//
// Example of GOOD design:
//
//   calculateFinalPrice()
//
// Instead of:
//
//   doStuff()
//
// ============================================================================


// ============================================================================
// 93. BAD FUNCTION EXAMPLE
// ============================================================================
//
// Avoid functions that do too many unrelated tasks.
//
// BAD:
//
//   processEverything()
//
// that:
//
//   • validates user
//   • saves database
//   • sends email
//   • calculates price
//   • updates stock
//   • prints UI
//
// Better:
//
//   validateUser()
//   calculatePrice()
//   saveUser()
//   updateStock()
//   sendEmail()
//
// Later, a service/use-case layer can coordinate these functions.
//
// ============================================================================


// ============================================================================
// 94. FLUTTER onPressed EXAMPLE
// ============================================================================
//
// In Flutter:
//
//   ElevatedButton(
//     onPressed: login,
//     child: const Text("Login"),
//   );
//
// Here login is a function.
//
// Example:
//
// ============================================================================

void login() {
  print("Login clicked");
}


// ============================================================================
// 95. FLUTTER onChanged STYLE
// ============================================================================
//
// A callback can receive a value.
//
// Example concept:
//
//   onChanged: (value) {
//     print(value);
//   }
//
// The callback's parameter type depends on the widget/API.
//
// ============================================================================

void handleSearch(String query) {
  print("Searching for: $query");
}


// ============================================================================
// 96. FUNCTION TYPE FOR CALLBACK
// ============================================================================
//
// If a callback accepts String and returns nothing:
//
//   void Function(String)
//
// If it accepts int and returns bool:
//
//   bool Function(int)
//
// If it accepts two ints and returns double:
//
//   double Function(int, int)
//
// ============================================================================


// ============================================================================
// 97. MULTIPLE CALLBACKS
// ============================================================================
//
// A function can receive multiple callbacks.
//
// This is common in service/UI communication.
//
// ============================================================================

void performRequest({
  required void Function() onLoading,
  required void Function(String) onSuccess,
  required void Function(String) onError,
}) {
  onLoading();

  // Simulated successful result.
  onSuccess("Request completed");
}


// ============================================================================
// 98. MULTIPLE CALLBACK EXAMPLE
// ============================================================================

void performRequestExample() {
  performRequest(
    onLoading: () {
      print("Loading...");
    },

    onSuccess: (message) {
      print(message);
    },

    onError: (error) {
      print(error);
    },
  );
}


// ============================================================================
// 99. PHASE 3 QUICK REVISION
// ============================================================================
//
// BASIC:
//
//   void functionName() {}
//
// RETURN:
//
//   int functionName() {
//     return 10;
//   }
//
// PARAMETER:
//
//   void greet(String name) {}
//
// OPTIONAL POSITIONAL:
//
//   void greet(String name, [String? title]) {}
//
// NAMED:
//
//   void createUser({
//     String? name,
//     int? age,
//   }) {}
//
// REQUIRED NAMED:
//
//   void createUser({
//     required String name,
//   }) {}
//
// DEFAULT:
//
//   void createUser({
//     String role = "user",
//   }) {}
//
// ARROW:
//
//   int square(int x) => x * x;
//
// ANONYMOUS:
//
//   final greet = (String name) {
//     print(name);
//   };
//
// FUNCTION TYPE:
//
//   int Function(int, int)
//
// CALLBACK:
//
//   void Function(String)
//
// HIGHER-ORDER FUNCTION:
//
//   Function that accepts or returns another function.
//
// CLOSURE:
//
//   Function remembers variables from its surrounding scope.
//
// RECURSION:
//
//   Function calls itself.
//
// ============================================================================


// ============================================================================
// 100. PHASE 3 — PRACTICE TASK 1
// ============================================================================
//
// Create:
//
//   int add(int a, int b)
//
//   int subtract(int a, int b)
//
//   int multiply(int a, int b)
//
//   double divide(double a, double b)
//
// Then test all functions.
//
// ============================================================================


// ============================================================================
// 101. PHASE 3 — PRACTICE TASK 2
// ============================================================================
//
// Create:
//
//   double calculateDiscount({
//     required double price,
//     required double discountPercent,
//   })
//
// Return the discount amount.
//
// Then create:
//
//   double calculateFinalPrice(...)
//
// Return the final price.
//
// ============================================================================


// ============================================================================
// 102. PHASE 3 — PRACTICE TASK 3
// ============================================================================
//
// Create:
//
//   bool isValidUser({
//     required String email,
//     required String password,
//   })
//
// Rules:
//
//   • Email cannot be empty.
//   • Email must contain "@"
//   • Password must contain at least 6 characters.
//
// Return true/false.
//
// ============================================================================


// ============================================================================
// 103. PHASE 3 — PRACTICE TASK 4
// ============================================================================
//
// Create:
//
//   List<int> getEvenNumbers(List<int> numbers)
//
// Return only even numbers.
//
// Example:
//
//   [1,2,3,4,5,6]
//
// Result:
//
//   [2,4,6]
//
// ============================================================================


// ============================================================================
// 104. PHASE 3 — PRACTICE TASK 5
// ============================================================================
//
// Create a function:
//
//   void processOrder({
//     required String orderId,
//     required void Function(String) onSuccess,
//     required void Function(String) onError,
//   })
//
// If orderId is empty:
//
//   onError()
//
// Otherwise:
//
//   onSuccess()
//
// ============================================================================


// ============================================================================
// 105. PHASE 3 — PRACTICE TASK 6
// ============================================================================
//
// Create:
//
//   Function createCounter()
//
// The returned function should increase an internal counter every time
// it is called.
//
// Expected:
//
//   counter() → 1
//   counter() → 2
//   counter() → 3
//   counter() → 4
//
// This task tests closures.
//
// ============================================================================


// ============================================================================
// 106. PHASE 3 — PRACTICE TASK 7
// ============================================================================
//
// Create a generic function:
//
//   T firstItem<T>(List<T> items)
//
// Return the first item.
//
// Test it with:
//
//   List<String>
//   List<int>
//   List<double>
//
// ============================================================================


// ============================================================================
// 107. PHASE 3 — PRACTICE TASK 8
// ============================================================================
//
// Build a small ERP pricing system using functions.
//
// Create functions:
//
//   calculateSubtotal()
//   calculateDiscount()
//   calculateTax()
//   calculateFinalTotal()
//
// Then compose them into:
//
//   calculateOrderTotal()
//
// Requirements:
//
//   • price
//   • quantity
//   • discount percentage
//   • tax percentage
//
// Print:
//
//   Subtotal
//   Discount
//   Tax
//   Final Total
//
// ============================================================================


// ============================================================================
// 108. PHASE 3 — PRACTICE TASK 9
// ============================================================================
//
// Build a permission system.
//
// Create:
//
//   bool canCreateProduct(String role)
//   bool canUpdateProduct(String role)
//   bool canDeleteProduct(String role)
//   bool canViewReports(String role)
//
// Test with:
//
//   admin
//   employee
//   vendor
//
// ============================================================================


// ============================================================================
// 109. PHASE 3 — PRACTICE TASK 10
// ============================================================================
//
// Build a Flutter-style menu generator:
//
//   List<String> generateMenu({
//     required String role,
//     required bool isLoggedIn,
//   })
//
// Rules:
//
//   Not logged in:
//       Login
//
//   Admin:
//       Dashboard
//       Products
//       Orders
//       Users
//       Reports
//
//   Employee:
//       Dashboard
//       Products
//       Orders
//
//   Vendor:
//       Dashboard
//       Products
//
// ============================================================================


// ============================================================================
// 110. PHASE 3 FINAL GOAL
// ============================================================================
//
// By the end of Phase 3, you should be comfortable writing code like:
//
//
//   double calculateFinalTotal({
//     required double price,
//     required int quantity,
//     double discountPercent = 0,
//   }) {
//     final subtotal = price * quantity;
//
//     final discount =
//         subtotal * discountPercent / 100;
//
//     return subtotal - discount;
//   }
//
//
//
// And callback-based code like:
//
//
//   void saveProduct({
//     required String name,
//     required void Function(String) onSuccess,
//     required void Function(String) onError,
//   }) {
//
//     if (name.isEmpty) {
//       onError("Product name is required");
//       return;
//     }
//
//     onSuccess("Product saved successfully");
//   }
//
//
//
// And function composition like:
//
//
//   final total = calculateOrderTotal(
//     price: 1000,
//     quantity: 3,
//     discountPercent: 10,
//   );
//
//
//
// These concepts will directly prepare you for:
//
//   Flutter widgets
//   Widget callbacks
//   State management
//   API services
//   Repository methods
//   Authentication services
//   Validation
//   Business logic
//   Data processing
//   Async functions
//   Classes & OOP
//
// ============================================================================


// ============================================================================
// IMPORTANT
// ============================================================================
//
// DO NOT move to advanced Dart just by memorizing syntax.
//
// Before Phase 4, practice writing functions from memory.
//
// You should be able to create:
//
//   ✓ Simple functions
//   ✓ Functions with return values
//   ✓ Positional parameters
//   ✓ Optional parameters
//   ✓ Named parameters
//   ✓ Required parameters
//   ✓ Default parameters
//   ✓ Arrow functions
//   ✓ Anonymous functions
//   ✓ Function variables
//   ✓ Callbacks
//   ✓ Higher-order functions
//   ✓ Closures
//   ✓ Basic generic functions
//
// ============================================================================


// ============================================================================
// END OF DART PHASE 3
// ============================================================================
//
// NEXT:
//
// PHASE 4 — DART COLLECTIONS & FUNCTIONAL PROGRAMMING
//
// Topics will include:
//
//   • List deeply
//   • Set deeply
//   • Map deeply
//   • Iterable
//   • where()
//   • map()
//   • reduce()
//   • fold()
//   • firstWhere()
//   • singleWhere()
//   • any()
//   • every()
//   • contains()
//   • take()
//   • skip()
//   • expand()
//   • forEach()
//   • sort()
//   • whereType()
//   • collection transformations
//   • spread operator (...)
//   • null-aware spread (...?)
//   • collection-if
//   • collection-for
//   • practical JSON/API data processing
//   • Flutter list-building patterns
//
// ============================================================================