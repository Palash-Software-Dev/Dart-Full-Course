// ============================================================================
// DART MASTER ROADMAP
// PHASE 15 — NULL SAFETY & SOUND NULL SAFETY
// ============================================================================
//
// GOAL:
// -----------------------------------------------------------------------------
// Dart is a null-safe language.
//
// Null safety prevents many common runtime errors such as:
//
//   NoSuchMethodError
//   NullPointerException-style crashes
//   Calling methods on null
//   Accessing properties of null
//
// This phase is EXTREMELY important for Flutter because you will constantly
// work with:
//
//   • API responses
//   • JSON
//   • Models
//   • Database data
//   • Form fields
//   • Authentication state
//   • Optional parameters
//   • Navigation arguments
//   • Nullable widgets/data
//   • Async data
//
// ============================================================================
// PHASE 15 TOPICS
// ============================================================================
//
// BASIC NULL SAFETY
//
// 01. What is null?
// 02. Non-nullable variables
// 03. Nullable variables
// 04. ? operator
// 05. ! operator
//
// NULL-AWARE OPERATORS
//
// 06. ?? operator
// 07. ??= operator
// 08. ?. operator
// 09. ?.. operator
// 10. null-aware method calls
// 11. null-aware property access
//
// NULL CHECKING
//
// 12. if (value != null)
// 13. if (value == null)
// 14. null promotion
// 15. early return
// 16. guard-style validation
//
// TYPE SYSTEM
//
// 17. String vs String?
// 18. int vs int?
// 19. List<T> vs List<T>?
// 20. List<T?> vs List<T>
// 21. Map nullable values
// 22. Generic nullable types
//
// LATE
//
// 23. late variables
// 24. late initialization
// 25. late final
// 26. late + Flutter
// 27. late initialization errors
//
// REQUIRED
//
// 28. required parameters
// 29. required + nullable
// 30. required + non-nullable
//
// API / JSON
//
// 31. Nullable JSON fields
// 32. JSON model parsing
// 33. API null handling
// 34. Missing fields
// 35. null values
// 36. Default values
//
// FLUTTER
//
// 37. Nullable widget data
// 38. TextField values
// 39. Form validation
// 40. FutureBuilder
// 41. Async state
// 42. Navigation arguments
// 43. Optional callbacks
//
// PRODUCTION
//
// 44. Avoiding unnecessary !
// 45. Safe model design
// 46. Null vs empty string
// 47. Null vs zero
// 48. Null vs false
// 49. Defensive programming
// 50. Common null-safety mistakes
//
// ============================================================================


// ============================================================================
// 01. WHAT IS NULL?
// ============================================================================
//
// null means:
//
// "There is no value."
//
// Example:
//
// A user may not have a phone number.
//
// phone = null
//
// A product may not have a discount.
//
// discount = null
//
// An API may not return an optional field.
//
// email = null
//
// ============================================================================


// ============================================================================
// 02. NON-NULLABLE VARIABLES
// ============================================================================
//
// By default, Dart variables cannot contain null.
//
// ============================================================================

void nonNullableExample() {
  String name = "Palash";

  int age = 25;

  double price = 100.0;

  bool isActive = true;

  print(name);
  print(age);
  print(price);
  print(isActive);
}


// ============================================================================
// This would NOT be valid:
//
// String name = null;
//
// Because String is non-nullable.
//
// ============================================================================


// ============================================================================
// 03. NULLABLE VARIABLES
// ============================================================================
//
// Add ? after the type.
//
// ============================================================================

void nullableExample() {
  String? name;

  int? age;

  double? price;

  bool? isActive;

  print(name);
  print(age);
  print(price);
  print(isActive);
}


// ============================================================================
// 04. ? OPERATOR
// ============================================================================
//
// ? means:
//
// "This value can be null."
//
// ============================================================================

String? getUserPhone() {
  return null;
}


// ============================================================================

void questionMarkExample() {
  String? phone =
      getUserPhone();

  print(phone);
}


// ============================================================================
// 05. ! OPERATOR
// ============================================================================
//
// ! tells Dart:
//
// "I know this value is NOT null."
//
// ============================================================================
//
// IMPORTANT:
//
// ! does NOT make a null value safe.
//
// If the value is actually null,
// your program can crash.
//
// ============================================================================

