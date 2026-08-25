// ============================================================================
// DART MASTER ROADMAP
// PHASE 21 — ADVANCED TYPE SYSTEM, FUNCTIONS, PATTERNS & CLASS MODIFIERS
// ============================================================================
//
// GOAL:
// --------------------------------------------------------------------------
// Phase 20 covered:
//
//   • Event Loop
//   • Microtasks
//   • Event Queue
//   • Future
//   • Stream
//   • async/await
//   • Isolates
//   • SendPort / ReceivePort
//   • Concurrency
//   • Performance
//   • Background processing
//
// Phase 21 goes deeper into Dart's TYPE SYSTEM and modern language features.
//
// These features are extremely useful for:
//
//   • Professional Flutter architecture
//   • Clean Architecture
//   • Repository patterns
//   • State management
//   • API models
//   • Result/Failure patterns
//   • Generic reusable code
//   • Type-safe navigation
//   • Large ERP applications
//   • Maintainable production code
//
// ============================================================================


// ============================================================================
// 01. FUNCTION TYPES
// ============================================================================
//
// In Dart, functions are objects.
//
// Therefore, a function can be:
//
//   • stored in a variable
//   • passed as an argument
//   • returned from another function
//   • stored in a collection
//
// Example:
// ============================================================================

int add(
  int a,
  int b,
) {
  return a + b;
}


// Function variable:
//
// The variable can store a function having:
//   (int, int) -> int
//
int Function(int, int)
    operation = add;

void functionTypeExample() {
  print(
    operation(
      10,
      20,
    ),
  );
}


// ============================================================================
// 02. FUNCTION TYPE SYNTAX
// ============================================================================
//
// General:
//
// ReturnType Function(ParameterTypes)
//
// Examples:
//
// int Function(int, int)
// String Function(String)
// void Function()
// bool Function(Product)
//
// ============================================================================

String greet(
  String name,
) {
  return "Hello $name";
}

String Function(String)
    greeter = greet;


// ============================================================================
// 03. CALLBACKS
// ============================================================================
//
// A callback is a function passed into another function.
//
// ============================================================================

void executeCallback(
  void Function() callback,
) {
  callback();
}


// ============================================================================

void callbackExample() {
  executeCallback(
    () {
      print(
        "Callback executed",
      );
    },
  );
}


// ============================================================================
// Flutter example:
//
// onPressed: () {
//   print("Button pressed");
// }
//
// onPressed expects a callback.
//
// ============================================================================


// ============================================================================
// 04. CALLBACK WITH PARAMETERS
// ============================================================================

void processNumber(
  int number,
  void Function(int) callback,
) {
  callback(number * 2);
}


// ============================================================================

void callbackParameterExample() {
  processNumber(
    10,
    (value) {
      print(value);
    },
  );
}


// ============================================================================
// 05. FUNCTION RETURNING FUNCTION
// ============================================================================
//
// A function can return another function.
//
// ============================================================================

int Function(int)
    multiplier(
  int factor,
) {
  return (
    int value,
  ) {
    return value * factor;
  };
}


// ============================================================================

void returnedFunctionExample() {
  final doubleValue =
      multiplier(2);

  final tripleValue =
      multiplier(3);

  print(
    doubleValue(10),
  );

  print(
    tripleValue(10),
  );
}


// ============================================================================
// Output:
//
// 20
// 30
//
// ============================================================================


// ============================================================================
// 06. CLOSURES
// ============================================================================
//
// A closure is a function that remembers variables from its surrounding
// scope.
//
// ============================================================================

int Function()
    createCounter() {
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

  print(
    counter(),
  );

  print(
    counter(),
  );

  print(
    counter(),
  );
}


// ============================================================================
// Output:
//
// 1
// 2
// 3
//
// The returned function remembers `count`.
//
// ============================================================================


// ============================================================================
// 07. CLOSURE WITH PRIVATE STATE
// ============================================================================
//
// This is useful when you want controlled access to internal state.
//
// ============================================================================

void closureStateExample() {
  int balance = 0;

  void deposit(
    int amount,
  ) {
    balance += amount;
  }

  int getBalance() {
    return balance;
  }

  deposit(1000);
  deposit(500);

  print(
    getBalance(),
  );
}


// ============================================================================
// 08. TYPEDEF
// ============================================================================
//
// typedef gives a name to a function type.
//
// ============================================================================

typedef MathOperation =
    int Function(
  int a,
  int b,
);


// ============================================================================

int multiply(
  int a,
  int b,
) {
  return a * b;
}


// ============================================================================

void typedefExample() {
  MathOperation operation =
      multiply;

  print(
    operation(
      5,
      4,
    ),
  );
}


// ============================================================================
// 09. TYPEDEF WITH CALLBACK
// ============================================================================

typedef OnSuccess =
    void Function(
  String message,
);

typedef OnError =
    void Function(
  Object error,
);


// ============================================================================

void request(
  OnSuccess onSuccess,
  OnError onError,
) {
  try {
    onSuccess(
      "Request successful",
    );
  } catch (error) {
    onError(error);
  }
}


// ============================================================================
// This pattern is useful in callbacks, but in modern Flutter code,
// Future-based APIs are usually preferred for asynchronous operations.
//
// ============================================================================


// ============================================================================
// 10. GENERIC FUNCTION TYPE
// ============================================================================
//
// Function types can also be generic.
//
// ============================================================================

typedef Converter<T, R> =
    R Function(T value);


// ============================================================================

String convertIntToString(
  int value,
) {
  return value.toString();
}


// ============================================================================

void genericFunctionTypeExample() {
  Converter<int, String>
      converter =
      convertIntToString;

  print(
    converter(100),
  );
}


// ============================================================================
// 11. FUNCTION TEAR-OFF
// ============================================================================
//
// A tear-off means referencing an existing function/method without calling
// it.
//
// Example:
//
// print()
// = calling function
//
// print
// = referencing function
//
// ============================================================================

