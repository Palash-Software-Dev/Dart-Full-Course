// ============================================================================
// DART MASTER ROADMAP
// PHASE 34 — NULL SAFETY + TYPE SYSTEM MASTERY
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// Null safety and Dart's type system are FUNDAMENTAL for professional
// Flutter development.
//
// If you understand this phase properly, you will be much more comfortable
// with:
//
// • API responses
// • JSON parsing
// • Models
// • State management
// • Forms
// • Authentication
// • Database data
// • Async programming
// • Flutter widgets
// • Error handling
// • Production-level code
//
// ============================================================================
// TOPICS
// ----------------------------------------------------------------------------
//
// 01. What is null?
// 02. Null safety
// 03. Non-nullable variables
// 04. Nullable variables
// 05. ? operator
// 06. null checking
// 07. if != null
// 08. if == null
// 09. ?? operator
// 10. ??= operator
// 11. ?. operator
// 12. ! operator
// 13. null-aware method calls
// 14. nullable properties
// 15. nullable parameters
// 16. nullable return types
// 17. required
// 18. late
// 19. late final
// 20. final vs late final
// 21. type inference
// 22. var
// 23. final
// 24. const
// 25. dynamic
// 26. Object
// 27. Object?
// 28. Never
// 29. void
// 30. runtimeType
// 31. is
// 32. is!
// 33. as
// 34. safe casting
// 35. type promotion
// 36. nullable collections
// 37. nullable List
// 38. List with nullable elements
// 39. nullable Map values
// 40. JSON null handling
// 41. API response safety
// 42. model parsing safety
// 43. default values
// 44. copyWith null safety
// 45. Flutter null-safety patterns
// 46. common mistakes
// 47. professional practices
//
// ============================================================================


// ============================================================================
// 01. WHAT IS NULL?
// ----------------------------------------------------------------------------
//
// null means:
//
// "There is no value."
//
// Example:
//
// A user may not have a phone number.
// A product may not have a discount.
// An API field may be missing.
// A user may not be logged in.
//
// ============================================================================

void nullBasic() {
  String? name = null;

  print(name);
}


// ============================================================================
// 02. NULL SAFETY
// ----------------------------------------------------------------------------
//
// Dart separates:
//
// NON-NULLABLE
//
// String
// int
// double
// bool
//
// from:
//
// NULLABLE
//
// String?
// int?
// double?
// bool?
//
// ============================================================================


// ============================================================================
// 03. NON-NULLABLE VARIABLE
// ----------------------------------------------------------------------------
//
// A normal String cannot contain null.
//
// ============================================================================

void nonNullableExample() {
  String name = "Palash";

  print(name);

  // name = null;
  //
  // ERROR
}


// ============================================================================
// 04. NULLABLE VARIABLE
// ----------------------------------------------------------------------------
//
// Add ? after the type.
//
// ============================================================================

void nullableExample() {
  String? name;

  name = null;
  name = "Palash";

  print(name);
}


// ============================================================================
// 05. INTEGER NULLABILITY
// ============================================================================

void nullableNumbers() {
  int? age;

  age = null;
  age = 25;

  print(age);
}


// ============================================================================
// 06. BOOLEAN NULLABILITY
// ============================================================================

void nullableBoolean() {
  bool? isActive;

  isActive = null;
  isActive = true;

  print(isActive);
}


// ============================================================================
// 07. BASIC NULL CHECK
// ============================================================================