void bangOperatorExample() {
  String? name = "Palash";

  print(
    name!.length,
  );
}


// ============================================================================
// Dangerous example:
//
// String? name = null;
//
// print(name!.length);
//
// This can cause a runtime error.
//
// ============================================================================


// ============================================================================
// BEST PRACTICE
// ============================================================================
//
// Prefer safe null handling over ! whenever practical.
//
// Bad:
//
// print(user!.name);
//
// Better:
//
// print(user?.name);
//
// Or:
//
// if (user != null) {
//   print(user.name);
// }
//
// ============================================================================


// ============================================================================
// 06. ?? OPERATOR
// ============================================================================
//
// ?? means:
//
// "If the left side is null, use the right side."
//
// ============================================================================

void nullCoalescingExample() {
  String? name;

  final displayName =
      name ?? "Guest";

  print(displayName);
}


// ============================================================================
// Another example
// ============================================================================

void defaultPriceExample() {
  double? price;

  final actualPrice =
      price ?? 0.0;

  print(actualPrice);
}


// ============================================================================
// 07. ??= OPERATOR
// ============================================================================
//
// ??= means:
//
// "Assign this value only if the variable is currently null."
//
// ============================================================================

void nullAssignmentExample() {
  String? name;

  name ??= "Guest";

  print(name);

  name ??= "Palash";

  print(name);
}


// Result:
//
// Guest
// Guest
//
// Because after the first assignment,
// name is no longer null.
//
// ============================================================================
// 08. ?. OPERATOR
// ============================================================================
//
// ?. safely accesses a property or method.
//
// If the object is null,
// Dart returns null instead of accessing it.
//
// ============================================================================

void nullAwareAccessExample() {
  String? name;

  final length =
      name?.length;

  print(length);
}


// ============================================================================
// If:
//
// name = "Palash"
//
// name?.length
//
// returns:
//
// 6
//
// If:
//
// name = null
//
// name?.length
//
// returns:
//
// null
//
// ============================================================================


// ============================================================================
// 09. ?.. OPERATOR
// ============================================================================
//
// ?.. is the null-shorting cascade operator.
//
// It allows you to perform multiple operations only when the object
// is not null.
//
// ============================================================================

class UserProfile {
  String name = "";
  int age = 0;

  void printInfo() {
    print(
      "$name - $age",
    );
  }
}


// ============================================================================

void nullAwareCascadeExample() {
  UserProfile? user;

  user
    ?..name = "Palash"
    ..age = 25
    ..printInfo();
}


// ============================================================================
// If user is null,
// the cascade operations are skipped.
//
// ============================================================================


// ============================================================================
// 10. NULL-AWARE METHOD CALL
// ============================================================================

void nullableMethodExample() {
  String? name;

  name?.toUpperCase();

  print(
    name?.toUpperCase(),
  );
}


// ============================================================================
// 11. NULL-AWARE PROPERTY ACCESS
// ============================================================================

void nullablePropertyExample() {
  UserProfile? user;

  print(
    user?.name,
  );

  print(
    user?.age,
  );
}


// ============================================================================
// 12. if (value != null)
// ============================================================================
//
// This is one of the safest and most common null-safety patterns.
//
// ============================================================================

void nullCheckExample() {
  String? name =
      "Palash";

  if (name != null) {
    print(
      name.length,
    );
  }
}


// ============================================================================
// Notice:
//
// Inside the if block,
// Dart knows that name is non-null.
//
// This is called:
//
// TYPE PROMOTION / NULL PROMOTION
//
// ============================================================================


// ============================================================================
// 13. if (value == null)
// ============================================================================

void nullEarlyReturnExample(
  String? name,
) {
  if (name == null) {
    return;
  }

  print(
    name.length,
  );
}


// ============================================================================
// This pattern is extremely useful in production code.
//
// Instead of deeply nesting code:
//
// if (user != null) {
//   if (user.email != null) {
//     ...
//   }
// }
//
// You can often:
//
// if (user == null) {
//   return;
// }
//
// if (user.email == null) {
//   return;
// }
//
// ============================================================================
// 14. NULL PROMOTION
// ============================================================================