void sayHello() {
  print("Hello");
}


// ============================================================================

void tearOffExample() {
  final callback =
      sayHello;

  callback();
}


// ============================================================================
// IMPORTANT:
//
// Don't write:
//
// final callback = sayHello();
//
// because that executes the function immediately.
//
// ============================================================================


// ============================================================================
// 12. METHOD TEAR-OFF
// ============================================================================

class Calculator {
  int add(
    int a,
    int b,
  ) {
    return a + b;
  }
}


// ============================================================================

void methodTearOffExample() {
  final calculator =
      Calculator();

  final operation =
      calculator.add;

  print(
    operation(
      10,
      20,
    ),
  );
}


// ============================================================================
// 13. STATIC METHOD TEAR-OFF
// ============================================================================

class MathUtils {
  static int square(
    int value,
  ) {
    return value * value;
  }
}


// ============================================================================

void staticTearOffExample() {
  final operation =
      MathUtils.square;

  print(
    operation(5),
  );
}


// ============================================================================
// 14. CALLABLE CLASSES
// ============================================================================
//
// A Dart class can behave like a function by implementing:
//
// call()
//
// ============================================================================

class Multiplier {
  final int factor;

  const Multiplier(
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
  final multiplyByFive =
      Multiplier(5);

  print(
    multiplyByFive(10),
  );
}


// ============================================================================
// Output:
//
// 50
//
// Because:
//
// multiplyByFive(10)
//
// internally behaves like:
//
// multiplyByFive.call(10)
//
// ============================================================================


// ============================================================================
// 15. CALLABLE CLASS — REAL USE CASE
// ============================================================================
//
// Useful for encapsulating behavior.
//
// Example:
//
// Validator
// Formatter
// Parser
// Transformer
//
// ============================================================================

class EmailValidator {
  bool call(
    String email,
  ) {
    return email.contains("@");
  }
}


// ============================================================================

void validatorExample() {
  final validator =
      EmailValidator();

  print(
    validator(
      "user@example.com",
    ),
  );
}


// ============================================================================
// 16. GENERIC CLASSES
// ============================================================================
//
// Generic classes allow reusable type-safe structures.
//
// ============================================================================

class Box<T> {
  final T value;

  const Box(
    this.value,
  );
}


// ============================================================================

void genericClassExample() {
  final intBox =
      Box<int>(100);

  final stringBox =
      Box<String>("Hello");

  print(
    intBox.value,
  );

  print(
    stringBox.value,
  );
}


// ============================================================================
// 17. GENERIC METHOD
// ============================================================================

class Repository {
  T getFirst<T>(
    List<T> items,
  ) {
    return items.first;
  }
}


// ============================================================================

void genericMethodExample() {
  final repository =
      Repository();

  final number =
      repository.getFirst<int>(
    [10, 20, 30],
  );

  final name =
      repository.getFirst<String>(
    [
      "Palash",
      "Flutter",
    ],
  );

  print(number);
  print(name);
}


// ============================================================================
// 18. TYPE CONSTRAINTS WITH EXTENDS
// ============================================================================
//
// You can restrict a generic type.
//
// ============================================================================

T firstItem<T extends Object>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================
// T must be a non-nullable Object.
//
// ============================================================================


// ============================================================================
// 19. GENERIC REPOSITORY
// ============================================================================
//
// This is highly relevant to Flutter architecture.
//
// ============================================================================

abstract interface class RepositoryInterface<T> {
  Future<List<T>> getAll();

  Future<T?> getById(
    String id,
  );
}


// ============================================================================

class Product {
  final String id;
  final String name;

