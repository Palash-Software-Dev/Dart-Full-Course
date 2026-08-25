// ============================================================================
// DART MASTER ROADMAP
// PHASE 1 — DART FUNDAMENTALS
// ============================================================================
//
// PURPOSE:
// This phase builds the foundation required for Flutter and Full-Stack
// Flutter development.
//
// After completing Phase 1, you should understand:
//   • Dart program structure
//   • Variables and constants
//   • Basic data types
//   • Type inference
//   • Strings and interpolation
//   • Operators
//   • Collections
//   • Type conversion
//   • Dynamic and Object
//   • Basic null safety
//   • Basic API/JSON-like data structures
//
// ============================================================================


// ============================================================================
// 1. DART PROGRAM STRUCTURE
// ============================================================================
//
// Dart program execution starts from the main() function.
//
// main() = Entry point of a Dart application.
//
// void = This function does not return a value.
//
// print() = Displays output in the console.
//
// Example:
// ============================================================================

void main() {
  print("Hello World");
  print("Welcome to Dart");

  // The code inside main() executes from top to bottom.
}


// ============================================================================
// 2. COMMENTS
// ============================================================================
//
// Comments are ignored by Dart during program execution.
//
// They are used to:
//   • Explain code
//   • Document logic
//   • Leave notes for developers
//   • Temporarily disable code
//
// --------------------------------------------------------------------------
// Single-line comment
// --------------------------------------------------------------------------

// This is a single-line comment.

// --------------------------------------------------------------------------
// Multi-line comment
// --------------------------------------------------------------------------

/*
  This is a multi-line comment.

  You can write multiple
  lines inside it.
*/


// ============================================================================
// 3. VARIABLES
// ============================================================================
//
// A variable is a named storage location used to hold data.
//
// Syntax:
//
//   DataType variableName = value;
//
// Example:
//
//   String name = "Palash";
//
// Here:
//   String → Data type
//   name   → Variable name
//   "Palash" → Value
//
// ============================================================================

void variablesExample() {
  String name = "Palash";
  int age = 24;
  double cgpa = 3.50;
  bool isStudent = true;

  print(name);
  print(age);
  print(cgpa);
  print(isStudent);
}


// ============================================================================
// 4. COMMON DART DATA TYPES
// ============================================================================
//
// Dart has many types. The most important basic types are:
//
//   String  → Text
//   int     → Whole numbers
//   double  → Decimal numbers
//   bool    → true / false
//   List    → Ordered collection
//   Set     → Unique collection
//   Map     → Key-value collection
//   dynamic → Can hold different types
//   Object  → Base type for Dart objects
//
// ============================================================================


// ============================================================================
// 5. STRING
// ============================================================================
//
// String is used to store text.
//
// Both single and double quotes can be used.
//
// Examples:
// ============================================================================

void stringExample() {
  String name = "Palash";
  String country = 'Bangladesh';
  String university = "Feni University";

  print(name);
  print(country);
  print(university);
}


// ============================================================================
// 6. INT
// ============================================================================
//
// int stores whole numbers.
//
// Examples:
//   10
//   100
//   -50
//   2026
//
// Decimal values cannot be stored in int.
//
// ============================================================================

void intExample() {
  int age = 24;
  int salary = 50000;
  int year = 2026;

  print(age);
  print(salary);
  print(year);

  // int number = 10.5; // ERROR
}


// ============================================================================
// 7. DOUBLE
// ============================================================================
//
// double stores decimal numbers.
//
// Examples:
//   10.5
//   99.99
//   3.50
//
// ============================================================================

void doubleExample() {
  double price = 999.99;
  double cgpa = 3.50;

  print(price);
  print(cgpa);
}


// ============================================================================
// 8. BOOL
// ============================================================================
//
// bool has only two possible values:
//
//   true
//   false
//
// It is commonly used for:
//   • Login status
//   • Admin status
//   • Verification status
//   • Loading state
//   • Permission checks
//   • Feature availability
//
// ============================================================================

void boolExample() {
  bool isLoggedIn = true;
  bool isAdmin = false;
  bool isVerified = true;

  print(isLoggedIn);
  print(isAdmin);
  print(isVerified);
}


