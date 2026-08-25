// ============================================================================
// DART MASTER ROADMAP
// PHASE 30 — ADVANCED DART TYPE SYSTEM & MODERN LANGUAGE FEATURES
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// This phase takes you from "I can use Dart" to:
//
// "I understand how Dart's type system works and can design professional,
// scalable Dart/Flutter code."
//
// These concepts are especially important for:
//
// • Flutter architecture
// • Clean Architecture
// • Repository/Service patterns
// • API response models
// • State management
// • Error handling
// • Type-safe code
// • Large ERP/SaaS applications
// • Reusable packages
// • SDK/API design
// • Professional Dart interviews
//
// IMPORTANT:
// Do not try to memorize every rule.
// Understand WHY each feature exists and WHEN to use it.
//
// ============================================================================
// TOPICS
// ----------------------------------------------------------------------------
//
// 01. Dart type system
// 02. Object
// 03. Object?
// 04. dynamic
// 05. Never
// 06. Null
// 07. Type
// 08. Type checking
// 09. is
// 10. is!
// 11. as
// 12. Type promotion
// 13. Type inference
// 14. var vs dynamic
// 15. final vs const
// 16. Generic types
// 17. Generic classes
// 18. Generic methods
// 19. Generic constraints
// 20. Generic return types
// 21. typedef
// 22. Function types
// 23. Records
// 24. Record positional fields
// 25. Record named fields
// 26. Record destructuring
// 27. Pattern matching
// 28. Variable patterns
// 29. List patterns
// 30. Map patterns
// 31. Object patterns
// 32. Relational patterns
// 33. Logical patterns
// 34. Guard clauses
// 35. switch expressions
// 36. Exhaustiveness
// 37. Sealed classes
// 38. final classes
// 39. base classes
// 40. interface classes
// 41. mixin classes
// 42. Extension methods
// 43. Extension types
// 44. Advanced mixins
// 45. Interface design
// 46. Abstract interfaces
// 47. Type-safe API models
// 48. Result-style architecture
// 49. Type-safe state management
// 50. Professional architecture examples
//
// ============================================================================


// ============================================================================
// 01. DART TYPE SYSTEM
// ----------------------------------------------------------------------------
//
// Dart is strongly typed.
//
// Every expression has a type.
//
// Example:
//
// int age = 25;
// String name = "Palash";
// bool active = true;
//
// The compiler can detect many mistakes before the application runs.
//
// ============================================================================


// ============================================================================
// 02. OBJECT
// ----------------------------------------------------------------------------
//
// Object is the root type of all non-nullable Dart objects.
//
// Examples:
//
// int
// String
// bool
// List
// User
// Product
//
// all ultimately derive from Object.
//
// ============================================================================