void nullPromotionExample(
  String? name,
) {
  if (name == null) {
    return;
  }

  // Here Dart promotes name from String? to String.

  final length =
      name.length;

  print(length);
}


// ============================================================================
// 15. EARLY RETURN
// ============================================================================

String getUserName(
  String? name,
) {
  if (name == null) {
    return "Guest";
  }

  return name;
}


// ============================================================================
// 16. GUARD-STYLE VALIDATION
// ============================================================================

bool canCreateProduct({
  required String? name,
  required double? price,
}) {
  if (name == null ||
      name.trim().isEmpty) {
    return false;
  }

  if (price == null ||
      price <= 0) {
    return false;
  }

  return true;
}


// ============================================================================
// 17. String VS String?
// ============================================================================
//
// String:
//
//   Cannot be null.
//
// String?:
//
//   Can be null.
//
// ============================================================================

void stringDifference() {
  String name =
      "Palash";

  String? nickname =
      null;

  print(name);
  print(nickname);
}


// ============================================================================
// 18. int VS int?
// ============================================================================

void integerDifference() {
  int quantity = 10;

  int? discount;

  print(quantity);
  print(discount);
}


// ============================================================================
// 19. List<T> VS List<T>?
// ============================================================================
//
// These are DIFFERENT:
//
// List<String>
//
// means:
//
// The list itself cannot be null,
// and its items cannot be null.
//
//
//
// List<String>?
//
// means:
//
// The list itself may be null,
// but items cannot be null.
//
//
//
// List<String?>
//
// means:
//
// The list cannot be null,
// but individual items may be null.
//
//
//
// List<String?>?
//
// means:
//
// Both the list and its items may be null.
//
// ============================================================================

void nullableListExample() {
  List<String> names = [
    "A",
    "B",
  ];

  List<String>? optionalNames;

  List<String?> namesWithNull = [
    "A",
    null,
    "C",
  ];

  List<String?>? everythingNullable;

  print(names);
  print(optionalNames);
  print(namesWithNull);
  print(everythingNullable);
}


// ============================================================================
// 20. LIST<T?> VS LIST<T>
// ============================================================================

void listElementNullExample() {
  final List<String?> names = [
    "Palash",
    null,
    "Rahim",
  ];

  for (final name in names) {
    print(
      name ?? "Unknown",
    );
  }
}


// ============================================================================
// 21. MAP NULLABLE VALUES
// ============================================================================

void nullableMapExample() {
  final Map<String, String?>
      user = {
    "name": "Palash",
    "phone": null,
  };

  print(
    user["name"],
  );

  print(
    user["phone"],
  );
}


// ============================================================================
// 22. GENERIC NULLABLE TYPES
// ============================================================================

T? findFirst<T>(
  List<T> items,
) {
  if (items.isEmpty) {
    return null;
  }

  return items.first;
}


// ============================================================================

void genericNullableExample() {
  final result =
      findFirst<int>([]);

  print(result);
}


// ============================================================================
// 23. LATE VARIABLES
// ============================================================================
//
// late tells Dart:
//
// "I promise this variable will be initialized before it is used."
//
// ============================================================================

class LateExample {
  late String name;

  void initialize() {
    name = "Palash";
  }

  void printName() {
    print(name);
  }
}


// ============================================================================
// IMPORTANT:
//
// If you access a late variable before initialization,
// Dart throws a runtime error.
//
// ============================================================================


// ============================================================================
// 24. LATE INITIALIZATION
// ============================================================================

void lateInitializationExample() {
  late String message;

  message = "Hello Dart";

  print(message);
}


// ============================================================================
// 25. LATE FINAL
// ============================================================================
//
// late final:
//
// • initialize later
// • initialize only once
//
// ============================================================================

class UserSession {
  late final String token;

  void initialize(
    String value,
  ) {
    token = value;
  }
}


// ============================================================================
// token can be assigned once.
//
// token = "abc";
//
// Later:
//
// token = "xyz";
//
// would cause an error.
//
// ============================================================================
// 26. LATE + FLUTTER
// ============================================================================
//
// You may encounter patterns such as:
//
// late TextEditingController controller;
//
// Then initialize it:
//
// controller = TextEditingController();
//
// And dispose it:
//
// controller.dispose();
//
//
//
// In a StatefulWidget:
//
// @override
// void initState() {
//   super.initState();
//
//   controller = TextEditingController();
// }
//
// ============================================================================