// ============================================================================
// 9. VAR
// ============================================================================
//
// var allows Dart to infer the type automatically.
//
// Example:
//
//   var name = "Palash";
//
// Dart understands that name is a String.
//
// IMPORTANT:
// var does NOT mean "any type".
//
// Once Dart determines the type, the variable remains that type.
//
// ============================================================================

void varExample() {
  var name = "Palash";
  var age = 24;
  var price = 99.99;
  var isActive = true;

  print(name);
  print(age);
  print(price);
  print(isActive);

  // name = 100; // ERROR
}


// ============================================================================
// 10. TYPE INFERENCE
// ============================================================================
//
// Type inference means Dart automatically determines a variable's type.
//
// Example:
//
//   var name = "Palash";
//
// Dart infers:
//
//   name → String
//
// Similarly:
//
//   var age = 24;
//   age → int
//
//   var price = 99.99;
//   price → double
//
//   var active = true;
//   active → bool
//
// ============================================================================


// ============================================================================
// 11. FINAL
// ============================================================================
//
// final means a variable can be assigned only once.
//
// The value can be determined at runtime.
//
// Example:
// ============================================================================

void finalExample() {
  final String name = "Palash";

  print(name);

  // name = "Rahim"; // ERROR
}


// ============================================================================
// FINAL WITH RUNTIME VALUE
// ============================================================================
//
// final is useful when the value is unknown until runtime.
//
// Example:
// DateTime.now() is evaluated while the program runs.
//
// ============================================================================

void finalRuntimeExample() {
  final currentTime = DateTime.now();

  print(currentTime);
}


// ============================================================================
// 12. CONST
// ============================================================================
//
// const means compile-time constant.
//
// The value must be known at compile time.
//
// Examples:
//
//   const String appName = "My ERP";
//   const double pi = 3.14159;
//
// const values cannot be changed.
//
// ============================================================================

void constExample() {
  const String appName = "My ERP";
  const double pi = 3.14159;

  print(appName);
  print(pi);

  // appName = "Another App"; // ERROR
}


// ============================================================================
// FINAL VS CONST
// ============================================================================
//
// final:
//   • Assigned only once
//   • Can contain runtime values
//
// const:
//   • Compile-time constant
//   • Must be known during compilation
//
// Example:
//
//   final time = DateTime.now(); // VALID
//
//   const time = DateTime.now(); // ERROR
//
// Flutter connection:
//
//   const Text("Hello")
//
// is commonly used because the widget can be created as a compile-time
// constant when all of its required values are constant.
//
// ============================================================================


// ============================================================================
// 13. STRING INTERPOLATION
// ============================================================================
//
// String interpolation allows variables to be inserted into a String.
//
// Use:
//
//   $variable
//
// Example:
// ============================================================================

void stringInterpolationExample() {
  String name = "Palash";
  int age = 24;

  print("My name is $name");
  print("I am $age years old");
}


// ============================================================================
// 14. STRING INTERPOLATION WITH EXPRESSIONS
// ============================================================================
//
// If you need to execute an expression inside a String,
// use:
//
//   ${expression}
//
// Example:
// ============================================================================

void stringExpressionExample() {
  int age = 24;

  print("Next year I will be ${age + 1}");

  int a = 10;
  int b = 20;

  print("Sum = ${a + b}");
  print("Product = ${a * b}");
}


// ============================================================================
// 15. ARITHMETIC OPERATORS
// ============================================================================
//
// Dart supports:
//
//   +   Addition
//   -   Subtraction
//   *   Multiplication
//   /   Division
//   ~/  Integer division
//   %   Remainder / Modulo
//
// ============================================================================

void arithmeticExample() {
  int a = 10;
  int b = 3;

  print(a + b); // 13
  print(a - b); // 7
  print(a * b); // 30
  print(a / b); // 3.333...
  print(a ~/ b); // 3
  print(a % b); // 1
}


// ============================================================================
// 16. COMPARISON OPERATORS
// ============================================================================
//
// Comparison operators return bool.
//
//   ==  Equal
//   !=  Not equal
//   >   Greater than
//   <   Less than
//   >=  Greater than or equal
//   <=  Less than or equal
//
// ============================================================================