void objectExample() {
  Object value = "Hello";

  print(value);

  value = 100;

  print(value);
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
//
// Object is NOT the same as dynamic.
//
// Object:
//
// The compiler still protects you.
//
// dynamic:
//
// The compiler allows almost anything.
//
// ============================================================================


// ============================================================================
// 03. OBJECT?
// ----------------------------------------------------------------------------
//
// Object? means:
//
// "Any Dart object OR null."
//
// ============================================================================

void objectNullableExample() {
  Object? value;

  value = "Hello";
  value = 100;
  value = null;

  print(value);
}


// ============================================================================
// 04. DYNAMIC
// ----------------------------------------------------------------------------
//
// dynamic disables much of Dart's compile-time type checking for that value.
//
// ============================================================================

void dynamicExample() {
  dynamic value = "Hello";

  print(value.length);

  value = 100;

  print(value + 10);
}


// ============================================================================
// PROBLEM WITH DYNAMIC
// ----------------------------------------------------------------------------
//
// The compiler may allow:
//
// dynamic value = "Hello";
//
// print(value.notExistingMethod());
//
// This can fail at runtime.
//
// Therefore:
//
// Prefer specific types.
//
// Use dynamic only when genuinely necessary.
//
// ============================================================================


// ============================================================================
// 05. OBJECT VS DYNAMIC
// ----------------------------------------------------------------------------

void objectVsDynamic() {
  Object objectValue = "Hello";

  // Cannot directly do this:
  //
  // objectValue.length;
  //
  // because Object does not guarantee a length property.

  dynamic dynamicValue = "Hello";

  print(
    dynamicValue.length,
  );
}


// ============================================================================
// 06. NEVER
// ----------------------------------------------------------------------------
//
// Never represents a value that can never successfully exist.
//
// A function returning Never never returns normally.
//
// Common examples:
//
// • Always throws
// • Infinite loop
// • Program termination
//
// ============================================================================

Never alwaysThrows() {
  throw Exception(
    "Something went wrong",
  );
}


// ============================================================================
// 07. NEVER IN ERROR HANDLING
// ----------------------------------------------------------------------------

String requireName(
  String? name,
) {
  return name ?? fail(
    "Name is required",
  );
}

Never fail(
  String message,
) {
  throw Exception(message);
}


// ============================================================================
// WHY NEVER?
// ----------------------------------------------------------------------------
//
// The compiler understands that fail() never returns.
//
// Therefore:
//
// name ?? fail(...)
//
// becomes type-safe.
//
// ============================================================================


// ============================================================================
// 08. NULL
// ----------------------------------------------------------------------------
//
// Null is the type of the null value.
//
// Example:
//
// String? name = null;
//
// The ? means the variable can contain null.
//
// ============================================================================


// ============================================================================
// 09. TYPE CHECKING — IS
// ----------------------------------------------------------------------------
//
// Use "is" to check a runtime type.
//
// ============================================================================

void isExample(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// 10. TYPE PROMOTION
// ----------------------------------------------------------------------------
//
// After:
//
// if (value is String)
//
// Dart understands inside that block that value is a String.
//
// ============================================================================


// ============================================================================
// 11. IS!
// ----------------------------------------------------------------------------
//
// Checks that a value is NOT a specific type.
//
// ============================================================================

void isNotExample(
  Object value,
) {
  if (value is! String) {
    print(
      "Not a String",
    );
  }
}


// ============================================================================
// 12. AS
// ----------------------------------------------------------------------------
//
// "as" performs an explicit type cast.
//
// ============================================================================

void asExample(
  Object value,
) {
  final text = value as String;

  print(
    text.length,
  );
}


// ============================================================================
// WARNING
// ----------------------------------------------------------------------------
//
// If value is not actually a String:
//
// value as String
//
// throws a runtime error.
//
// Therefore prefer:
//
// if (value is String) {
//
// }
//
// when possible.
//
// ============================================================================


// ============================================================================
// 13. TYPE PROMOTION WITH NULLABLE VALUES
// ============================================================================

void nullablePromotion(
  String? name,
) {
  if (name != null) {
    print(
      name.length,
    );
  }
}


// ============================================================================
// 14. TYPE INFERENCE
// ----------------------------------------------------------------------------
//
// Dart can determine types automatically.
//
// ============================================================================

void inferenceExample() {
  final name = "Palash";
  final age = 25;
  final active = true;

  print(name);
  print(age);
  print(active);
}


// ============================================================================
// 15. VAR VS DYNAMIC
// ----------------------------------------------------------------------------
//
// var:
//
// Type is inferred once.
//
// dynamic:
//
// Type checking is relaxed.
//
// ============================================================================

void varVsDynamic() {
  var name = "Palash";

  // name = 100;
  //
  // ERROR because name is inferred as String.

  dynamic value = "Palash";

  value = 100;

  print(value);
}


// ============================================================================
// GOLDEN RULE
// ----------------------------------------------------------------------------
//
// Prefer:
//
// final
//
// then:
//
// var
//
// Use:
//
// dynamic
//
// only when needed.
//
// ============================================================================


// ============================================================================
// 16. GENERICS
// ----------------------------------------------------------------------------
//
// Generics allow you to create reusable type-safe code.
//
// Example:
//
// List<String>
//
// List<int>
//
// Map<String, int>
//
// ============================================================================

void genericExample() {
  final names =
      <String>[
    "A",
    "B",
    "C",
  ];

  final numbers =
      <int>[
    1,
    2,
    3,
  ];

  print(names);
  print(numbers);
}


// ============================================================================
// 17. GENERIC CLASS
// ============================================================================

class Box<T> {
  final T value;

  Box(
    this.value,
  );
}


// ============================================================================
// USAGE
// ============================================================================

void genericClassExample() {
  final stringBox =
      Box<String>(
    "Hello",
  );

  final intBox =
      Box<int>(
    100,
  );

  print(
    stringBox.value,
  );

  print(
    intBox.value,
  );
}


// ============================================================================
// 18. GENERIC METHOD
// ============================================================================

T identity<T>(
  T value,
) {
  return value;
}


// ============================================================================
// USAGE
// ============================================================================

void genericMethodExample() {
  final name =
      identity<String>(
    "Palash",
  );

  final number =
      identity<int>(
    100,
  );

  print(name);
  print(number);
}


// ============================================================================
// 19. TYPE INFERENCE WITH GENERICS
// ----------------------------------------------------------------------------
//
// You often don't need to write:
//
// identity<String>("Palash")
//
// Dart can infer:
//
// identity("Palash")
//
// ============================================================================

void inferredGenericExample() {
  final name =
      identity("Palash");

  final number =
      identity(100);

  print(name);
  print(number);
}


// ============================================================================
// 20. GENERIC CONSTRAINT
// ----------------------------------------------------------------------------
//
// You can restrict what type T can be.
//
// Example:
//
// T extends Object
//
// ============================================================================

class Storage<T extends Object> {
  final T value;

  Storage(
    this.value,
  );
}


// ============================================================================
// This allows:
//
// Storage<String>
// Storage<int>
//
// But not:
//
// Storage<String?>
//
// because String? can contain null.
//
// ============================================================================


// ============================================================================
// 21. GENERIC RETURN TYPE
// ============================================================================

T firstItem<T>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================
// 22. WHY GENERICS MATTER IN FLUTTER
// ----------------------------------------------------------------------------
//
// Real application:
//
// Repository<T>
//
// ApiResponse<T>
//
// Result<T>
//
// Pagination<T>
//
// Cache<T>
//
// These patterns are everywhere in scalable Flutter applications.
//
// ============================================================================


// ============================================================================
// 23. TYPedef
// ----------------------------------------------------------------------------
//
// typedef creates an alias for a type.
//
// ============================================================================

typedef UserId = String;


// ============================================================================
// USAGE
// ============================================================================

void typedefExample() {
  UserId id =
      "USER-1001";

  print(id);
}


// ============================================================================
// 24. FUNCTION TYPE
// ----------------------------------------------------------------------------
//
// Functions are values in Dart.
//
// Example function type:
//
// String Function(String)
//
// ============================================================================

String upperCase(
  String value,
) {
  return value.toUpperCase();
}


// ============================================================================
// 25. FUNCTION VARIABLE
// ============================================================================

void functionTypeExample() {
  String Function(String)
      converter = upperCase;

  print(
    converter("hello"),
  );
}


// ============================================================================
// 26. FUNCTION TYPE TYPEDEF
// ============================================================================

typedef StringConverter =
    String Function(String);


// ============================================================================
// USAGE
// ============================================================================

void typedefFunctionExample() {
  StringConverter converter =
      upperCase;

  print(
    converter("hello"),
  );
}


// ============================================================================
// 27. RECORDS
// ----------------------------------------------------------------------------
//
// Records allow you to group multiple values into one value without creating
// a custom class.
//
// Introduced in modern Dart.
//
// ============================================================================

(String, int) getUserInfo() {
  return (
    "Palash",
    25,
  );
}


// ============================================================================
// 28. POSITIONAL RECORD
// ============================================================================

void positionalRecordExample() {
  final user =
      getUserInfo();

  print(
    user.$1,
  );

  print(
    user.$2,
  );
}


// ============================================================================
// 29. NAMED RECORD
// ============================================================================

({
  String name,
  int age,
}) getNamedUserInfo() {
  return (
    name: "Palash",
    age: 25,
  );
}


// ============================================================================
// 30. ACCESS NAMED RECORD
// ============================================================================

void namedRecordExample() {
  final user =
      getNamedUserInfo();

  print(
    user.name,
  );

  print(
    user.age,
  );
}


// ============================================================================
// 31. MIXED RECORD
// ============================================================================

(
  String,
  int, {
  bool active,
})
getMixedRecord() {
  return (
    "Palash",
    25,
    active: true,
  );
}


// ============================================================================
// 32. RECORD DESTRUCTURING
// ----------------------------------------------------------------------------
//
// You can unpack record values directly.
//
// ============================================================================

void recordDestructuringExample() {
  final (
    name,
    age,
  ) = getUserInfo();

  print(name);
  print(age);
}


// ============================================================================
// 33. NAMED RECORD DESTRUCTURING
// ============================================================================

void namedDestructuringExample() {
  final (
    name: userName,
    age: userAge,
  ) = getNamedUserInfo();

  print(userName);
  print(userAge);
}


// ============================================================================
// 34. WHY RECORDS MATTER
// ----------------------------------------------------------------------------
//
// Instead of creating a class for tiny temporary groups of values:
//
// class Result {
//   final String name;
//   final int age;
// }
//
// You can sometimes use:
//
// (String, int)
//
// Records are especially useful for internal helper functions.
//
// ============================================================================


// ============================================================================
// 35. PATTERNS
// ----------------------------------------------------------------------------
//
// Patterns allow Dart to match and destructure values.
//
// They are extremely powerful in modern Dart.
//
// ============================================================================


// ============================================================================
// 36. VARIABLE PATTERN
// ============================================================================

void variablePatternExample() {
  final value =
      100;

  switch (value) {
    case int number:
      print(
        "Number: $number",
      );
  }
}


// ============================================================================
// 37. LIST PATTERN
// ============================================================================

void listPatternExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final [
    first,
    second,
    third,
  ] = numbers;

  print(first);
  print(second);
  print(third);
}


// ============================================================================
// 38. LIST REST PATTERN
// ----------------------------------------------------------------------------
//
// ... captures remaining elements.
//
// ============================================================================

void listRestPatternExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final [
    first,
    ...rest,
  ] = numbers;

  print(first);
  print(rest);
}