  const Product({
    required this.id,
    required this.name,
  });
}


// ============================================================================

class ProductRepository
    implements
        RepositoryInterface<Product> {
  @override
  Future<List<Product>> getAll() async {
    return [];
  }

  @override
  Future<Product?> getById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// This allows:
//
// RepositoryInterface<Product>
//
// RepositoryInterface<Order>
//
// RepositoryInterface<Customer>
//
// without duplicating the architecture.
//
// ============================================================================


// ============================================================================
// 20. NULL SAFETY + TYPE PROMOTION
// ============================================================================
//
// Dart can promote a variable's type after checking it.
//
// ============================================================================

void typePromotionExample(
  String? name,
) {
  if (name != null) {
    print(
      name.length,
    );
  }
}


// ============================================================================
// After the null check:
//
// name
//
// is promoted from:
//
// String?
//
// to:
//
// String
//
// ============================================================================


// ============================================================================
// 21. TYPE PROMOTION WITH IS
// ============================================================================

void isPromotionExample(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// Inside the block:
//
// value is treated as String.
//
// ============================================================================


// ============================================================================
// 22. TYPE PROMOTION WITH NUMBERS
// ============================================================================

void numberPromotion(
  num value,
) {
  if (value is int) {
    print(
      value.isEven,
    );
  }
}


// ============================================================================
// 23. TYPE CHECKING
// ============================================================================

void typeCheckExample(
  Object value,
) {
  if (value is String) {
    print("String");
  } else if (value is int) {
    print("Integer");
  } else if (value is double) {
    print("Double");
  } else {
    print("Other");
  }
}


// ============================================================================
// 24. PATTERN MATCHING
// ============================================================================
//
// Modern Dart supports pattern matching.
//
// Patterns can be used in:
//
//   • switch
//   • if-case
//   • variable declarations
//   • destructuring
//
// ============================================================================


// ============================================================================
// 25. SIMPLE SWITCH
// ============================================================================

String describeNumber(
  int value,
) {
  return switch (value) {
    0 => "Zero",
    1 => "One",
    _ => "Other",
  };
}


// ============================================================================
// `_` means:
//
// any remaining value.
//
// ============================================================================


// ============================================================================
// 26. MULTIPLE VALUES IN SWITCH
// ============================================================================

String describeDay(
  int day,
) {
  return switch (day) {
    1 || 7 => "Weekend",
    2 || 3 || 4 || 5 || 6 =>
      "Weekday",
    _ => "Invalid",
  };
}


// ============================================================================
// 27. RANGE-LIKE GUARD PATTERN
// ============================================================================
//
// Dart patterns can use guards with `when`.
//
// ============================================================================

String classifyAge(
  int age,
) {
  return switch (age) {
    < 13 => "Child",
    >= 13 && < 18 => "Teenager",
    >= 18 && < 60 => "Adult",
    _ => "Senior",
  };
}


// ============================================================================
// 28. IF-CASE
// ============================================================================

void ifCaseExample(
  Object value,
) {
  if (value case String name) {
    print(
      name.toUpperCase(),
    );
  }
}


// ============================================================================
// 29. DESTRUCTURING RECORDS
// ============================================================================
//
// Records can be destructured.
//
// ============================================================================

void recordDestructuring() {
  final person =
      (
        name: "Palash",
        age: 25,
      );

  final (
    :name,
    :age,
  ) = person;

  print(name);
  print(age);
}


// ============================================================================
// 30. POSITIONAL RECORD DESTRUCTURING
// ============================================================================

void positionalRecordDestructuring() {
  final data =
      (
        "Palash",
        25,
      );

  final (
    name,
    age,
  ) = data;

  print(name);
  print(age);
}


// ============================================================================
// 31. LIST PATTERN
// ============================================================================

void listPatternExample(
  List<int> numbers,
) {
  if (numbers case [
    final first,
    final second,
    ...
  ]) {
    print(first);
    print(second);
  }
}


// ============================================================================
// 32. REST ELEMENT IN LIST PATTERN
// ============================================================================
//
// `...` captures remaining elements.
//
// ============================================================================

void listRestExample(
  List<int> numbers,
) {
  if (numbers case [
    final first,
    ...final remaining,
  ]) {
    print(first);
    print(remaining);
  }
}


// ============================================================================
// 33. MAP PATTERN
// ============================================================================

void mapPatternExample(
  Map<String, dynamic> data,
) {
  if (data case {
    "name": String name,
    "age": int age,
  }) {
    print(name);
    print(age);
  }
}


// ============================================================================
// This is extremely useful when dealing with structured data.
//
// ============================================================================


// ============================================================================
// 34. OBJECT PATTERN
// ============================================================================

class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });
}


// ============================================================================

void objectPatternExample(
  User user,
) {
  if (user case User(
    name: final name,
    age: final age,
  )) {
    print(name);
    print(age);
  }
}


// ============================================================================
// 35. SWITCH WITH OBJECT PATTERN
// ============================================================================

String userCategory(
  User user,
) {
  return switch (user) {
    User(age: < 18) =>
      "Minor",
    User(age: >= 18) =>
      "Adult",
  };
}


// ============================================================================
// 36. SEALED CLASSES
// ============================================================================
//
// Sealed classes are extremely useful for representing a fixed set of
// states.
//
// This is especially useful in Flutter state management.
//
// ============================================================================

sealed class ApiState<T> {
  const ApiState();
}


// ============================================================================

class Loading<T>
    extends ApiState<T> {
  const Loading();
}


// ============================================================================

class Success<T>
    extends ApiState<T> {
  final T data;

  const Success(
    this.data,
  );
}


// ============================================================================

class Failure<T>
    extends ApiState<T> {
  final Object error;

  const Failure(
    this.error,
  );
}


// ============================================================================
// 37. EXHAUSTIVE SWITCH
// ============================================================================

String stateMessage<T>(
  ApiState<T> state,
) {
  return switch (state) {
    Loading() =>
      "Loading...",
    Success(data: final data) =>
      "Success: $data",
    Failure(error: final error) =>
      "Error: $error",
  };
}


// ============================================================================
// WHY THIS IS POWERFUL:
//
// If you add another subclass:
//
// class Empty<T> extends ApiState<T> {}
//
// Dart can help identify switch expressions that no longer handle every
// possible state.
//
// ============================================================================


// ============================================================================
// 38. REAL FLUTTER STATE PATTERN
// ============================================================================
//
// A screen often has:
//
// Loading
// Success
// Error
//
// Instead of:
//
// bool isLoading
// String? error
// List<Product>? products
//
// you can model the state explicitly.
//
// ============================================================================

sealed class ProductState {
  const ProductState();
}

class ProductLoading
    extends ProductState {
  const ProductLoading();
}

class ProductLoaded
    extends ProductState {
  final List<Product> products;

  const ProductLoaded(
    this.products,
  );
}

class ProductError
    extends ProductState {
  final String message;

  const ProductError(
    this.message,
  );
}


// ============================================================================
// 39. RENDERING STATE
// ============================================================================

String renderProductState(
  ProductState state,
) {
  return switch (state) {
    ProductLoading() =>
      "Show loading indicator",

    ProductLoaded(
      products: final products,
    ) =>
      "Show ${products.length} products",

    ProductError(
      message: final message,
    ) =>
      "Show error: $message",
  };
}


// ============================================================================
// 40. CLASS MODIFIERS
// ============================================================================
//
// Modern Dart provides class modifiers:
//
//   • base
//   • interface
//   • final
//   • sealed
//   • mixin
//   • abstract
//
// These control how classes can be extended, implemented, or mixed in.
//
// ============================================================================


// ============================================================================
// 41. BASE CLASS
// ============================================================================
//
// A base class can be extended.
//
// ============================================================================

base class BaseRepository {
  void log() {
    print("Repository");
  }
}


// ============================================================================

base class ProductDataSource
    extends BaseRepository {
  void fetch() {
    print(
      "Fetching products",
    );
  }
}


// ============================================================================
// 42. INTERFACE CLASS
// ============================================================================
//
// An interface class is intended to be implemented rather than extended.
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