void nullCheck() {
  String? name;

  if (name != null) {
    print(name);
  }
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
//
// After:
//
// if (name != null)
//
// Dart understands that name is a String inside that block.
//
// This is called:
//
// TYPE PROMOTION
//
// ============================================================================


// ============================================================================
// 08. IF == NULL
// ============================================================================

void nullCheck2() {
  String? name;

  if (name == null) {
    print("Name is missing");
    return;
  }

  print(
    name.toUpperCase(),
  );
}


// ============================================================================
// 09. NULL-AWARE OPERATOR ??
// ----------------------------------------------------------------------------
//
// ?? means:
//
// "If left side is null, use the right side."
//
// ============================================================================

void ifNullOperator() {
  String? name;

  final displayName =
      name ?? "Guest";

  print(displayName);
}


// ============================================================================
// 10. ?? WITH API DATA
// ============================================================================

void apiDefaultValue() {
  final Map<String, dynamic> json = {
    "name": null,
  };

  final name =
      json["name"] as String? ??
          "Unknown";

  print(name);
}


// ============================================================================
// 11. ??=
// ----------------------------------------------------------------------------
//
// Assign a value ONLY if the variable is currently null.
//
// ============================================================================

void nullAssignment() {
  String? name;

  name ??= "Palash";

  print(name);

  name ??= "Another Name";

  print(name);
}


// ============================================================================
// RESULT:
//
// Palash
// Palash
//
// The second assignment does nothing because name is already non-null.
//
// ============================================================================


// ============================================================================
// 12. NULL-AWARE ACCESS ?.
// ----------------------------------------------------------------------------
//
// ?. means:
//
// "Call/access this only if the object is not null."
//
// ============================================================================

void nullAwareAccess() {
  String? name;

  print(
    name?.toUpperCase(),
  );
}


// ============================================================================
// RESULT:
//
// null
//
// No exception occurs.
//
// ============================================================================


// ============================================================================
// 13. NORMAL ACCESS VS NULL-AWARE ACCESS
// ============================================================================

void normalVsSafeAccess() {
  String? name;

  // print(name.toUpperCase());
  //
  // ERROR because name may be null.

  print(
    name?.toUpperCase(),
  );
}


// ============================================================================
// 14. NULL-AWARE PROPERTY ACCESS
// ============================================================================

class User {
  final String name;

  User({
    required this.name,
  });
}


void nullableObject() {
  User? user;

  print(
    user?.name,
  );
}


// ============================================================================
// 15. NULL-AWARE METHOD CALL
// ============================================================================

class Logger {
  void log(String message) {
    print(message);
  }
}


void nullableMethod() {
  Logger? logger;

  logger?.log(
    "Hello",
  );
}


// ============================================================================
// 16. NULL-AWARE CHAINING
// ----------------------------------------------------------------------------
//
// You can safely chain operations.
//
// ============================================================================

void nullAwareChain() {
  User? user;

  final name =
      user?.name.toUpperCase();

  print(name);
}


// ============================================================================
// 17. ! OPERATOR
// ----------------------------------------------------------------------------
//
// ! means:
//
// "I guarantee this value is not null."
//
// ============================================================================

void bangOperator() {
  String? name = "Palash";

  print(
    name!.toUpperCase(),
  );
}


// ============================================================================
// VERY IMPORTANT WARNING
// ----------------------------------------------------------------------------
//
// ! does NOT make a null value non-null.
//
// It simply tells Dart:
//
// "Trust me."
//
// If the value actually is null:
//
// Runtime error.
//
// ============================================================================

void dangerousBang() {
  String? name;

  // print(name!.length);
  //
  // Runtime error.
}


// ============================================================================
// 18. WHEN ! IS COMMONLY SEEN IN FLUTTER
// ----------------------------------------------------------------------------
//
// Example:
//
// final user = currentUser!;
//
// This means the developer believes currentUser cannot be null.
//
// Use ! only when you are genuinely certain.
//
// ============================================================================


// ============================================================================
// 19. REQUIRED NAMED PARAMETER
// ----------------------------------------------------------------------------
//
// required means the caller MUST provide the argument.
//
// ============================================================================

void greet({
  required String name,
}) {
  print(
    "Hello $name",
  );
}


// ============================================================================
// 20. REQUIRED + NON-NULLABLE
// ----------------------------------------------------------------------------
//
// This combination means:
//
// • caller must provide it
// • value cannot be null
//
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
// 21. REQUIRED + NULLABLE
// ----------------------------------------------------------------------------
//
// The argument must be provided,
// but the value may be null.
//
// ============================================================================

void savePhone({
  required String? phone,
}) {
  print(phone);
}


// ============================================================================
// 22. OPTIONAL NULLABLE PARAMETER
// ----------------------------------------------------------------------------
//
// This is different.
//
// The caller may completely omit it.
//
// ============================================================================

void greetOptional([
  String? name,
]) {
  print(
    "Hello ${name ?? "Guest"}",
  );
}


// ============================================================================
// 23. NULLABLE RETURN TYPE
// ----------------------------------------------------------------------------
//
// A function can return null.
//
// ============================================================================

String? findUserName(
  String id,
) {
  if (id == "U001") {
    return "Palash";
  }

  return null;
}


// ============================================================================
// 24. USING NULLABLE RETURN VALUE
// ============================================================================

void nullableReturnExample() {
  final name =
      findUserName("U999");

  print(
    name ?? "User not found",
  );
}


// ============================================================================
// 25. LATE
// ----------------------------------------------------------------------------
//
// late tells Dart:
//
// "I will initialize this variable later."
//
// ============================================================================

late String username;


void initializeLater() {
  username = "Palash";

  print(username);
}


// ============================================================================
// 26. LATE VARIABLE WARNING
// ----------------------------------------------------------------------------
//
// If you read a late variable BEFORE initializing it:
//
// Runtime error:
//
// LateInitializationError
//
// ============================================================================


// ============================================================================
// 27. LATE FINAL
// ----------------------------------------------------------------------------
//
// late final can be initialized once later.
//
// ============================================================================

late final String userId;


void initializeUserId() {
  userId = "U001";

  print(userId);
}


// ============================================================================
// 28. FINAL VS LATE FINAL
// ----------------------------------------------------------------------------
//
// final:
//
// Must be initialized when declared or in constructor initialization.
//
// late final:
//
// Can be initialized later,
// but only once.
//
// ============================================================================


// ============================================================================
// 29. LATE IN CLASSES
// ----------------------------------------------------------------------------
//
// Example:
//
// Flutter often has objects that are initialized after the object itself.
//
// ============================================================================

class DatabaseService {
  late String connection;

  void connect() {
    connection =
        "Connected to database";
  }
}


// ============================================================================
// 30. TYPE INFERENCE
// ----------------------------------------------------------------------------
//
// Dart can infer types automatically.
//
// ============================================================================

void typeInference() {
  final name = "Palash";

  final age = 25;

  final price = 99.99;

  final active = true;

  print(name);
  print(age);
  print(price);
  print(active);
}


// ============================================================================
// 31. VAR
// ----------------------------------------------------------------------------
//
// var lets Dart infer the type.
//
// ============================================================================

void varExample() {
  var name = "Palash";

  // name = 25;
  //
  // ERROR
  //
  // Because Dart inferred:
  //
  // String
}


// ============================================================================
// 32. VAR DOES NOT MEAN DYNAMIC
// ----------------------------------------------------------------------------
//
// This is VERY important.
//
// var:
//
// Type is inferred.
//
// dynamic:
//
// Type checking is largely deferred to runtime.
//
// ============================================================================


// ============================================================================
// 33. FINAL
// ----------------------------------------------------------------------------
//
// final means:
//
// Assign once.
//
// ============================================================================

void finalExample() {
  final name = "Palash";

  // name = "Ahmed";
  //
  // ERROR
}


// ============================================================================
// 34. CONST
// ----------------------------------------------------------------------------
//
// const means:
//
// Compile-time constant.
//
// ============================================================================

void constExample() {
  const pi = 3.14159;

  print(pi);
}


// ============================================================================
// 35. FINAL VS CONST
// ----------------------------------------------------------------------------
//
// final:
//
// Value is assigned once.
//
// const:
//
// Value must be known at compile time.
//
// ============================================================================

void finalVsConst() {
  final currentTime =
      DateTime.now();

  // const time =
  //     DateTime.now();
  //
  // ERROR
  //
  // DateTime.now() is not compile-time constant.

  print(currentTime);
}


// ============================================================================
// 36. CONST OBJECT
// ============================================================================

class Config {
  final String appName;

  const Config({
    required this.appName,
  });
}


void constObject() {
  const config = Config(
    appName: "My ERP",
  );

  print(config.appName);
}


// ============================================================================
// 37. DYNAMIC
// ----------------------------------------------------------------------------
//
// dynamic disables normal static type checking for that value.
//
// ============================================================================

void dynamicExample() {
  dynamic value = "Hello";

  print(value);

  value = 100;

  print(value);

  value = true;

  print(value);
}


// ============================================================================
// 38. DYNAMIC DANGER
// ----------------------------------------------------------------------------

void dynamicDanger() {
  dynamic value = 100;

  // print(value.toUpperCase());
  //
  // This compiles,
  // but fails at runtime.
}


// ============================================================================
// 39. OBJECT
// ----------------------------------------------------------------------------
//
// Object means:
//
// Any non-null Dart object.
//
// ============================================================================

void objectExample() {
  Object value = "Hello";

  value = 100;
  value = true;

  print(value);
}


// ============================================================================
// 40. OBJECT?
// ----------------------------------------------------------------------------
//
// Object? means:
//
// Any Dart value, including null.
//
// ============================================================================

void objectNullable() {
  Object? value;

  value = "Hello";
  value = 100;
  value = null;

  print(value);
}


// ============================================================================
// 41. DYNAMIC VS OBJECT
// ----------------------------------------------------------------------------
//
// dynamic:
//
// Dart allows almost anything without static checking.
//
// Object:
//
// Dart knows it is an object,
// but you cannot directly call arbitrary methods.
//
// Example:
//
// ============================================================================

void dynamicVsObject() {
  dynamic a = "Hello";

  Object b = "Hello";

  print(
    a.toUpperCase(),
  );

  // print(b.toUpperCase());
  //
  // ERROR
  //
  // Because Object does not guarantee
  // that toUpperCase() exists.
}


// ============================================================================
// 42. NEVER
// ----------------------------------------------------------------------------
//
// Never represents a value that never successfully exists/returns.
//
// Common use:
//
// A function that always throws.
//
// ============================================================================

Never throwError(
  String message,
) {
  throw Exception(message);
}


// ============================================================================
// 43. NEVER EXAMPLE
// ============================================================================

Never failAuthentication() {
  throw Exception(
    "Authentication failed",
  );
}


// ============================================================================
// 44. VOID
// ----------------------------------------------------------------------------
//
// void means:
//
// The function does not return a useful value.
//
// ============================================================================

void printMessage() {
  print("Hello");
}


// ============================================================================
// 45. VOID VS NEVER
// ----------------------------------------------------------------------------
//
// void:
//
// Function finishes normally,
// but doesn't return a useful value.
//
// Never:
//
// Function never successfully returns.
//
// ============================================================================


// ============================================================================
// 46. RUNTIMETYPE
// ----------------------------------------------------------------------------
//
// runtimeType tells you the runtime type.
//
// ============================================================================

void runtimeTypeExample() {
  final value = "Hello";

  print(
    value.runtimeType,
  );
}


// ============================================================================
// 47. IS
// ----------------------------------------------------------------------------
//
// Checks whether an object is a particular type.
//
// ============================================================================

void isExample() {
  Object value = "Hello";

  if (value is String) {
    print(
      value.toUpperCase(),
    );
  }
}


// ============================================================================
// 48. IS WITH INT
// ============================================================================

void isIntExample() {
  Object value = 100;

  if (value is int) {
    print(
      value + 50,
    );
  }
}


// ============================================================================
// 49. IS!
//
// Means:
//
// "is NOT this type."
//
// ============================================================================

void isNotExample() {
  Object value = "Hello";

  if (value is! int) {
    print(
      "Value is not an int",
    );
  }
}


// ============================================================================
// 50. AS
// ----------------------------------------------------------------------------
//
// as explicitly casts a value to a type.
//
// ============================================================================

void asExample() {
  Object value = "Hello";

  final text =
      value as String;

  print(
    text.toUpperCase(),
  );
}


// ============================================================================
// 51. DANGEROUS AS
// ----------------------------------------------------------------------------
//
// If the actual value isn't String:
//
// Runtime error.
//
// ============================================================================

void dangerousAs() {
  Object value = 100;

  // final text =
  //     value as String;
  //
  // Runtime TypeError.
}


// ============================================================================
// 52. SAFE CASTING
// ----------------------------------------------------------------------------
//
// When uncertain, check with is.
//
// ============================================================================

void safeCasting() {
  Object value = "Hello";

  if (value is String) {
    print(
      value.toUpperCase(),
    );
  }
}


// ============================================================================
// 53. JSON CASTING
// ----------------------------------------------------------------------------
//
// API response often contains dynamic data.
//
// ============================================================================

void jsonCasting() {
  final json =
      <String, dynamic>{
    "name": "Phone",
    "price": 1000,
  };

  final name =
      json["name"] as String;

  final price =
      json["price"] as int;

  print(name);
  print(price);
}


// ============================================================================
// 54. SAFE JSON CASTING
// ----------------------------------------------------------------------------

void safeJsonCasting() {
  final json =
      <String, dynamic>{
    "name": "Phone",
    "price": null,
  };

  final name =
      json["name"] as String?;

  final price =
      json["price"] as int?;

  print(name);
  print(price);
}


// ============================================================================
// 55. JSON DEFAULT VALUE
// ----------------------------------------------------------------------------

void jsonDefault() {
  final json =
      <String, dynamic>{
    "name": null,
    "stock": null,
  };

  final name =
      json["name"] as String? ??
          "Unknown";

  final stock =
      json["stock"] as int? ??
          0;

  print(name);
  print(stock);
}


// ============================================================================
// 56. TYPE PROMOTION
// ----------------------------------------------------------------------------
//
// Dart can promote a nullable variable after checking it.
//
// ============================================================================

void typePromotion() {
  String? name =
      "Palash";

  if (name != null) {
    print(
      name.length,
    );
  }
}


// ============================================================================
// 57. TYPE PROMOTION WITH IS
// ============================================================================

void typePromotion2(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// 58. NULLABLE LIST
// ----------------------------------------------------------------------------
//
// The whole List can be null.
//
// ============================================================================

void nullableList() {
  List<String>? products;

  products = null;

  print(products);
}


// ============================================================================
// 59. LIST WITH NULLABLE ELEMENTS
// ----------------------------------------------------------------------------
//
// The List itself exists,
// but elements may be null.
//
// ============================================================================

void nullableElements() {
  List<String?> names = [
    "Palash",
    null,
    "Ahmed",
  ];

  print(names);
}


// ============================================================================
// 60. BOTH LIST AND ELEMENTS NULLABLE
// ============================================================================

void bothNullable() {
  List<String?>? names;

  names = null;

  print(names);
}


// ============================================================================
// 61. NULLABLE MAP
// ----------------------------------------------------------------------------
//
// The Map itself may be null.
//
// ============================================================================

void nullableMap() {
  Map<String, dynamic>? user;

  user = null;

  print(user);
}


// ============================================================================
// 62. MAP WITH NULLABLE VALUES
// ----------------------------------------------------------------------------

void nullableMapValues() {
  final Map<String, String?> user = {
    "name": "Palash",
    "phone": null,
  };

  print(user);
}


// ============================================================================
// 63. MAP WITH NULLABLE KEYS
// ----------------------------------------------------------------------------
//
// Map keys can also technically be nullable.
//
// ============================================================================

void nullableMapKeys() {
  final Map<String?, String> data = {
    null: "Unknown",
    "id": "U001",
  };

  print(data);
}


// ============================================================================
// 64. NULLABLE ITERABLE
// ============================================================================

void nullableIterable() {
  Iterable<int>? numbers;

  print(
    numbers?.length,
  );
}


// ============================================================================
// 65. NULL-AWARE COLLECTION OPERATIONS
// ============================================================================

void nullableCollectionOperation() {
  List<String>? products;

  final count =
      products?.length ?? 0;

  print(count);
}


// ============================================================================
// 66. API RESPONSE EXAMPLE
// ----------------------------------------------------------------------------
//
// Imagine server response:
//
// {
//   "id": "P001",
//   "name": "Phone",
//   "description": null,
//   "price": 1000,
//   "discount": null
// }
//
// ============================================================================

class ProductResponse {
  final String id;
  final String name;
  final String? description;
  final double price;
  final double? discount;

  ProductResponse({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.discount,
  });

  factory ProductResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductResponse(
      id: json["id"] as String,
      name: json["name"] as String,
      description:
          json["description"] as String?,
      price:
          (json["price"] as num).toDouble(),
      discount:
          (json["discount"] as num?)
              ?.toDouble(),
    );
  }
}


// ============================================================================
// 67. WHY num IS USEFUL FOR API NUMBERS
// ----------------------------------------------------------------------------
//
// JSON numbers may arrive as:
//
// int
//
// or:
//
// double
//
// Using:
//
// num
//
// before converting to double is often safer.
//
// Example:
//
// (json["price"] as num).toDouble()
//
// ============================================================================


// ============================================================================
// 68. OPTIONAL API FIELD
// ----------------------------------------------------------------------------
//
// If a field may not exist:
//
// final value = json["field"] as String?;
//
// Missing key:
//
// json["field"]
//
// returns null.
//
// ============================================================================


// ============================================================================
// 69. DEFAULT API FIELD
// ----------------------------------------------------------------------------

class UserResponse {
  final String name;
  final String role;
  final bool active;

  UserResponse({
    required this.name,
    required this.role,
    required this.active,
  });

  factory UserResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserResponse(
      name:
          json["name"] as String? ??
              "Unknown",
      role:
          json["role"] as String? ??
              "employee",
      active:
          json["active"] as bool? ??
              false,
    );
  }
}


