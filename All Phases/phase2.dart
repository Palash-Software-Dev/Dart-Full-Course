// ============================================================================
// DART MASTER ROADMAP
// PHASE 2 — CONTROL FLOW
// ============================================================================
//
// PURPOSE:
// This phase teaches Dart decision-making and repetition.
//
// Control flow is extremely important for Flutter and full-stack development.
// You will use these concepts for:
//
//   • Login/authentication logic
//   • Role & permission checking
//   • Form validation
//   • Product stock checking
//   • Order status handling
//   • API response handling
//   • Cart calculations
//   • Filtering data
//   • Generating dynamic UI
//   • Loops and data processing
//
// ============================================================================
//
// PHASE 2 TOPICS:
//
//   1. if
//   2. else
//   3. else if
//   4. Nested if
//   5. Logical conditions
//   6. Ternary operator
//   7. switch
//   8. switch + enum
//   9. Modern switch expression
//  10. for loop
//  11. for-in loop
//  12. while loop
//  13. do-while loop
//  14. break
//  15. continue
//  16. Nested loops
//  17. Assertions
//  18. Collection if
//  19. Collection for
//  20. Collection if + for
//  21. Real-world Flutter examples
//
// ============================================================================


// ============================================================================
// 1. IF
// ============================================================================
//
// if is used when you want to execute code only when a condition is true.
//
// Syntax:
//
//   if (condition) {
//     // code
//   }
//
// The condition must evaluate to true or false.
//
// ============================================================================

void ifExample() {
  int age = 20;

  if (age >= 18) {
    print("Adult");
  }
}


// ============================================================================
// 2. IF WITH BOOLEAN
// ============================================================================
//
// Boolean values can be used directly inside if.
//
// ============================================================================

void ifBooleanExample() {
  bool isLoggedIn = true;

  if (isLoggedIn) {
    print("Go to Dashboard");
  }
}


// ============================================================================
// 3. ELSE
// ============================================================================
//
// else runs when the if condition is false.
//
// Syntax:
//
//   if (condition) {
//     // true
//   } else {
//     // false
//   }
//
// ============================================================================

void elseExample() {
  int age = 16;

  if (age >= 18) {
    print("Adult");
  } else {
    print("Minor");
  }
}


// ============================================================================
// 4. LOGIN EXAMPLE
// ============================================================================
//
// A common Flutter authentication decision.
//
// ============================================================================

void loginExample() {
  bool isLoggedIn = false;

  if (isLoggedIn) {
    print("Dashboard");
  } else {
    print("Login Screen");
  }
}


// ============================================================================
// 5. ELSE IF
// ============================================================================
//
// else if is used when there are multiple possible conditions.
//
// Dart checks conditions from top to bottom.
//
// Once a condition is true, its block executes and the remaining conditions
// are skipped.
//
// ============================================================================

void elseIfExample() {
  int marks = 75;

  if (marks >= 80) {
    print("A+");
  } else if (marks >= 70) {
    print("A");
  } else if (marks >= 60) {
    print("A-");
  } else {
    print("Below A-");
  }
}


// ============================================================================
// 6. IMPORTANT — CONDITION ORDER
// ============================================================================
//
// Conditions should normally be ordered from the most specific/highest
// threshold to the lowest when using ranges.
//
// Example:
//
//   marks >= 80
//   marks >= 70
//   marks >= 60
//
// If marks = 85:
//
//   85 >= 80 → true
//
// So Dart executes A+ and stops checking the remaining else-if conditions.
//
// ============================================================================


// ============================================================================
// 7. LOGICAL AND — &&
// ============================================================================
//
// && means AND.
//
// BOTH conditions must be true.
//
// Example:
//
//   age >= 18 && hasNid
//
// means:
//
//   age must be >= 18
//   AND
//   hasNid must be true
//
// ============================================================================

void andExample() {
  int age = 25;
  bool hasNid = true;

  if (age >= 18 && hasNid) {
    print("Eligible");
  }
}


// ============================================================================
// 8. LOGICAL OR — ||
// ============================================================================
//
// || means OR.
//
// At least ONE condition must be true.
//
// ============================================================================