class ConsoleLogger
    implements Logger {
  @override
  void log(
    String message,
  ) {
    print(
      "Console: $message",
    );
  }
}


// ============================================================================
// 43. FINAL CLASS
// ============================================================================
//
// A final class cannot be extended or implemented outside its defining
// library.
//
// Useful when you want strict control over a class hierarchy.
//
// ============================================================================

final class AppConfig {
  final String baseUrl;

  const AppConfig(
    this.baseUrl,
  );
}


// ============================================================================
// 44. SEALED CLASS
// ============================================================================
//
// A sealed class is useful for a closed hierarchy.
//
// ============================================================================

sealed class PaymentResult {
  const PaymentResult();
}

class PaymentSuccess
    extends PaymentResult {
  const PaymentSuccess();
}

class PaymentFailed
    extends PaymentResult {
  final String reason;

  const PaymentFailed(
    this.reason,
  );
}


// ============================================================================
// 45. ABSTRACT CLASS
// ============================================================================
//
// Abstract class cannot normally be instantiated directly.
//
// ============================================================================

abstract class Animal {
  void makeSound();
}


// ============================================================================

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof");
  }
}


// ============================================================================
// 46. ABSTRACT INTERFACE
// ============================================================================
//
// Useful for defining contracts.
//
// ============================================================================

abstract interface class UserRepository {
  Future<User?> getUser(
    String id,
  );

  Future<void> saveUser(
    User user,
  );
}


// ============================================================================
// 47. MIXIN
// ============================================================================
//
// A mixin allows reusable behavior.
//
// ============================================================================

mixin LoggerMixin {
  void log(
    String message,
  ) {
    print(
      "[LOG] $message",
    );
  }
}


// ============================================================================

class ProductService
    with LoggerMixin {
  void createProduct() {
    log(
      "Creating product",
    );
  }
}


// ============================================================================
// 48. MIXIN WITH ON
// ============================================================================
//
// `on` restricts which classes can use the mixin.
//
// ============================================================================

class DatabaseService {
  void connect() {
    print("Connected");
  }
}


// ============================================================================

mixin DatabaseLogger
    on DatabaseService {
  void logDatabase() {
    print(
      "Database operation",
    );
  }
}


// ============================================================================

class ProductDatabaseService
    extends DatabaseService
    with DatabaseLogger {}


// ============================================================================
// 49. EXTENSION METHODS
// ============================================================================
//
// Extension methods allow adding functionality to existing types without
// modifying the original class.
//
// ============================================================================

extension StringExtensions
    on String {
  bool get isEmail {
    return contains("@");
  }
}


// ============================================================================

void extensionExample() {
  print(
    "test@example.com".isEmail,
  );
}


// ============================================================================
// 50. EXTENSION METHOD
// ============================================================================

extension IntExtensions
    on int {
  bool get isPositive {
    return this > 0;
  }

  int squared() {
    return this * this;
  }
}


// ============================================================================

void intExtensionExample() {
  print(
    5.isPositive,
  );

  print(
    5.squared(),
  );
}


// ============================================================================
// 51. EXTENSION GETTER FOR UI
// ============================================================================
//
// Example:
//
// extension CurrencyExtension on double {
//   String get formattedCurrency {
//     return "\$${toStringAsFixed(2)}";
//   }
// }
//
// Then:
//
// price.formattedCurrency
//
// ============================================================================


// ============================================================================
// 52. EXTENSION TYPES
// ============================================================================
//
// Extension types are an advanced Dart feature for creating compile-time
// abstractions over an existing representation.
//
// They are useful when you want stronger type semantics without necessarily
// creating a traditional class representation.
//
// Example concept:
//
// A raw String:
//
// String userId
//
// can accidentally be confused with:
//
// String productId
//
// An extension type can provide a stronger semantic API.
//
// ============================================================================


// ============================================================================
// Example:
//
// extension type UserId(String value) {
//   String get raw => value;
// }
//
// extension type ProductId(String value) {
//   String get raw => value;
// }
//
// ============================================================================
//
// UserId and ProductId communicate different meanings even though their
// underlying representation is String.
//
// ============================================================================


// ============================================================================
// 53. TYPE-SAFE IDs
// ============================================================================
//
// This is useful in large applications.
//
// Instead of:
//
// void getUser(String id)
// void getProduct(String id)
//
// you can conceptually use:
//
// void getUser(UserId id)
// void getProduct(ProductId id)
//
// This reduces accidental mixing of identifiers.
//
// ============================================================================


// ============================================================================
// 54. RECORDS + GENERICS
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

