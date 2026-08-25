// ============================================================================
// DART MASTER ROADMAP
// PHASE 5 — NULL SAFETY + EXCEPTION & ERROR HANDLING
// ============================================================================
//
// Goal:
// Become completely comfortable with Dart's null-safety and error-handling
// system before moving into OOP, asynchronous programming, JSON/API work,
// and Flutter architecture.
//
// WHY THIS PHASE IS EXTREMELY IMPORTANT
// -------------------------------------
//
// As a Full-Stack Flutter Developer, you will constantly receive data like:
//
//   API response
//   Database result
//   User input
//   Optional fields
//   Authentication data
//   Product information
//   Order information
//   Uploaded images
//
// Many of these values can be missing/null.
//
// Example:
//
//   User has no profile image.
//   Product has no discount.
//   API doesn't return a field.
//   Database query finds nothing.
//   Network request fails.
//
// Dart's null safety helps you handle these situations safely.
//
// ============================================================================
//
// PHASE 5 TOPICS
//
// 01. What is null?
// 02. Null safety
// 03. Non-nullable variables
// 04. Nullable variables
// 05. ? operator
// 06. Null-aware property access ?.
// 07. Null-aware method invocation
// 08. Null-aware index access
// 09. ?? operator
// 10. ??= operator
// 11. ! operator
// 12. Type promotion
// 13. Null checks with if
// 14. Null checks with early return
// 15. Nullable collections
// 16. Nullable List elements
// 17. Nullable Map values
// 18. Nullable function parameters
// 19. Nullable return values
// 20. required keyword
// 21. late keyword
// 22. late final
// 23. late vs nullable
// 24. final + null safety
// 25. const + null safety
//
// 26. assert
// 27. What is an exception?
// 28. Exception vs error
// 29. throw
// 30. try
// 31. catch
// 32. on
// 33. finally
// 34. StackTrace
// 35. rethrow
// 36. Custom exceptions
// 37. Multiple exception types
// 38. Nested try-catch
// 39. Safe parsing
// 40. API error handling
// 41. Business logic exceptions
// 42. Validation exceptions
// 43. Production error-handling pattern
//
// ============================================================================


// ============================================================================
// 1. WHAT IS NULL?
// ============================================================================
//
// null means:
// "There is no value."
//
// Example:
//
//   String? name = null;
//
// This does NOT mean the String contains the word "null".
//
// It means name currently has no String value.
//
// ============================================================================

void nullBasicExample() {
  String? name = null;

  print(name);
}


// ============================================================================
// 2. NULL SAFETY
// ============================================================================
//
// Dart separates:
//
//   Non-nullable types
//
// from:
//
//   Nullable types
//
// Non-nullable:
//
//   String name = "Palash";
//
// Nullable:
//
//   String? name = null;
//
// ============================================================================


// ============================================================================
// 3. NON-NULLABLE VARIABLE
// ============================================================================

void nonNullableExample() {
  String name = "Palash";

  print(name);
}


// ============================================================================
// This is NOT allowed:
//
//   String name = null;
//
// Because String is non-nullable.
//
// ============================================================================


// ============================================================================
// 4. NULLABLE VARIABLE
// ============================================================================
//
// Add ? after the type.
//
// ============================================================================

void nullableExample() {
  String? name = null;

  name = "Palash";

  print(name);
}


// ============================================================================
// 5. NULLABLE INT
// ============================================================================

void nullableIntExample() {
  int? age;

  age = null;
  age = 25;

  print(age);
}


// ============================================================================
// 6. NULLABLE DOUBLE
// ============================================================================

void nullableDoubleExample() {
  double? price;

  price = null;

  print(price);
}


// ============================================================================
// 7. NULLABLE BOOL
// ============================================================================

void nullableBoolExample() {
  bool? isActive;

  isActive = null;

  print(isActive);
}


// ============================================================================
// 8. NULLABLE LIST
// ============================================================================
//
// The entire List itself can be null.
//
// ============================================================================

void nullableListExample() {
  List<String>? products;

  products = null;

  print(products);
}


// ============================================================================
// 9. NON-NULLABLE LIST WITH NULLABLE ELEMENTS
// ============================================================================
//
// The List exists,
// but individual elements may be null.
//
// ============================================================================

void nullableListElementsExample() {
  List<String?> names = [
    "Palash",
    null,
    "Rahim",
  ];

  print(names);
}


// ============================================================================
// 10. BOTH LIST AND ELEMENTS NULLABLE
// ============================================================================

void fullyNullableListExample() {
  List<String?>? names;

  names = null;

  print(names);
}


// ============================================================================
// IMPORTANT
// ============================================================================
//
// List<String>
//   → List cannot contain null Strings.
//
// List<String?>
//   → List exists, but its elements may be null.
//
// List<String>?
//   → The List itself may be null.
//
// List<String?>?
//   → Both the List and its elements may be null.
//
// ============================================================================


// ============================================================================
// 11. NULL-AWARE PROPERTY ACCESS (?)
// ============================================================================
//
// ?. allows you to access a property only if the object is not null.
//
// ============================================================================

void nullAwarePropertyExample() {
  String? name;

  print(name?.length);
}


// ============================================================================
// Without ?.:
//
//   print(name.length);
//
// This would not be allowed because name may be null.
//
// ============================================================================


// ============================================================================
// 12. NULL-AWARE METHOD CALL
// ============================================================================

void nullAwareMethodExample() {
  String? name;

  print(name?.toUpperCase());
}


// ============================================================================
// If name is null:
//
//   name?.toUpperCase()
//
// returns null.
//
// It does NOT call toUpperCase().
//
// ============================================================================


// ============================================================================
// 13. NULL-AWARE CHAINING
// ============================================================================

class Address {
  String? city;

  Address({this.city});
}

class User {
  Address? address;

  User({this.address});
}

void nullAwareChainingExample() {
  User? user;

  print(user?.address?.city);
}


// ============================================================================
// This pattern is extremely important for API data:
//
//   user?.address?.city
//
// Meaning:
//
//   user exists?
//       ↓
//   address exists?
//       ↓
//   city
//
// ============================================================================