void orExample() {
  bool isAdmin = false;
  bool isOwner = true;

  if (isAdmin || isOwner) {
    print("Access granted");
  }
}


// ============================================================================
// 9. LOGICAL NOT — !
// ============================================================================
//
// ! reverses a boolean.
//
// true  → false
// false → true
//
// ============================================================================

void notExample() {
  bool isBlocked = false;

  if (!isBlocked) {
    print("User can continue");
  }
}


// ============================================================================
// 10. COMBINING LOGICAL OPERATORS
// ============================================================================
//
// You can combine multiple conditions.
//
// ============================================================================

void combinedConditionExample() {
  bool isLoggedIn = true;
  bool isBlocked = false;
  bool isVerified = true;

  if (isLoggedIn && !isBlocked && isVerified) {
    print("User can access the application");
  }
}


// ============================================================================
// 11. NESTED IF
// ============================================================================
//
// An if statement can exist inside another if statement.
//
// ============================================================================

void nestedIfExample() {
  bool isLoggedIn = true;
  bool isAdmin = true;

  if (isLoggedIn) {
    if (isAdmin) {
      print("Admin Dashboard");
    }
  }
}


// ============================================================================
// 12. SIMPLIFYING NESTED IF
// ============================================================================
//
// Sometimes nested conditions can be simplified.
//
// Instead of:
//
//   if (isLoggedIn) {
//     if (isAdmin) {
//       ...
//     }
//   }
//
// You can write:
//
//   if (isLoggedIn && isAdmin) {
//     ...
//   }
//
// ============================================================================

void simplifiedNestedIfExample() {
  bool isLoggedIn = true;
  bool isAdmin = true;

  if (isLoggedIn && isAdmin) {
    print("Admin Dashboard");
  }
}


// ============================================================================
// 13. TERNARY OPERATOR
// ============================================================================
//
// Ternary is a short form of simple if-else.
//
// Syntax:
//
//   condition ? valueIfTrue : valueIfFalse
//
// Example:
//
//   age >= 18 ? "Adult" : "Minor"
//
// ============================================================================

void ternaryExample() {
  int age = 20;

  String result = age >= 18 ? "Adult" : "Minor";

  print(result);
}


// ============================================================================
// 14. TERNARY IN FLUTTER
// ============================================================================
//
// Ternary operators are commonly used when choosing UI values.
//
// Example:
//
//   Text(
//     isLoggedIn ? "Logout" : "Login",
//   )
//
// Another example:
//
//   Icon(
//     isFavorite
//         ? Icons.favorite
//         : Icons.favorite_border,
//   )
//
// ============================================================================


// ============================================================================
// 15. AVOID COMPLEX NESTED TERNARY
// ============================================================================
//
// This is possible:
//
//   condition1
//       ? value1
//       : condition2
//           ? value2
//           : value3;
//
// But too many nested ternaries reduce readability.
//
// Use:
//
//   if
//   else if
//   else
//
// when business logic becomes complex.
//
// ============================================================================


// ============================================================================
// 16. SWITCH
// ============================================================================
//
// switch is useful when one value can have multiple possible cases.
//
// Traditional Dart switch syntax:
//
//   switch (value) {
//     case value1:
//       ...
//       break;
//
//     case value2:
//       ...
//       break;
//
//     default:
//       ...
//   }
//
// ============================================================================

void switchExample() {
  String role = "admin";

  switch (role) {
    case "admin":
      print("Admin access");
      break;

    case "vendor":
      print("Vendor access");
      break;

    case "employee":
      print("Employee access");
      break;

    default:
      print("Unknown role");
  }
}


// ============================================================================
// 17. SWITCH DEFAULT
// ============================================================================
//
// default executes when no case matches.
//
// ============================================================================

void switchDefaultExample() {
  String role = "customer";

  switch (role) {
    case "admin":
      print("Admin");
      break;

    case "vendor":
      print("Vendor");
      break;

    default:
      print("Unknown role");
  }
}


// ============================================================================
// 18. ENUM
// ============================================================================
//
// enum defines a fixed set of named values.
//
// This is very useful for:
//
//   • Order status
//   • Payment status
//   • User roles
//   • Product status
//   • Delivery status
//
// ============================================================================

enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled,
}


// ============================================================================
// 19. ENUM + SWITCH
// ============================================================================

void enumSwitchExample() {
  OrderStatus status = OrderStatus.shipped;

  switch (status) {
    case OrderStatus.pending:
      print("Waiting for confirmation");
      break;

    case OrderStatus.confirmed:
      print("Order confirmed");
      break;

    case OrderStatus.shipped:
      print("Order is on the way");
      break;

    case OrderStatus.delivered:
      print("Order delivered");
      break;

    case OrderStatus.cancelled:
      print("Order cancelled");
      break;
  }
}


// ============================================================================
// 20. MODERN SWITCH EXPRESSION
// ============================================================================
//
// Modern Dart allows switch to be used as an expression.
//
// Instead of manually assigning a result in every case:
//
//   return switch (value) {
//     case1 => result1,
//     case2 => result2,
//   };
//
// This is especially useful for mapping states to values.
//
// ============================================================================

String getOrderStatusText(OrderStatus status) {
  return switch (status) {
    OrderStatus.pending => "Pending",
    OrderStatus.confirmed => "Confirmed",
    OrderStatus.shipped => "Shipped",
    OrderStatus.delivered => "Delivered",
    OrderStatus.cancelled => "Cancelled",
  };
}


// ============================================================================
// 21. SWITCH EXPRESSION EXAMPLE
// ============================================================================

void switchExpressionExample() {
  OrderStatus status = OrderStatus.delivered;

  final String text = switch (status) {
    OrderStatus.pending => "Waiting",
    OrderStatus.confirmed => "Confirmed",
    OrderStatus.shipped => "On the way",
    OrderStatus.delivered => "Completed",
    OrderStatus.cancelled => "Cancelled",
  };

  print(text);
}


// ============================================================================
// 22. FOR LOOP
// ============================================================================
//
// for is used when you want to repeat code.
//
// Syntax:
//
//   for (initialization; condition; update) {
//     // code
//   }
//
// Example:
//
//   for (int i = 0; i < 5; i++)
//
// ============================================================================

void forLoopExample() {
  for (int i = 0; i < 5; i++) {
    print(i);
  }
}


// ============================================================================
// 23. HOW FOR LOOP WORKS
// ============================================================================
//
// Example:
//
//   for (int i = 0; i < 3; i++)
//
// Step 1:
//   int i = 0
//
// Step 2:
//   i < 3 → true
//
// Step 3:
//   Execute body
//
// Step 4:
//   i++
//
// Step 5:
//   Check condition again
//
// Result:
//
//   0
//   1
//   2
//
// When i becomes 3:
//
//   3 < 3 → false
//
// Loop stops.
//
// ============================================================================


// ============================================================================
// 24. FOR LOOP WITH LIST
// ============================================================================

void forListExample() {
  List<String> names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
}


// ============================================================================
// 25. FOR-IN LOOP
// ============================================================================
//
// for-in is useful when you need each item but do not need its index.
//
// Syntax:
//
//   for (final item in collection) {
//     ...
//   }
//
// ============================================================================

void forInExample() {
  List<String> names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  for (final name in names) {
    print(name);
  }
}


// ============================================================================
// 26. FOR VS FOR-IN
// ============================================================================
//
// Use traditional for when you need the index:
//
//   for (int i = 0; i < products.length; i++) {
//     print(products[i]);
//   }
//
// Use for-in when you only need the item:
//
//   for (final product in products) {
//     print(product);
//   }
//
// ============================================================================


// ============================================================================
// 27. WHILE LOOP
// ============================================================================
//
// while repeats code as long as the condition is true.
//
// Syntax:
//
//   while (condition) {
//     ...
//   }
//
// The condition is checked BEFORE each iteration.
//
// ============================================================================

void whileExample() {
  int count = 0;

  while (count < 5) {
    print(count);

    count++;
  }
}


// ============================================================================
// 28. IMPORTANT — AVOID INFINITE WHILE LOOP
// ============================================================================
//
// WRONG:
//
//   int count = 0;
//
//   while (count < 5) {
//     print(count);
//   }
//
// count never changes.
//
// Therefore:
//
//   count < 5
//
// remains true forever.
//
// Always make sure the loop can eventually terminate.
//
// ============================================================================