// ============================================================================
// 70. NESTED NULL-SAFE JSON
// ----------------------------------------------------------------------------

void nestedSafeJson() {
  final json =
      <String, dynamic>{
    "user": {
      "profile": {
        "name": "Palash",
      },
    },
  };

  final user =
      json["user"]
          as Map<String, dynamic>?;

  final profile =
      user?["profile"]
          as Map<String, dynamic>?;

  final name =
      profile?["name"] as String?;

  print(name);
}


// ============================================================================
// 71. NULL-AWARE CHAINING WITH MAPS
// ----------------------------------------------------------------------------
//
// Be careful:
//
// Map access returns dynamic depending on map type.
//
// Explicit casts are often useful when processing API data.
//
// ============================================================================


// ============================================================================
// 72. SAFE LIST PARSING
// ----------------------------------------------------------------------------

void parseListSafely() {
  final json = <String, dynamic>{
    "products": [
      {
        "id": "P001",
        "name": "Phone",
      },
      {
        "id": "P002",
        "name": "Laptop",
      },
    ],
  };

  final rawProducts =
      json["products"];

  if (rawProducts
      is List) {
    for (final item in rawProducts) {
      if (item
          is Map<String, dynamic>) {
        print(
          item["name"],
        );
      }
    }
  }
}