// ============================================================================
// 27. REQUIRED PARAMETERS
// ============================================================================
//
// required means caller MUST provide the argument.
//
// ============================================================================

void createUserRequired({
  required String name,
  required String email,
}) {
  print(name);
  print(email);
}


// ============================================================================
// 28. REQUIRED + NULLABLE
// ============================================================================
//
// This is valid:
//
// required String? phone
//
// It means:
//
// "The caller MUST provide the parameter,
// but the value itself is allowed to be null."
//
// ============================================================================

void createCustomer({
  required String name,
  required String? phone,
}) {
  print(name);
  print(phone);
}


// ============================================================================
// 29. REQUIRED + NON-NULLABLE
// ============================================================================
//
// This means:
//
// Parameter must be supplied
// AND
// value cannot be null.
//
// ============================================================================

void createAdmin({
  required String email,
}) {
  print(email);
}


// ============================================================================
// 30. NULLABLE API DATA
// ============================================================================
//
// Real APIs often return incomplete data.
//
// Example JSON:
//
// {
//   "id": "U001",
//   "name": "Palash",
//   "phone": null
// }
//
// Model:
//
// ============================================================================

class UserModel {
  final String id;
  final String name;
  final String? phone;

  const UserModel({
    required this.id,
    required this.name,
    this.phone,
  });
}


// ============================================================================
// 31. JSON NULLABLE FIELDS
// ============================================================================

void jsonNullableExample() {
  final json =
      <String, dynamic>{
    "id": "U001",
    "name": "Palash",
    "phone": null,
  };

  final user =
      UserModel(
    id: json["id"] as String,
    name: json["name"] as String,
    phone: json["phone"] as String?,
  );

  print(user.id);
  print(user.name);
  print(user.phone);
}


// ============================================================================
// 32. SAFE MODEL PARSING
// ============================================================================
//
// APIs can omit fields.
//
// So blindly assuming every field exists can cause runtime problems.
//
// ============================================================================

class ProductModel {
  final String id;
  final String name;
  final double? discount;

  const ProductModel({
    required this.id,
    required this.name,
    this.discount,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      id: json["id"] as String,
      name: json["name"] as String,
      discount:
          (json["discount"] as num?)
              ?.toDouble(),
    );
  }
}


// ============================================================================
// WHY num?
// ============================================================================
//
// JSON numbers may be represented as:
//
// int
//
// or:
//
// double
//
// num supports both.
//
// ============================================================================
// 33. API NULL HANDLING
// ============================================================================

String getDiscountLabel(
  double? discount,
) {
  if (discount == null) {
    return "No discount";
  }

  return "$discount% OFF";
}


// ============================================================================
// 34. MISSING FIELDS
// ============================================================================

void missingFieldExample() {
  final json =
      <String, dynamic>{
    "name": "Phone",
  };

  final stock =
      json["stock"] as int?;

  print(
    stock ?? 0,
  );
}


// ============================================================================
// 35. NULL VALUES
// ============================================================================

void nullValueExample() {
  final json =
      <String, dynamic>{
    "discount": null,
  };

  final discount =
      json["discount"] as num?;

  print(discount);
}


// ============================================================================
// 36. DEFAULT VALUES
// ============================================================================

class SettingsModel {
  final bool notificationsEnabled;

  const SettingsModel({
    this.notificationsEnabled = true,
  });
}


// ============================================================================
// API-style default:
//
// final enabled =
//     json["enabled"] as bool? ?? true;
//
// ============================================================================
// 37. NULLABLE WIDGET DATA
// ============================================================================
//
// In Flutter:
//
// final String? imageUrl;
//
// Then:
//
// Image.network(
//   imageUrl ?? defaultImageUrl,
// );
//
//
//
// This prevents passing null where a String is required.
//
// ============================================================================
// 38. TEXTFIELD VALUES
// ============================================================================
//
// TextEditingController.text is a String.
//
// But many external values can still be nullable.
//
// Example:
//
// final String? initialName;
//
// controller.text =
//     initialName ?? "";
//
// ============================================================================
// 39. FORM VALIDATION
// ============================================================================