void genericRecordExample() {
  final result =
      pair<int, String>(
    100,
    "Success",
  );

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 55. NAMED RECORD RETURN TYPE
// ============================================================================

({
  String name,
  int age,
}) getUserInfo() {
  return (
    name: "Palash",
    age: 25,
  );
}


// ============================================================================

void namedRecordExample() {
  final user =
      getUserInfo();

  print(user.name);
  print(user.age);
}


// ============================================================================
// 56. RECORDS FOR MULTIPLE VALUES
// ============================================================================
//
// Instead of creating a class for every tiny return structure:
//
// class Coordinates {
//   final double latitude;
//   final double longitude;
// }
//
// You can use:
//
// (double, double)
//
// ============================================================================

(double, double)
    getCoordinates() {
  return (
    23.8103,
    90.4125,
  );
}


// ============================================================================
// 57. RECORDS IN FUNCTIONS
// ============================================================================

void coordinateExample() {
  final (
    latitude,
    longitude,
  ) = getCoordinates();

  print(latitude);
  print(longitude);
}


// ============================================================================
// 58. RECORD PATTERN IN SWITCH
// ============================================================================

String coordinateDescription(
  (double, double) point,
) {
  return switch (point) {
    (0, 0) =>
      "Origin",
    (double x, double y) =>
      "Point: $x, $y",
  };
}


// ============================================================================
// 59. NULLABLE GENERICS
// ============================================================================

class NullableBox<T> {
  final T? value;

  const NullableBox(
    this.value,
  );
}


// ============================================================================

void nullableGenericExample() {
  final box =
      NullableBox<String>(
    null,
  );

  print(box.value);
}


// ============================================================================
// 60. COVARIANT
// ============================================================================
//
// `covariant` is an advanced Dart type-system feature.
//
// It changes how a parameter in an overridden method can be treated.
//
// Use it carefully.
//
// ============================================================================

class AnimalHandler {
  void handle(
    Animal animal,
  ) {
    print(
      "Animal",
    );
  }
}


// ============================================================================
//
// A child class may need a narrower parameter.
//
// This is where `covariant` can be relevant.
//
// ============================================================================

class DogHandler
    extends AnimalHandler {
  @override
  void handle(
    covariant Dog dog,
  ) {
    print(
      "Dog",
    );
  }
}


// ============================================================================
// IMPORTANT:
//
// `covariant` should not be used casually.
//
// Understand the type-safety implications before using it in production.
//
// ============================================================================


// ============================================================================
// 61. FUNCTION TYPE COMPATIBILITY
// ============================================================================
//
// Function parameters and return types must be compatible.
//
// Example:
//
// ============================================================================

void acceptsCallback(
  String Function(int) callback,
) {
  print(
    callback(10),
  );
}


// ============================================================================

String numberToText(
  int number,
) {
  return number.toString();
}


// ============================================================================

void functionCompatibilityExample() {
  acceptsCallback(
    numberToText,
  );
}


// ============================================================================
// 62. OPTIONAL FUNCTION PARAMETERS
// ============================================================================

void configure(
  String name, {
  void Function()? onSuccess,
  void Function(Object error)? onError,
}) {
  try {
    print(
      "Configuring $name",
    );

    onSuccess?.call();
  } catch (error) {
    onError?.call(error);
  }
}


// ============================================================================
// 63. CALLBACK WITH NAMED PARAMETERS
// ============================================================================
//
// Function types can contain named parameters.
//
// ============================================================================

typedef Validator = String? Function(
  String value, {
  bool required,
});


// ============================================================================

String? validate(
  String value, {
  bool required = true,
}) {
  if (required &&
      value.trim().isEmpty) {
    return "Required";
  }

  return null;
}


// ============================================================================

void validatorTypeExample() {
  Validator validator =
      validate;

  print(
    validator(
      "",
      required: true,
    ),
  );
}


// ============================================================================
// 64. RESULT TYPE — PRODUCTION PATTERN
// ============================================================================
//
// For large applications, a sealed Result hierarchy can be useful.
//
// ============================================================================

sealed class ResultState<T> {
  const ResultState();
}


class ResultSuccess<T>
    extends ResultState<T> {
  final T data;

  const ResultSuccess(
    this.data,
  );
}


class ResultFailure<T>
    extends ResultState<T> {
  final Object error;

  const ResultFailure(
    this.error,
  );
}


class ResultLoading<T>
    extends ResultState<T> {
  const ResultLoading();
}


// ============================================================================
// 65. RESULT HANDLING
// ============================================================================

String handleResult<T>(
  ResultState<T> result,
) {
  return switch (result) {
    ResultLoading() =>
      "Loading",

    ResultSuccess(
      data: final data,
    ) =>
      "Success: $data",

    ResultFailure(
      error: final error,
    ) =>
      "Failure: $error",
  };
}


// ============================================================================
// 66. API RESPONSE MODEL
// ============================================================================

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
  });
}


// ============================================================================
// Generic API response allows:
//
// ApiResponse<User>
//
// ApiResponse<Product>
//
// ApiResponse<List<Order>>
//
// ApiResponse<DashboardData>
//
// ============================================================================


// ============================================================================
// 67. SEALED NETWORK RESULT
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

class NetworkError<T>
    extends NetworkResult<T> {
  final String message;
  final int? statusCode;

  const NetworkError(
    this.message, {
    this.statusCode,
  });
}


// ============================================================================
// 68. NETWORK RESULT HANDLER
// ============================================================================

void handleNetworkResult<T>(
  NetworkResult<T> result,
) {
  switch (result) {
    case NetworkSuccess(
      data: final data,
    ):
      print(
        "Data: $data",
      );

    case NetworkError(
      message: final message,
      statusCode: final code,
    ):
      print(
        "Error: $message ($code)",
      );
  }
}


// ============================================================================
// 69. PATTERN GUARDS
// ============================================================================
//
// `when` can add additional conditions to a pattern.
//
// ============================================================================

String productStockStatus(
  int stock,
) {
  return switch (stock) {
    0 => "Out of stock",
    final value
        when value > 0 &&
            value <= 5 =>
      "Low stock",
    _ => "Available",
  };
}


// ============================================================================
// 70. DESTRUCTURING IN FOR LOOP
// ============================================================================

void destructuringLoop() {
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
    :name,
    :age,
  ) in users) {
    print(
      "$name - $age",
    );
  }
}


// ============================================================================
// 71. PATTERN MATCHING WITH MAP
// ============================================================================

void orderPattern(
  Map<String, dynamic> order,
) {
  switch (order) {
    case {
      "status": "completed",
      "total": num total,
    }:
      print(
        "Completed: $total",
      );

    case {
      "status": "pending",
    }:
      print(
        "Pending",
      );

    default:
      print(
        "Unknown",
      );
  }
}


// ============================================================================
// 72. PATTERN MATCHING WITH SEALED STATES
// ============================================================================
//
// This combination is extremely powerful.
//
// sealed class
//      +
// pattern matching
//      +
// exhaustive switch
//
// gives highly type-safe state handling.
//
// ============================================================================


// ============================================================================
// 73. CLEAN ARCHITECTURE EXAMPLE
// ============================================================================

abstract interface class ProductRepositoryContract {
  Future<ResultState<List<Product>>>
      getProducts();
}