// ============================================================================
// 73. NULL SAFETY IN FLUTTER WIDGETS
// ----------------------------------------------------------------------------
//
// Example:
//
// String? imageUrl;
//
// NetworkImage:
//
// NetworkImage(imageUrl)
//
// would fail because NetworkImage needs String.
//
// Instead:
//
// if (imageUrl != null)
//
// ============================================================================

void flutterConceptExample(
  String? imageUrl,
) {
  if (imageUrl != null) {
    print(
      "Load image: $imageUrl",
    );
  } else {
    print(
      "Show placeholder",
    );
  }
}


// ============================================================================
// 74. NULL SAFETY IN AUTHENTICATION
// ----------------------------------------------------------------------------
//
// Current user can be null.
//
// Logged in:
//
// User
//
// Logged out:
//
// null
//
// ============================================================================

void authExample(
  User? currentUser,
) {
  if (currentUser == null) {
    print(
      "User is logged out",
    );
    return;
  }

  print(
    "Welcome ${currentUser.name}",
  );
}


// ============================================================================
// 75. NULL SAFETY IN FORMS
// ----------------------------------------------------------------------------
//
// TextEditingController.text itself is String,
// but other form values may be nullable.
//
// Example:
//
// String? selectedBranchId;
//
// ============================================================================