// ============================================================================
// 29. DO-WHILE LOOP
// ============================================================================
//
// do-while executes the body FIRST and checks the condition AFTER.
//
// Syntax:
//
//   do {
//     ...
//   } while (condition);
//
// Therefore, the body executes at least once.
//
// ============================================================================

void doWhileExample() {
  int count = 0;

  do {
    print(count);

    count++;
  } while (count < 5);
}


// ============================================================================
// 30. WHILE VS DO-WHILE
// ============================================================================
//
// while:
//
//   condition → check first
//   body      → execute if true
//
// do-while:
//
//   body      → execute first
//   condition → check afterward
//
// Therefore:
//
// while may execute zero times.
//
// do-while executes at least once.
//
// ============================================================================


// ============================================================================
// 31. BREAK
// ============================================================================
//
// break immediately terminates the current loop.
//
// ============================================================================

void breakExample() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break;
    }

    print(i);
  }
}


// ============================================================================
// 32. BREAK RESULT
// ============================================================================
//
// Output:
//
//   0
//   1
//   2
//   3
//   4
//
// When i becomes 5:
//
//   break
//
// stops the entire loop.
//
// ============================================================================


// ============================================================================
// 33. CONTINUE
// ============================================================================
//
// continue skips the current iteration and moves to the next iteration.
//
// ============================================================================

void continueExample() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }

    print(i);
  }
}


// ============================================================================
// 34. CONTINUE RESULT
// ============================================================================
//
// Output:
//
//   0
//   1
//   3
//   4
//
// 2 is skipped.
//
// Difference:
//
//   break    → stop the entire loop
//
//   continue → skip only the current iteration
//
// ============================================================================


// ============================================================================
// 35. NESTED LOOP
// ============================================================================
//
// A loop can exist inside another loop.
//
// ============================================================================

void nestedLoopExample() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print("$i - $j");
    }
  }
}


// ============================================================================
// 36. NESTED LOOP CONCEPT
// ============================================================================
//
// Outer loop:
//
//   i = 1
//      j = 1
//      j = 2
//      j = 3
//
//   i = 2
//      j = 1
//      j = 2
//      j = 3
//
//   i = 3
//      j = 1
//      j = 2
//      j = 3
//
// Nested loops are useful for some algorithms, but unnecessary nested loops
// can become expensive for large datasets.
//
// ============================================================================


// ============================================================================
// 37. ASSERT
// ============================================================================
//
// assert is mainly a development/debugging tool.
//
// It verifies that an assumption is true.
//
// Example:
//
//   assert(age >= 18);
//
// If the condition fails during a debug/development run, an assertion error
// can occur.
//
// IMPORTANT:
//
// assert is NOT a replacement for production validation.
//
// For user input validation, use proper validation logic.
//
// ============================================================================

void assertExample() {
  int age = 20;

  assert(age >= 18);
}


// ============================================================================
// 38. ASSERT WITH STRING
// ============================================================================

void assertStringExample() {
  String name = "Palash";

  assert(name.isNotEmpty);
}


// ============================================================================
// 39. COLLECTION IF
// ============================================================================
//
// Dart allows if conditions directly inside collection literals.
//
// This is extremely useful in Flutter when creating dynamic lists of widgets.
//
// Example:
//
//   final actions = [
//     "Profile",
//     if (isAdmin) "Manage Users",
//   ];
//
// ============================================================================

void collectionIfExample() {
  bool isAdmin = true;

  final actions = [
    "Profile",

    if (isAdmin)
      "Manage Users",
  ];

  print(actions);
}


// ============================================================================
// 40. COLLECTION IF WHEN FALSE
// ============================================================================

void collectionIfFalseExample() {
  bool isAdmin = false;

  final actions = [
    "Profile",

    if (isAdmin)
      "Manage Users",
  ];

  print(actions);

  // Result:
  //
  // [Profile]
  //
  // because isAdmin is false.
}


// ============================================================================
// 41. COLLECTION IF + ELSE
// ============================================================================
//
// You can also use else in collection control flow.
//
// ============================================================================