// ============================================================================

class ProductRepositoryImpl
    implements
        ProductRepositoryContract {
  @override
  Future<ResultState<List<Product>>>
      getProducts() async {
    try {
      final products =
          <Product>[];

      return ResultSuccess(
        products,
      );
    } catch (error) {
      return ResultFailure(
        error,
      );
    }
  }
}


// ============================================================================
// This creates:
//
// Contract
// ↓
// Implementation
// ↓
// Result type
// ↓
// UI
//
// ============================================================================
// 74. UI STATE EXAMPLE
// ============================================================================

void renderState(
  ResultState<List<Product>>
      state,
) {
  switch (state) {
    case ResultLoading():
      print(
        "Loading...",
      );

    case ResultSuccess(
      data: final products,
    ):
      print(
        "Products: ${products.length}",
      );

    case ResultFailure(
      error: final error,
    ):
      print(
        "Error: $error",
      );
  }
}


// ============================================================================
// 75. TYPE-SAFE BUSINESS LOGIC
// ============================================================================
//
// Instead of passing:
//
// String status
//
// everywhere:
//
// "loading"
// "success"
// "error"
//
// use typed states.
//
//
//
// This prevents many spelling mistakes:
//
// "sucess"
// "succes"
// "successs"
//
// ============================================================================
// 76. BAD STATUS STRING
// ============================================================================

void badStatus(
  String status,
) {
  if (status == "sucess") {
    print(
      "Success",
    );
  }
}


// ============================================================================
// 77. BETTER SEALED STATE
// ============================================================================
//
// Compiler-aware states are safer.
//
// ============================================================================


// ============================================================================
// 78. GENERIC STATE
// ============================================================================
//
// One state hierarchy can represent:
//
// Product
// User
// Order
// Dashboard
//
// ============================================================================

sealed class State<T> {
  const State();
}

class StateLoading<T>
    extends State<T> {
  const StateLoading();
}

class StateSuccess<T>
    extends State<T> {
  final T data;

  const StateSuccess(
    this.data,
  );
}

class StateError<T>
    extends State<T> {
  final Object error;

  const StateError(
    this.error,
  );
}


// ============================================================================
// 79. GENERIC STATE EXAMPLE
// ============================================================================

State<List<Product>>
    productState() {
  return StateSuccess(
    <Product>[],
  );
}


// ============================================================================
// 80. FUNCTION + GENERIC + CALLBACK
// ============================================================================

Future<R> transformAsync<T, R>(
  T value,
  Future<R> Function(T value)
      transformer,
) async {
  return transformer(value);
}


// ============================================================================

Future<String>
    convertNumber(
  int number,
) async {
  return "Number: $number";
}


// ============================================================================

Future<void>
    transformExample() async {
  final result =
      await transformAsync(
    100,
    convertNumber,
  );

  print(result);
}


// ============================================================================
// 81. ADVANCED FUNCTION COMPOSITION
// ============================================================================
//
// Function A:
//
// int -> int
//
// Function B:
//
// int -> String
//
// Compose:
//
// int -> String
//
// ============================================================================

String compose(
  int value,
  int Function(int) first,
  String Function(int) second,
) {
  final intermediate =
      first(value);

  return second(
    intermediate,
  );
}


// ============================================================================

void compositionExample() {
  final result = compose(
    5,
    (value) => value * 10,
    (value) => "Result: $value",
  );

  print(result);
}


// ============================================================================
// 82. FUNCTIONAL STYLE — MAP
// ============================================================================

void mapExample() {
  final numbers = [
    1,
    2,
    3,
    4,
  ];

  final squared =
      numbers.map(
    (number) => number * number,
  );

  print(
    squared.toList(),
  );
}


// ============================================================================
// 83. FUNCTIONAL STYLE — WHERE
// ============================================================================

void whereExample() {
  final numbers = [
    1,
    2,
    3,
    4,
    5,
  ];

  final even =
      numbers.where(
    (number) =>
        number.isEven,
  );

  print(
    even.toList(),
  );
}


// ============================================================================
// 84. FUNCTIONAL STYLE — FOLD
// ============================================================================
//
// fold is extremely useful in data processing.
//
// ============================================================================

void foldExample() {
  final prices = [
    100,
    200,
    300,
  ];

  final total =
      prices.fold<int>(
    0,
    (
      sum,
      price,
    ) =>
        sum + price,
  );

  print(total);
}


// ============================================================================
// 85. ERP PROFIT CALCULATION
// ============================================================================

class Sale {
  final double salePrice;
  final double purchasePrice;

  const Sale({
    required this.salePrice,
    required this.purchasePrice,
  });

  double get profit {
    return salePrice -
        purchasePrice;
  }
}


// ============================================================================

double calculateTotalProfit(
  List<Sale> sales,
) {
  return sales.fold<double>(
    0,
    (
      total,
      sale,
    ) =>
        total + sale.profit,
  );
}


// ============================================================================
// 86. FUNCTION TYPE IN REPOSITORY
// ============================================================================

typedef Request<T> =
    Future<T> Function();


// ============================================================================

Future<T> executeRequest<T>(
  Request<T> request,
) async {
  return request();
}


// ============================================================================
// 87. GENERIC API EXECUTOR
// ============================================================================

Future<T> executeApi<T>(
  Future<T> Function() request,
) async {
  try {
    return await request();
  } catch (error) {
    throw Exception(
      "API failed: $error",
    );
  }
}


// ============================================================================
// 88. TYPE-SAFE ID WITH EXTENSION TYPE
// ============================================================================
//
// Advanced concept:
//
// ============================================================================

extension type UserId(
  String value,
) {
  String get raw => value;
}


// ============================================================================

extension type OrderId(
  String value,
) {
  String get raw => value;
}


// ============================================================================

void typedIdExample() {
  final userId =
      UserId("U100");

  final orderId =
      OrderId("O100");

  print(userId.raw);
  print(orderId.raw);
}