void formExample() {
  String? selectedBranchId;

  if (selectedBranchId == null) {
    print(
      "Please select branch",
    );

    return;
  }

  print(
    selectedBranchId,
  );
}


// ============================================================================
// 76. NULL SAFETY IN DATABASE DATA
// ----------------------------------------------------------------------------
//
// Database fields may be optional.
//
// Example:
//
// phone: String?
// email: String?
// deletedAt: DateTime?
//
// ============================================================================

class CustomerModel {
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final DateTime? deletedAt;

  CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.deletedAt,
  });
}


// ============================================================================
// 77. SOFT DELETE EXAMPLE
// ----------------------------------------------------------------------------
//
// deletedAt == null
//
// means:
//
// Not deleted.
//
// deletedAt != null
//
// means:
//
// Soft deleted.
//
// ============================================================================

bool isActiveCustomer(
  CustomerModel customer,
) {
  return customer.deletedAt == null;
}


// ============================================================================
// 78. NULLABLE DATE
// ----------------------------------------------------------------------------

void nullableDate() {
  DateTime? deletedAt;

  if (deletedAt == null) {
    print(
      "Not deleted",
    );
  }
}


// ============================================================================
// 79. NULLABLE BOOLEAN
// ----------------------------------------------------------------------------
//
// Sometimes APIs have:
//
// true
// false
// null
//
// This is different from a normal bool.
//
// ============================================================================

void nullableBooleanLogic() {
  bool? approved;

  if (approved == true) {
    print("Approved");
  } else if (approved == false) {
    print("Rejected");
  } else {
    print("Pending");
  }
}


// ============================================================================
// 80. VERY USEFUL BOOLEAN PATTERN
// ----------------------------------------------------------------------------
//
// Instead of:
//
// if (value != null && value == true)
//
// use:
//
// if (value == true)
//
// ============================================================================


// ============================================================================
// 81. NULLABLE STRING EMPTY VS NULL
// ----------------------------------------------------------------------------
//
// These are NOT the same:
//
// null
//
// ""
//
// "   "
//
// null means no value.
//
// Empty String means a String exists but contains no characters.
//
// ============================================================================

void nullVsEmpty() {
  String? a;
  String b = "";

  print(a == null);
  print(b.isEmpty);
}


// ============================================================================
// 82. trim + NULL SAFETY
// ============================================================================

void trimSafely(
  String? value,
) {
  final result =
      value?.trim();

  print(result);
}


// ============================================================================
// 83. DEFAULT EMPTY STRING
// ============================================================================

void defaultString(
  String? value,
) {
  final result =
      value?.trim() ?? "";

  print(result);
}


// ============================================================================
// 84. NULL-AWARE ASSIGNMENT
// ============================================================================

void nullAwareAssignment() {
  String? token;

  token ??=
      "temporary-token";

  print(token);
}


// ============================================================================
// 85. NULL-AWARE INDEX ACCESS
// ----------------------------------------------------------------------------
//
// Dart supports null-aware access patterns depending on expression context.
// Always prefer clear code over overly clever chaining.
//
// ============================================================================


// ============================================================================
// 86. COLLECTION DEFAULT
// ----------------------------------------------------------------------------

void collectionDefault(
  List<String>? products,
) {
  final safeProducts =
      products ?? [];

  print(
    safeProducts.length,
  );
}


// ============================================================================
// 87. NULLABLE CALLBACK
// ----------------------------------------------------------------------------
//
// Very common in Flutter.
//
// ============================================================================

void executeCallback(
  void Function()? onPressed,
) {
  onPressed?.call();
}


// ============================================================================
// 88. CALLBACK WITH DATA
// ============================================================================