void comparisonExample() {
  int a = 10;
  int b = 20;

  print(a == b); // false
  print(a != b); // true
  print(a > b); // false
  print(a < b); // true
  print(a >= b); // false
  print(a <= b); // true
}


// ============================================================================
// 17. LOGICAL OPERATORS
// ============================================================================
//
// Logical operators are used to combine conditions.
//
//   &&  AND
//       Both conditions must be true.
//
//   ||  OR
//       At least one condition must be true.
//
//   !   NOT
//       Reverses true/false.
//
// ============================================================================

void logicalExample() {
  bool condition1 = true;
  bool condition2 = false;

  print(condition1 && condition2); // false
  print(condition1 || condition2); // true
  print(!condition1); // false
}



// ============================================================================
// 18. ASSIGNMENT OPERATORS
// ============================================================================
//
// Basic assignment:
//
//   =
//
// Compound assignment:
//
//   +=
//   -=
//   *=
//   ~/=
//
// ============================================================================

void assignmentExample() {
  int count = 10;

  count += 5;
  print(count); // 15

  count -= 2;
  print(count); // 13

  count *= 2;
  print(count); // 26

  count ~/= 2;
  print(count); // 13
}


// ============================================================================
// 19. INCREMENT / DECREMENT
// ============================================================================
//
// ++ increases a value by 1.
//
// -- decreases a value by 1.
//
// ============================================================================

void incrementExample() {
  int count = 10;

  count++;
  print(count); // 11

  count--;
  print(count); // 10
}


// ============================================================================
// 20. LIST
// ============================================================================
//
// List is an ordered collection.
//
// List uses zero-based indexing.
//
// Example:
//
//   index 0 → first item
//   index 1 → second item
//   index 2 → third item
//
// ============================================================================

void listExample() {
  List<String> skills = [
    "Dart",
    "Flutter",
    "Node.js",
    "MongoDB",
  ];

  print(skills);

  print(skills[0]); // Dart
  print(skills[1]); // Flutter

  print(skills.length);
  print(skills.first);
  print(skills.last);

  print(skills.contains("Flutter"));

  skills.add("Express.js");

  print(skills);

  skills.remove("MongoDB");

  print(skills);
}


// ============================================================================
// 21. LIST OF NUMBERS
// ============================================================================

void numberListExample() {
  List<int> numbers = [
    10,
    20,
    30,
    40,
    50,
  ];

  print(numbers);

  print(numbers[0]);
  print(numbers.length);
}


// ============================================================================
// 22. COMMON LIST OPERATIONS
// ============================================================================
//
// add()       → Add one item
// addAll()    → Add multiple items
// remove()    → Remove by value
// removeAt()  → Remove by index
// length      → Number of items
// first       → First item
// last        → Last item
// contains()  → Check whether item exists
//
// ============================================================================

void listOperationsExample() {
  List<String> names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  names.add("Hasan");

  names.addAll([
    "Sakib",
    "Rakib",
  ]);

  names.remove("Rahim");

  names.removeAt(0);

  print(names);
}


// ============================================================================
// 23. SET
// ============================================================================
//
// Set is a collection of unique values.
//
// IMPORTANT:
// A Set does not allow duplicate values.
//
// ============================================================================

void setExample() {
  Set<String> technologies = {
    "Dart",
    "Flutter",
    "Node.js",
    "Flutter",
  };

  // Flutter appears only once because Set stores unique values.

  print(technologies);

  technologies.add("MongoDB");

  print(technologies);

  technologies.remove("Node.js");

  print(technologies);

  print(technologies.contains("Flutter"));
}


// ============================================================================
// 24. MAP
// ============================================================================
//
// Map stores data as key-value pairs.
//
// Syntax:
//
//   Map<KeyType, ValueType>
//
// Example:
//
//   Map<String, dynamic>
//
// This structure is extremely important for API/JSON handling.
//
// ============================================================================

void mapExample() {
  Map<String, dynamic> user = {
    "name": "Palash",
    "age": 24,
    "email": "palash@example.com",
    "isStudent": true,
    "cgpa": 3.50,
  };

  print(user);

  print(user["name"]);
  print(user["age"]);
  print(user["email"]);
  print(user["isStudent"]);
}


// ============================================================================
// 25. MODIFYING A MAP
// ============================================================================
//
// You can add or update values using:
//
//   map[key] = value;
//
// ============================================================================