// ============================================================================
// This prevents accidentally communicating intent incorrectly.
//
// Example:
//
// getUser(UserId("U100"))
//
// is clearer than:
//
// getUser("U100")
//
// ============================================================================


// ============================================================================
// 89. ENUM + SWITCH
// ============================================================================

enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled,
}


// ============================================================================

String orderStatusText(
  OrderStatus status,
) {
  return switch (status) {
    OrderStatus.pending =>
      "Pending",

    OrderStatus.confirmed =>
      "Confirmed",

    OrderStatus.shipped =>
      "Shipped",

    OrderStatus.delivered =>
      "Delivered",

    OrderStatus.cancelled =>
      "Cancelled",
  };
}


// ============================================================================
// 90. SEALED CLASS VS ENUM
// ============================================================================
//
// ENUM:
//
// Best when the state is simple and doesn't need different data.
//
// Example:
//
// OrderStatus.pending
//
//
//
// SEALED CLASS:
//
// Best when different states contain different data.
//
// Example:
//
// Loading
// Success(data)
// Failure(error)
//
// ============================================================================
// 91. ENUM WITH DATA
// ============================================================================
//
// If you need complex state-specific data, sealed classes are generally
// more suitable.
//
// ============================================================================
// 92. FINAL VS SEALED
// ============================================================================
//
// final:
//
// Prevents external subclassing/implementation.
//
//
//
// sealed:
//
// Defines a closed hierarchy that can be exhaustively switched.
//
//
//
// They solve different problems.
//
// ============================================================================
// 93. INTERFACE VS ABSTRACT CLASS
// ============================================================================
//
// abstract class:
//
// Can provide shared implementation and abstract members.
//
//
//
// abstract interface class:
//
// Mainly defines a contract.
//
//
//
// For repository contracts:
//
// abstract interface class
//
// is often a very clear choice.
//
// ============================================================================
// 94. MIXIN VS INHERITANCE
// ============================================================================
//
// Inheritance:
//
// class Child extends Parent
//
// Represents:
//
// "Child IS-A Parent"
//
//
//
// Mixin:
//
// class Service with LoggerMixin
//
// Represents:
//
// "Service USES this reusable behavior"
//
// ============================================================================
// 95. EXTENSION VS INHERITANCE
// ============================================================================
//
// Extension:
//
// Adds helper methods to an existing type.
//
//
//
// It does NOT modify the original class.
//
//
//
// Example:
//
// String
// ↓
// StringExtensions
//
// ============================================================================
// 96. IMPORTANT EXTENSION LIMITATION
// ============================================================================
//
// Extensions don't add actual instance fields to the target class.
//
// You can add:
//
//   • methods
//   • getters
//   • setters
//
// but not ordinary stored instance fields.
//
// ============================================================================
// 97. CALLABLE OBJECT VS FUNCTION
// ============================================================================
//
// Function:
//
// void Function()
//
// Callable class:
//
// class Action {
//   void call() {}
// }
//
//
//
// Callable classes are useful when the behavior needs configuration/state.
//
// ============================================================================
// 98. FUNCTION VS CLASS
// ============================================================================
//
// Use a function when:
//
//   • operation is simple
//   • little/no state
//
// Use callable class when:
//
//   • behavior has state
//   • configuration is needed
//   • behavior should be reusable as an object
//
// ============================================================================
// 99. PROFESSIONAL FLUTTER EXAMPLE
// ============================================================================
//
// Validator:
//
// ============================================================================

abstract interface class FieldValidator {
  String? call(
    String value,
  );
}


// ============================================================================

class RequiredValidator
    implements FieldValidator {
  @override
  String? call(
    String value,
  ) {
    if (value.trim().isEmpty) {
      return "This field is required";
    }

    return null;
  }
}


// ============================================================================
// Usage:
//
// final validator = RequiredValidator();
//
// final error = validator(value);
//
// ============================================================================


// ============================================================================
// 100. PROFESSIONAL ERP VALIDATION
// ============================================================================

class PositivePriceValidator
    implements FieldValidator {
  @override
  String? call(
    String value,
  ) {
    final price =
        double.tryParse(value);

    if (price == null) {
      return "Invalid price";
    }

    if (price <= 0) {
      return "Price must be greater than 0";
    }

    return null;
  }
}


// ============================================================================
// 101. MULTIPLE VALIDATORS
// ============================================================================

List<String> validateAll(
  String value,
  List<FieldValidator>
      validators,
) {
  final errors =
      <String>[];

  for (final validator
      in validators) {
    final error =
        validator(value);

    if (error != null) {
      errors.add(error);
    }
  }

  return errors;
}


// ============================================================================
// 102. ADVANCED ARCHITECTURE
// ============================================================================
//
// Your Flutter application can eventually have:
//
//
//
// UI
// │
// ▼
// Controller / Cubit / Notifier
// │
// ▼
// UseCase
// │
// ▼
// Repository Interface
// │
// ▼
// Repository Implementation
// │
// ▼
// Data Source
// │
// ▼
// API Client
// │
// ▼
// Node.js / Express
//
//
//
// Supporting Dart features:
//
// Generics
// Sealed classes
// Records
// Patterns
// Function types
// Extensions
// Interfaces
// Mixins
//
// ============================================================================
// 103. FULL MINI ARCHITECTURE EXAMPLE
// ============================================================================

abstract interface class ProductDataSource {
  Future<List<Product>>
      fetchProducts();
}


// ============================================================================

class FakeProductDataSource
    implements ProductDataSource {
  @override
  Future<List<Product>>
      fetchProducts() async {
    return [
      const Product(
        id: "1",
        name: "Laptop",
      ),
      const Product(
        id: "2",
        name: "Phone",
      ),
    ];
  }
}


// ============================================================================

abstract interface class ProductRepository {
  Future<ResultState<List<Product>>>
      getProducts();
}


