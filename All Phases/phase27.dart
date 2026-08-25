// ============================================================================
// DART MASTER ROADMAP
// PHASE 27 — PATTERN MATCHING, RECORDS, SEALED CLASSES & MODERN DART
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// In this phase you will learn:
//
// 01. What are Records?
// 02. Positional Records
// 03. Named Records
// 04. Mixed Records
// 05. Record type annotations
// 06. Record equality
// 07. Record destructuring
// 08. Record patterns
// 09. List patterns
// 10. Map patterns
// 11. Object patterns
// 12. Variable patterns
// 13. Wildcard patterns
// 14. Constant patterns
// 15. Relational patterns
// 16. Logical OR patterns
// 17. Logical AND patterns
// 18. Null-check patterns
// 19. Null-assert patterns
// 20. Cast patterns
// 21. Guard clauses / when
// 22. Switch statements
// 23. Switch expressions
// 24. Exhaustive switch
// 25. Sealed classes
// 26. Final classes
// 27. Base classes
// 28. Interface classes
// 29. Abstract interface classes
// 30. Pattern matching with sealed classes
// 31. Result<T> architecture
// 32. API state modeling
// 33. Flutter state modeling
// 34. DTO patterns
// 35. Practical ERP examples
//
// ============================================================================


// ============================================================================
// 01. WHAT IS A RECORD?
// ----------------------------------------------------------------------------
// A Record is an anonymous, immutable aggregate type.
//
// It lets you group multiple values together without creating a dedicated
// class.
//
// Example:
//
// (10, "Dart")
//
// ============================================================================


// ============================================================================
// 02. POSITIONAL RECORD
// ============================================================================

void positionalRecordExample() {
  final record = (
    100,
    "Dart",
    true,
  );

  print(record);
}


// ============================================================================
// 03. ACCESS POSITIONAL RECORD VALUES
// ============================================================================

void positionalAccessExample() {
  final user = (
    "Palash",
    25,
    true,
  );

  print(user.$1);
  print(user.$2);
  print(user.$3);
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// Positional record fields use:
//
// $1
// $2
// $3
// ...
//
// ============================================================================


// ============================================================================
// 04. NAMED RECORD
// ============================================================================

void namedRecordExample() {
  final user = (
    name: "Palash",
    age: 25,
    isActive: true,
  );

  print(user.name);
  print(user.age);
  print(user.isActive);
}


// ============================================================================
// 05. MIXED RECORD
// ----------------------------------------------------------------------------
// Records can contain positional and named fields.
//
// ============================================================================

void mixedRecordExample() {
  final data = (
    "Palash",
    age: 25,
    country: "Bangladesh",
  );

  print(data.$1);
  print(data.age);
  print(data.country);
}


// ============================================================================
// 06. RECORD TYPE ANNOTATION
// ============================================================================

void recordTypeExample() {
  (String, int) user = (
    "Palash",
    25,
  );

  print(user.$1);
  print(user.$2);
}


// ============================================================================
// 07. NAMED RECORD TYPE
// ============================================================================

void namedRecordTypeExample() {
  ({
    String name,
    int age,
  }) user = (
    name: "Palash",
    age: 25,
  );

  print(user.name);
  print(user.age);
}


// ============================================================================
// 08. MIXED RECORD TYPE
// ============================================================================

void mixedRecordTypeExample() {
  (
    String,
    {
      int age,
      bool active,
    }
  ) user = (
    "Palash",
    age: 25,
    active: true,
  );

  print(user.$1);
  print(user.age);
  print(user.active);
}


// ============================================================================
// 09. RECORDS ARE IMMUTABLE
// ----------------------------------------------------------------------------
// Record fields cannot be changed after creation.
//
// ============================================================================

void immutableRecordExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  // user.age = 26;
  //
  // Not allowed.
}


// ============================================================================
// 10. RECORD EQUALITY
// ----------------------------------------------------------------------------
// Records compare structurally.
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

  print(a == b);
}


// ============================================================================
// 11. RECORDS AS FUNCTION RETURN VALUES
// ----------------------------------------------------------------------------
// Very useful when a function needs to return multiple values.
//
// ============================================================================

(String, int) getUserSummary() {
  return (
    "Palash",
    25,
  );
}


// ============================================================================
// 12. USING RECORD RETURN VALUE
// ============================================================================

void recordReturnExample() {
  final result =
      getUserSummary();

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 13. NAMED RECORD RETURN
// ============================================================================

({
  String name,
  int age,
  bool active,
}) getUserInfo() {
  return (
    name: "Palash",
    age: 25,
    active: true,
  );
}


// ============================================================================
// 14. NAMED RECORD RETURN USAGE
// ============================================================================

void namedRecordReturnExample() {
  final user =
      getUserInfo();

  print(user.name);
  print(user.age);
  print(user.active);
}


// ============================================================================
// 15. RECORDS VS CLASS
// ----------------------------------------------------------------------------
//
// Record:
//
// • Anonymous
// • Lightweight
// • Immutable
// • Excellent for temporary grouped values
//
// Class:
//
// • Named type
// • Methods
// • Constructors
// • Business logic
// • Long-term domain model
//
// ============================================================================


// ============================================================================
// 16. WHEN TO USE RECORDS
// ----------------------------------------------------------------------------
//
// Good examples:
//
// • Returning multiple calculated values
// • Returning coordinates
// • Returning min/max
// • Returning parsed values
// • Temporary grouping
// • Small utility functions
//
// ============================================================================


// ============================================================================
// 17. RECORD DESTRUCTURING
// ----------------------------------------------------------------------------
// Destructuring means extracting values from a structure directly.
//
// ============================================================================

void recordDestructuringExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  final (
    name: userName,
    age: userAge,
  ) = user;

  print(userName);
  print(userAge);
}


// ============================================================================
// 18. POSITIONAL DESTRUCTURING
// ============================================================================

void positionalDestructuringExample() {
  final point = (
    100,
    200,
  );

  final (
    x,
    y,
  ) = point;

  print(x);
  print(y);
}


// ============================================================================
// 19. IGNORING VALUES
// ----------------------------------------------------------------------------
// `_` means:
//
// I don't need this value.
//
// ============================================================================

void ignoreRecordValueExample() {
  final user = (
    "Palash",
    25,
    "Bangladesh",
  );

  final (
    name,
    _,
    country,
  ) = user;

  print(name);
  print(country);
}


// ============================================================================
// 20. RECORDS WITH FUNCTIONS
// ============================================================================

({
  int min,
  int max,
}) minMax(
  List<int> values,
) {
  if (values.isEmpty) {
    throw ArgumentError(
      "List cannot be empty",
    );
  }

  var minimum = values.first;
  var maximum = values.first;

  for (final value
      in values) {
    if (value < minimum) {
      minimum = value;
    }

    if (value > maximum) {
      maximum = value;
    }
  }

  return (
    min: minimum,
    max: maximum,
  );
}


// ============================================================================
// 21. MIN MAX USAGE
// ============================================================================

void minMaxExample() {
  final result =
      minMax([
    10,
    20,
    5,
    50,
  ]);

  print(result.min);
  print(result.max);
}