String? validateEmail(
  String? value,
) {
  if (value == null ||
      value.trim().isEmpty) {
    return "Email is required";
  }

  if (!value.contains("@")) {
    return "Invalid email";
  }

  return null;
}


// ============================================================================
// 40. FUTUREBUILDER NULL SAFETY
// ============================================================================
//
// In Flutter you may have:
//
// FutureBuilder<UserModel?>(
//
// The snapshot's data may be null.
//
// So:
//
// final user = snapshot.data;
//
// if (user == null) {
//   ...
// }
//
// ============================================================================
// 41. ASYNC STATE
// ============================================================================

class ApiState<T> {
  final T? data;
  final String? error;
  final bool isLoading;

  const ApiState({
    this.data,
    this.error,
    this.isLoading = false,
  });
}


// ============================================================================
// This pattern allows:
//
// data = null
// error = null
// isLoading = true
//
// or:
//
// data = user
// error = null
// isLoading = false
//
// ============================================================================
// 42. NAVIGATION ARGUMENTS
// ============================================================================
//
// Navigation arguments may be nullable depending on your design.
//
// Example:
//
// final id = arguments["id"] as String?;
//
// Then validate:
//
// if (id == null) {
//   return;
// }
//
// ============================================================================
// 43. OPTIONAL CALLBACKS
// ============================================================================

typedef VoidCallback =
    void Function();


class OptionalCallbackExample {
  final VoidCallback?
      onComplete;

  const OptionalCallbackExample({
    this.onComplete,
  });

  void complete() {
    onComplete?.call();
  }
}


// ============================================================================
// 44. AVOIDING UNNECESSARY !
// ============================================================================
//
// BAD:
//
// print(user!.name!);
//
//
//
// BETTER:
//
// print(
//   user?.name ?? "Guest",
// );
//
//
//
// Or:
//
// if (user == null) {
//   return;
// }
//
// print(user.name);
//
// ============================================================================
// 45. SAFE MODEL DESIGN
// ============================================================================
//
// Make fields nullable ONLY when null is a valid business state.
//
// BAD:
//
// class Product {
//   String? id;
//   String? name;
//   double? price;
// }
//
// if these fields are actually required.
//
//
//
// BETTER:
//
// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final double? discount;
// }
//
// Required business data should generally be non-nullable.
//
// ============================================================================
// 46. NULL VS EMPTY STRING
// ============================================================================
//
// null:
//
// "No value exists."
//
// ""
//
// "A value exists, but it contains no characters."
//
// These are NOT always equivalent.
//
// ============================================================================

void nullVsEmpty() {
  String? phone1;

  String phone2 = "";

  print(phone1);
  print(phone2);
}


// ============================================================================
// 47. NULL VS ZERO
// ============================================================================
//
// null:
//
// Value is unknown / not supplied.
//
// 0:
//
// Value is known to be zero.
//
// Example:
//
// stock = 0
//
// means product is out of stock.
//
// stock = null
//
// may mean stock information was not provided.
//
// ============================================================================
// 48. NULL VS FALSE
// ============================================================================
//
// null:
//
// Unknown / not supplied.
//
// false:
//
// Explicitly disabled.
//
// ============================================================================
// 49. DEFENSIVE PROGRAMMING
// ============================================================================
//
// Never assume external data is perfect.
//
// External sources include:
//
//   • API
//   • database
//   • local storage
//   • user input
//   • deep links
//   • navigation arguments
//   • third-party SDKs
//
// Validate external data before using it.
//
// ============================================================================
// 50. COMMON NULL-SAFETY MISTAKES
// ============================================================================
//
// MISTAKE 1:
//
// Using ! everywhere.
//
// user!.name!
//
//
//
// MISTAKE 2:
//
// Making everything nullable.
//
// String?
// int?
// bool?
//
// even when the value should never be null.
//
//
//
// MISTAKE 3:
//
// Confusing null with empty.
//
// null != ""
//
//
//
// MISTAKE 4:
//
// Using late unnecessarily.
//
// late is not a replacement for proper initialization.
//
//
//
// MISTAKE 5:
//
// Ignoring API null values.
//
// JSON can contain:
//
// null
//
// missing fields
//
// unexpected types
//
//
//
// MISTAKE 6:
//
// Casting blindly.
//
// json["price"] as double
//
// may fail if JSON provides an int.
//
// Safer:
//
// (json["price"] as num?)?.toDouble()
//
// ============================================================================
// ⭐ IMPORTANT NULL-SAFETY PATTERNS
// ============================================================================