// ============================================================================

class ProductRepositoryImpl
    implements ProductRepository {
  final ProductDataSource
      dataSource;

  const ProductRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<ResultState<List<Product>>>
      getProducts() async {
    try {
      final products =
          await dataSource
              .fetchProducts();

      return ResultSuccess(
        products,
      );
    } catch (error) {
      return ResultFailure(
        error,
      );
    }
  }
}


// ============================================================================
// 104. USE CASE
// ============================================================================

class GetProductsUseCase {
  final ProductRepository
      repository;

  const GetProductsUseCase(
    this.repository,
  );

  Future<ResultState<List<Product>>>
      call() {
    return repository
        .getProducts();
  }
}


// ============================================================================
// 105. USE CASE AS CALLABLE OBJECT
// ============================================================================
//
// This is a professional pattern:
//
// useCase()
//
// instead of:
//
// useCase.execute()
//
// ============================================================================


// ============================================================================
// 106. COMPLETE FLOW
// ============================================================================
//
// UI
// ↓
// GetProductsUseCase()
// ↓
// ProductRepository
// ↓
// ProductDataSource
// ↓
// API
// ↓
// ResultState
// ↓
// UI
//
// ============================================================================
// 107. WHAT YOU SHOULD NOW UNDERSTAND
// ============================================================================
//
// FUNCTIONS:
//
// [✓] Function objects
// [✓] Function types
// [✓] Callbacks
// [✓] typedef
// [✓] Generic function types
// [✓] Closures
// [✓] Function tear-offs
// [✓] Method tear-offs
// [✓] Callable classes
//
// GENERICS:
//
// [✓] Generic classes
// [✓] Generic methods
// [✓] Generic repositories
// [✓] Generic state
// [✓] Generic API response
//
// TYPE SYSTEM:
//
// [✓] Type promotion
// [✓] is checks
// [✓] covariant
// [✓] Function compatibility
//
// PATTERNS:
//
// [✓] switch expressions
// [✓] if-case
// [✓] list patterns
// [✓] map patterns
// [✓] object patterns
// [✓] record destructuring
// [✓] guards
// [✓] exhaustive matching
//
// MODERN CLASS SYSTEM:
//
// [✓] abstract
// [✓] base
// [✓] interface
// [✓] final
// [✓] sealed
// [✓] mixin
//
// OTHER:
//
// [✓] extension methods
// [✓] extension types
// [✓] records
// [✓] typed IDs
// [✓] Result patterns
//
// ============================================================================
// 108. INTERVIEW QUESTIONS
// ============================================================================
//
// 1. What is a function type in Dart?
//
// 2. What is a callback?
//
// 3. What is a closure?
//
// 4. What is a typedef?
//
// 5. What is a function tear-off?
//
// 6. What is a callable class?
//
// 7. What is the difference between a callable class and a normal function?
//
// 8. What are generics?
//
// 9. Why are generics important in repositories?
//
// 10. What is type promotion?
//
// 11. What is pattern matching?
//
// 12. What is an exhaustive switch?
//
// 13. What is a sealed class?
//
// 14. When should you use enum instead of sealed class?
//
// 15. What is a base class?
//
// 16. What is an interface class?
//
// 17. What is a final class?
//
// 18. What is a mixin?
//
// 19. What is an extension method?
//
// 20. What is an extension type?
//
// 21. What is covariant?
//
// 22. What are records?
//
// 23. How can sealed classes improve Flutter state management?
//
// 24. Why are typed IDs useful in large applications?
//
// 25. Why is a callable UseCase useful in Clean Architecture?
//
// ============================================================================
// 109. MASTER RULES
// ============================================================================
//
// RULE 1:
// Functions are first-class objects.
//
// RULE 2:
// Use function types when you need type-safe callbacks.
//
// RULE 3:
// Use typedef when a complex function type needs a meaningful name.
//
// RULE 4:
// Use closures when a function needs to remember surrounding state.
//
// RULE 5:
// Use callable classes when behavior needs state/configuration.
//
// RULE 6:
// Use generics to build reusable type-safe architecture.
//
// RULE 7:
// Use sealed classes for finite state hierarchies.
//
// RULE 8:
// Use exhaustive switch to make state handling safer.
//
// RULE 9:
// Use records for lightweight grouped values.
//
// RULE 10:
// Use patterns to destructure and inspect structured data.
//
// RULE 11:
// Use interfaces to define contracts.
//
// RULE 12:
// Use mixins for reusable behavior.
//
// RULE 13:
// Use extensions for helper functionality on existing types.
//
// RULE 14:
// Don't use advanced features simply because they exist.
//
// RULE 15:
// Prefer code that is type-safe AND easy for another developer to read.
//
// ============================================================================
// 110. PHASE 21 FINAL PROJECT
// ============================================================================
//
// Build a small typed Product module:
//
// Product
// ProductRepository interface
// ProductRepositoryImpl
// ProductDataSource
// GetProductsUseCase
// ProductState sealed class
// Loading
// Success<List<Product>>
// Failure
//
// Add:
//
//   • generic Result
//   • callable UseCase
//   • extension methods
//   • pattern matching
//   • records where appropriate
//   • typed ProductId
//
// Then your architecture should look like:
//
//
// UI
//  │
//  ▼
// ProductState
//  │
//  ▼
// GetProductsUseCase()
//  │
//  ▼
// ProductRepository
//  │
//  ▼
// ProductDataSource
//  │
//  ▼
// API
//
// ============================================================================
// END OF PHASE 21
// ============================================================================
//
// NEXT PHASE:
//
// PHASE 22 — DART MEMORY, OBJECT LIFECYCLE, GARBAGE COLLECTION,
// IMMUTABILITY, PERFORMANCE, DEEP COPY, REFERENCES & ADVANCED COLLECTIONS
//
// This will connect your Dart language knowledge with real Flutter
// performance and large-application memory management.
//
// ============================================================================