void mapModificationExample() {
  Map<String, dynamic> user = {
    "name": "Palash",
    "age": 24,
  };

  // Update existing value.
  user["age"] = 25;

  // Add new key-value pair.
  user["role"] = "Developer";

  print(user);

  // Remove a key-value pair.
  user.remove("age");

  print(user);
}


// ============================================================================
// 26. DYNAMIC
// ============================================================================
//
// dynamic allows a variable to hold different types at runtime.
//
// Example:
//
//   dynamic value = "Hello";
//   value = 100;
//   value = true;
//
// All are valid.
//
// IMPORTANT:
// Avoid unnecessary dynamic usage because it reduces compile-time type
// safety.
//
// Use proper types whenever possible.
//
// ============================================================================

void dynamicExample() {
  dynamic value = "Hello";

  print(value);

  value = 100;

  print(value);

  value = true;

  print(value);

  value = [1, 2, 3];

  print(value);
}


// ============================================================================
// 27. OBJECT
// ============================================================================
//
// Object is a general Dart type.
//
// Many Dart values can be assigned to Object.
//
// Unlike dynamic, Dart does not simply allow arbitrary operations on an
// Object without type information.
//
// ============================================================================

void objectExample() {
  Object value = "Hello";

  print(value);

  value = 100;

  print(value);

  value = true;

  print(value);
}


// ============================================================================
// 28. DYNAMIC VS OBJECT
// ============================================================================
//
// dynamic:
//   • Type checking is more relaxed.
//   • Different values can be assigned.
//   • Can reduce compile-time safety.
//
// Object:
//   • Can hold many different Dart values.
//   • Still follows Dart's type system more strictly.
//
// Production Flutter code should generally prefer specific types.
//
// ============================================================================


// ============================================================================
// 29. TYPE CONVERSION
// ============================================================================
//
// Data received from APIs/forms may need conversion.
//
// Common conversions:
//
//   String → int
//   String → double
//   int → String
//   double → String
//
// ============================================================================

void typeConversionExample() {
  // String → int
  String priceText = "100";

  int price = int.parse(priceText);

  print(price);


  // String → double
  String decimalText = "99.50";

  double decimalPrice = double.parse(decimalText);

  print(decimalPrice);


  // int → String
  int age = 24;

  String ageText = age.toString();

  print(ageText);


  // double → String
  double amount = 500.75;

  String amountText = amount.toString();

  print(amountText);
}


// ============================================================================
// 30. STRING METHODS
// ============================================================================
//
// Useful String properties/methods:
//
//   length
//   toUpperCase()
//   toLowerCase()
//   contains()
//   startsWith()
//   endsWith()
//
// ============================================================================

void stringMethodsExample() {
  String message = "Hello Dart";

  print(message.length);

  print(message.toUpperCase());

  print(message.toLowerCase());

  print(message.contains("Dart"));

  print(message.startsWith("Hello"));

  print(message.endsWith("Dart"));
}


// ============================================================================
// 31. NULL
// ============================================================================
//
// null means "no value".
//
// Dart uses sound null safety.
//
// A normal non-nullable String cannot contain null:
//
//   String name = null; // ERROR
//
// To allow null, use:
//
//   String?
//
// ============================================================================

void nullExample() {
  String? nullableName;

  print(nullableName);

  nullableName = "Palash";

  print(nullableName);
}


// ============================================================================
// 32. NULL-AWARE OPERATOR ??
// ============================================================================
//
// ?? provides a fallback value when the left side is null.
//
// Syntax:
//
//   value ?? fallback
//
// Example:
//
//   username ?? "Guest"
//
// If username is null:
//   "Guest" is returned.
//
// If username has a value:
//   That value is returned.
//
// ============================================================================

void nullAwareExample() {
  String? username;

  print(username ?? "Guest");

  username = "Palash";

  print(username ?? "Guest");
}


// ============================================================================
// 33. NULL-AWARE ASSIGNMENT ??=
// ============================================================================
//
// ??= assigns a value only if the variable is currently null.
//
// ============================================================================