void collectionIfElseExample() {
  bool isAdmin = true;

  final menu = [
    "Home",

    if (isAdmin)
      "Admin Panel"
    else
      "My Account",
  ];

  print(menu);
}


// ============================================================================
// 42. COLLECTION FOR
// ============================================================================
//
// Dart allows for loops inside collection literals.
//
// Example:
//
//   final doubled = [
//     for (final number in numbers)
//       number * 2,
//   ];
//
// ============================================================================

void collectionForExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final doubled = [
    for (final number in numbers)
      number * 2,
  ];

  print(doubled);
}


// ============================================================================
// 43. COLLECTION FOR WITH STRING
// ============================================================================

void collectionForStringExample() {
  final names = [
    "Palash",
    "Rahim",
    "Karim",
  ];

  final greetings = [
    for (final name in names)
      "Hello $name",
  ];

  print(greetings);
}


// ============================================================================
// 44. COLLECTION IF + FOR
// ============================================================================
//
// Both can be combined.
//
// Example:
//   Select only even numbers.
//
// ============================================================================

void collectionIfForExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  final evenNumbers = [
    for (final number in numbers)
      if (number % 2 == 0)
        number,
  ];

  print(evenNumbers);
}


// ============================================================================
// 45. FLUTTER UI EXAMPLE — DYNAMIC WIDGET LIST
// ============================================================================
//
// In Flutter, collection-if and collection-for are extremely useful.
//
// Example:
//
//   Column(
//     children: [
//       const Text("Products"),
//
//       if (products.isEmpty)
//         const Text("No products"),
//
//       if (products.isNotEmpty)
//         for (final product in products)
//           Text(product.name),
//     ],
//   );
//
// This is one of the most practical reasons to learn collection control
// flow.
//
// ============================================================================


// ============================================================================
// 46. REAL-WORLD EXAMPLE — USER ROLE
// ============================================================================
//
// This resembles a simple ERP permission decision.
//
// ============================================================================

void userRoleExample() {
  String role = "admin";

  if (role == "admin") {
    print("Admin Dashboard");
  } else if (role == "employee") {
    print("Employee Dashboard");
  } else if (role == "vendor") {
    print("Vendor Dashboard");
  } else {
    print("No access");
  }
}


// ============================================================================
// 47. REAL-WORLD EXAMPLE — LOGIN + BLOCK STATUS
// ============================================================================

void authenticationExample() {
  bool isLoggedIn = true;
  bool isBlocked = false;

  if (isLoggedIn && !isBlocked) {
    print("Go to Home");
  } else {
    print("Stay on Login");
  }
}


// ============================================================================
// 48. REAL-WORLD EXAMPLE — PRODUCT STOCK
// ============================================================================
//
// Never allow negative stock in your ERP logic.
//
// This example checks stock states.
//
// ============================================================================

void stockExample() {
  List<int> stocks = [
    10,
    0,
    5,
    2,
    0,
    15,
    1,
  ];

  for (final stock in stocks) {
    if (stock == 0) {
      print("Out of stock");
    } else if (stock <= 2) {
      print("Low stock");
    } else {
      print("Available");
    }
  }
}


// ============================================================================
// 49. REAL-WORLD EXAMPLE — COUNT STOCK STATUS
// ============================================================================

void stockCountExample() {
  List<int> stocks = [
    10,
    0,
    5,
    2,
    0,
    15,
    1,
  ];

  int outOfStock = 0;
  int available = 0;
  int lowStock = 0;

  for (final stock in stocks) {
    if (stock == 0) {
      outOfStock++;
    } else if (stock <= 2) {
      lowStock++;
    } else {
      available++;
    }
  }

  print("Out of stock: $outOfStock");
  print("Low stock: $lowStock");
  print("Available: $available");
}


// ============================================================================
// 50. REAL-WORLD EXAMPLE — CART
// ============================================================================
//
// Calculate subtotal and discount using loops + conditions.
//
// ============================================================================