// ============================================================================
// 14. NULL-AWARE INDEX ACCESS
// ============================================================================

void nullAwareIndexExample() {
  List<String>? products;

  print(products?[0]);
}


// ============================================================================
// If products is null:
//
//   products?[0]
//
// returns null.
//
// ============================================================================


// ============================================================================
// 15. ?? OPERATOR
// ============================================================================
//
// ?? means:
//
// "If the left side is null, use the right side."
//
// ============================================================================

void nullCoalescingExample() {
  String? name;

  final displayName = name ?? "Guest";

  print(displayName);
}


// ============================================================================
// 16. ?? WITH NUMBERS
// ============================================================================

void nullCoalescingNumberExample() {
  double? price;

  final finalPrice = price ?? 0;

  print(finalPrice);
}


// ============================================================================
// 17. ?? WITH API DATA
// ============================================================================

void apiDefaultValueExample() {
  final Map<String, dynamic> user = {
    "name": "Palash",
  };

  final phone =
      user["phone"] as String? ?? "Not provided";

  print(phone);
}


// ============================================================================
// 18. ?? WITH EMPTY STRING
// ============================================================================

void stringDefaultExample() {
  String? name;

  final result = name ?? "";

  print(result);
}


// ============================================================================
// 19. ??= OPERATOR
// ============================================================================
//
// ??= means:
//
// "Assign a value only if the variable is currently null."
//
// ============================================================================

void nullAssignmentExample() {
  String? name;

  name ??= "Guest";

  print(name);
}


// ============================================================================
// If name already has a value:
//
// ============================================================================

void nullAssignmentExistingExample() {
  String? name = "Palash";

  name ??= "Guest";

  print(name);

  // Palash
}


// ============================================================================
// 20. PRACTICAL CACHE EXAMPLE
// ============================================================================

void cacheExample() {
  String? cachedToken;

  cachedToken ??= "temporary-token";

  print(cachedToken);
}


// ============================================================================
// 21. ! OPERATOR
// ============================================================================
//
// ! means:
//
// "I guarantee this value is NOT null."
//
// Example:
//
//   String? name = "Palash";
//
//   print(name!.length);
//
// ============================================================================

void bangOperatorExample() {
  String? name = "Palash";

  print(name!.length);
}


// ============================================================================
// IMPORTANT WARNING
// ============================================================================
//
// ! does NOT make null safe.
//
// It only tells Dart:
//
// "Trust me. This is not null."
//
// If you are wrong:
//
//   String? name = null;
//
//   print(name!.length);
//
// Runtime error occurs.
//
// Therefore:
//
// USE ! ONLY WHEN YOU ARE CERTAIN.
//
// ============================================================================


// ============================================================================
// 22. SAFE NULL CHECK
// ============================================================================

void safeNullCheckExample() {
  String? name = "Palash";

  if (name != null) {
    print(name.length);
  }
}


// ============================================================================
// 23. TYPE PROMOTION
// ============================================================================
//
// After:
//
//   if (name != null)
//
// Dart understands that name is non-null inside the appropriate scope.
//
// ============================================================================

void typePromotionExample() {
  String? name = "Palash";

  if (name != null) {
    final length = name.length;

    print(length);
  }
}


// ============================================================================
// 24. NULL CHECK WITH ELSE
// ============================================================================

void nullCheckElseExample() {
  String? name;

  if (name != null) {
    print(name);
  } else {
    print("Name is missing");
  }
}


// ============================================================================
// 25. EARLY RETURN
// ============================================================================
//
// Early return is extremely useful in production code.
//
// ============================================================================

void printUserName(String? name) {
  if (name == null) {
    return;
  }

  print(name.toUpperCase());
}


// ============================================================================
// 26. NULLABLE FUNCTION PARAMETER
// ============================================================================

void greetUser(String? name) {
  print("Hello ${name ?? "Guest"}");
}


// ============================================================================
// 27. NULLABLE RETURN VALUE
// ============================================================================

String? findUsername(bool found) {
  if (found) {
    return "Palash";
  }

  return null;
}


// ============================================================================
// 28. USING NULLABLE RETURN VALUE
// ============================================================================

void nullableReturnExample() {
  final name = findUsername(false);

  print(name ?? "User not found");
}


// ============================================================================
// 29. required PARAMETER
// ============================================================================
//
// required means:
//
// "Caller MUST provide this named parameter."
//
// ============================================================================

void createUser({
  required String name,
  required String email,
}) {
  print(name);
  print(email);
}


// ============================================================================
// Usage:
//
//   createUser(
//     name: "Palash",
//     email: "palash@example.com",
//   );
//
// This concept is heavily used in Flutter constructors.
//
// ============================================================================


// ============================================================================
// 30. required DOES NOT AUTOMATICALLY MEAN NULLABLE
// ============================================================================
//
// This:
//
//   required String name
//
// means:
//
//   caller must provide it
//   AND
//   value cannot be null.
//
// If you want:
//
//   required String? name
//
// then caller must provide it,
// but the value may be null.
//
// ============================================================================

void requiredNullableExample({
  required String? nickname,
}) {
  print(nickname);
}


// ============================================================================
// 31. late KEYWORD
// ============================================================================
//
// late tells Dart:
//
// "This non-nullable variable will be initialized later,
//  before I use it."
//
// ============================================================================

void lateExample() {
  late String name;

  name = "Palash";

  print(name);
}


// ============================================================================
// 32. late VARIABLE MUST BE INITIALIZED BEFORE USE
// ============================================================================
//
// This causes a runtime error:
//
//   late String name;
//   print(name);
//
// Because name was read before initialization.
//
// ============================================================================


// ============================================================================
// 33. late final
// ============================================================================
//
// late final:
//
//   initialized later
//   assigned only once
//
// ============================================================================

void lateFinalExample() {
  late final String token;

  token = "ABC123";

  print(token);
}


// ============================================================================
// You cannot do:
//
//   token = "XYZ";
//
// again.
//
// ============================================================================