void executeCallbackWithData(
  void Function(String value)? onChanged,
) {
  onChanged?.call(
    "Hello",
  );
}


// ============================================================================
// 89. NULLABLE FUNCTION TYPE
// ----------------------------------------------------------------------------
//
// void Function()?
//
// means:
//
// The function itself may be null.
//
// ============================================================================


// ============================================================================
// 90. NULL SAFETY + COPYWITH
// ----------------------------------------------------------------------------
//
// Be careful when using nullable fields in copyWith.
//
// ============================================================================

class Profile {
  final String name;
  final String? phone;

  const Profile({
    required this.name,
    this.phone,
  });

  Profile copyWith({
    String? name,
    String? phone,
  }) {
    return Profile(
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}


// ============================================================================
// IMPORTANT COPYWITH PROBLEM
// ----------------------------------------------------------------------------
//
// The above implementation cannot distinguish:
//
// "Don't change phone"
//
// from:
//
// "Set phone to null"
//
// Professional applications sometimes use a special sentinel pattern when
// they need to explicitly clear nullable fields.
//
// ============================================================================


// ============================================================================
// 91. SENTINEL CONCEPT
// ----------------------------------------------------------------------------
//
// Advanced concept:
//
// A special object can represent:
//
// "argument was not provided"
//
// while null can mean:
//
// "explicitly set this field to null"
//
// You don't need to memorize an implementation yet,
// but understand the problem.
//
// ============================================================================


// ============================================================================
// 92. TYPE ALIASES — CONCEPT
// ----------------------------------------------------------------------------
//
// Modern Dart also supports type aliases.
//
// Example:
//
// typedef UserId = String;
//
// ============================================================================

typedef UserId = String;


void typedefExample() {
  UserId id = "U001";

  print(id);
}


// ============================================================================
// 93. GENERIC NULL SAFETY
// ----------------------------------------------------------------------------
//
// Generic types also respect null safety.
//
// ============================================================================

void genericExample() {
  List<String> names = [
    "Palash",
  ];

  List<String?> nullableNames = [
    "Palash",
    null,
  ];

  print(names);
  print(nullableNames);
}


// ============================================================================
// 94. FUTURE NULL SAFETY
// ----------------------------------------------------------------------------
//
// Async code commonly uses:
//
// Future<String>
//
// or:
//
// Future<String?>
//
// They mean different things.
//
// ============================================================================

Future<String> getUsername() async {
  return "Palash";
}


Future<String?> findUsername() async {
  return null;
}


// ============================================================================
// 95. FUTURE STRING VS FUTURE STRING?
// ----------------------------------------------------------------------------
//
// Future<String>
//
// means:
//
// The asynchronous operation completes with a String.
//
// Future<String?>
//
// means:
//
// The asynchronous operation completes with either:
//
// String
//
// OR:
//
// null.
//
// ============================================================================


// ============================================================================
// 96. STREAM NULL SAFETY
// ----------------------------------------------------------------------------
//
// Stream<String>
//
// vs
//
// Stream<String?>
//
// ============================================================================

Stream<String> usernameStream() async* {
  yield "Palash";
  yield "Ahmed";
}


// ============================================================================
// 97. FLUTTER STATE EXAMPLE
// ----------------------------------------------------------------------------
//
// Concept:
//
// User? currentUser;
//
// During app startup:
//
// currentUser = null
//
// After authentication:
//
// currentUser = User(...)
//
// This pattern appears throughout Flutter applications.
//
// ============================================================================


// ============================================================================
// 98. COMMON NULL-SAFETY MISTAKE #1
// ----------------------------------------------------------------------------
//
// ❌ Excessive !
//
// Example:
//
// user!.profile!.name!
//
// This can hide bugs.
//
// Prefer:
//
// user?.profile?.name
//
// or explicit validation.
//
// ============================================================================


// ============================================================================
// 99. COMMON MISTAKE #2
// ----------------------------------------------------------------------------
//
// ❌ Making everything nullable:
//
// String?
// int?
// bool?
//
// everywhere.
//
// Don't do this.
//
// Only use nullable types when null is actually a valid state.
//
// ============================================================================


// ============================================================================
// 100. COMMON MISTAKE #3
// ----------------------------------------------------------------------------
//
// ❌ dynamic everywhere.
//
// Dynamic removes much of Dart's compile-time protection.
//
// Prefer:
//
// String
// int
// double
// bool
// Map<String, dynamic>
// List<Product>
//
// where appropriate.
//
// ============================================================================


// ============================================================================
// 101. COMMON MISTAKE #4
// ----------------------------------------------------------------------------
//
// ❌ Blind casting:
//
// json["price"] as double
//
// JSON may contain int:
//
// 100
//
// instead of:
//
// 100.0
//
// Better:
//
// (json["price"] as num?)?.toDouble()
//
// ============================================================================


// ============================================================================
// 102. COMMON MISTAKE #5
// ----------------------------------------------------------------------------
//
// ❌ Assuming API fields always exist.
//
// Backend can return:
//
// missing
// null
// unexpected type
//
// Production apps must validate/parse carefully.
//
// ============================================================================


// ============================================================================
// 103. COMMON MISTAKE #6
// ----------------------------------------------------------------------------
//
// ❌ Using late unnecessarily.
//
// late bypasses some initialization checks.
//
// Use it only when delayed initialization is genuinely required.
//
// ============================================================================


// ============================================================================
// 104. COMMON MISTAKE #7
// ----------------------------------------------------------------------------
//
// ❌ Confusing:
//
// null
//
// with:
//
// empty
//
// Example:
//
// List empty
//
// is not the same as:
//
// List null
//
// ============================================================================


// ============================================================================
// 105. PROFESSIONAL API PARSER
// ----------------------------------------------------------------------------

class ProductDto {
  final String id;
  final String name;
  final double price;
  final double? discount;

  const ProductDto({
    required this.id,
    required this.name,
    required this.price,
    this.discount,
  });

  factory ProductDto.fromJson(
    Map<String, dynamic> json,
  ) {
    final id =
        json["id"] as String?;

    final name =
        json["name"] as String?;

    final price =
        (json["price"] as num?)
            ?.toDouble();

    if (id == null ||
        name == null ||
        price == null) {
      throw FormatException(
        "Invalid product response",
      );
    }

    return ProductDto(
      id: id,
      name: name,
      price: price,
      discount:
          (json["discount"] as num?)
              ?.toDouble(),
    );
  }
}


// ============================================================================
// 106. WHY VALIDATION MATTERS
// ----------------------------------------------------------------------------
//
// Bad API data should not silently create invalid application state.
//
// Instead:
//
// JSON
// ↓
// Validate
// ↓
// Parse
// ↓
// Model
// ↓
// Application
//
// ============================================================================


// ============================================================================
// 107. NULL SAFETY + ERP
// ----------------------------------------------------------------------------
//
// Real ERP examples:
//
// String? vendorId
// String? warehouseId
// String? branchId
// String? deliveryNote
// double? discount
// double? tax
// DateTime? approvedAt
// DateTime? deletedAt
// DateTime? deliveredAt
//
// But:
//
// String orderId
// String productId
// int quantity
//
// may be non-null when required by business rules.
//
// ============================================================================


// ============================================================================
// 108. BUSINESS RULE EXAMPLE
// ----------------------------------------------------------------------------

class Order {
  final String id;
  final String productId;
  final int quantity;
  final double? discount;
  final DateTime? deliveredAt;

  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    this.discount,
    this.deliveredAt,
  });