void cartExample() {
  List<double> prices = [
    100,
    250,
    50,
    500,
  ];

  double total = 0;

  for (final price in prices) {
    total += price;
  }

  double discountPercent;

  if (total >= 1000) {
    discountPercent = 10;
  } else if (total >= 500) {
    discountPercent = 5;
  } else {
    discountPercent = 0;
  }

  double discountAmount =
      total * discountPercent / 100;

  double finalTotal =
      total - discountAmount;

  print("Subtotal: $total");
  print("Discount: $discountAmount");
  print("Final Total: $finalTotal");
}


// ============================================================================
// 51. REAL-WORLD EXAMPLE — FIND FIRST OUT-OF-STOCK PRODUCT
// ============================================================================
//
// break can stop searching once the desired item is found.
//
// ============================================================================

void findOutOfStockExample() {
  List<int> stocks = [
    10,
    5,
    8,
    0,
    12,
  ];

  for (int i = 0; i < stocks.length; i++) {
    if (stocks[i] == 0) {
      print("First out-of-stock index: $i");
      break;
    }
  }
}


// ============================================================================
// 52. REAL-WORLD EXAMPLE — SKIP OUT-OF-STOCK PRODUCTS
// ============================================================================
//
// continue can be used when you want to skip certain data.
//
// ============================================================================

void skipOutOfStockExample() {
  List<int> stocks = [
    10,
    0,
    5,
    0,
    20,
  ];

  for (final stock in stocks) {
    if (stock == 0) {
      continue;
    }

    print("Available stock: $stock");
  }
}


// ============================================================================
// 53. REAL-WORLD EXAMPLE — ORDER STATUS
// ============================================================================

void orderStatusExample() {
  OrderStatus status = OrderStatus.shipped;

  final message = switch (status) {
    OrderStatus.pending =>
      "Your order is waiting for confirmation.",

    OrderStatus.confirmed =>
      "Your order has been confirmed.",

    OrderStatus.shipped =>
      "Your order is on the way.",

    OrderStatus.delivered =>
      "Your order has been delivered.",

    OrderStatus.cancelled =>
      "Your order has been cancelled.",
  };

  print(message);
}


// ============================================================================
// 54. REAL-WORLD EXAMPLE — PERMISSION
// ============================================================================
//
// Simple permission decision.
//
// In a production application, permissions should normally be represented
// more systematically rather than scattered throughout UI code.
//
// ============================================================================

void permissionExample() {
  String role = "admin";

  if (role == "admin" || role == "owner") {
    print("Can manage users");
  } else if (role == "employee") {
    print("Limited access");
  } else if (role == "vendor") {
    print("Vendor access");
  } else {
    print("Access denied");
  }
}


// ============================================================================
// 55. REAL-WORLD EXAMPLE — FORM VALIDATION
// ============================================================================
//
// Control flow is heavily used for validation.
//
// ============================================================================

void validationExample() {
  String email = "palash@example.com";
  String password = "123456";

  if (email.isEmpty) {
    print("Email is required");
  } else if (password.isEmpty) {
    print("Password is required");
  } else if (password.length < 6) {
    print("Password must contain at least 6 characters");
  } else {
    print("Form is valid");
  }
}


// ============================================================================
// 56. REAL-WORLD EXAMPLE — API RESPONSE STATUS
// ============================================================================
//
// Backend APIs commonly return a status code.
//
// ============================================================================

void apiStatusExample() {
  int statusCode = 200;

  if (statusCode == 200) {
    print("Success");
  } else if (statusCode == 201) {
    print("Created");
  } else if (statusCode == 400) {
    print("Bad Request");
  } else if (statusCode == 401) {
    print("Unauthorized");
  } else if (statusCode == 403) {
    print("Forbidden");
  } else if (statusCode == 404) {
    print("Not Found");
  } else if (statusCode >= 500) {
    print("Server Error");
  } else {
    print("Unknown Status");
  }
}


// ============================================================================
// 57. COLLECTION IF + FLUTTER-LIKE EXAMPLE
// ============================================================================
//
// This is Dart syntax representing the kind of logic you will use in
// Flutter widget lists.
//
// ============================================================================

void dynamicMenuExample() {
  bool isAdmin = true;
  bool isVendor = false;

  final menu = [
    "Dashboard",
    "Profile",

    if (isAdmin)
      "User Management",

    if (isVendor)
      "Vendor Panel",
  ];

  print(menu);
}