// ============================================================================
// 34. late vs nullable
// ============================================================================
//
// Nullable:
//
//   String? name;
//
// Means:
//
//   name CAN legitimately be null.
//
// late:
//
//   late String name;
//
// Means:
//
//   name should NOT be null,
//   but initialization happens later.
//
//
//
// USE nullable when:
//
//   "No value" is a valid state.
//
// USE late when:
//
//   You know a value will exist,
//   but initialization happens later.
//
// ============================================================================


// ============================================================================
// 35. late IN CLASS
// ============================================================================

class Product {
  late String name;
  late double price;

  void initialize() {
    name = "Phone";
    price = 50000;
  }
}

void lateClassExample() {
  final product = Product();

  product.initialize();

  print(product.name);
  print(product.price);
}


// ============================================================================
// 36. late final IN CLASS
// ============================================================================

class UserProfile {
  late final String userId;

  void initialize(String id) {
    userId = id;
  }
}


// ============================================================================
// 37. const WITH NULL
// ============================================================================

void constNullExample() {
  const String? name = null;

  print(name);
}


// ============================================================================
// 38. final WITH NULL
// ============================================================================

void finalNullExample() {
  final String? name = null;

  print(name);
}


// ============================================================================
// 39. NULLABLE MAP
// ============================================================================

void nullableMapExample() {
  Map<String, dynamic>? user;

  print(user);
}


// ============================================================================
// 40. MAP WITH NULLABLE VALUES
// ============================================================================

void nullableMapValuesExample() {
  final Map<String, String?> user = {
    "name": "Palash",
    "phone": null,
  };

  print(user);
}


// ============================================================================
// 41. NULL-SAFE MAP ACCESS
// ============================================================================

void safeMapAccessExample() {
  final Map<String, dynamic> user = {
    "name": "Palash",
  };

  final phone =
      user["phone"] as String? ?? "No phone";

  print(phone);
}


// ============================================================================
// 42. NULLABLE OBJECT
// ============================================================================

class Customer {
  String name;

  Customer(this.name);
}

void nullableObjectExample() {
  Customer? customer;

  print(customer?.name);
}


// ============================================================================
// 43. NULLABLE OBJECT + DEFAULT
// ============================================================================

void nullableObjectDefaultExample() {
  Customer? customer;

  final name = customer?.name ?? "Unknown Customer";

  print(name);
}


// ============================================================================
// 44. NULL-AWARE ASSIGNMENT
// ============================================================================
//
// ??= is useful for initializing optional values.
//
// ============================================================================

void nullableAssignmentExample() {
  String? status;

  status ??= "pending";

  print(status);
}


// ============================================================================
// 45. NULL-AWARE PROPERTY + METHOD
// ============================================================================

void nullableStringExample() {
  String? email = "PALASH@EXAMPLE.COM";

  final normalized =
      email?.trim().toLowerCase();

  print(normalized);
}


// ============================================================================
// 46. NULL SAFETY WITH USER INPUT
// ============================================================================

String normalizeName(String? input) {
  final name = input?.trim();

  if (name == null || name.isEmpty) {
    return "Unknown";
  }

  return name;
}


// ============================================================================
// 47. NULL SAFETY WITH PRODUCT PRICE
// ============================================================================

double calculateDiscountedPrice(
  double? price,
  double? discount,
) {
  final actualPrice = price ?? 0;
  final actualDiscount = discount ?? 0;

  return actualPrice - actualDiscount;
}


// ============================================================================
// 48. BETTER DISCOUNT EXAMPLE
// ============================================================================

double calculateDiscountedPricePercentage(
  double? price,
  double? discountPercentage,
) {
  if (price == null) {
    return 0;
  }

  final discount = discountPercentage ?? 0;

  return price - (price * discount / 100);
}


// ============================================================================
// 49. assert
// ============================================================================
//
// assert() is mainly used during development to verify assumptions.
//
// Example:
//
//   assert(price >= 0);
//
// If the assertion fails in an environment where assertions are enabled,
// an AssertionError is thrown.
//
// ============================================================================

void assertExample(double price) {
  assert(price >= 0);

  print(price);
}


// ============================================================================
// 50. ASSERT WITH STRING
// ============================================================================

void assertStringExample(String name) {
  assert(name.isNotEmpty);

  print(name);
}


// ============================================================================
// IMPORTANT
// ============================================================================
//
// assert is NOT a replacement for production validation.
//
// Never rely only on assert for security or business-critical validation.
//
// Example:
//
//   User enters negative price.
//
// You should explicitly validate it in production code.
//
// ============================================================================


// ============================================================================
// 51. WHAT IS AN EXCEPTION?
// ============================================================================
//
// An exception represents an abnormal condition during program execution.
//
// Examples:
//
//   Invalid input
//   File operation failure
//   Network failure
//   Parsing failure
//   Business rule violation
//   Invalid state
//
// ============================================================================


// ============================================================================
// 52. throw
// ============================================================================
//
// throw manually creates/raises an exception.
//
// ============================================================================

void throwExample() {
  throw Exception("Something went wrong");
}


// ============================================================================
// 53. BASIC try-catch
// ============================================================================

void tryCatchExample() {
  try {
    final result = 10 ~/ 0;

    print(result);
  } catch (error) {
    print("Error: $error");
  }
}


// ============================================================================
// 54. catch WITH StackTrace
// ============================================================================
//
// StackTrace tells you where the error happened.
//
// ============================================================================

void stackTraceExample() {
  try {
    final result = 10 ~/ 0;

    print(result);
  } catch (error, stackTrace) {
    print("Error: $error");
    print("Stack trace: $stackTrace");
  }
}


// ============================================================================
// 55. on
// ============================================================================
//
// Use on when you want to handle a specific exception type.
//
// ============================================================================

void onExample() {
  try {
    final result = int.parse("abc");

    print(result);
  } on FormatException {
    print("Invalid number format");
  }
}


// ============================================================================
// 56. on + catch
// ============================================================================

void onCatchExample() {
  try {
    final result = int.parse("abc");

    print(result);
  } on FormatException catch (error) {
    print("Parsing failed: $error");
  }
}


// ============================================================================
// 57. finally
// ============================================================================
//
// finally runs whether an exception happens or not.
//
// Useful for cleanup.
//
// ============================================================================