// ============================================================================
// 39. MAP PATTERN
// ============================================================================

void mapPatternExample() {
  final json = {
    "name": "Palash",
    "age": 25,
  };

  if (json case {
    "name": String name,
    "age": int age,
  }) {
    print(name);
    print(age);
  }
}


// ============================================================================
// 40. OBJECT PATTERN
// ----------------------------------------------------------------------------
//
// Patterns can match object properties through getters.
//
// ============================================================================

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });
}


void objectPatternExample() {
  final user = User(
    name: "Palash",
    age: 25,
  );

  if (user case User(
    name: final name,
    age: final age,
  )) {
    print(name);
    print(age);
  }
}


// ============================================================================
// 41. RELATIONAL PATTERNS
// ----------------------------------------------------------------------------

String ageCategory(
  int age,
) {
  return switch (age) {
    < 13 => "Child",
    >= 13 && < 20 => "Teenager",
    >= 20 && < 60 => "Adult",
    _ => "Senior",
  };
}


// ============================================================================
// 42. LOGICAL PATTERNS
// ----------------------------------------------------------------------------
//
// &&
// ||
//
// can combine patterns.
//
// ============================================================================


// ============================================================================
// 43. SWITCH EXPRESSION
// ----------------------------------------------------------------------------
//
// switch can return a value.
//
// ============================================================================

String getRoleText(
  String role,
) {
  return switch (role) {
    "admin" => "Administrator",
    "employee" => "Employee",
    "vendor" => "Vendor",
    _ => "Unknown",
  };
}


// ============================================================================
// 44. SWITCH STATEMENT VS EXPRESSION
// ----------------------------------------------------------------------------
//
// Statement:
//
// switch (role) {
//   case "admin":
//     print("Admin");
// }
//
// Expression:
//
// final text = switch (role) {
//   "admin" => "Admin",
//   _ => "Unknown",
// };
//
// Expression returns a value.
//
// ============================================================================


// ============================================================================
// 45. EXHAUSTIVENESS
// ----------------------------------------------------------------------------
//
// Dart can verify that all possible cases are handled.
//
// This becomes extremely useful with sealed classes.
//
// ============================================================================


// ============================================================================
// 46. SEALED CLASS
// ----------------------------------------------------------------------------
//
// sealed classes restrict which classes can extend them.
//
// They are excellent for representing finite states.
//
// ============================================================================