// ============================================================================
// 58. COLLECTION FOR + FLUTTER-LIKE EXAMPLE
// ============================================================================

void productNamesExample() {
  final products = [
    "Laptop",
    "Phone",
    "Tablet",
  ];

  final displayItems = [
    for (final product in products)
      "Product: $product",
  ];

  print(displayItems);
}


// ============================================================================
// 59. COLLECTION IF + FOR — FILTER-LIKE LOGIC
// ============================================================================

void availableProductsExample() {
  final products = [
    {
      "name": "Laptop",
      "stock": 10,
    },
    {
      "name": "Phone",
      "stock": 0,
    },
    {
      "name": "Tablet",
      "stock": 5,
    },
  ];

  final availableProducts = [
    for (final product in products)
      if ((product["stock"] as int) > 0)
        product["name"],
  ];

  print(availableProducts);
}


// ============================================================================
// 60. PHASE 2 QUICK REVISION
// ============================================================================
//
// DECISION MAKING
// --------------------------------------------------------------------------
//
// if
// else
// else if
// nested if
//
//
//
// LOGICAL CONDITIONS
// --------------------------------------------------------------------------
//
// && → AND
// || → OR
// !  → NOT
//
//
//
// SHORT CONDITION
// --------------------------------------------------------------------------
//
// condition ? trueValue : falseValue
//
//
//
// MULTIPLE FIXED CASES
// --------------------------------------------------------------------------
//
// switch
// enum + switch
// switch expression
//
//
//
// LOOPS
// --------------------------------------------------------------------------
//
// for
// for-in
// while
// do-while
//
//
//
// LOOP CONTROL
// --------------------------------------------------------------------------
//
// break
// continue
//
//
//
// COLLECTION CONTROL FLOW
// --------------------------------------------------------------------------
//
// collection if
// collection if / else
// collection for
// collection if + for
//
//
//
// DEBUGGING
// --------------------------------------------------------------------------
//
// assert
//
// ============================================================================


// ============================================================================
// 61. BREAK VS CONTINUE
// ============================================================================
//
// break:
//
//   Completely stops the loop.
//
// Example:
//
//   for (...) {
//     if (...) {
//       break;
//     }
//   }
//
//
//
// continue:
//
//   Skips only the current iteration.
//
// Example:
//
//   for (...) {
//     if (...) {
//       continue;
//     }
//   }
//
// ============================================================================


// ============================================================================
// 62. FOR VS FOR-IN VS WHILE VS DO-WHILE
// ============================================================================
//
// for:
//
//   Best when you know/control the iteration count or need an index.
//
//
//
// for-in:
//
//   Best when iterating directly over collection items.
//
//
//
// while:
//
//   Best when repetition depends on a condition.
//
//
//
// do-while:
//
//   Best when the body must execute at least once.
//
// ============================================================================


// ============================================================================
// 63. IMPORTANT COMMON MISTAKES
// ============================================================================
//
// MISTAKE 1:
//
//   if (age = 18)
//
// This is assignment, not comparison.
//
// Correct:
//
//   if (age == 18)
//
//
//
// MISTAKE 2:
//
//   while (count < 10) {
//     print(count);
//   }
//
// count never changes → infinite loop.
//
//
//
// MISTAKE 3:
//
//   names[3]
//
// when:
//
//   names = ["A", "B", "C"]
//
// Valid indexes:
//
//   0
//   1
//   2
//
//
//
// MISTAKE 4:
//
// Too many nested ternary operators.
//
// Prefer readable if/else logic for complex business rules.
//
// ============================================================================


// ============================================================================
// 64. PHASE 2 PRACTICE — TASK 1
// ============================================================================
//
// Create a grade calculator.
//
// Rules:
//
//   80–100 → A+
//   70–79  → A
//   60–69  → A-
//   50–59  → B
//   40–49  → C
//   33–39  → D
//   0–32   → F
//
// Also handle invalid marks:
//
//   marks < 0
//   marks > 100
//
// ============================================================================