void finallyExample() {
  try {
    print("Doing operation");
  } catch (error) {
    print(error);
  } finally {
    print("Cleanup completed");
  }
}


// ============================================================================
// 58. TRY-CATCH-FINALLY
// ============================================================================

void completeExceptionExample() {
  try {
    final result = 10 ~/ 2;

    print(result);
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  } catch (error, stackTrace) {
    print(error);
    print(stackTrace);
  } finally {
    print("Operation finished");
  }
}


// ============================================================================
// 59. MULTIPLE EXCEPTION TYPES
// ============================================================================

void multipleExceptionExample(String input) {
  try {
    final number = int.parse(input);

    final result = 100 ~/ number;

    print(result);
  } on FormatException {
    print("Input is not a valid integer");
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  } catch (error) {
    print("Unknown error: $error");
  }
}


// ============================================================================
// 60. rethrow
// ============================================================================
//
// rethrow catches an exception and sends it upward again.
//
// Very useful when a lower layer logs/adds context,
// but the upper layer should still handle the exception.
//
// ============================================================================

void rethrowExample() {
  try {
    riskyOperation();
  } catch (error) {
    print("Logging error: $error");

    rethrow;
  }
}

void riskyOperation() {
  throw Exception("Database operation failed");
}


// ============================================================================
// IMPORTANT:
//
// throw:
//
//   Create/raise a new exception.
//
// rethrow:
//
//   Pass the existing exception upward.
//
// ============================================================================


// ============================================================================
// 61. CUSTOM EXCEPTION
// ============================================================================
//
// Custom exceptions are extremely useful in business applications.
//
// ============================================================================

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);

  @override
  String toString() {
    return "ValidationException: $message";
  }
}


// ============================================================================
// 62. THROW CUSTOM EXCEPTION
// ============================================================================

void validateName(String name) {
  if (name.trim().isEmpty) {
    throw ValidationException(
      "Name cannot be empty",
    );
  }
}


// ============================================================================
// 63. HANDLE CUSTOM EXCEPTION
// ============================================================================

void customExceptionHandlingExample() {
  try {
    validateName("");
  } on ValidationException catch (error) {
    print(error);
  }
}


// ============================================================================
// 64. BUSINESS EXCEPTION
// ============================================================================

class InsufficientStockException implements Exception {
  final String productId;
  final int requested;
  final int available;

  InsufficientStockException({
    required this.productId,
    required this.requested,
    required this.available,
  });

  @override
  String toString() {
    return "InsufficientStockException("
        "productId: $productId, "
        "requested: $requested, "
        "available: $available)";
  }
}


// ============================================================================
// 65. STOCK VALIDATION
// ============================================================================

void validateStock({
  required String productId,
  required int requested,
  required int available,
}) {
  if (requested > available) {
    throw InsufficientStockException(
      productId: productId,
      requested: requested,
      available: available,
    );
  }
}


// ============================================================================
// 66. STOCK EXCEPTION HANDLING
// ============================================================================

void stockExceptionExample() {
  try {
    validateStock(
      productId: "P001",
      requested: 20,
      available: 5,
    );
  } on InsufficientStockException catch (error) {
    print(error);
  }
}


// ============================================================================
// 67. NEVER ALLOW NEGATIVE STOCK
// ============================================================================
//
// This is a good example of business validation.
//
// ============================================================================

int decreaseStock({
  required int currentStock,
  required int quantity,
}) {
  if (quantity < 0) {
    throw ValidationException(
      "Quantity cannot be negative",
    );
  }

  if (quantity > currentStock) {
    throw InsufficientStockException(
      productId: "UNKNOWN",
      requested: quantity,
      available: currentStock,
    );
  }

  return currentStock - quantity;
}


// ============================================================================
// 68. INVALID PRICE EXCEPTION
// ============================================================================

class InvalidPriceException implements Exception {
  final String message;

  InvalidPriceException(this.message);

  @override
  String toString() {
    return "InvalidPriceException: $message";
  }
}


// ============================================================================
// 69. PRICE VALIDATION
// ============================================================================

void validatePrice(double price) {
  if (price < 0) {
    throw InvalidPriceException(
      "Price cannot be negative",
    );
  }
}


// ============================================================================
// 70. EMAIL VALIDATION EXCEPTION
// ============================================================================

class InvalidEmailException implements Exception {
  final String email;

  InvalidEmailException(this.email);

  @override
  String toString() {
    return "InvalidEmailException: $email";
  }
}


// ============================================================================
// 71. EMAIL VALIDATION
// ============================================================================

void validateEmail(String email) {
  final normalized = email.trim();

  if (normalized.isEmpty ||
      !normalized.contains("@")) {
    throw InvalidEmailException(email);
  }
}


// ============================================================================
// 72. SAFE INTEGER PARSING
// ============================================================================
//
// int.parse() throws FormatException if input is invalid.
//
// ============================================================================

int parseAge(String value) {
  try {
    return int.parse(value);
  } on FormatException {
    return 0;
  }
}


// ============================================================================
// 73. BETTER SAFE PARSING — tryParse
// ============================================================================
//
// Dart provides:
//
//   int.tryParse()
//
// It returns null instead of throwing a FormatException.
//
// ============================================================================

void tryParseExample() {
  final age = int.tryParse("abc");

  print(age);
}


// ============================================================================
// 74. DOUBLE.tryParse
// ============================================================================

void doubleTryParseExample() {
  final price = double.tryParse("50000.50");

  print(price);
}


// ============================================================================
// 75. SAFE USER INPUT PARSING
// ============================================================================

int? parseQuantity(String input) {
  final quantity = int.tryParse(
    input.trim(),
  );

  if (quantity == null || quantity < 0) {
    return null;
  }

  return quantity;
}


// ============================================================================
// 76. VALIDATE QUANTITY
// ============================================================================

void validateQuantity(String input) {
  final quantity = int.tryParse(
    input.trim(),
  );

  if (quantity == null) {
    throw ValidationException(
      "Quantity must be a valid integer",
    );
  }

  if (quantity <= 0) {
    throw ValidationException(
      "Quantity must be greater than zero",
    );
  }
}