sealed class ApiState {}


// ============================================================================
// 47. SUBCLASSES
// ============================================================================

class ApiLoading
    extends ApiState {}

class ApiSuccess
    extends ApiState {
  final String data;

  ApiSuccess(
    this.data,
  );
}

class ApiError
    extends ApiState {
  final String message;

  ApiError(
    this.message,
  );
}


// ============================================================================
// 48. HANDLE SEALED STATES
// ============================================================================

String stateMessage(
  ApiState state,
) {
  return switch (state) {
    ApiLoading() =>
      "Loading...",

    ApiSuccess(
      data: final data,
    ) =>
      "Success: $data",

    ApiError(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 49. WHY SEALED CLASSES ARE IMPORTANT
// ----------------------------------------------------------------------------
//
// This pattern is extremely useful in Flutter:
//
// Loading
// Success
// Error
// Empty
//
// Instead of:
//
// String status
//
// you create a type-safe state model.
//
// ============================================================================


// ============================================================================
// 50. API RESULT EXAMPLE
// ============================================================================

sealed class Result<T> {}

class Success<T>
    extends Result<T> {
  final T data;

  Success(
    this.data,
  );
}

class Failure<T>
    extends Result<T> {
  final String message;

  Failure(
    this.message,
  );
}

class Loading<T>
    extends Result<T> {}


// ============================================================================
// 51. HANDLE RESULT
// ============================================================================

String resultMessage<T>(
  Result<T> result,
) {
  return switch (result) {
    Loading<T>() =>
      "Loading",

    Success<T>(
      data: final data,
    ) =>
      "Success: $data",

    Failure<T>(
      message: final message,
    ) =>
      "Failure: $message",
  };
}


// ============================================================================
// 52. GENERICS + SEALED CLASSES
// ----------------------------------------------------------------------------
//
// This combination is extremely powerful.
//
// Result<User>
//
// Result<Product>
//
// Result<List<Order>>
//
// Same architecture, different data.
//
// ============================================================================


// ============================================================================
// 53. FINAL CLASS
// ----------------------------------------------------------------------------
//
// A final class cannot be extended outside its library.
//
// Useful when you want to control inheritance.
//
// ============================================================================

final class Token {
  final String value;

  Token(
    this.value,
  );
}


// ============================================================================
// 54. BASE CLASS
// ----------------------------------------------------------------------------
//
// A base class is designed to be extended.
//
// It controls how subclasses are created across library boundaries.
//
// ============================================================================

base class BaseRepository {
  void log() {
    print(
      "Repository",
    );
  }
}


// ============================================================================
// 55. INTERFACE CLASS
// ----------------------------------------------------------------------------
//
// interface class is designed primarily to be implemented rather than
// extended.
//
// ============================================================================

interface class Logger {
  void log(
    String message,
  ) {
    print(message);
  }
}


// ============================================================================
// 56. IMPLEMENT INTERFACE
// ============================================================================

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
// 57. MIXIN CLASS
// ----------------------------------------------------------------------------
//
// A mixin class can be used as a mixin and also as a class.
//
// ============================================================================

mixin class TimestampMixin {
  DateTime now() {
    return DateTime.now();
  }
}


// ============================================================================
// 58. USING MIXIN CLASS
// ============================================================================

class LogService
    with TimestampMixin {}


// ============================================================================
// 59. EXTENSION METHODS
// ----------------------------------------------------------------------------
//
// Extension methods add functionality to existing types without modifying
// their original class.
//
// ============================================================================

extension StringExtensions
    on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() +
        substring(1);
  }
}


// ============================================================================
// 60. USE EXTENSION
// ============================================================================

void extensionExample() {
  final text =
      "hello";

  print(
    text.capitalizeFirst(),
  );
}


// ============================================================================
// 61. EXTENSION FOR INT
// ============================================================================

extension IntExtensions
    on int {
  bool get isEvenNumber =>
      this % 2 == 0;

  bool get isOddNumber =>
      this % 2 != 0;
}


// ============================================================================
// 62. USE INT EXTENSION
// ============================================================================

void intExtensionExample() {
  print(
    10.isEvenNumber,
  );

  print(
    11.isOddNumber,
  );
}


// ============================================================================
// 63. EXTENSION GETTER
// ----------------------------------------------------------------------------
//
// Extensions can create getters.
//
// ============================================================================


// ============================================================================
// 64. EXTENSION TYPES
// ----------------------------------------------------------------------------
//
// Extension types provide a zero-cost abstraction around an existing type.
//
// They can improve API design and type safety.
//
// ============================================================================

extension type UserIdType(
  String value,
) {
  String get normalized =>
      value.trim();
}


// ============================================================================
// 65. USE EXTENSION TYPE
// ============================================================================

void extensionTypeExample() {
  final id =
      UserIdType(
    " USER-100 ",
  );

  print(
    id.normalized,
  );
}


// ============================================================================
// 66. WHY EXTENSION TYPES?
// ----------------------------------------------------------------------------
//
// Instead of:
//
// String userId;
//
// String productId;
//
// String orderId;
//
// You can create semantically different types.
//
// This prevents accidentally passing the wrong String.
//
// ============================================================================


// ============================================================================
// 67. ADVANCED MIXINS
// ----------------------------------------------------------------------------
//
// Mixins are useful for sharing behavior across unrelated classes.
//
// ============================================================================

mixin Auditable {
  void audit(
    String message,
  ) {
    print(
      "AUDIT: $message",
    );
  }
}


// ============================================================================
// 68. MULTIPLE MIXINS
// ============================================================================

class OrderService
    with Auditable, TimestampMixin {}


// ============================================================================
// 69. INTERFACES
// ----------------------------------------------------------------------------
//
// Every Dart class can act as an interface.
//
// ============================================================================

abstract interface class PaymentGateway {
  Future<bool> pay(
    double amount,
  );
}


// ============================================================================
// 70. IMPLEMENTATION
// ============================================================================

class BkashGateway
    implements PaymentGateway {
  @override
  Future<bool> pay(
    double amount,
  ) async {
    print(
      "Paying $amount",
    );

    return true;
  }
}


// ============================================================================
// 71. WHY INTERFACES MATTER
// ----------------------------------------------------------------------------
//
// You can switch implementations.
//
// PaymentGateway
//      │
// ├── BkashGateway
// ├── NagadGateway
// ├── StripeGateway
// └── PaypalGateway
//
// The rest of the application depends on the abstraction.
//
// ============================================================================


// ============================================================================
// 72. ABSTRACT INTERFACE CLASS
// ----------------------------------------------------------------------------
//
// abstract interface class is excellent for defining contracts.
//
// ============================================================================

abstract interface class UserRepository {
  Future<User?> findById(
    String id,
  );

  Future<List<User>> getUsers();
}


// ============================================================================
// 73. REPOSITORY IMPLEMENTATION
// ============================================================================

class ApiUserRepository
    implements UserRepository {
  @override
  Future<User?> findById(
    String id,
  ) async {
    return User(
      name: "Palash",
      age: 25,
    );
  }

  @override
  Future<List<User>> getUsers() async {
    return [
      User(
        name: "Palash",
        age: 25,
      ),
    ];
  }
}


// ============================================================================
// 74. TYPE-SAFE API RESPONSE
// ----------------------------------------------------------------------------
//
// A professional API architecture should avoid:
//
// dynamic response;
//
// Prefer:
//
// Result<User>
//
// Result<List<Product>>
//
// etc.
//
// ============================================================================


// ============================================================================
// 75. GENERIC API RESPONSE
// ============================================================================

class ApiResponse<T> {
  final T data;
  final int statusCode;

  ApiResponse({
    required this.data,
    required this.statusCode,
  });
}


// ============================================================================
// 76. API RESPONSE EXAMPLE
// ============================================================================

Future<ApiResponse<User>>
    fetchUser() async {
  final user =
      User(
    name: "Palash",
    age: 25,
  );

  return ApiResponse<User>(
    data: user,
    statusCode: 200,
  );
}


// ============================================================================
// 77. TYPE-SAFE PAGINATION
// ============================================================================

class Page<T> {
  final List<T> items;
  final int page;
  final int total;

  Page({
    required this.items,
    required this.page,
    required this.total,
  });
}


// ============================================================================
// 78. PAGINATION EXAMPLE
// ============================================================================

Future<Page<User>>
    fetchUsers() async {
  return Page<User>(
    items: [
      User(
        name: "Palash",
        age: 25,
      ),
    ],
    page: 1,
    total: 1,
  );
}


// ============================================================================
// 79. TYPE-SAFE STATE ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Instead of:
//
// enum Status {
//   loading,
//   success,
//   error,
// }
//
// and many nullable variables,
// you can represent state using sealed classes.
//
// ============================================================================


// ============================================================================
// 80. FLUTTER STATE EXAMPLE
// ============================================================================

sealed class UserState {}

class UserInitial
    extends UserState {}

class UserLoading
    extends UserState {}

class UserLoaded
    extends UserState {
  final User user;

  UserLoaded(
    this.user,
  );
}

class UserFailed
    extends UserState {
  final String message;

  UserFailed(
    this.message,
  );
}


// ============================================================================
// 81. HANDLE USER STATE
// ============================================================================

String renderUserState(
  UserState state,
) {
  return switch (state) {
    UserInitial() =>
      "Initial",

    UserLoading() =>
      "Loading",

    UserLoaded(
      user: final user,
    ) =>
      "Welcome ${user.name}",

    UserFailed(
      message: final message,
    ) =>
      "Error: $message",
  };
}


// ============================================================================
// 82. PATTERN MATCHING WITH RECORDS
// ============================================================================

void patternRecordExample() {
  final user = (
    name: "Palash",
    age: 25,
  );

  switch (user) {
    case (
      name: String name,
      age: int age,
    ):
      print(
        "$name - $age",
      );
  }
}


// ============================================================================
// 83. GUARD CLAUSE
// ----------------------------------------------------------------------------
//
// Patterns can use "when" conditions.
//
// ============================================================================

String classifyNumber(
  int number,
) {
  return switch (number) {
    int value when value > 100 =>
      "Large",

    int value when value > 0 =>
      "Positive",

    0 =>
      "Zero",

    _ =>
      "Negative",
  };
}


// ============================================================================
// 84. OBJECT PATTERN + GUARD
// ============================================================================

String classifyUser(
  User user,
) {
  return switch (user) {
    User(age: final age)
        when age >= 18 =>
      "Adult",

    User() =>
      "Minor",
  };
}


// ============================================================================
// 85. SEALED CLASS FOR ERP PERMISSIONS
// ----------------------------------------------------------------------------
//
// This is a practical architecture example.
//
// ============================================================================

sealed class Permission {}

class ReadPermission
    extends Permission {}

class CreatePermission
    extends Permission {}

class UpdatePermission
    extends Permission {}

class DeletePermission
    extends Permission {}


// ============================================================================
// 86. PERMISSION TEXT
// ============================================================================

String permissionText(
  Permission permission,
) {
  return switch (permission) {
    ReadPermission() =>
      "Read",

    CreatePermission() =>
      "Create",

    UpdatePermission() =>
      "Update",

    DeletePermission() =>
      "Delete",
  };
}


// ============================================================================
// 87. SEALED CLASS FOR ORDER STATES
// ============================================================================

sealed class OrderState {}

class OrderPending
    extends OrderState {}

class OrderApproved
    extends OrderState {}

class OrderProcessing
    extends OrderState {}

class OrderShipped
    extends OrderState {}

class OrderDelivered
    extends OrderState {}

class OrderCancelled
    extends OrderState {}


// ============================================================================
// 88. ORDER STATE HANDLING
// ============================================================================

String orderStateText(
  OrderState state,
) {
  return switch (state) {
    OrderPending() =>
      "Pending",

    OrderApproved() =>
      "Approved",

    OrderProcessing() =>
      "Processing",

    OrderShipped() =>
      "Shipped",

    OrderDelivered() =>
      "Delivered",

    OrderCancelled() =>
      "Cancelled",
  };
}


// ============================================================================
// 89. WHY THIS IS BETTER THAN RAW STRINGS
// ----------------------------------------------------------------------------
//
// BAD:
//
// String status = "approved";
//
// Possible mistakes:
//
// "Approved"
// "approve"
// "aproved"
// "APPROVED"
//
// Type-safe state:
//
// OrderApproved()
//
// The compiler can help you.
//
// ============================================================================


// ============================================================================
// 90. ADVANCED GENERIC REPOSITORY
// ============================================================================

abstract interface class Repository<T> {
  Future<T?> findById(
    String id,
  );

  Future<List<T>> getAll();

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
// 91. PRODUCT MODEL
// ============================================================================

class Product {
  final String id;
  final String name;

  Product({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// 92. PRODUCT REPOSITORY
// ============================================================================

class ProductRepository
    implements Repository<Product> {
  @override
  Future<Product?> findById(
    String id,
  ) async {
    return Product(
      id: id,
      name: "Phone",
    );
  }

  @override
  Future<List<Product>> getAll() async {
    return [
      Product(
        id: "P001",
        name: "Phone",
      ),
    ];
  }

  @override
  Future<Product> create(
    Product item,
  ) async {
    return item;
  }

  @override
  Future<Product> update(
    Product item,
  ) async {
    return item;
  }

  @override
  Future<void> delete(
    String id,
  ) async {}
}


// ============================================================================
// 93. WHY THIS ARCHITECTURE MATTERS
// ----------------------------------------------------------------------------
//
// Repository<Product>
//
// can become:
//
// Repository<User>
// Repository<Order>
// Repository<Product>
// Repository<Customer>
// Repository<Supplier>
// Repository<Warehouse>
//
// This is the foundation of reusable enterprise architecture.
//
// ============================================================================


// ============================================================================
// 94. TYPE-SAFE FILTER
// ============================================================================

typedef Predicate<T> =
    bool Function(T value);


List<T> filterItems<T>(
  List<T> items,
  Predicate<T> predicate,
) {
  return items
      .where(predicate)
      .toList();
}


// ============================================================================
// 95. FILTER EXAMPLE
// ============================================================================

void genericFilterExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final evenNumbers =
      filterItems<int>(
    numbers,
    (number) =>
        number.isEven,
  );

  print(evenNumbers);
}


// ============================================================================
// 96. FUNCTION TYPE AS DEPENDENCY
// ----------------------------------------------------------------------------
//
// Functions can be passed into classes.
//
// ============================================================================

class Calculator {
  final int Function(
    int,
    int,
  ) operation;

  Calculator(
    this.operation,
  );

  int calculate(
    int a,
    int b,
  ) {
    return operation(
      a,
      b,
    );
  }
}


// ============================================================================
// 97. CALCULATOR EXAMPLE
// ============================================================================

void calculatorExample() {
  final calculator =
      Calculator(
    (a, b) => a + b,
  );

  print(
    calculator.calculate(
      10,
      20,
    ),
  );
}


// ============================================================================
// 98. TYPE-SAFE CALLBACK
// ----------------------------------------------------------------------------
//
// This pattern is heavily used in Flutter.
//
// Example:
//
// void Function(User user)
//
// Future<void> Function()
//
// ValueChanged<String>
//
// ============================================================================


// ============================================================================
// 99. API ERROR MODEL
// ============================================================================

sealed class AppError {}

class NetworkError
    extends AppError {}

class AuthenticationError
    extends AppError {}

class ValidationError
    extends AppError {
  final String message;

  ValidationError(
    this.message,
  );
}

class ServerError
    extends AppError {}


// ============================================================================
// 100. ERROR HANDLING
// ============================================================================

String errorMessage(
  AppError error,
) {
  return switch (error) {
    NetworkError() =>
      "Network error",

    AuthenticationError() =>
      "Authentication required",

    ValidationError(
      message: final message,
    ) =>
      message,

    ServerError() =>
      "Server error",
  };
}


// ============================================================================
// 101. PROFESSIONAL RESULT TYPE
// ----------------------------------------------------------------------------
//
// This pattern can represent:
//
// Success
// Failure
//
// without relying on exceptions for every normal application failure.
//
// ============================================================================

sealed class OperationResult<T> {}

class OperationSuccess<T>
    extends OperationResult<T> {
  final T data;

  OperationSuccess(
    this.data,
  );
}

class OperationFailure<T>
    extends OperationResult<T> {
  final AppError error;

  OperationFailure(
    this.error,
  );
}


// ============================================================================
// 102. RESULT HANDLER
// ============================================================================

String handleOperation<T>(
  OperationResult<T> result,
) {
  return switch (result) {
    OperationSuccess<T>(
      data: final data,
    ) =>
      "Success: $data",

    OperationFailure<T>(
      error: final error,
    ) =>
      "Failure: ${errorMessage(error)}",
  };
}


// ============================================================================
// 103. EXTENSION METHOD FOR RESULT
// ----------------------------------------------------------------------------

extension OperationResultExtension<T>
    on OperationResult<T> {
  bool get isSuccess =>
      this
          is OperationSuccess<T>;

  bool get isFailure =>
      this
          is OperationFailure<T>;
}


// ============================================================================
// 104. USE EXTENSION
// ============================================================================

void resultExtensionExample() {
  final result =
      OperationSuccess<int>(
    100,
  );

  print(
    result.isSuccess,
  );
}


// ============================================================================
// 105. IMPORTANT TYPE DESIGN RULE
// ----------------------------------------------------------------------------
//
// Prefer:
//
// String
// int
// double
// bool
// DateTime
// User
// Product
// Result<User>
//
// over:
//
// dynamic
//
// whenever possible.
//
// ============================================================================


// ============================================================================
// 106. NULL SAFETY RULE
// ----------------------------------------------------------------------------
//
// Use nullable types only when null is a valid state.
//
// Good:
//
// String? middleName
//
// Bad:
//
// String? userId
//
// if userId should always exist.
//
// ============================================================================


// ============================================================================
// 107. FINAL CLASS RULE
// ----------------------------------------------------------------------------
//
// Use final class when you want to prevent external inheritance.
//
// Useful for:
//
// Models
// Value objects
// Services
// Internal implementations
//
// ============================================================================


// ============================================================================
// 108. SEALED CLASS RULE
// ----------------------------------------------------------------------------
//
// Use sealed classes when you have a finite set of states.
//
// Excellent for:
//
// UI states
// API results
// Authentication states
// Order states
// Payment states
// Permission states
//
// ============================================================================


// ============================================================================
// 109. INTERFACE RULE
// ----------------------------------------------------------------------------
//
// Use interface classes when you want to define a contract.
//
// Example:
//
// abstract interface class PaymentGateway
//
// ============================================================================


// ============================================================================
// 110. EXTENSION RULE
// ----------------------------------------------------------------------------
//
// Use extensions when you want convenience behavior without modifying the
// original type.
//
// Examples:
//
// String.capitalizeFirst()
// DateTime.isToday
// double.toCurrency()
//
// ============================================================================


// ============================================================================
// 111. EXTENSION TYPE RULE
// ----------------------------------------------------------------------------
//
// Use extension types when you want stronger semantic typing around an
// existing representation.
//
// Example:
//
// UserId
// ProductId
// OrderId
//
// ============================================================================


// ============================================================================
// 112. RECORD RULE
// ----------------------------------------------------------------------------
//
// Use records for lightweight grouping of values.
//
// Use a class when:
//
// • The object has behavior
// • It has a meaningful domain identity
// • It will be reused extensively
// • Serialization is needed
//
// ============================================================================


// ============================================================================
// 113. PATTERN RULE
// ----------------------------------------------------------------------------
//
// Patterns are especially useful for:
//
// • Destructuring
// • JSON-like maps
// • State handling
// • switch expressions
// • Sealed classes
//
// ============================================================================


// ============================================================================
// 114. PROFESSIONAL FLUTTER EXAMPLE
// ----------------------------------------------------------------------------
//
// API
// ↓
// ApiResponse<User>
// ↓
// Repository<User>
// ↓
// OperationResult<User>
// ↓
// UserState
// ↓
// switch pattern
// ↓
// Flutter UI
//
// This creates a highly type-safe architecture.
//
// ============================================================================


// ============================================================================
// 115. FULL EXAMPLE
// ============================================================================

Future<OperationResult<User>>
    loadUser() async {
  try {
    final user =
        await ApiUserRepository()
            .findById(
      "USER-001",
    );

    if (user == null) {
      return OperationFailure<User>(
        ServerError(),
      );
    }

    return OperationSuccess<User>(
      user,
    );
  } catch (_) {
    return OperationFailure<User>(
      NetworkError(),
    );
  }
}


// ============================================================================
// 116. HANDLE FULL RESULT
// ============================================================================

Future<void>
    fullResultExample() async {
  final result =
      await loadUser();

  final message =
      handleOperation(
    result,
  );

  print(message);
}


// ============================================================================
// 117. PRACTICE TASK 1
// ----------------------------------------------------------------------------
//
// Create:
//
// Box<T>
//
// Then create:
//
// Box<String>
// Box<int>
// Box<User>
//
// ============================================================================


// ============================================================================
// 118. PRACTICE TASK 2
// ----------------------------------------------------------------------------
//
// Create:
//
// Repository<T>
//
// Implement:
//
// UserRepository
// ProductRepository
// OrderRepository
//
// ============================================================================


// ============================================================================
// 119. PRACTICE TASK 3
// ----------------------------------------------------------------------------
//
// Create:
//
// sealed class LoginState
//
// States:
//
// LoginInitial
// LoginLoading
// LoginSuccess
// LoginFailure
//
// Then handle them with a switch expression.
//
// ============================================================================


// ============================================================================
// 120. PRACTICE TASK 4
// ----------------------------------------------------------------------------
//
// Create:
//
// sealed class PaymentResult
//
// States:
//
// PaymentSuccess
// PaymentFailed
// PaymentPending
// PaymentCancelled
//
// Handle all states using switch.
//
// ============================================================================


// ============================================================================
// 121. PRACTICE TASK 5
// ----------------------------------------------------------------------------
//
// Create:
//
// Result<T>
//
// with:
//
// Success<T>
// Failure<T>
//
// Test:
//
// Result<User>
// Result<Product>
// Result<List<Order>>
//
// ============================================================================


// ============================================================================
// 122. PRACTICE TASK 6
// ----------------------------------------------------------------------------
//
// Create an extension:
//
// String.capitalizeFirst()
//
// Then test it.
//
// ============================================================================


// ============================================================================
// 123. PRACTICE TASK 7
// ----------------------------------------------------------------------------
//
// Create:
//
// UserId
// ProductId
// OrderId
//
// using extension types.
//
// Make sure the types are semantically different.
//
// ============================================================================


// ============================================================================
// 124. PRACTICE TASK 8
// ----------------------------------------------------------------------------
//
// Create a record:
//
// name
// age
// email
//
// Return it from a function.
//
// Then destructure it.
//
// ============================================================================


// ============================================================================
// 125. PRACTICE TASK 9
// ----------------------------------------------------------------------------
//
// Practice patterns:
//
// • List patterns
// • Map patterns
// • Object patterns
// • Record patterns
// • Relational patterns
//
// ============================================================================


// ============================================================================
// 126. PRACTICE TASK 10
// ----------------------------------------------------------------------------
//
// Create an ERP OrderState sealed hierarchy:
//
// Pending
// Approved
// Processing
// Shipped
// Delivered
// Cancelled
//
// Build a function that returns:
//
// status title
// allowed next action
// UI message
//
// using switch expressions.
//
// ============================================================================


// ============================================================================
// 127. INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is Object in Dart?
//
// 02. Object vs dynamic?
//
// 03. What is Object??
//
// 04. What is Never?
//
// 05. Why is Never useful?
//
// 06. What is type promotion?
//
// 07. Difference between var and dynamic?
//
// 08. What are generics?
//
// 09. Why use generics?
//
// 10. What is a generic constraint?
//
// 11. What is typedef?
//
// 12. What is a function type?
//
// 13. What are records?
//
// 14. Positional vs named records?
//
// 15. What is destructuring?
//
// 16. What are patterns?
//
// 17. What is a switch expression?
//
// 18. What is exhaustiveness?
//
// 19. What is a sealed class?
//
// 20. When should you use sealed classes?
//
// 21. What is final class?
//
// 22. What is base class?
//
// 23. What is interface class?
//
// 24. What is mixin class?
//
// 25. What are extension methods?
//
// 26. What are extension types?
//
// 27. Extension method vs extension type?
//
// 28. Why are interfaces useful in Clean Architecture?
//
// 29. How can generics improve repositories?
//
// 30. Why is dynamic dangerous?
//
// 31. How can sealed classes improve Flutter state management?
//
// 32. How can records simplify helper functions?
//
// 33. What is type inference?
//
// 34. What is type-safe API architecture?
//
// 35. How would you model API loading/success/error states?
//
// ============================================================================
// 128. GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// Prefer strong types over dynamic.
//
// RULE 2:
// Use nullable types only when null is meaningful.
//
// RULE 3:
// Use generics to build reusable type-safe components.
//
// RULE 4:
// Use sealed classes for finite state hierarchies.
//
// RULE 5:
// Use switch expressions for clean state mapping.
//
// RULE 6:
// Let the compiler help you.
//
// RULE 7:
// Use interfaces to separate contracts from implementations.
//
// RULE 8:
// Use extension methods for convenient reusable behavior.
//
// RULE 9:
// Use extension types when semantic type safety matters.
//
// RULE 10:
// Use records for lightweight temporary structures.
//
// RULE 11:
// Use classes for meaningful domain models.
//
// RULE 12:
// Patterns are not just syntax—they are a tool for safer data handling.
//
// RULE 13:
// Avoid unnecessary dynamic.
//
// RULE 14:
// Don't use inheritance simply because it is available.
//
// RULE 15:
// Prefer composition and interfaces when appropriate.
//
// RULE 16:
// Type safety becomes increasingly important as your application grows.
//
// ============================================================================
// 129. FULL-STACK FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
//                 API RESPONSE
//                       │
//                       ▼
//                ApiResponse<T>
//                       │
//                       ▼
//                 Repository<T>
//                       │
//                       ▼
//               Result<T>
//                       │
//                       ▼
//                Sealed State
//                       │
//                       ▼
//              Pattern Matching
//                       │
//                       ▼
//                   UI
//
// This is the type-system foundation for building large Flutter applications.
//
// ============================================================================
// PHASE 30 COMPLETE
// ============================================================================
//
// NEXT:
// ----------------------------------------------------------------------------
// PHASE 31 — DART OOP MASTERY + PROFESSIONAL ARCHITECTURE
//
// Topics:
//
// • Class design
// • Composition
// • Inheritance
// • Polymorphism
// • Abstraction
// • Encapsulation
// • SOLID principles
// • Dependency inversion
// • Dependency injection
// • Service classes
// • Repository architecture
// • Factory patterns
// • Strategy pattern
// • Adapter pattern
// • Observer pattern
// • Singleton considerations
// • Immutable models
// • Value objects
// • Domain-driven design concepts
// • Clean Architecture connection
// • Flutter project architecture
//
// ============================================================================
// END OF PHASE 30
// ============================================================================