// ============================================================================
// 65. PHASE 2 PRACTICE — TASK 2
// ============================================================================
//
// Create login permission logic.
//
// Variables:
//
//   bool isLoggedIn;
//   bool isBlocked;
//   String role;
//
// Rules:
//
//   Not logged in
//       → Login
//
//   Logged in + blocked
//       → Access denied
//
//   Logged in + admin
//       → Admin Dashboard
//
//   Logged in + employee
//       → Employee Dashboard
//
//   Logged in + vendor
//       → Vendor Dashboard
//
// ============================================================================


// ============================================================================
// 66. PHASE 2 PRACTICE — TASK 3
// ============================================================================
//
// Given:
//
//   List<int> stocks = [10, 0, 5, 2, 0, 15, 1];
//
// Calculate:
//
//   • Number of out-of-stock products
//   • Number of low-stock products
//   • Number of available products
//   • Print each stock status
//
// Rules:
//
//   stock == 0
//       → Out of stock
//
//   stock <= 2
//       → Low stock
//
//   stock > 2
//       → Available
//
// ============================================================================


// ============================================================================
// 67. PHASE 2 PRACTICE — TASK 4
// ============================================================================
//
// Given:
//
//   List<double> prices = [100, 250, 50, 500];
//
// Calculate total.
//
// Discount:
//
//   Total >= 1000
//       → 10%
//
//   Total >= 500
//       → 5%
//
//   Otherwise
//       → 0%
//
// Print:
//
//   Subtotal
//   Discount
//   Final Total
//
// ============================================================================


// ============================================================================
// 68. PHASE 2 PRACTICE — TASK 5
// ============================================================================
//
// Create:
//
//   enum PaymentStatus {
//     pending,
//     paid,
//     failed,
//     refunded,
//   }
//
// Then use switch expression to return:
//
//   pending  → "Payment Pending"
//   paid     → "Payment Successful"
//   failed   → "Payment Failed"
//   refunded → "Payment Refunded"
//
// ============================================================================


// ============================================================================
// 69. PHASE 2 PRACTICE — TASK 6
// ============================================================================
//
// Create a list:
//
//   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//
// Using collection-for + collection-if:
//
//   • Create a list containing only even numbers.
//   • Create a list containing only odd numbers.
//   • Create a list containing squares of all numbers.
//
// ============================================================================


// ============================================================================
// 70. PHASE 2 PRACTICE — TASK 7
// ============================================================================
//
// Create a list of products:
//
//   Laptop  → stock 10
//   Phone   → stock 0
//   Tablet  → stock 5
//   Monitor → stock 2
//
// Using collection-if + collection-for:
//
//   Create a list containing only products that are currently available.
//
// ============================================================================


// ============================================================================
// 71. PHASE 2 FINAL GOAL
// ============================================================================
//
// By the end of Phase 2, you should be able to understand and write logic
// like this:
//
//
//
//   if (user.isLoggedIn && !user.isBlocked) {
//
//     switch (user.role) {
//
//       case "admin":
//         openAdminDashboard();
//         break;
//
//       case "employee":
//         openEmployeeDashboard();
//         break;
//
//       case "vendor":
//         openVendorDashboard();
//         break;
//     }
//
//   }
//
//
//
// And modern collection logic like:
//
//
//   final availableProducts = [
//     for (final product in products)
//       if (product.stock > 0)
//         product,
//   ];
//
//
//
// These are the foundations for:
//
//   Authentication
//   Authorization
//   ERP business rules
//   API handling
//   Dynamic Flutter UI
//   Form validation
//   Product filtering
//   Cart calculations
//   Order processing
//   State handling
//
// ============================================================================


// ============================================================================
// END OF DART PHASE 2
// ============================================================================
//
// NEXT:
//
// PHASE 3 — FUNCTIONS
//
// Topics:
//
//   • Function syntax
//   • Return types
//   • Parameters
//   • Positional parameters
//   • Optional positional parameters
//   • Named parameters
//   • required parameters
//   • Default parameters
//   • Arrow functions
//   • Anonymous functions
//   • Function variables
//   • Callbacks
//   • Higher-order functions
//   • Closures
//   • Scope
//   • Function types
//   • Flutter callback examples
//   • Real-world business functions
//
// ============================================================================