// ============================================================================
// 77. NESTED try-catch
// ============================================================================

void nestedTryCatchExample() {
  try {
    try {
      throw Exception("Inner error");
    } catch (error) {
      print("Handled inside: $error");

      rethrow;
    }
  } catch (error) {
    print("Handled outside: $error");
  }
}


// ============================================================================
// 78. EXCEPTION FROM FUNCTION
// ============================================================================
//
// An exception can travel through multiple function calls until something
// catches it.
//
// ============================================================================

void levelOne() {
  levelTwo();
}

void levelTwo() {
  levelThree();
}

void levelThree() {
  throw Exception("Something failed");
}


// ============================================================================
// 79. HANDLING FUNCTION EXCEPTION
// ============================================================================

void exceptionPropagationExample() {
  try {
    levelOne();
  } catch (error) {
    print(error);
  }
}


// ============================================================================
// 80. CUSTOM API EXCEPTION
// ============================================================================

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(
    this.message, {
    this.statusCode,
  });

  @override
  String toString() {
    return "ApiException("
        "statusCode: $statusCode, "
        "message: $message)";
  }
}


// ============================================================================
// 81. SIMULATED API REQUEST
// ============================================================================

Map<String, dynamic> fetchUser() {
  throw ApiException(
    "User not found",
    statusCode: 404,
  );
}


// ============================================================================
// 82. HANDLE API EXCEPTION
// ============================================================================

void apiExceptionExample() {
  try {
    final user = fetchUser();

    print(user);
  } on ApiException catch (error) {
    print(
      "API Error: ${error.message}",
    );

    print(
      "Status: ${error.statusCode}",
    );
  }
}


// ============================================================================
// 83. API ERROR TYPES
// ============================================================================
//
// In a real Flutter application, you may create exceptions such as:
//
//   NetworkException
//   TimeoutException
//   UnauthorizedException
//   ForbiddenException
//   NotFoundException
//   ValidationException
//   ServerException
//   ApiException
//
// ============================================================================


// ============================================================================
// 84. NETWORK EXCEPTION
// ============================================================================

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() {
    return "NetworkException: $message";
  }
}


// ============================================================================
// 85. UNAUTHORIZED EXCEPTION
// ============================================================================

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([
    this.message = "Unauthorized",
  ]);

  @override
  String toString() {
    return "UnauthorizedException: $message";
  }
}


// ============================================================================
// 86. NOT FOUND EXCEPTION
// ============================================================================

class NotFoundException implements Exception {
  final String message;

  NotFoundException([
    this.message = "Resource not found",
  ]);

  @override
  String toString() {
    return "NotFoundException: $message";
  }
}


// ============================================================================
// 87. EXCEPTION HIERARCHY CONCEPT
// ============================================================================
//
// You can create a common base exception.
//
// ============================================================================

abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() {
    return message;
  }
}


// ============================================================================
// 88. CHILD EXCEPTIONS
// ============================================================================

class AppValidationException extends AppException {
  AppValidationException(super.message);
}

class AppNetworkException extends AppException {
  AppNetworkException(super.message);
}

class AppAuthException extends AppException {
  AppAuthException(super.message);
}


// ============================================================================
// 89. HANDLING BASE EXCEPTION
// ============================================================================

void appExceptionExample() {
  try {
    throw AppValidationException(
      "Invalid product name",
    );
  } on AppException catch (error) {
    print(error);
  }
}


// ============================================================================
// 90. PRODUCTION-STYLE VALIDATION FUNCTION
// ============================================================================

void validateProduct({
  required String name,
  required double price,
  required int stock,
}) {
  if (name.trim().isEmpty) {
    throw AppValidationException(
      "Product name is required",
    );
  }

  if (price < 0) {
    throw AppValidationException(
      "Product price cannot be negative",
    );
  }

  if (stock < 0) {
    throw AppValidationException(
      "Product stock cannot be negative",
    );
  }
}


// ============================================================================
// 91. HANDLING PRODUCT VALIDATION
// ============================================================================

void productValidationExample() {
  try {
    validateProduct(
      name: "",
      price: 50000,
      stock: 10,
    );
  } on AppValidationException catch (error) {
    print("Validation failed: $error");
  }
}


// ============================================================================
// 92. NULL SAFETY + VALIDATION
// ============================================================================

void validateOptionalProductName(
  String? name,
) {
  final normalizedName = name?.trim();

  if (normalizedName == null ||
      normalizedName.isEmpty) {
    throw AppValidationException(
      "Product name is required",
    );
  }
}


// ============================================================================
// 93. NULL SAFETY + API RESPONSE
// ============================================================================

String extractUserName(
  Map<String, dynamic>? response,
) {
  final data = response?["data"];

  if (data is! Map<String, dynamic>) {
    return "Unknown";
  }

  final name = data["name"];

  if (name is! String || name.trim().isEmpty) {
    return "Unknown";
  }

  return name;
}


// ============================================================================
// 94. TYPE CHECKING WITH is
// ============================================================================
//
// Useful when dealing with dynamic API data.
//
// ============================================================================

void typeCheckExample(dynamic value) {
  if (value is String) {
    print(value.toUpperCase());
  } else if (value is int) {
    print(value * 2);
  } else {
    print("Unknown type");
  }
}


// ============================================================================
// 95. TYPE CHECKING + NULL
// ============================================================================

void nullableTypeCheck(dynamic value) {
  if (value is String) {
    print(value.length);
  }
}


// ============================================================================
// 96. SAFE API DATA EXTRACTION
// ============================================================================

String extractProductName(
  Map<String, dynamic> product,
) {
  final name = product["name"];

  if (name is String) {
    return name;
  }

  return "Unknown Product";
}


// ============================================================================
// 97. SAFE API PRICE EXTRACTION
// ============================================================================
//
// APIs may return:
//
//   int
//   double
//   null
//
// Using num makes this easier.
//
// ============================================================================

double extractProductPrice(
  Map<String, dynamic> product,
) {
  final price = product["price"];

  if (price is num) {
    return price.toDouble();
  }

  return 0;
}