// ============================================================================
// 22. RECORDS WITH GENERICS
// ============================================================================

(T, R) pair<T, R>(
  T first,
  R second,
) {
  return (
    first,
    second,
  );
}


// ============================================================================
// 23. GENERIC RECORD USAGE
// ============================================================================

void genericRecordExample() {
  final result =
      pair<String, int>(
    "Age",
    25,
  );

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 24. PATTERN MATCHING
// ----------------------------------------------------------------------------
// Pattern matching allows Dart to inspect and destructure values.
//
// It is especially useful with:
//
// • Records
// • Lists
// • Maps
// • Classes
// • Sealed classes
// • switch
//
// ============================================================================


// ============================================================================
// 25. SIMPLE SWITCH
// ============================================================================

void simpleSwitch(
  int value,
) {
  switch (value) {
    case 1:
      print("One");

    case 2:
      print("Two");

    default:
      print("Other");
  }
}


// ============================================================================
// 26. SWITCH EXPRESSION
// ----------------------------------------------------------------------------
// A switch expression returns a value.
//
// ============================================================================

String numberName(
  int value,
) {
  return switch (value) {
    1 => "One",
    2 => "Two",
    3 => "Three",
    _ => "Other",
  };
}


// ============================================================================
// 27. SWITCH EXPRESSION USAGE
// ============================================================================

void switchExpressionExample() {
  final result =
      numberName(2);

  print(result);
}


// ============================================================================
// 28. WILDCARD PATTERN
// ----------------------------------------------------------------------------
// `_` matches anything but doesn't bind the value.
//
// ============================================================================

void wildcardExample(
  Object value,
) {
  switch (value) {
    case String():
      print("String");

    case int():
      print("Integer");

    case _:
      print("Other");
  }
}


// ============================================================================
// 29. VARIABLE PATTERN
// ----------------------------------------------------------------------------
// A variable pattern captures the matched value.
//
// ============================================================================

void variablePatternExample(
  Object value,
) {
  switch (value) {
    case String text:
      print(text.length);

    case int number:
      print(number * 2);

    default:
      print("Unknown");
  }
}


// ============================================================================
// 30. TYPE PATTERN
// ============================================================================

void typePatternExample(
  Object value,
) {
  switch (value) {
    case String():
      print("String");

    case int():
      print("Integer");

    case double():
      print("Double");

    case bool():
      print("Boolean");

    default:
      print("Other");
  }
}


// ============================================================================
// 31. LIST PATTERN
// ----------------------------------------------------------------------------
// Patterns can inspect list structure.
//
// ============================================================================

void listPatternExample(
  List<int> values,
) {
  switch (values) {
    case [1, 2, 3]:
      print("Exactly 1, 2, 3");

    default:
      print("Different list");
  }
}


// ============================================================================
// 32. LIST DESTRUCTURING
// ============================================================================

void listDestructuringExample(
  List<int> values,
) {
  switch (values) {
    case [
        final first,
        final second,
      ]:
      print(first);
      print(second);

    default:
      print("Need exactly two items");
  }
}


// ============================================================================
// 33. REST ELEMENT IN LIST PATTERN
// ----------------------------------------------------------------------------
// `...` can match remaining elements.
//
// ============================================================================

void restPatternExample(
  List<int> values,
) {
  switch (values) {
    case [
        final first,
        ...final rest,
      ]:
      print(first);
      print(rest);

    default:
      print("Empty list");
  }
}


// ============================================================================
// 34. LIST PATTERN WITH WILDCARD
// ============================================================================

void listWildcardExample(
  List<int> values,
) {
  switch (values) {
    case [
        _,
        final second,
      ]:
      print(second);

    default:
      print("Different structure");
  }
}


// ============================================================================
// 35. MAP PATTERN
// ----------------------------------------------------------------------------
// Map patterns can extract values by keys.
//
// ============================================================================

void mapPatternExample(
  Map<String, Object?>
      json,
) {
  switch (json) {
    case {
        "name": String name,
        "age": int age,
      }:
      print(name);
      print(age);

    default:
      print("Invalid user");
  }
}


// ============================================================================
// 36. MAP PATTERN WITH NULLABLE VALUE
// ============================================================================

void nullableMapPattern(
  Map<String, Object?>
      json,
) {
  switch (json) {
    case {
        "name": String name,
        "email": String? email,
      }:
      print(name);
      print(email);

    default:
      print("Invalid");
  }
}


// ============================================================================
// 37. OBJECT PATTERN
// ----------------------------------------------------------------------------
// Object patterns can match fields/getters of objects.
//
// ============================================================================

class SimpleUser {
  final String name;
  final int age;

  const SimpleUser({
    required this.name,
    required this.age,
  });
}


// ============================================================================

void objectPatternExample(
  SimpleUser user,
) {
  switch (user) {
    case SimpleUser(
        name: final name,
        age: final age,
      ):
      print(name);
      print(age);
  }
}


// ============================================================================
// 38. OBJECT PATTERN WITH CONDITION
// ============================================================================

String userCategory(
  SimpleUser user,
) {
  return switch (user) {
    SimpleUser(
      age: >= 18,
    ) =>
      "Adult",

    SimpleUser(
      age: < 18,
    ) =>
      "Minor",
  };
}


// ============================================================================
// 39. RELATIONAL PATTERNS
// ----------------------------------------------------------------------------
// Relational operators:
//
// >
// >=
// <
// <=
// ==
// !=
//
// can be used inside patterns.
//
// ============================================================================

String priceCategory(
  double price,
) {
  return switch (price) {
    < 1000 => "Low",
    >= 1000 && < 10000 =>
      "Medium",
    >= 10000 => "High",
    _ => "Unknown",
  };
}


// ============================================================================
// 40. LOGICAL AND PATTERN
// ============================================================================

String ageCategory(
  int age,
) {
  return switch (age) {
    >= 0 && < 13 =>
      "Child",

    >= 13 && < 18 =>
      "Teenager",

    >= 18 && < 60 =>
      "Adult",

    >= 60 =>
      "Senior",

    _ =>
      "Invalid",
  };
}


// ============================================================================
// 41. LOGICAL OR PATTERN
// ----------------------------------------------------------------------------
// `||` means either pattern can match.
//
// ============================================================================

String dayType(
  String day,
) {
  return switch (day) {
    "Saturday" ||
    "Sunday" =>
      "Weekend",

    _ => "Weekday",
  };
}


// ============================================================================
// 42. NULL CHECK PATTERN
// ----------------------------------------------------------------------------
// `?` checks that a value is not null and then matches it.
//
// ============================================================================

void nullCheckPattern(
  String? value,
) {
  switch (value) {
    case String text?:
      print(text.length);

    case null:
      print("Null");
  }
}


// ============================================================================
// 43. NULL-ASSERT PATTERN
// ----------------------------------------------------------------------------
// `!` asserts that the value is non-null.
//
// ============================================================================

void nullAssertPattern(
  String? value,
) {
  switch (value) {
    case String text!:
      print(text);

    case null:
      print("Null");
  }
}


// ============================================================================
// 44. CAST PATTERN
// ----------------------------------------------------------------------------
// `as` can also appear in patterns.
//
// ============================================================================

void castPattern(
  Object value,
) {
  switch (value) {
    case final String text:
      print(text.toUpperCase());

    default:
      print("Not a String");
  }
}


// ============================================================================
// 45. WHEN GUARD
// ----------------------------------------------------------------------------
// `when` adds an additional condition to a pattern.
//
// ============================================================================

String classifyNumber(
  int value,
) {
  return switch (value) {
    int n when n > 0 =>
      "Positive",

    int n when n < 0 =>
      "Negative",

    0 =>
      "Zero",
  };
}


// ============================================================================
// 46. WHEN WITH OBJECT PATTERN
// ============================================================================

String classifyUser(
  SimpleUser user,
) {
  return switch (user) {
    SimpleUser(
        age: final age)
      when age >= 18 =>
      "Adult",

    SimpleUser(
        age: final age)
      when age < 18 =>
      "Minor",
  };
}


// ============================================================================
// 47. IF-CASE
// ----------------------------------------------------------------------------
// Patterns can also be used with if-case.
//
// ============================================================================

void ifCaseExample(
  Object value,
) {
  if (value case String text) {
    print(
      text.toUpperCase(),
    );
  }
}


// ============================================================================
// 48. IF-CASE WITH LIST
// ============================================================================

void ifCaseListExample(
  List<int> values,
) {
  if (values
      case [
        final first,
        final second,
      ]) {
    print(first);
    print(second);
  }
}


// ============================================================================
// 49. IF-CASE WITH MAP
// ============================================================================

void ifCaseMapExample(
  Map<String, Object?>
      json,
) {
  if (json case {
    "name": String name,
  }) {
    print(name);
  }
}


// ============================================================================
// 50. FOR-CASE
// ----------------------------------------------------------------------------
// Patterns can be used inside loops.
//
// ============================================================================

void forCaseExample(
  List<Object> values,
) {
  for (final value
      in values) {
    if (value
        case String text) {
      print(text);
    }
  }
}


// ============================================================================
// 51. FOR LOOP DESTRUCTURING
// ============================================================================

void forRecordExample() {
  final users = [
    (
      name: "Palash",
      age: 25,
    ),
    (
      name: "Rahim",
      age: 30,
    ),
  ];

  for (final (
      name: name,
      age: age,
    ) in users) {
    print(name);
    print(age);
  }
}


// ============================================================================
// 52. SEALED CLASS
// ----------------------------------------------------------------------------
// A sealed class defines a closed hierarchy.
//
// This is extremely useful for state management.
//
// ============================================================================

sealed class LoginState {
  const LoginState();
}


// ============================================================================
// 53. SEALED SUBCLASSES
// ============================================================================

class LoginInitial
    extends LoginState {
  const LoginInitial();
}


class LoginLoading
    extends LoginState {
  const LoginLoading();
}


class LoginSuccess
    extends LoginState {
  final User user;

  const LoginSuccess(
    this.user,
  );
}


class LoginFailure
    extends LoginState {
  final String message;

  const LoginFailure(
    this.message,
  );
}


// ============================================================================
// 54. EXHAUSTIVE SWITCH
// ----------------------------------------------------------------------------
// Because LoginState is sealed, Dart can know all direct subtypes.
//
// ============================================================================

String loginStateText(
  LoginState state,
) {
  return switch (state) {
    LoginInitial() =>
      "Initial",

    LoginLoading() =>
      "Loading",

    LoginSuccess(
      user: final user,
    ) =>
      "Welcome ${user.name}",

    LoginFailure(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 55. WHY SEALED CLASSES?
// ----------------------------------------------------------------------------
//
// Without sealed classes:
//
// switch may not know every possible state.
//
// With sealed classes:
//
// Dart can perform exhaustive analysis.
//
// This is excellent for:
//
// • Loading
// • Success
// • Error
// • Empty
// • Auth states
// • API states
// • Pagination states
// • Form states
//
// ============================================================================
// 56. GENERIC SEALED STATE
// ============================================================================

sealed class RequestState<T> {
  const RequestState();
}


class RequestInitial<T>
    extends RequestState<T> {
  const RequestInitial();
}


class RequestLoading<T>
    extends RequestState<T> {
  const RequestLoading();
}


class RequestSuccess<T>
    extends RequestState<T> {
  final T data;

  const RequestSuccess(
    this.data,
  );
}


class RequestError<T>
    extends RequestState<T> {
  final String message;

  const RequestError(
    this.message,
  );
}


// ============================================================================
// 57. GENERIC REQUEST STATE USAGE
// ============================================================================

String productStateText(
  RequestState<
      List<ProductModel>>
      state,
) {
  return switch (state) {
    RequestInitial() =>
      "Initial",

    RequestLoading() =>
      "Loading",

    RequestSuccess(
      data: final products,
    ) =>
      "Loaded ${products.length} products",

    RequestError(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 58. SEALED RESULT
// ----------------------------------------------------------------------------
// This is a production-friendly architecture pattern.
//
// ============================================================================

sealed class AppResult<T> {
  const AppResult();
}


class AppSuccess<T>
    extends AppResult<T> {
  final T data;

  const AppSuccess(
    this.data,
  );
}


class AppFailure<T>
    extends AppResult<T> {
  final AppError error;

  const AppFailure(
    this.error,
  );
}


class AppError {
  final String code;
  final String message;

  const AppError({
    required this.code,
    required this.message,
  });
}


// ============================================================================
// 59. RESULT HANDLER
// ============================================================================

String resultMessage<T>(
  AppResult<T> result,
) {
  return switch (result) {
    AppSuccess(
      data: final data,
    ) =>
      "Success: $data",

    AppFailure(
      error: final error,
    ) =>
      "Error: ${error.message}",
  };
}


// ============================================================================
// 60. API RESPONSE WITH SEALED RESULT
// ============================================================================

Future<
    AppResult<
        List<ProductModel>>>
    loadProducts() async {
  try {
    final products =
        <ProductModel>[];

    return AppSuccess(
      products,
    );
  } catch (error) {
    return AppFailure(
      AppError(
        code: "LOAD_FAILED",
        message:
            error.toString(),
      ),
    );
  }
}


// ============================================================================
// 61. SEALED AUTH STATE
// ----------------------------------------------------------------------------
// Excellent for Flutter authentication.
//
// ============================================================================

sealed class AuthState {
  const AuthState();
}


class AuthChecking
    extends AuthState {
  const AuthChecking();
}


class Authenticated
    extends AuthState {
  final User user;

  const Authenticated(
    this.user,
  );
}


class Unauthenticated
    extends AuthState {
  const Unauthenticated();
}


class AuthError
    extends AuthState {
  final String message;

  const AuthError(
    this.message,
  );
}


// ============================================================================
// 62. AUTH UI STATE
// ============================================================================

String authMessage(
  AuthState state,
) {
  return switch (state) {
    AuthChecking() =>
      "Checking authentication...",

    Authenticated(
      user: final user,
    ) =>
      "Welcome ${user.name}",

    Unauthenticated() =>
      "Please login",

    AuthError(
      message: final message,
    ) =>
      message,
  };
}


// ============================================================================
// 63. SEALED ORDER STATE
// ----------------------------------------------------------------------------
// Very relevant for your ERP.
//
// ============================================================================

sealed class OrderState {
  const OrderState();
}


class OrderLoading
    extends OrderState {
  const OrderLoading();
}


class OrderLoaded
    extends OrderState {
  final List<Order> orders;

  const OrderLoaded(
    this.orders,
  );
}


class OrderEmpty
    extends OrderState {
  const OrderEmpty();
}


class OrderError
    extends OrderState {
  final String message;

  const OrderError(
    this.message,
  );
}


// ============================================================================
// 64. ORDER UI DECISION
// ============================================================================

String orderMessage(
  OrderState state,
) {
  return switch (state) {
    OrderLoading() =>
      "Loading orders...",

    OrderLoaded(
      orders: final orders,
    ) =>
      "${orders.length} orders",

    OrderEmpty() =>
      "No orders found",

    OrderError(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 65. ERP PRODUCT STATE
// ============================================================================

sealed class ProductState {
  const ProductState();
}


class ProductInitial
    extends ProductState {
  const ProductInitial();
}


class ProductLoading
    extends ProductState {
  const ProductLoading();
}


class ProductLoaded
    extends ProductState {
  final List<ProductModel>
      products;

  const ProductLoaded(
    this.products,
  );
}


class ProductEmpty
    extends ProductState {
  const ProductEmpty();
}


class ProductError
    extends ProductState {
  final String message;

  const ProductError(
    this.message,
  );
}


// ============================================================================
// 66. PRODUCT STATE HANDLER
// ============================================================================

String productMessage(
  ProductState state,
) {
  return switch (state) {
    ProductInitial() =>
      "Start",

    ProductLoading() =>
      "Loading",

    ProductLoaded(
      products: final products,
    ) =>
      "Products: ${products.length}",

    ProductEmpty() =>
      "No products",

    ProductError(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 67. SEALED PAYMENT STATE
// ----------------------------------------------------------------------------
// Useful for your ERP payment/billing system.
//
// ============================================================================

sealed class PaymentState {
  const PaymentState();
}


class PaymentInitial
    extends PaymentState {
  const PaymentInitial();
}


class PaymentProcessing
    extends PaymentState {
  const PaymentProcessing();
}


class PaymentSuccess
    extends PaymentState {
  final String transactionId;

  const PaymentSuccess(
    this.transactionId,
  );
}


class PaymentFailed
    extends PaymentState {
  final String message;

  const PaymentFailed(
    this.message,
  );
}


// ============================================================================
// 68. PAYMENT STATE HANDLER
// ============================================================================

String paymentMessage(
  PaymentState state,
) {
  return switch (state) {
    PaymentInitial() =>
      "Ready",

    PaymentProcessing() =>
      "Processing",

    PaymentSuccess(
      transactionId:
          final transactionId,
    ) =>
      "Paid: $transactionId",

    PaymentFailed(
      message: final message,
    ) =>
      "Failed: $message",
  };
}


// ============================================================================
// 69. SEALED NETWORK RESULT
// ============================================================================

sealed class NetworkResult<T> {
  const NetworkResult();
}


class NetworkSuccess<T>
    extends NetworkResult<T> {
  final T data;

  const NetworkSuccess(
    this.data,
  );
}


class NetworkFailure<T>
    extends NetworkResult<T> {
  final int statusCode;
  final String message;

  const NetworkFailure({
    required this.statusCode,
    required this.message,
  });
}


// ============================================================================
// 70. NETWORK RESULT HANDLER
// ============================================================================

String networkMessage<T>(
  NetworkResult<T> result,
) {
  return switch (result) {
    NetworkSuccess(
      data: final data,
    ) =>
      "Success: $data",

    NetworkFailure(
      statusCode:
          final statusCode,
      message: final message,
    ) =>
      "$statusCode: $message",
  };
}


// ============================================================================
// 71. JSON PATTERN VALIDATION
// ----------------------------------------------------------------------------
// Pattern matching can help validate simple JSON structures.
//
// ============================================================================

bool isValidProductJson(
  Map<String, Object?>
      json,
) {
  return switch (json) {
    {
      "id": String(),
      "name": String(),
      "price": num(),
    } =>
      true,

    _ =>
      false,
  };
}


// ============================================================================
// 72. EXTRACT PRODUCT JSON
// ============================================================================

void extractProductJson(
  Map<String, Object?>
      json,
) {
  switch (json) {
    case {
        "id": String id,
        "name": String name,
        "price": num price,
      }:
      print(id);
      print(name);
      print(price);

    default:
      print(
        "Invalid product",
      );
  }
}


// ============================================================================
// 73. JSON + PATTERN + MODEL
// ----------------------------------------------------------------------------
// In production, model factories are still usually preferable for complex
// JSON parsing.
//
// Pattern matching is excellent for validating/extracting structures.
//
// ============================================================================
// 74. SWITCH EXPRESSION FOR HTTP STATUS
// ============================================================================

String httpStatusMessage(
  int statusCode,
) {
  return switch (statusCode) {
    >= 200 && < 300 =>
      "Success",

    400 =>
      "Bad Request",

    401 =>
      "Unauthorized",

    403 =>
      "Forbidden",

    404 =>
      "Not Found",

    >= 400 && < 500 =>
      "Client Error",

    >= 500 && < 600 =>
      "Server Error",

    _ =>
      "Unknown",
  };
}


// ============================================================================
// 75. SWITCH EXPRESSION FOR STOCK
// ----------------------------------------------------------------------------
// ERP-specific example.
//
// ============================================================================

String stockStatus(
  int stock,
) {
  return switch (stock) {
    0 =>
      "Out of Stock",

    > 0 && <= 5 =>
      "Low Stock",

    > 5 =>
      "In Stock",

    _ =>
      "Invalid",
  };
}


// ============================================================================
// 76. PRODUCT PRICE PATTERN
// ============================================================================

String productPriceLabel(
  ProductModel product,
) {
  return switch (product.price) {
    < 10000 =>
      "Budget",

    >= 10000 && < 50000 =>
      "Mid Range",

    >= 50000 =>
      "Premium",

    _ =>
      "Invalid",
  };
}


// ============================================================================
// 77. RECORD + PATTERN
// ----------------------------------------------------------------------------
// Records and patterns work extremely well together.
//
// ============================================================================

void recordPatternExample() {
  final product = (
    name: "Phone",
    price: 50000,
  );

  switch (product) {
    case (
        name: final name,
        price: final price,
      ):
      print(name);
      print(price);
  }
}


// ============================================================================
// 78. RECORD + SWITCH EXPRESSION
// ============================================================================

String productLabel(
  ({
    String name,
    double price,
  }) product,
) {
  return switch (product) {
    (
      name: final name,
      price: < 10000,
    ) =>
      "$name - Budget",

    (
      name: final name,
      price: >= 10000,
    ) =>
      "$name - Premium",
  };
}


// ============================================================================
// 79. NESTED PATTERNS
// ----------------------------------------------------------------------------
// Patterns can be nested.
//
// ============================================================================

void nestedPatternExample(
  List<Map<String, Object?>>
      data,
) {
  for (final item
      in data) {
    if (item case {
      "user": {
        "name": String name,
      },
    }) {
      print(name);
    }
  }
}


// ============================================================================
// 80. NESTED RECORD PATTERN
// ============================================================================

void nestedRecordExample() {
  final data = (
    user: (
      name: "Palash",
      age: 25,
    ),
    active: true,
  );

  final (
    user: (
      name: name,
      age: age,
    ),
    active: active,
  ) = data;

  print(name);
  print(age);
  print(active);
}


// ============================================================================
// 81. FINAL CLASS
// ----------------------------------------------------------------------------
// A final class cannot be extended outside its library.
//
// Use it when you want to prevent external subclassing.
//
// ============================================================================

final class ApiClient {
  const ApiClient();

  void get() {
    print("GET");
  }
}


// ============================================================================
// 82. BASE CLASS
// ----------------------------------------------------------------------------
// A base class allows controlled inheritance rules.
//
// ============================================================================

base class BaseRepository {
  void log() {
    print("Repository");
  }
}


base class ProductBaseRepository
    extends BaseRepository {
  void getProducts() {
    print("Products");
  }
}


// ============================================================================
// 83. INTERFACE CLASS
// ----------------------------------------------------------------------------
// An interface class allows others to implement the interface but prevents
// extending it outside the library.
//
// ============================================================================

interface class Logger {
  void log(
    String message,
  ) {
    print(message);
  }
}


class ConsoleLogger
    implements Logger {
  @override
  void log(
    String message,
  ) {
    print(
      "CONSOLE: $message",
    );
  }
}


// ============================================================================
// 84. ABSTRACT INTERFACE CLASS
// ----------------------------------------------------------------------------
// Excellent for defining contracts.
//
// ============================================================================

abstract interface class
    ProductDataSource {
  Future<List<ProductModel>>
      getProducts();
}


class RemoteProductDataSource
    implements
        ProductDataSource {
  @override
  Future<List<ProductModel>>
      getProducts() async {
    return [];
  }
}


// ============================================================================
// 85. SEALED VS ABSTRACT
// ----------------------------------------------------------------------------
//
// abstract:
//
// Defines a class that may be extended/implemented.
//
//
//
// sealed:
//
// Defines a closed hierarchy for exhaustive pattern matching.
//
//
//
// Use sealed when you want:
//
// "Only this known family of states exists."
//
// ============================================================================
// 86. SEALED + GENERICS + PATTERNS
// ----------------------------------------------------------------------------
// This combination is extremely powerful.
//
// ============================================================================

sealed class AsyncState<T> {
  const AsyncState();
}


class AsyncIdle<T>
    extends AsyncState<T> {
  const AsyncIdle();
}


class AsyncLoading<T>
    extends AsyncState<T> {
  const AsyncLoading();
}


class AsyncData<T>
    extends AsyncState<T> {
  final T value;

  const AsyncData(
    this.value,
  );
}


class AsyncError<T>
    extends AsyncState<T> {
  final Object error;

  const AsyncError(
    this.error,
  );
}


// ============================================================================
// 87. ASYNC STATE HANDLER
// ============================================================================

String asyncStateMessage<T>(
  AsyncState<T> state,
) {
  return switch (state) {
    AsyncIdle() =>
      "Idle",

    AsyncLoading() =>
      "Loading",

    AsyncData(
      value: final value,
    ) =>
      "Data: $value",

    AsyncError(
      error: final error,
    ) =>
      "Error: $error",
  };
}


// ============================================================================
// 88. FLUTTER ARCHITECTURE EXAMPLE
// ----------------------------------------------------------------------------
//
// Repository
//      ↓
// Service
//      ↓
// Controller
//      ↓
// AsyncState<T>
//      ↓
// Flutter UI
//
// ============================================================================
// 89. PRODUCT CONTROLLER STATE
// ============================================================================

class ProductManager {
  AsyncState<
      List<ProductModel>>
      state =
      const AsyncIdle();

  Future<void> load() async {
    state =
        const AsyncLoading();

    try {
      final products =
          <ProductModel>[];

      state =
          AsyncData(products);
    } catch (error) {
      state =
          AsyncError(error);
    }
  }
}


// ============================================================================
// 90. UI DECISION CONCEPT
// ----------------------------------------------------------------------------
//
// switch(state) {
//
//   AsyncIdle()
//       → Empty initial UI
//
//   AsyncLoading()
//       → CircularProgressIndicator
//
//   AsyncData()
//       → Product List
//
//   AsyncError()
//       → Error UI
//
// }
//
// This pattern maps beautifully to Flutter state management.
//
// ============================================================================
// 91. FORM STATE
// ----------------------------------------------------------------------------

sealed class FormState {
  const FormState();
}


class FormInitial
    extends FormState {
  const FormInitial();
}


class FormSubmitting
    extends FormState {
  const FormSubmitting();
}


class FormSuccess
    extends FormState {
  const FormSuccess();
}


class FormFailure
    extends FormState {
  final Map<String, String>
      errors;

  const FormFailure(
    this.errors,
  );
}


// ============================================================================
// 92. FORM STATE HANDLER
// ============================================================================

String formMessage(
  FormState state,
) {
  return switch (state) {
    FormInitial() =>
      "Ready",

    FormSubmitting() =>
      "Submitting",

    FormSuccess() =>
      "Success",

    FormFailure(
      errors: final errors,
    ) =>
      "Errors: ${errors.length}",
  };
}


// ============================================================================
// 93. PAGINATION STATE
// ----------------------------------------------------------------------------

sealed class PaginationState<T> {
  const PaginationState();
}


class PaginationInitial<T>
    extends PaginationState<T> {
  const PaginationInitial();
}


class PaginationLoading<T>
    extends PaginationState<T> {
  const PaginationLoading();
}


class PaginationLoaded<T>
    extends PaginationState<T> {
  final List<T> items;
  final bool hasMore;

  const PaginationLoaded({
    required this.items,
    required this.hasMore,
  });
}


class PaginationFailure<T>
    extends PaginationState<T> {
  final String message;

  const PaginationFailure(
    this.message,
  );
}


// ============================================================================
// 94. PAGINATION HANDLER
// ============================================================================

String paginationMessage<T>(
  PaginationState<T> state,
) {
  return switch (state) {
    PaginationInitial() =>
      "Initial",

    PaginationLoading() =>
      "Loading",

    PaginationLoaded(
      items: final items,
      hasMore: final hasMore,
    ) =>
      "${items.length} items | More: $hasMore",

    PaginationFailure(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 95. ERP INVENTORY STATE
// ============================================================================

sealed class InventoryState {
  const InventoryState();
}


class InventoryLoading
    extends InventoryState {
  const InventoryLoading();
}


class InventoryLoaded
    extends InventoryState {
  final List<ProductModel>
      products;

  const InventoryLoaded(
    this.products,
  );
}


class InventoryEmpty
    extends InventoryState {
  const InventoryEmpty();
}


class InventoryError
    extends InventoryState {
  final String message;

  const InventoryError(
    this.message,
  );
}


// ============================================================================
// 96. INVENTORY STATE MESSAGE
// ============================================================================

String inventoryMessage(
  InventoryState state,
) {
  return switch (state) {
    InventoryLoading() =>
      "Loading inventory",

    InventoryLoaded(
      products: final products,
    ) =>
      "${products.length} products",

    InventoryEmpty() =>
      "Inventory empty",

    InventoryError(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 97. ORDER STATUS ENUM + SWITCH
// ----------------------------------------------------------------------------
// Not every state requires a sealed class.
// For simple fixed values, enum is often better.
//
// ============================================================================

enum OrderStatus {
  pending,
  confirmed,
  processing,
  shipped,
  delivered,
  cancelled,
}


// ============================================================================
// 98. ENUM PATTERN
// ============================================================================

String orderStatusText(
  OrderStatus status,
) {
  return switch (status) {
    OrderStatus.pending =>
      "Pending",

    OrderStatus.confirmed =>
      "Confirmed",

    OrderStatus.processing =>
      "Processing",

    OrderStatus.shipped =>
      "Shipped",

    OrderStatus.delivered =>
      "Delivered",

    OrderStatus.cancelled =>
      "Cancelled",
  };
}


// ============================================================================
// 99. ENUM + SEALED CLASS
// ----------------------------------------------------------------------------
// Use enum for simple finite values.
//
// Use sealed classes when each state carries different data.
//
// Example:
//
// enum:
//
// pending
// shipped
// delivered
//
// sealed:
//
// Success(data)
// Error(message)
// Loading
//
// ============================================================================
// 100. PATTERN MATCHING WITH RECORDS FROM API
// ============================================================================

({
  int statusCode,
  Object? data,
}) apiResult() {
  return (
    statusCode: 200,
    data: "Success",
  );
}


// ============================================================================
// 101. HANDLE API RECORD
// ============================================================================

void handleApiRecord() {
  final result =
      apiResult();

  switch (result) {
    case (
        statusCode: >= 200 &&
            < 300,
        data: final data,
      ):
      print(
        "Success: $data",
      );

    case (
        statusCode: >= 400 &&
            < 500,
        data: final data,
      ):
      print(
        "Client Error: $data",
      );

    case (
        statusCode: >= 500,
        data: final data,
      ):
      print(
        "Server Error: $data",
      );

    default:
      print("Unknown");
  }
}


// ============================================================================
// 102. PATTERN MATCHING JSON PRODUCT
// ============================================================================

ProductModel?
    productFromJsonPattern(
  Map<String, Object?>
      json,
) {
  switch (json) {
    case {
        "id": String id,
        "name": String name,
        "price": num price,
      }:
      return ProductModel(
        id: id,
        name: name,
        price: price.toDouble(),
      );

    default:
      return null;
  }
}


// ============================================================================
// 103. IMPORTANT JSON RULE
// ----------------------------------------------------------------------------
// Pattern matching is NOT a replacement for every JSON parser.
//
// For complex production models:
//
// ProductModel.fromJson()
//
// is usually clearer.
//
// Patterns are excellent for:
//
// • Validation
// • Small extraction
// • Conditional handling
// • Simple JSON structures
//
// ============================================================================
// 104. NESTED SEALED STATE
// ----------------------------------------------------------------------------
// Real applications can model nested states.
//
// ============================================================================

sealed class SaveState<T> {
  const SaveState();
}


class SaveIdle<T>
    extends SaveState<T> {
  const SaveIdle();
}


class SaveLoading<T>
    extends SaveState<T> {
  const SaveLoading();
}


class SaveSuccess<T>
    extends SaveState<T> {
  final T data;

  const SaveSuccess(
    this.data,
  );
}


class SaveValidationError<T>
    extends SaveState<T> {
  final Map<String, String>
      errors;

  const SaveValidationError(
    this.errors,
  );
}


class SaveServerError<T>
    extends SaveState<T> {
  final String message;

  const SaveServerError(
    this.message,
  );
}


// ============================================================================
// 105. SAVE STATE HANDLER
// ============================================================================

String saveStateMessage<T>(
  SaveState<T> state,
) {
  return switch (state) {
    SaveIdle() =>
      "Idle",

    SaveLoading() =>
      "Saving",

    SaveSuccess(
      data: final data,
    ) =>
      "Saved: $data",

    SaveValidationError(
      errors: final errors,
    ) =>
      "Validation errors: ${errors.length}",

    SaveServerError(
      message: final message,
    ) =>
      "Server error: $message",
  };
}


// ============================================================================
// 106. PRODUCT CREATION FLOW
// ----------------------------------------------------------------------------
//
// Form
//   ↓
// Validation
//   ↓
// SaveLoading
//   ↓
// API
//   ↓
// SaveSuccess<Product>
// OR
// SaveValidationError
// OR
// SaveServerError
//
// ============================================================================
// 107. PATTERN MATCHING BENEFIT
// ----------------------------------------------------------------------------
//
// Traditional:
//
// if
// else if
// else if
// else
//
// Modern:
//
// switch + patterns
//
// This often makes state-heavy code much easier to read.
//
// ============================================================================
// 108. EXHAUSTIVENESS
// ----------------------------------------------------------------------------
// If a sealed hierarchy has:
//
// A
// B
// C
//
// Dart can warn/error when switch doesn't handle every case.
//
// This prevents forgotten UI states.
//
// ============================================================================
// 109. DEFAULT CASE
// ----------------------------------------------------------------------------
// `_` catches everything.
//
// But don't unnecessarily use:
//
// _ => ...
//
// when exhaustive matching gives you better safety.
//
// ============================================================================
// 110. IMPORTANT EXHAUSTIVENESS RULE
// ----------------------------------------------------------------------------
//
// For sealed states:
//
// Prefer explicit cases.
//
// Good:
//
// switch(state) {
//   Loading()
//   Success()
//   Error()
// }
//
// Avoid hiding everything under:
//
// _
//
// when you want compiler protection.
//
// ============================================================================
// 111. RECORD + GENERIC + SEALED
// ----------------------------------------------------------------------------
// All concepts can work together.
//
// ============================================================================

sealed class QueryResult<T> {
  const QueryResult();
}


class QuerySuccess<T>
    extends QueryResult<T> {
  final ({
    T data,
    int statusCode,
  }) result;

  const QuerySuccess(
    this.result,
  );
}


class QueryFailure<T>
    extends QueryResult<T> {
  final String message;

  const QueryFailure(
    this.message,
  );
}


// ============================================================================
// 112. QUERY RESULT HANDLER
// ============================================================================

String queryResultMessage<T>(
  QueryResult<T> result,
) {
  return switch (result) {
    QuerySuccess(
      result: (
        data: final data,
        statusCode: final statusCode,
      ),
    ) =>
      "$statusCode: $data",

    QueryFailure(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 113. PRACTICAL PRODUCT API RESULT
// ============================================================================

QueryResult<
    List<ProductModel>>
    productQuery() {
  return QuerySuccess(
    (
      data: <ProductModel>[],
      statusCode: 200,
    ),
  );
}


// ============================================================================
// 114. RECORD VS MODEL DECISION
// ----------------------------------------------------------------------------
//
// Use Record:
//
// final result = (name: ..., age: ...);
//
// Temporary/local data.
//
//
//
// Use Model:
//
// ProductModel
// UserModel
// OrderModel
//
// Domain/business data.
//
// ============================================================================
// 115. SEALED CLASS VS ENUM DECISION
// ----------------------------------------------------------------------------
//
// Use enum:
//
// enum Status {
//   pending,
//   approved,
//   rejected,
// }
//
// When values don't carry different data.
//
//
//
// Use sealed class:
//
// Success(data)
// Error(message)
// Loading
//
// When variants have different data/behavior.
//
// ============================================================================
// 116. CLASS MODIFIER DECISION
// ----------------------------------------------------------------------------
//
// abstract class
// → intended to be inherited/implemented.
//
// abstract interface class
// → contract only.
//
// interface class
// → implementation allowed, extension restricted.
//
// base class
// → controlled inheritance.
//
// final class
// → no external subclassing.
//
// sealed class
// → closed hierarchy + exhaustive matching.
//
// ============================================================================
// 117. MODERN FLUTTER STATE ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Example:
//
// sealed class ProductState
//
//       ↓
//
// ProductInitial
// ProductLoading
// ProductLoaded
// ProductEmpty
// ProductError
//
//       ↓
//
// switch(state)
//
//       ↓
//
// Flutter UI
//
// ============================================================================
// 118. FULL ERP EXAMPLE
// ----------------------------------------------------------------------------
//
// User opens Products page.
//
// ProductInitial
//       ↓
// ProductLoading
//       ↓
// API request
//       ↓
// ┌───────────────────────┐
// │                       │
// ProductLoaded       ProductEmpty
// │                       │
// │                       │
// ProductError            │
// └───────────────────────┘
//
// Every state is explicit.
//
// ============================================================================
// 119. PATTERN MATCHING + NULL SAFETY
// ============================================================================

String userName(
  User? user,
) {
  return switch (user) {
    User(name: final name) =>
      name,

    null =>
      "Guest",
  };
}


// ============================================================================
// 120. NULLABLE OBJECT PATTERN
// ============================================================================

void nullableUserPattern(
  User? user,
) {
  if (user case User(
    name: final name,
  )) {
    print(name);
  }
}


// ============================================================================
// 121. LIST + TYPE PATTERN
// ============================================================================

void listTypePattern(
  List<Object> values,
) {
  switch (values) {
    case [
        String first,
        int second,
      ]:
      print(first);
      print(second);

    default:
      print("Different");
  }
}


// ============================================================================
// 122. MAP + TYPE PATTERN
// ============================================================================

void mapTypePattern(
  Map<String, Object?>
      data,
) {
  if (data case {
    "id": String id,
    "active": bool active,
  }) {
    print(id);
    print(active);
  }
}


// ============================================================================
// 123. RELATIONAL PATTERN WITH DOUBLE
// ============================================================================

String discountLabel(
  double discount,
) {
  return switch (discount) {
    <= 0 =>
      "No discount",

    > 0 && < 10 =>
      "Small discount",

    >= 10 && < 30 =>
      "Good discount",

    >= 30 =>
      "Large discount",

    _ =>
      "Invalid",
  };
}


// ============================================================================
// 124. NESTED OBJECT PATTERN
// ============================================================================

class Company {
  final String name;
  final User owner;

  const Company({
    required this.name,
    required this.owner,
  });
}


// ============================================================================

void nestedObjectPattern(
  Company company,
) {
  switch (company) {
    case Company(
        name: final companyName,
        owner: User(
          name: final ownerName,
        )):
      print(companyName);
      print(ownerName);
  }
}


// ============================================================================
// 125. PATTERN MATCHING IN COLLECTION TRANSFORMATION
// ============================================================================

void patternCollectionExample() {
  final users = [
    (
      name: "Palash",
      age: 25,
    ),
    (
      name: "Rahim",
      age: 15,
    ),
  ];

  for (final (
      name: name,
      age: age,
    ) in users) {
    if (age >= 18) {
      print(
        "$name is adult",
      );
    }
  }
}


// ============================================================================
// 126. PRACTICAL API RESPONSE MODEL
// ============================================================================

sealed class ApiState<T> {
  const ApiState();
}


class ApiIdle<T>
    extends ApiState<T> {
  const ApiIdle();
}


class ApiLoading<T>
    extends ApiState<T> {
  const ApiLoading();
}


class ApiSuccess<T>
    extends ApiState<T> {
  final T data;
  final int statusCode;

  const ApiSuccess({
    required this.data,
    required this.statusCode,
  });
}


class ApiError<T>
    extends ApiState<T> {
  final int? statusCode;
  final String message;

  const ApiError({
    this.statusCode,
    required this.message,
  });
}


// ============================================================================
// 127. API STATE HANDLER
// ============================================================================

String apiStateMessage<T>(
  ApiState<T> state,
) {
  return switch (state) {
    ApiIdle() =>
      "Idle",

    ApiLoading() =>
      "Loading",

    ApiSuccess(
      data: final data,
      statusCode:
          final statusCode,
    ) =>
      "$statusCode: $data",

    ApiError(
      statusCode:
          final statusCode,
      message: final message,
    ) =>
      "${statusCode ?? 'N/A'}: $message",
  };
}


// ============================================================================
// 128. IMPORTANT ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Don't put UI code inside your sealed state classes.
//
// State:
//
//   describes WHAT happened.
//
// UI:
//
//   decides HOW to display it.
//
// ============================================================================
// 129. CLEAN SEPARATION
// ----------------------------------------------------------------------------
//
// Controller:
//
// state = ApiLoading()
//
// Repository:
//
// returns data/error
//
// UI:
//
// switch(state)
//
// ============================================================================
// 130. PRACTICAL LOGIN RESULT
// ============================================================================

sealed class LoginResult {
  const LoginResult();
}


class LoginSuccessResult
    extends LoginResult {
  final User user;

  const LoginSuccessResult(
    this.user,
  );
}


class LoginInvalidCredentials
    extends LoginResult {
  const LoginInvalidCredentials();
}


class LoginNetworkError
    extends LoginResult {
  final String message;

  const LoginNetworkError(
    this.message,
  );
}


// ============================================================================
// 131. LOGIN RESULT HANDLER
// ============================================================================

String loginResultMessage(
  LoginResult result,
) {
  return switch (result) {
    LoginSuccessResult(
      user: final user,
    ) =>
      "Welcome ${user.name}",

    LoginInvalidCredentials() =>
      "Invalid credentials",

    LoginNetworkError(
      message: final message,
    ) =>
      "Network error: $message",
  };
}


// ============================================================================
// 132. WHEN TO USE PATTERN MATCHING
// ----------------------------------------------------------------------------
//
// Excellent for:
//
// • State management
// • API result handling
// • JSON validation
// • Destructuring
// • Data transformation
// • Business rules
// • Enum decisions
// • UI state decisions
//
// ============================================================================
// 133. WHEN NOT TO OVERUSE PATTERNS
// ----------------------------------------------------------------------------
//
// Don't make simple code unnecessarily complicated.
//
// Instead of:
//
// switch with five patterns
//
// use:
//
// simple if
//
// when the condition is trivial.
//
// Readability always matters.
//
// ============================================================================
// 134. COMMON MISTAKE #1
// ----------------------------------------------------------------------------
//
// Mistake:
//
// Using dynamic everywhere.
//
// Better:
//
// Strong model types + patterns at boundaries.
//
// ============================================================================
// 135. COMMON MISTAKE #2
// ----------------------------------------------------------------------------
//
// Mistake:
//
// Using sealed classes for every tiny boolean.
//
// Example:
//
// sealed class IsActive
//
// This is unnecessary.
//
// A bool is enough.
//
// ============================================================================
// 136. COMMON MISTAKE #3
// ----------------------------------------------------------------------------
//
// Mistake:
//
// Creating huge nested patterns.
//
// If a pattern becomes difficult to read:
//
// extract a function.
//
// ============================================================================
// 137. COMMON MISTAKE #4
// ----------------------------------------------------------------------------
//
// Mistake:
//
// Using records as permanent domain models.
//
// Better:
//
// ProductModel
// OrderModel
// CustomerModel
//
// for real domain entities.
//
// ============================================================================
// 138. COMMON MISTAKE #5
// ----------------------------------------------------------------------------
//
// Mistake:
//
// Using `_` as a default case everywhere.
//
// This can hide newly added states.
//
// For sealed classes, prefer exhaustive explicit cases.
//
// ============================================================================
// 139. PHASE 27 INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is a Record?
//
// 02. What is a positional Record?
//
// 03. What is a named Record?
//
// 04. Can Records contain named and positional fields?
//
// 05. Are Records mutable?
//
// 06. How are Records compared?
//
// 07. What is destructuring?
//
// 08. What is a Record pattern?
//
// 09. What is a list pattern?
//
// 10. What is a map pattern?
//
// 11. What is an object pattern?
//
// 12. What does `_` mean in patterns?
//
// 13. What is a variable pattern?
//
// 14. What is a relational pattern?
//
// 15. What is `&&` in patterns?
//
// 16. What is `||` in patterns?
//
// 17. What is a null-check pattern?
//
// 18. What is a switch expression?
//
// 19. What is exhaustive matching?
//
// 20. What is a sealed class?
//
// 21. Why are sealed classes useful in Flutter?
//
// 22. Sealed class vs abstract class?
//
// 23. Sealed class vs enum?
//
// 24. What is a final class?
//
// 25. What is a base class?
//
// 26. What is an interface class?
//
// 27. What is an abstract interface class?
//
// 28. How does pattern matching improve state management?
//
// 29. How can patterns be used with JSON?
//
// 30. How can Records be used in Flutter architecture?
//
// ============================================================================
// 140. PHASE 27 CHECKLIST
// ----------------------------------------------------------------------------
//
// RECORDS
// [✓] Positional Records
// [✓] Named Records
// [✓] Mixed Records
// [✓] Record types
// [✓] Record equality
// [✓] Record destructuring
// [✓] Generic Records
//
// PATTERNS
// [✓] Variable patterns
// [✓] Wildcard patterns
// [✓] Constant patterns
// [✓] Type patterns
// [✓] List patterns
// [✓] Map patterns
// [✓] Object patterns
// [✓] Relational patterns
// [✓] Logical AND
// [✓] Logical OR
// [✓] Null-check patterns
// [✓] Null-assert patterns
// [✓] Cast concepts
// [✓] when guards
// [✓] if-case
// [✓] for-case
//
// SWITCH
// [✓] Switch statements
// [✓] Switch expressions
// [✓] Exhaustive matching
//
// CLASS MODIFIERS
// [✓] abstract
// [✓] final
// [✓] base
// [✓] interface
// [✓] abstract interface
// [✓] sealed
//
// ARCHITECTURE
// [✓] Sealed states
// [✓] Generic states
// [✓] API result states
// [✓] Authentication states
// [✓] Product states
// [✓] Order states
// [✓] Payment states
// [✓] Pagination states
// [✓] Form states
// [✓] ERP inventory states
//
// ============================================================================
// 141. PHASE 27 GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// Records are excellent for temporary grouped values.
//
// RULE 2:
// Use classes for important domain models.
//
// RULE 3:
// Patterns allow you to inspect and destructure values safely.
//
// RULE 4:
// Switch expressions return values.
//
// RULE 5:
// `_` is the wildcard pattern.
//
// RULE 6:
// `is` and type patterns are useful for safe type-based branching.
//
// RULE 7:
// Relational patterns make range-based decisions readable.
//
// RULE 8:
// `when` adds extra conditions to a pattern.
//
// RULE 9:
// Sealed classes are excellent for finite state hierarchies.
//
// RULE 10:
// Prefer exhaustive matching for important application states.
//
// RULE 11:
// Use enums for simple finite values.
//
// RULE 12:
// Use sealed classes when states carry different data.
//
// RULE 13:
// Don't use sealed classes for everything.
//
// RULE 14:
// Don't use dynamic everywhere.
//
// RULE 15:
// Don't use records as a replacement for every model.
//
// RULE 16:
// Patterns should improve readability, not reduce it.
//
// RULE 17:
// Generic + sealed classes are extremely powerful for Flutter state
// management.
//
// RULE 18:
// API boundaries can be validated with patterns.
//
// RULE 19:
// Business state should be explicit.
//
// RULE 20:
// Compiler-assisted exhaustiveness helps prevent missing UI states.
//
// ============================================================================
// 142. PHASE 27 FINAL ARCHITECTURE
// ----------------------------------------------------------------------------
//
//                 BACKEND API
//                      │
//                      ▼
//                    JSON
//                      │
//                      ▼
//               Parser / DTO
//                      │
//                      ▼
//              Repository<T>
//                      │
//                      ▼
//                Service<T>
//                      │
//                      ▼
//             Sealed ApiState<T>
//                      │
//          ┌───────────┼───────────┐
//          ▼           ▼           ▼
//        Idle       Loading       Error
//                                  │
//                                  ▼
//                              Success<T>
//                                  │
//                                  ▼
//                            Flutter UI
//
// Patterns decide exactly which state/data is present.
//
// ============================================================================
// PHASE 27 COMPLETE
// ============================================================================
//
// NEXT:
//
// PHASE 28 — DART PACKAGES, PUBSPEC, DEPENDENCIES, TESTING,
//            LINTING, ANALYZER, FORMATTING & PRODUCTION TOOLING
//
// You will learn:
//
// • pubspec.yaml
// • dependencies
// • dev_dependencies
// • dependency constraints
// • package imports
// • package structure
// • library organization
// • barrel files
// • dart analyze
// • dart format
// • dart test
// • unit testing
// • test groups
// • setUp / tearDown
// • matchers
// • async tests
// • exceptions testing
// • mocks/fakes concepts
// • code quality
// • linting
// • production Dart workflow
//
// ============================================================================