  bool get isDelivered =>
      deliveredAt != null;

  double applyDiscount(
    double price,
  ) {
    final discountAmount =
        discount ?? 0;

    return price -
        (price * discountAmount / 100);
  }
}


// ============================================================================
// 109. TYPE SYSTEM MENTAL MODEL
// ----------------------------------------------------------------------------
//
// String
// ↓
// Definitely a String
//
// String?
// ↓
// String OR null
//
// Object
// ↓
// Any non-null object
//
// Object?
// ↓
// Any object OR null
//
// dynamic
// ↓
// Runtime-typed value
//
// void
// ↓
// No useful return value
//
// Never
// ↓
// No successful return
//
// ============================================================================


// ============================================================================
// 110. OPERATOR CHEAT SHEET
// ----------------------------------------------------------------------------
//
// ?
//
// Makes a type nullable.
//
// Example:
//
// String?
//
//
// ??
//
// Default if null.
//
// Example:
//
// name ?? "Guest"
//
//
// ??=
//
// Assign only if null.
//
// Example:
//
// name ??= "Guest"
//
//
// ?.
//
// Null-aware access.
//
// Example:
//
// user?.name
//
//
// !
//
// Assert non-null.
//
// Example:
//
// user!.name
//
//
// is
//
// Type check.
//
// Example:
//
// value is String
//
//
// is!
//
// Negative type check.
//
// Example:
//
// value is! String
//
//
// as
//
// Type cast.
//
// Example:
//
// value as String
//
// ============================================================================


// ============================================================================
// 111. NULL-SAFETY DECISION TREE
// ----------------------------------------------------------------------------
//
// Ask:
//
// "Can this value legitimately be missing?"
//
// NO
// ↓
// Use non-nullable:
//
// String
//
// YES
// ↓
// Use:
//
// String?
//
// Then ask:
//
// "What should happen when it is null?"
//
// Default?
// ↓
// ??
//
// Do nothing safely?
// ↓
// ?.
//
// Guaranteed non-null after validation?
// ↓
// !   (use carefully)
//
// ============================================================================


// ============================================================================
// 112. PRACTICE TASK 01
// ----------------------------------------------------------------------------
//
// Create:
//
// class Employee
//
// Fields:
//
// id
// name
// email?
// phone?
// salary
// deletedAt?
//
// Add:
//
// isDeleted
//
// ============================================================================


// ============================================================================
// 113. PRACTICE TASK 02
// ----------------------------------------------------------------------------
//
// Create:
//
// Product.fromJson()
//
// JSON:
//
// {
//   "id": "P001",
//   "name": "Phone",
//   "price": 1200,
//   "discount": null
// }
//
// Correctly parse every field.
//
// ============================================================================


// ============================================================================
// 114. PRACTICE TASK 03
// ----------------------------------------------------------------------------
//
// Write:
//
// String displayName(String? name)
//
// Rules:
//
// null → "Guest"
// empty → "Guest"
// whitespace → "Guest"
// otherwise → original trimmed name
//
// ============================================================================


// ============================================================================
// 115. PRACTICE TASK 04
// ----------------------------------------------------------------------------
//
// Write:
//
// double calculateDiscount(
//   double price,
//   double? discount,
// )
//
// If discount is null:
//
// discount = 0
//
// ============================================================================


// ============================================================================
// 116. PRACTICE TASK 05
// ----------------------------------------------------------------------------
//
// Create:
//
// User? currentUser;
//
// Print:
//
// "Login"
// when null.
//
// Print:
//
// "Welcome <name>"
// when non-null.
//
// ============================================================================


// ============================================================================
// 117. PRACTICE TASK 06
// ----------------------------------------------------------------------------
//
// Create:
//
// List<String?> phoneNumbers
//
// Remove null values safely.
//
// Result should be:
//
// List<String>
//
// Hint:
//
// whereType<String>()
//
// ============================================================================