// ============================================================================
// 98. SAFE API STOCK EXTRACTION
// ============================================================================

int extractStock(
  Map<String, dynamic> product,
) {
  final stock = product["stock"];

  if (stock is int) {
    return stock;
  }

  if (stock is num) {
    return stock.toInt();
  }

  return 0;
}


// ============================================================================
// 99. EXCEPTION + STACKTRACE
// ============================================================================
//
// In production applications, you usually want both:
//
//   error
//   stackTrace
//
// because the stack trace helps locate the source of the failure.
//
// ============================================================================

void productionLoggingExample() {
  try {
    riskyOperation();
  } catch (error, stackTrace) {
    print("ERROR: $error");
    print("STACK TRACE: $stackTrace");
  }
}


// ============================================================================
// 100. DON'T CATCH EVERYTHING BLINDLY
// ============================================================================
//
// Avoid:
//
//   try {
//     ...
//   } catch (_) {}
//
// This silently hides errors.
//
// Bad:
//
//   catch (_) {}
//
// Better:
//
//   catch (error, stackTrace) {
//     log(error);
//     log(stackTrace);
//   }
//
// ============================================================================


// ============================================================================
// 101. DON'T USE ! EVERYWHERE
// ============================================================================
//
// Bad:
//
//   user!.address!.city!.length
//
// Better:
//
//   user?.address?.city?.length
//
// Or explicitly validate:
//
//   if (user == null) return;
//
// ============================================================================


// ============================================================================
// 102. NULL SAFETY IN FLUTTER API MODELS
// ============================================================================
//
// A server may return:
//
//   {
//     "id": "P001",
//     "name": "Phone",
//     "discount": null,
//     "image": null
//   }
//
// Your Dart model might use:
//
//   String id;
//   String name;
//   double? discount;
//   String? image;
//
// Because discount/image may legitimately be absent.
//
// ============================================================================


// ============================================================================
// 103. NULL SAFETY RULE FOR DATA MODELS
// ============================================================================
//
// Ask:
//
// "Can this field genuinely be absent?"
//
// If YES:
//
//   Type?
//
// If NO:
//
//   Non-nullable type.
//
// Do NOT make every field nullable just to avoid errors.
//
// ============================================================================


// ============================================================================
// 104. BAD MODEL DESIGN
// ============================================================================
//
// Avoid:
//
//   String? id;
//   String? name;
//   double? price;
//   int? stock;
//
// for everything.
//
// If your backend guarantees:
//
//   id
//   name
//   price
//   stock
//
// then keep them non-nullable.
//
// ============================================================================


// ============================================================================
// 105. GOOD MODEL DESIGN CONCEPT
// ============================================================================
//
// Example:
//
//   class Product {
//     final String id;
//     final String name;
//     final double price;
//     final int stock;
//     final double? discount;
//     final String? image;
//   }
//
// Required data stays non-nullable.
// Optional data stays nullable.
//
// ============================================================================


// ============================================================================
// 106. NULL-SAFE DEFAULT VALUES
// ============================================================================

double getFinalPrice(
  double? price,
) {
  return price ?? 0;
}


// ============================================================================
// 107. NULL-SAFE BOOLEAN
// ============================================================================
//
// Sometimes APIs return:
//
//   true
//   false
//   null
//
// ============================================================================

bool getActiveStatus(bool? active) {
  return active ?? false;
}


// ============================================================================
// 108. NULL-SAFE LIST DEFAULT
// ============================================================================

List<String> getProducts(
  List<String>? products,
) {
  return products ?? [];
}


// ============================================================================
// 109. NULL-SAFE MAP DEFAULT
// ============================================================================

Map<String, dynamic> getMetadata(
  Map<String, dynamic>? metadata,
) {
  return metadata ?? {};
}


// ============================================================================
// 110. NULL-SAFE COLLECTION PROCESSING
// ============================================================================

List<String> getActiveProductNames(
  List<Map<String, dynamic>>? products,
) {
  return products
          ?.where(
            (product) =>
                product["active"] == true,
          )
          .map(
            (product) =>
                product["name"] as String? ?? "Unknown",
          )
          .toList() ??
      [];
}


// ============================================================================
// 111. ERROR HANDLING IN A SERVICE-LIKE FUNCTION
// ============================================================================

Map<String, dynamic> loginUser(
  String email,
  String password,
) {
  if (email.trim().isEmpty) {
    throw AppValidationException(
      "Email is required",
    );
  }

  if (password.isEmpty) {
    throw AppValidationException(
      "Password is required",
    );
  }

  // Simulated result.
  return {
    "success": true,
    "token": "abc123",
  };
}


// ============================================================================
// 112. HANDLE LOGIN
// ============================================================================

void loginExample() {
  try {
    final result = loginUser(
      "palash@example.com",
      "123456",
    );

    print(result);
  } on AppValidationException catch (error) {
    print("Validation error: $error");
  } catch (error, stackTrace) {
    print("Unexpected error: $error");
    print(stackTrace);
  }
}


// ============================================================================
// 113. TRANSACTION-LIKE BUSINESS VALIDATION
// ============================================================================
//
// Imagine an order:
//
//   requested quantity
//   current stock
//
// Validate before changing stock.
//
// ============================================================================

void placeOrder({
  required int stock,
  required int quantity,
}) {
  if (quantity <= 0) {
    throw AppValidationException(
      "Order quantity must be greater than zero",
    );
  }

  if (quantity > stock) {
    throw InsufficientStockException(
      productId: "P001",
      requested: quantity,
      available: stock,
    );
  }

  print("Order can be placed");
}


// ============================================================================
// 114. EXCEPTION FLOW
// ============================================================================
//
// Example:
//
//   UI
//    ↓
//   Service
//    ↓
//   Repository
//    ↓
//   API
//
// If repository throws:
//
//   ApiException
//
// service may rethrow:
//
//   rethrow
//
// UI catches and shows appropriate message.
//
// This separation becomes very important in large Flutter applications.
//
// ============================================================================