void nullAwareAssignmentExample() {
  String? nickname;

  nickname ??= "Developer";

  print(nickname);

  // nickname is no longer null,
  // so this assignment will not replace it.
  nickname ??= "Flutter Developer";

  print(nickname);
}


// ============================================================================
// 34. BASIC PRODUCT EXAMPLE
// ============================================================================
//
// This combines variables, types, arithmetic and interpolation.
//
// This type of logic will later become part of your Flutter ERP.
//
// ============================================================================

void productExample() {
  String productName = "Laptop";
  double productCost = 75000;
  double offerPrice = 70000;
  int quantity = 2;

  double totalPrice = offerPrice * quantity;

  print("Product: $productName");
  print("Cost: $productCost");
  print("Offer Price: $offerPrice");
  print("Quantity: $quantity");
  print("Total Price: $totalPrice");
}


// ============================================================================
// 35. BASIC USER EXAMPLE
// ============================================================================
//
// User-related data is common in Flutter applications.
//
// ============================================================================

void userExample() {
  String userName = "Palash";
  String email = "palash@example.com";
  String role = "admin";
  bool verified = true;

  print("Name: $userName");
  print("Email: $email");
  print("Role: $role");
  print("Verified: $verified");
}


// ============================================================================
// 36. BASIC DISCOUNT CALCULATION
// ============================================================================
//
// Example business logic.
//
// Subtotal:
//   5000
//
// Discount:
//   10%
//
// Discount amount:
//   500
//
// Final amount:
//   4500
//
// ============================================================================

void discountExample() {
  double subtotal = 5000;
  double discountPercent = 10;

  double discountAmount =
      subtotal * discountPercent / 100;

  double finalAmount =
      subtotal - discountAmount;

  print("Subtotal: $subtotal");
  print("Discount: $discountAmount");
  print("Final Amount: $finalAmount");
}


// ============================================================================
// 37. API-LIKE DATA
// ============================================================================
//
// Backend APIs commonly return JSON.
//
// After JSON decoding, Dart commonly represents JSON objects as:
//
//   Map<String, dynamic>
//
// Example API response:
//
// {
//   "success": true,
//   "message": "User fetched successfully",
//   "data": {
//     "id": "USR001",
//     "name": "Palash"
//   }
// }
//
// ============================================================================

void apiResponseExample() {
  Map<String, dynamic> apiResponse = {
    "success": true,
    "message": "User fetched successfully",
    "data": {
      "id": "USR001",
      "name": "Palash",
      "email": "palash@example.com",
    },
  };

  print(apiResponse["success"]);
  print(apiResponse["message"]);
  print(apiResponse["data"]);
}


// ============================================================================
// 38. NESTED MAP
// ============================================================================
//
// API responses can contain nested objects.
//
// Example:
//
//   company
//      ├── name
//      ├── owner
//      │     ├── name
//      │     └── email
//      └── address
//            ├── country
//            └── city
//
// ============================================================================

void nestedMapExample() {
  Map<String, dynamic> company = {
    "name": "My ERP",

    "owner": {
      "name": "Palash",
      "email": "palash@example.com",
    },

    "address": {
      "country": "Bangladesh",
      "city": "Dhaka",
    },
  };

  print(company["name"]);
  print(company["owner"]);
  print(company["address"]);
}


// ============================================================================
// 39. COMBINED DEVELOPER DATA
// ============================================================================
//
// This example combines:
//   • final
//   • int
//   • String
//   • List
//   • Map
//   • bool
//
// ============================================================================

void developerExample() {
  final String developerName = "Palash";

  final int developerAge = 24;

  final List<String> developerSkills = [
    "Dart",
    "Flutter",
    "Node.js",
    "MongoDB",
  ];

  final Map<String, dynamic> developer = {
    "name": developerName,
    "age": developerAge,
    "skills": developerSkills,
    "isFullStackDeveloper": true,
  };

  print(developer);
}