void masterNullPatterns() {
  String? name;

  // 1. Default value
  final displayName =
      name ?? "Guest";

  // 2. Safe property access
  final length =
      name?.length;

  // 3. Assign only when null
  name ??= "Palash";

  // 4. Explicit null check
  if (name != null) {
    print(name.length);
  }

  // 5. Safe callback
  VoidCallback? callback;

  callback?.call();

  print(displayName);
  print(length);
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — PRODUCT
// ============================================================================

class ErpProduct {
  final String id;
  final String name;
  final double sellingPrice;

  // Optional fields.
  final double? discountPrice;
  final String? description;
  final String? imageUrl;

  // Required stock value.
  final int stock;

  const ErpProduct({
    required this.id,
    required this.name,
    required this.sellingPrice,
    required this.stock,
    this.discountPrice,
    this.description,
    this.imageUrl,
  });

  // --------------------------------------------------------------------------
  // NULL-SAFE BUSINESS LOGIC
  // --------------------------------------------------------------------------

  double get effectivePrice {
    return discountPrice ??
        sellingPrice;
  }

  bool get hasDiscount {
    return discountPrice != null &&
        discountPrice! <
            sellingPrice;
  }

  String get image {
    return imageUrl ??
        "assets/images/product.png";
  }

  bool get isOutOfStock {
    return stock <= 0;
  }
}


// ============================================================================
// ⭐ BETTER VERSION WITHOUT unnecessary !
// ============================================================================

class SafeProduct {
  final String name;
  final double sellingPrice;
  final double? discountPrice;

  const SafeProduct({
    required this.name,
    required this.sellingPrice,
    this.discountPrice,
  });

  double get effectivePrice {
    final discount =
        discountPrice;

    if (discount != null &&
        discount <
            sellingPrice) {
      return discount;
    }

    return sellingPrice;
  }
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — USER
// ============================================================================

class ErpUser {
  final String id;
  final String name;
  final String email;

  final String? phone;
  final String? profileImage;
  final String? branchId;

  final bool isActive;

  const ErpUser({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    this.phone,
    this.profileImage,
    this.branchId,
  });

  String get displayPhone {
    return phone ?? "No phone number";
  }

  String get displayImage {
    return profileImage ??
        "assets/images/avatar.png";
  }
}


// ============================================================================
// ⭐ REAL ERP EXAMPLE — ORDER
// ============================================================================

class Order {
  final String id;

  final double subtotal;
  final double? discount;
  final double? deliveryCharge;

  const Order({
    required this.id,
    required this.subtotal,
    this.discount,
    this.deliveryCharge,
  });

  double get total {
    final discountAmount =
        discount ?? 0;

    final delivery =
        deliveryCharge ?? 0;

    return subtotal -
        discountAmount +
        delivery;
  }
}


// ============================================================================
// ⭐ NULL SAFETY WITH MAP DATA
// ============================================================================

void safeMapReading(
  Map<String, dynamic> json,
) {
  final String? name =
      json["name"] as String?;

  final int stock =
      json["stock"] as int? ?? 0;

  final double price =
      (json["price"] as num?)
          ?.toDouble() ??
      0.0;

  print(name);
  print(stock);
  print(price);
}


// ============================================================================
// ⭐ NULL SAFETY WITH NESTED JSON
// ============================================================================

void nestedJsonExample(
  Map<String, dynamic> json,
) {
  final company =
      json["company"]
          as Map<String, dynamic>?;

  final branch =
      company?["branch"]
          as Map<String, dynamic>?;

  final branchName =
      branch?["name"] as String?;

  print(
    branchName ?? "Unknown branch",
  );
}


// ============================================================================
// ⭐ NULL SAFETY WITH COLLECTIONS
// ============================================================================

void nullableCollectionExample() {
  final List<String?> names = [
    "Palash",
    null,
    "Rahim",
    null,
  ];

  final validNames =
      names
          .whereType<String>()
          .toList();

  print(validNames);
}


// ============================================================================
// whereType<T>()
//
// Removes values that are not of type T.
//
// This is useful when working with nullable or mixed collections.
//
// ============================================================================
// ⭐ NULL SAFETY + MAP
// ============================================================================

void nullableMapTransformation() {
  final List<double?> prices = [
    100,
    null,
    200,
    null,
    300,
  ];

  final validPrices =
      prices
          .whereType<double>()
          .toList();

  print(validPrices);
}


// ============================================================================
// ⭐ NULL SAFETY + FUTURE
// ============================================================================

Future<String?>
findUserName(
  String id,
) async {
  if (id.isEmpty) {
    return null;
  }

  return "Palash";
}


// ============================================================================

Future<void>
futureNullExample() async {
  final name =
      await findUserName("");

  print(
    name ?? "User not found",
  );
}


// ============================================================================
// ⭐ NULL SAFETY + ASYNC ERROR HANDLING
// ============================================================================

Future<void>
loadUserExample() async {
  try {
    final String? name =
        await findUserName(
      "U001",
    );

    if (name == null) {
      print(
        "User not found",
      );

      return;
    }

    print(
      "User: $name",
    );
  } catch (error) {
    print(
      "Something went wrong: $error",
    );
  }
}


// ============================================================================
// ⭐ NULL-SAFE STRING OPERATIONS
// ============================================================================

void nullableStringExample(
  String? value,
) {
  final trimmed =
      value?.trim();

  final upper =
      value?.toUpperCase();

  final length =
      value?.length ?? 0;

  print(trimmed);
  print(upper);
  print(length);
}


// ============================================================================
// ⭐ NULL-SAFE OBJECT CHAIN
// ============================================================================

class Company {
  final Branch? branch;

  const Company({
    this.branch,
  });
}


class Branch {
  final Manager? manager;

  const Branch({
    this.manager,
  });
}


class Manager {
  final String name;

  const Manager({
    required this.name,
  });
}


// ============================================================================

void nestedObjectExample(
  Company? company,
) {
  final managerName =
      company
          ?.branch
          ?.manager
          ?.name;

  print(
    managerName ?? "No manager",
  );
}


// ============================================================================
// ⭐ NULL-SAFE METHOD CHAIN
// ============================================================================

void methodChainExample(
  String? value,
) {
  final result =
      value
          ?.trim()
          .toLowerCase();

  print(result);
}


// ============================================================================
// ⭐ NULL-AWARE CASCADE
// ============================================================================

class ProductEditor {
  String name = "";
  double price = 0;
  bool active = false;

  void save() {
    print(
      "$name | $price | $active",
    );
  }
}


// ============================================================================

void productEditorExample() {
  ProductEditor? editor =
      ProductEditor();

  editor
    ?..name = "Laptop"
    ..price = 100000
    ..active = true
    ..save();
}


// ============================================================================
// ⭐ NULL SAFETY WITH OPTIONAL PARAMETER
// ============================================================================

void printUser({
  String? name,
  String? phone,
}) {
  print(
    "Name: ${name ?? "Unknown"}",
  );

  print(
    "Phone: ${phone ?? "Not provided"}",
  );
}


// ============================================================================
// ⭐ REQUIRED NULLABLE PARAMETER
// ============================================================================

void updateUser({
  required String userId,
  required String? phone,
}) {
  print(userId);
  print(phone);
}


// ============================================================================
// IMPORTANT:
//
// updateUser(
//   userId: "U001",
//   phone: null,
// );
//
// is valid.
//
// The parameter MUST be supplied,
// but its value may be null.
//
// ============================================================================
// ⭐ NULL SAFETY DECISION TREE
// ============================================================================
//
// Ask yourself:
//
// 1. Can this value legitimately be absent?
//
//    NO → use non-nullable type.
//
//    YES → use nullable type.
//
//
//
// 2. If null, do I have a default?
//
//    YES → use ??
//
//
//
// 3. If null, should I skip the operation?
//
//    YES → use ?.
//
//
//
// 4. Am I 100% certain it cannot be null?
//
//    YES → ! may be appropriate.
//
//    Otherwise → DON'T use !.
//
//
//
// 5. Must caller provide the argument?
//
//    YES → required
//
//
//
// 6. Do I initialize it later?
//
//    YES → consider late.
//
// ============================================================================
// ⭐ NULL SAFETY MASTER EXAMPLE
// ============================================================================

class UserService {
  Future<ErpUser?> getUser(
    String id,
  ) async {
    if (id.isEmpty) {
      return null;
    }

    return const ErpUser(
      id: "U001",
      name: "Palash",
      email: "palash@example.com",
      isActive: true,
      phone: null,
      profileImage: null,
      branchId: "BR001",
    );
  }
}


// ============================================================================

Future<void>
masterNullSafetyExample() async {
  final service =
      UserService();

  final user =
      await service.getUser(
    "U001",
  );

  if (user == null) {
    print(
      "User not found",
    );

    return;
  }

  print(
    user.name,
  );

  print(
    user.email,
  );

  print(
    user.phone ??
        "No phone",
  );

  print(
    user.profileImage ??
        "Default image",
  );

  print(
    user.branchId ??
        "No branch",
  );
}


// ============================================================================
// ⭐ PHASE 15 MASTER CHECKLIST
// ============================================================================
//
// BASIC
//
// [ ] null
// [ ] non-nullable
// [ ] nullable
// [ ] ?
// [ ] !
//
// OPERATORS
//
// [ ] ?? 
// [ ] ??=
// [ ] ?.
// [ ] ?..
//
// CHECKING
//
// [ ] == null
// [ ] != null
// [ ] null promotion
// [ ] early return
//
// TYPES
//
// [ ] String
// [ ] String?
// [ ] List<String>
// [ ] List<String>?
// [ ] List<String?>
// [ ] List<String?>?
// [ ] Map nullable values
//
// INITIALIZATION
//
// [ ] late
// [ ] late final
// [ ] initialization error
//
// PARAMETERS
//
// [ ] required
// [ ] required String
// [ ] required String?
//
// API
//
// [ ] nullable JSON
// [ ] missing JSON field
// [ ] default values
// [ ] num -> double
// [ ] nested nullable data
//
// FLUTTER
//
// [ ] nullable widget data
// [ ] TextField
// [ ] Form validation
// [ ] FutureBuilder
// [ ] async state
// [ ] navigation arguments
// [ ] optional callbacks
//
// PRODUCTION
//
// [ ] avoid unnecessary !
// [ ] model design
// [ ] null vs empty
// [ ] null vs zero
// [ ] null vs false
// [ ] defensive programming
//
// ============================================================================
// ⭐ YOU SHOULD BE ABLE TO EXPLAIN THESE WITHOUT LOOKING:
// ============================================================================
//
// String
//
// String?
//
// value!
//
// value?
//
// value ?? defaultValue
//
// value ??= defaultValue
//
// object?.property
//
// object?.method()
//
// object?..method()
//
// required String
//
// required String?
//
// late String
//
// List<String>
//
// List<String?>
//
// List<String>?
//
// null promotion
//
// ============================================================================
// ⭐ MOST IMPORTANT RULE
// ============================================================================
//
// DO NOT THINK:
//
// "How can I remove the null error?"
//
// THINK:
//
// "Can this value legitimately be null?"
//
// If YES:
//
//     Design the code to handle null.
//
// If NO:
//
//     Make the type non-nullable.
//
// This mindset will help you write much safer Flutter applications.
//
// ============================================================================
// END OF PHASE 15
// ============================================================================
//
// NEXT:
//
// PHASE 16 — OBJECT-ORIENTED PROGRAMMING (OOP) DEEP DIVE
//
// Topics:
//
//   • Classes
//   • Objects
//   • Constructors
//   • Named constructors
//   • Factory constructors
//   • Redirecting constructors
//   • this
//   • static
//   • instance members
//   • getters
//   • setters
//   • methods
//   • inheritance
//   • abstract classes
//   • interfaces
//   • implements
//   • extends
//   • mixins
//   • polymorphism
//   • encapsulation
//   • composition
//   • dependency injection
//   • immutable classes
//   • model classes
//   • JSON models
//   • repository classes
//   • service classes
//   • Flutter architecture examples
//
// ============================================================================ 