// ============================================================================
// 115. DO NOT MIX USER MESSAGE WITH LOW-LEVEL ERROR UNNECESSARILY
// ============================================================================
//
// Low-level:
//
//   SocketException
//   FormatException
//
// Application layer:
//
//   NetworkException
//   ApiException
//
// UI:
//
//   "Unable to connect to server."
//
// Keeping these responsibilities separate creates cleaner architecture.
//
// ============================================================================


// ============================================================================
// 116. CUSTOM ERROR MESSAGE MAPPING
// ============================================================================

String getUserFriendlyMessage(
  Object error,
) {
  if (error is UnauthorizedException) {
    return "Please login again.";
  }

  if (error is NetworkException) {
    return "Please check your internet connection.";
  }

  if (error is NotFoundException) {
    return "Requested data was not found.";
  }

  if (error is AppValidationException) {
    return error.message;
  }

  return "Something went wrong.";
}


// ============================================================================
// 117. COMPLETE ERROR HANDLING EXAMPLE
// ============================================================================

void completeBusinessExample() {
  try {
    placeOrder(
      stock: 5,
      quantity: 10,
    );
  } on InsufficientStockException catch (error) {
    print(
      "Stock error: ${error.available} available.",
    );
  } on AppValidationException catch (error) {
    print(
      "Validation error: ${error.message}",
    );
  } catch (error, stackTrace) {
    print("Unexpected error: $error");
    print("StackTrace: $stackTrace");
  }
}


// ============================================================================
// 118. IMPORTANT DIFFERENCE
// ============================================================================
//
// NULL:
//
//   No value.
//
// EXCEPTION:
//
//   Something went wrong during execution.
//
// Example:
//
//   String? phone = null;
//
// is not necessarily an error.
//
// But:
//
//   throw ApiException("Server failed");
//
// represents an exceptional condition.
//
// ============================================================================


// ============================================================================
// 119. NULL VS EMPTY
// ============================================================================
//
// These are different:
//
//   null
//   ""
//   []
//   {}
//
// null:
//   No value.
//
// "": 
//   A String exists but has zero characters.
//
// []:
//   A List exists but has zero elements.
//
// {}:
//   A Map exists but has zero entries.
//
// This distinction is extremely important in API/backend development.
//
// ============================================================================


// ============================================================================
// 120. NULL VS ZERO
// ============================================================================
//
// These are different:
//
//   null
//   0
//
// null:
//   No number.
//
// 0:
//   Actual numeric value zero.
//
// Example:
//
//   discount = null
//
// may mean:
//
//   "Discount was not provided."
//
// While:
//
//   discount = 0
//
// means:
//
//   "Discount exists and is zero."
//
// ============================================================================


// ============================================================================
// 121. SAFE DIVISION
// ============================================================================

double safeDivide(
  double a,
  double b,
) {
  if (b == 0) {
    throw AppValidationException(
      "Cannot divide by zero",
    );
  }

  return a / b;
}


// ============================================================================
// 122. SAFE INVENTORY VALUE
// ============================================================================

double calculateInventoryValueSafe(
  List<Map<String, dynamic>> products,
) {
  return products.fold<double>(
    0,
    (total, product) {
      final price =
          (product["price"] as num?)?.toDouble() ?? 0;

      final stock =
          product["stock"] as int? ?? 0;

      if (stock < 0) {
        throw AppValidationException(
          "Negative stock detected",
        );
      }

      return total + (price * stock);
    },
  );
}


// ============================================================================
// 123. SAFE JSON-LIKE DATA
// ============================================================================

Map<String, dynamic> parseUserResponse(
  Map<String, dynamic>? response,
) {
  if (response == null) {
    throw ApiException(
      "Empty response",
    );
  }

  final success = response["success"];

  if (success != true) {
    throw ApiException(
      "API request failed",
    );
  }

  final data = response["data"];

  if (data is! Map<String, dynamic>) {
    throw ApiException(
      "Invalid user data",
    );
  }

  return data;
}


// ============================================================================
// 124. VALIDATION BEFORE PROCESSING
// ============================================================================
//
// Production rule:
//
//   Validate first.
//   Process second.
//
// Example:
//
//   validateProduct()
//   ↓
//   saveProduct()
//
// Not:
//
//   save half of product
//   ↓
//   discover invalid data
//
// ============================================================================


// ============================================================================
// 125. ERROR HANDLING BEST PRACTICES
// ============================================================================
//
// 1. Don't ignore errors.
//
// 2. Don't use catch (_) {} unless you intentionally want to ignore something
//    and understand the consequences.
//
// 3. Use specific exception types when possible.
//
// 4. Preserve StackTrace when debugging.
//
// 5. Use rethrow when you want higher layers to handle the same exception.
//
// 6. Don't use ! just to silence the compiler.
//
// 7. Use ? when null is a valid state.
//
// 8. Use required for required named parameters.
//
// 9. Validate business rules explicitly.
//
// 10. Keep user-friendly messages separate from low-level technical errors.
//
// 11. Don't make every model property nullable unnecessarily.
//
// 12. Use tryParse when invalid user input is expected.
//
// ============================================================================


// ============================================================================
// 126. COMMON NULL-SAFETY OPERATORS — MASTER SUMMARY
// ============================================================================
//
// ?
//
//   Makes a type nullable.
//
//   String?
//
//
// ?.
//
//   Null-aware access.
//
//   user?.name
//
//
// ??
//
//   Default value when null.
//
//   name ?? "Guest"
//
//
// ??=
//
//   Assign only when null.
//
//   name ??= "Guest"
//
//
// !
//
//   Assert to Dart that a value is not null.
//
//   name!.length
//
//   Use carefully.
//
// ============================================================================


// ============================================================================
// 127. COMMON ERROR-HANDLING KEYWORDS — MASTER SUMMARY
// ============================================================================
//
// try
//
//   Code that may throw.
//
// catch
//
//   Handle an exception.
//
// on
//
//   Handle a specific exception type.
//
// finally
//
//   Always execute cleanup code.
//
// throw
//
//   Create/raise an exception.
//
// rethrow
//
//   Pass the current exception upward.
//
// assert
//
//   Development-time assumption checking.
//
// ============================================================================