// ============================================================================
// 118. WHERE TYPE
// ----------------------------------------------------------------------------
//
// Very useful for filtering nullable collections.
//
// ============================================================================

void whereTypeExample() {
  final values =
      <String?>[
    "Phone",
    null,
    "Laptop",
    null,
  ];

  final names =
      values.whereType<String>();

  print(
    names.toList(),
  );
}


// ============================================================================
// 119. PRACTICE TASK 07
// ----------------------------------------------------------------------------
//
// Create:
//
// Object value
//
// Determine whether it is:
//
// String
// int
// double
// bool
//
// using is.
//
// ============================================================================


// ============================================================================
// 120. PRACTICE TASK 08
// ----------------------------------------------------------------------------
//
// Create:
//
// Future<String?>
//
// Simulate finding a user.
//
// Handle null safely using await + ??.
//
// ============================================================================


// ============================================================================
// 121. INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is null safety?
//
// 02. Difference between String and String?
//
// 03. What does ? mean?
//
// 04. What does ?? mean?
//
// 05. What does ??= mean?
//
// 06. What does ?. mean?
//
// 07. What does ! mean?
//
// 08. Why is ! dangerous?
//
// 09. What is required?
//
// 10. What is late?
//
// 11. late vs final?
//
// 12. late vs late final?
//
// 13. var vs dynamic?
//
// 14. Object vs dynamic?
//
// 15. Object vs Object??
//
// 16. What is Never?
//
// 17. What is void?
//
// 18. What is runtimeType?
//
// 19. What does is do?
//
// 20. What does as do?
//
// 21. What is type promotion?
//
// 22. List<String> vs List<String?>?
//
// 23. List<String>? vs List<String?>?
//
// 24. Why can JSON numbers be tricky?
//
// 25. Why use num when parsing numeric JSON?
//
// 26. Why shouldn't you use ! everywhere?
//
// 27. How do you safely parse nullable API data?
//
// 28. What is the difference between null and empty?
//
// 29. What is a nullable callback?
//
// 30. Future<String> vs Future<String>?
//
// ============================================================================


// ============================================================================
// 122. MASTER EXAMPLE
// ----------------------------------------------------------------------------
//
// Production-style flow:
//
// API
// ↓
// Nullable/dynamic JSON
// ↓
// Validate required fields
// ↓
// Safely parse optional fields
// ↓
// Strongly typed model
// ↓
// Business logic
// ↓
// Flutter UI
//
// ============================================================================

class UserModel {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final bool active;

  const UserModel({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.active,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final id =
        json["id"] as String?;

    final name =
        json["name"] as String?;

    if (id == null ||
        name == null) {
      throw FormatException(
        "Invalid user data",
      );
    }

    return UserModel(
      id: id,
      name: name,
      email:
          json["email"] as String?,
      phone:
          json["phone"] as String?,
      active:
          json["active"] as bool? ??
              false,
    );
  }
}


// ============================================================================
// 123. MASTER USAGE
// ============================================================================

void masterExample() {
  final json =
      <String, dynamic>{
    "id": "U001",
    "name": "Palash",
    "email": null,
    "phone": "01700000000",
    "active": true,
  };

  final user =
      UserModel.fromJson(
    json,
  );

  print(
    "Name: ${user.name}",
  );

  print(
    "Email: ${user.email ?? "Not provided"}",
  );

  print(
    "Phone: ${user.phone ?? "Not provided"}",
  );

  print(
    "Active: ${user.active}",
  );
}


// ============================================================================
// 124. FINAL PROFESSIONAL RULES
// ----------------------------------------------------------------------------
//
// ✓ Use non-nullable types by default.
//
// ✓ Use ? only when null is a valid state.
//
// ✓ Prefer explicit null checks when logic is important.
//
// ✓ Use ?? for sensible defaults.
//
// ✓ Use ?. when null should simply result in no operation/value.
//
// ✓ Use ! only when you have strong proof.
//
// ✓ Avoid excessive dynamic.
//
// ✓ Parse API data into typed models.
//
// ✓ Validate required API fields.
//
// ✓ Treat optional API fields as nullable.
//
// ✓ Use required for required constructor parameters.
//
// ✓ Use late only for genuinely delayed initialization.
//
// ✓ Understand List<T> vs List<T?>.
//
// ✓ Understand List<T>?.
//
// ✓ Know the difference between null and empty.
//
// ✓ Keep nullability meaningful.
//
// ============================================================================
// PHASE 34 COMPLETE
// ============================================================================
//
// YOU SHOULD NOW BE COMFORTABLE WITH:
//
// String
// String?
// int?
// double?
// bool?
// ?
// ?? 
// ??=
// ?.
// !
// required
// late
// final
// const
// var
// dynamic
// Object
// Object?
// Never
// void
// is
// is!
// as
// type promotion
// nullable collections
// nullable API fields
// JSON parsing
// model validation
// Flutter null-safety patterns
//
// ============================================================================
//
// NEXT:
//
// PHASE 35 — DART GENERICS + ADVANCED TYPE SYSTEM
//
// Topics will include:
//
// • Generic classes
// • Generic methods
// • Generic functions
// • Type parameters
// • T
// • E
// • K / V
// • Generic constraints
// • extends in generics
// • Generic collections
// • Repository<T>
// • ApiResponse<T>
// • Result<T>
// • Pagination<T>
// • Generic services
// • Generic models
// • Type-safe API architecture
// • Flutter architecture using generics
//
// ============================================================================
// END OF PHASE 34
// ============================================================================