// ============================================================================
// 40. PHASE 1 QUICK REVISION
// ============================================================================
//
// VARIABLES
// --------------------------------------------------------------------------
//
// String
// int
// double
// bool
// var
// final
// const
//
//
// COLLECTIONS
// --------------------------------------------------------------------------
//
// List
// Set
// Map
//
//
// SPECIAL TYPES
// --------------------------------------------------------------------------
//
// dynamic
// Object
//
//
// OPERATORS
// --------------------------------------------------------------------------
//
// Arithmetic:
//   +
//   -
//   *
//   /
//   ~/
//   %
//
// Comparison:
//   ==
//   !=
//   >
//   <
//   >=
//   <=
//
// Logical:
//   &&
//   ||
//   !
//
// Assignment:
//   =
//   +=
//   -=
//   *=
//   ~/=
//
// Increment / Decrement:
//   ++
//   --
//
//
// STRING
// --------------------------------------------------------------------------
//
// String interpolation:
//   $variable
//
// Expression:
//   ${expression}
//
//
// TYPE CONVERSION
// --------------------------------------------------------------------------
//
// int.parse()
// double.parse()
// toString()
//
//
// NULL SAFETY FOUNDATION
// --------------------------------------------------------------------------
//
// String?
// ??
// ??=
//
//
// PROGRAM STRUCTURE
// --------------------------------------------------------------------------
//
// main()
// print()
// comments
//
// ============================================================================


// ============================================================================
// 41. PHASE 1 PRACTICE TASKS
// ============================================================================
//
// TASK 1 — PERSONAL INFORMATION
//
// Create variables for:
//
//   • Name
//   • Age
//   • University
//   • CGPA
//   • Country
//   • Student status
//
// Then print them using String interpolation.
//
//
//
// TASK 2 — PRODUCT
//
// Create:
//
//   • Product name
//   • Product price
//   • Offer price
//   • Quantity
//
// Calculate:
//
//   Total price = Offer price × Quantity
//
//
//
// TASK 3 — USER
//
// Create a Map containing:
//
//   • name
//   • email
//   • age
//   • role
//   • isVerified
//
//
//
// TASK 4 — SKILLS
//
// Create a List containing:
//
//   Dart
//   Flutter
//   Node.js
//   Express.js
//   MongoDB
//
// Then:
//
//   • Print the first item
//   • Print the last item
//   • Print length
//   • Add a new skill
//   • Remove a skill
//   • Check whether Flutter exists
//
//
//
// TASK 5 — DISCOUNT
//
// Given:
//
//   subtotal = 5000
//   discount = 10%
//
// Calculate:
//
//   discount amount
//   final amount
//
//
//
// TASK 6 — API RESPONSE
//
// Create a Map representing:
//
// {
//   "success": true,
//   "message": "Success",
//   "data": {
//     "id": "USR001",
//     "name": "Palash"
//   }
// }
//
// Access each value.
//
// ============================================================================


// ============================================================================
// 42. MOST IMPORTANT THINGS TO REMEMBER
// ============================================================================
//
// 1. var
//    → Type is inferred automatically.
//
// 2. final
//    → Can be assigned only once; runtime values are allowed.
//
// 3. const
//    → Compile-time constant.
//
// 4. String
//    → Text.
//
// 5. int
//    → Whole numbers.
//
// 6. double
//    → Decimal numbers.
//
// 7. bool
//    → true / false.
//
// 8. List
//    → Ordered collection, allows duplicates.
//
// 9. Set
//    → Unique collection.
//
// 10. Map
//     → Key-value collection.
//
// 11. dynamic
//     → Flexible runtime type; avoid unnecessary use.
//
// 12. String?
//     → Nullable String.
//
// 13. ??
//     → Fallback when value is null.
//
// 14. ??=
//     → Assign only when current value is null.
//
// 15. $variable
//     → String interpolation.
//
// 16. ${expression}
//     → Expression inside String.
//
// 17. int.parse()
//     → String → int.
//
// 18. double.parse()
//     → String → double.
//
// 19. toString()
//     → Value → String.
//
// ============================================================================


// ============================================================================
// END OF DART PHASE 1
// ============================================================================
//
// NEXT:
//
// PHASE 2 — CONTROL FLOW
//
// Topics:
//
//   • if
//   • else
//   • else if
//   • Nested conditions
//   • Logical conditions
//   • Ternary operator
//   • switch
//   • Modern switch expression
//   • for loop
//   • for-in loop
//   • while loop
//   • do-while loop
//   • break
//   • continue
//   • assertions
//   • collection if
//   • collection for
//   • Real-world Flutter examples
//
// ============================================================================