// ============================================================================
// 128. BEGINNER PRACTICE
// ============================================================================
//
// 1. Create String? name.
// 2. Set it to null.
// 3. Print name ?? "Guest".
// 4. Create int? age.
// 5. Use age ?? 0.
// 6. Create List<String>? products.
// 7. Use products ?? [].
// 8. Create String? email.
// 9. Use ?. to convert it to lowercase.
// 10. Practice ??=.
//
// ============================================================================


// ============================================================================
// 129. INTERMEDIATE PRACTICE
// ============================================================================
//
// Create:
//
//   Product
//
// fields:
//
//   id
//   name
//   price
//   discount
//   stock
//   image
//
// Make:
//
//   discount nullable
//   image nullable
//
// Then:
//
//   ✓ Calculate final price.
//   ✓ Display default image.
//   ✓ Detect low stock.
//   ✓ Prevent negative price.
//   ✓ Prevent negative stock.
//
// ============================================================================


// ============================================================================
// 130. EXCEPTION PRACTICE
// ============================================================================
//
// Create:
//
//   InvalidProductException
//
// Throw it when:
//
//   name is empty
//   price < 0
//   stock < 0
//
// Then catch it using:
//
//   on InvalidProductException catch (...)
//
// ============================================================================


// ============================================================================
// 131. API PRACTICE
// ============================================================================
//
// Simulate:
//
//   fetchProduct()
//
// It should sometimes throw:
//
//   ApiException
//
// Handle:
//
//   404
//   401
//   500
//   network error
//
// ============================================================================


// ============================================================================
// 132. FULL ERP PRACTICE
// ============================================================================
//
// Build:
//
//   createProduct()
//   updateProduct()
//   deleteProduct()
//   decreaseStock()
//   increaseStock()
//   createOrder()
//
// Rules:
//
//   • Product name cannot be empty.
//   • Price cannot be negative.
//   • Stock cannot be negative.
//   • Order quantity must be > 0.
//   • Order quantity cannot exceed stock.
//   • Unknown product should throw an exception.
//   • API failure should throw ApiException.
//
// ============================================================================


// ============================================================================
// 133. FINAL PHASE 5 CHALLENGE
// ============================================================================
//
// Build a small InventoryService:
//
//
// class InventoryService {
//
//   addProduct()
//   updateProduct()
//   findProduct()
//   decreaseStock()
//   increaseStock()
//   calculateInventoryValue()
//
// }
//
// Requirements:
//
//   ✓ Null-safe inputs
//   ✓ Validation
//   ✓ Custom exceptions
//   ✓ try/catch
//   ✓ rethrow
//   ✓ Safe API-like data
//   ✓ No negative stock
//   ✓ No negative prices
//   ✓ Missing optional values handled correctly
//
// ============================================================================


// ============================================================================
// PHASE 5 FINAL CHECKLIST
// ============================================================================
//
// NULL SAFETY
//
// [ ] Understand null
// [ ] Understand null safety
// [ ] Nullable types
// [ ] Non-nullable types
// [ ] ?
// [ ] ?.
// [ ] ?? 
// [ ] ??=
// [ ] !
// [ ] Null checks
// [ ] Type promotion
// [ ] Nullable List
// [ ] Nullable List elements
// [ ] Nullable Map
// [ ] Nullable Map values
// [ ] Nullable parameters
// [ ] Nullable return values
// [ ] required
// [ ] late
// [ ] late final
// [ ] late vs nullable
// [ ] Null-safe API data
// [ ] Null-safe model design
//
//
// ERROR HANDLING
//
// [ ] Exception
// [ ] Error concept
// [ ] throw
// [ ] try
// [ ] catch
// [ ] on
// [ ] finally
// [ ] StackTrace
// [ ] rethrow
// [ ] Custom exceptions
// [ ] Multiple exception types
// [ ] Validation exceptions
// [ ] API exceptions
// [ ] Network exceptions
// [ ] Business exceptions
// [ ] Safe parsing
// [ ] tryParse
// [ ] Error propagation
// [ ] User-friendly error messages
//
// ============================================================================
//
// MOST IMPORTANT THINGS TO MASTER BEFORE PHASE 6
//
// 1. String? name
//
// 2. name?.length
//
// 3. name ?? "Guest"
//
// 4. name ??= "Guest"
//
// 5. name!
//
// 6. if (name != null)
//
// 7. required String name
//
// 8. late String name
//
// 9. try / catch
//
// 10. on ExceptionType
//
// 11. throw
//
// 12. rethrow
//
// 13. finally
//
// 14. Custom Exception
//
// 15. Safe API data handling
//
// 16. Validation before business logic
//
// ============================================================================
//
// FULL-STACK FLUTTER CONNECTION
// -----------------------------
//
// These concepts will directly appear later in:
//
//   Flutter:
//
//     Text(user.name ?? "Guest")
//     user?.profile?.image
//     if (isAdmin) ...
//
//   API:
//
//     response["data"] ?? []
//     response["message"] ?? "Unknown error"
//
//   Authentication:
//
//     token ??= savedToken
//     user?.token
//
//   Database:
//
//     query result may be null
//
//   ERP:
//
//     optional discount
//     optional image
//     optional supplier
//     optional warehouse
//     stock validation
//     order validation
//
//   Production:
//
//     try/catch
//     custom exceptions
//     API errors
//     validation errors
//     logging
//
// ============================================================================
//
// NEXT:
//
// PHASE 6 — OBJECT-ORIENTED PROGRAMMING (OOP) IN DART
//
// Topics will include:
//
//   • Class
//   • Object
//   • Constructor
//   • Named constructor
//   • Redirecting constructor
//   • this
//   • final fields
//   • methods
//   • getters
//   • setters
//   • static
//   • inheritance
//   • extends
//   • super
//   • method overriding
//   • abstract class
//   • interface
//   • implements
//   • mixins
//   • with
//   • enum
//   • factory constructor
//   • const constructor
//   • immutable classes
//   • composition
//   • polymorphism
//   • encapsulation
//   • SOLID preparation
//   • Flutter model/class architecture
//
// ============================================================================


// ============================================================================
// END OF PHASE 5
// ============================================================================