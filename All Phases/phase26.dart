// ============================================================================
// DART MASTER ROADMAP
// PHASE 26 — ADVANCED GENERICS & TYPE SYSTEM
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// In this phase you will learn:
//
// 01. What generics are
// 02. Generic classes
// 03. Generic methods
// 04. Generic functions
// 05. Generic interfaces
// 06. Generic repositories
// 07. Generic services
// 08. Generic API responses
// 09. Generic pagination
// 10. Generic Result<T>
// 11. Generic constraints
// 12. Type bounds
// 13. Type inference
// 14. Object
// 15. Object?
// 16. dynamic
// 17. Never
// 18. Null
// 19. Type promotion
// 20. is
// 21. is!
// 22. as
// 23. runtimeType
// 24. covariant
// 25. variance concepts
// 26. Function types
// 27. Generic callbacks
// 28. Generic collections
// 29. Generic extensions
// 30. Generic Flutter architecture
//
// WHY THIS MATTERS FOR YOU
// ----------------------------------------------------------------------------
// In a professional Flutter + Node.js ERP/SaaS application you will often
// build reusable:
//
//   • API response classes
//   • Repository classes
//   • Service classes
//   • Pagination classes
//   • Result classes
//   • Cache classes
//   • State classes
//   • Generic widgets
//   • Data-source abstractions
//
// Example:
//
// ApiResponse<Product>
// ApiResponse<Order>
// ApiResponse<Customer>
//
// Instead of writing three separate classes.
//
// ============================================================================


// ============================================================================
// 01. WHAT IS A GENERIC?
// ----------------------------------------------------------------------------
// A generic allows a class/function/type to work with different data types
// while maintaining type safety.
//
// Without generics:
//
// class Box {
//   Object? value;
// }
//
// With generics:
//
// class Box<T> {
//   T value;
// }
//
// T is a type parameter.
//
// ============================================================================


// ============================================================================
// 02. BASIC GENERIC CLASS
// ============================================================================

class Box<T> {
  final T value;

  const Box(
    this.value,
  );
}


// ============================================================================
// 03. USING GENERIC CLASS
// ============================================================================

void genericClassExample() {
  final Box<int> numberBox =
      Box<int>(100);

  final Box<String> textBox =
      Box<String>("Hello");

  print(
    numberBox.value,
  );

  print(
    textBox.value,
  );
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// Box<int>
//
// means:
//
// T = int
//
// Box<String>
//
// means:
//
// T = String
//
// ============================================================================


// ============================================================================
// 04. TYPE SAFETY
// ----------------------------------------------------------------------------
// This is one of the biggest benefits of generics.
//
// ============================================================================

void typeSafetyExample() {
  final Box<int> box =
      Box<int>(100);

  final int value =
      box.value;

  print(value);
}


// ============================================================================
// You cannot safely treat:
//
// Box<int>
//
// as:
//
// Box<String>
//
// ============================================================================


// ============================================================================
// 05. GENERIC FUNCTION
// ----------------------------------------------------------------------------
// A function can also have a type parameter.
//
// ============================================================================

T identity<T>(
  T value,
) {
  return value;
}


// ============================================================================
// 06. GENERIC FUNCTION USAGE
// ============================================================================

void genericFunctionExample() {
  final int number =
      identity<int>(100);

  final String text =
      identity<String>("Dart");

  print(number);
  print(text);
}


// ============================================================================
// 07. TYPE INFERENCE
// ----------------------------------------------------------------------------
// Dart can often determine T automatically.
//
// ============================================================================

void inferenceExample() {
  final number =
      identity(100);

  final text =
      identity("Dart");

  print(number);
  print(text);
}


// ============================================================================
// Dart understands:
//
// identity(100)
//
// T = int
//
// identity("Dart")
//
// T = String
//
// ============================================================================


// ============================================================================
// 08. GENERIC LIST FUNCTION
// ============================================================================

T firstItem<T>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================

void firstItemExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      firstItem(numbers);

  print(result);
}


// ============================================================================
// 09. GENERIC MAP FUNCTION
// ============================================================================

List<R> convertList<T, R>(
  List<T> items,
  R Function(T item)
      converter,
) {
  return items
      .map(converter)
      .toList();
}


// ============================================================================
// 10. USING GENERIC MAP
// ============================================================================

void convertListExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final strings =
      convertList<int, String>(
    numbers,
    (number) =>
        number.toString(),
  );

  print(strings);
}


// ============================================================================
// This is similar to:
//
// List.map()
//
// and is a fundamental concept behind reusable Dart APIs.
//
// ============================================================================


// ============================================================================
// 11. GENERIC CLASS WITH MULTIPLE TYPES
// ============================================================================

class Pair<A, B> {
  final A first;
  final B second;

  const Pair(
    this.first,
    this.second,
  );
}


// ============================================================================

void pairExample() {
  final pair =
      Pair<String, int>(
    "Age",
    25,
  );

  print(pair.first);
  print(pair.second);
}


// ============================================================================
// 12. GENERIC TRIPLE
// ============================================================================

class Triple<A, B, C> {
  final A first;
  final B second;
  final C third;

  const Triple(
    this.first,
    this.second,
    this.third,
  );
}


// ============================================================================
// 13. GENERIC INTERFACE
// ============================================================================

abstract interface class Storage<T> {
  Future<void> save(
    T value,
  );

  Future<T?> get();
}


// ============================================================================
// 14. STRING STORAGE
// ============================================================================

class StringStorage
    implements Storage<String> {
  String? _value;

  @override
  Future<void> save(
    String value,
  ) async {
    _value = value;
  }

  @override
  Future<String?> get() async {
    return _value;
  }
}


// ============================================================================
// 15. PRODUCT STORAGE
// ============================================================================

class ProductStorage
    implements Storage<ProductModel> {
  ProductModel? _value;

  @override
  Future<void> save(
    ProductModel value,
  ) async {
    _value = value;
  }

  @override
  Future<ProductModel?>
      get() async {
    return _value;
  }
}


// ============================================================================
// 16. GENERIC REPOSITORY
// ----------------------------------------------------------------------------
// This is extremely important for your ERP architecture.
//
// ============================================================================

abstract interface class Repository<T> {
  Future<List<T>> getAll();

  Future<T?> getById(
    String id,
  );

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
// 17. PRODUCT REPOSITORY
// ============================================================================

class ProductRepository
    implements Repository<ProductModel> {
  @override
  Future<List<ProductModel>>
      getAll() async {
    return [];
  }

  @override
  Future<ProductModel?>
      getById(
    String id,
  ) async {
    return null;
  }

  @override
  Future<ProductModel>
      create(
    ProductModel item,
  ) async {
    return item;
  }

  @override
  Future<ProductModel>
      update(
    ProductModel item,
  ) async {
    return item;
  }

  @override
  Future<void> delete(
    String id,
  ) async {}
}


// ============================================================================
// 18. ORDER REPOSITORY
// ============================================================================

class OrderRepository
    implements Repository<Order> {
  @override
  Future<List<Order>>
      getAll() async {
    return [];
  }

  @override
  Future<Order?>
      getById(
    String id,
  ) async {
    return null;
  }

  @override
  Future<Order> create(
    Order item,
  ) async {
    return item;
  }

  @override
  Future<Order> update(
    Order item,
  ) async {
    return item;
  }

  @override
  Future<void> delete(
    String id,
  ) async {}
}


// ============================================================================
// 19. WHY GENERIC REPOSITORY?
// ----------------------------------------------------------------------------
//
// Without generics:
//
// ProductRepository
// OrderRepository
// CustomerRepository
// SupplierRepository
// WarehouseRepository
//
// Each would need a similar interface.
//
//
//
// With generics:
//
// Repository<Product>
// Repository<Order>
// Repository<Customer>
// Repository<Supplier>
// Repository<Warehouse>
//
// Much more reusable.
//
// ============================================================================
// 20. GENERIC SERVICE
// ============================================================================

class Service<T> {
  final Repository<T>
      repository;

  const Service(
    this.repository,
  );

  Future<List<T>>
      getAll() {
    return repository
        .getAll();
  }

  Future<T> create(
    T item,
  ) {
    return repository
        .create(item);
  }

  Future<T> update(
    T item,
  ) {
    return repository
        .update(item);
  }

  Future<void> delete(
    String id,
  ) {
    return repository
        .delete(id);
  }
}


// ============================================================================
// 21. PRODUCT SERVICE
// ============================================================================

void serviceExample() {
  final repository =
      ProductRepository();

  final service =
      Service<ProductModel>(
    repository,
  );

  print(service);
}


// ============================================================================
// 22. GENERIC API RESPONSE
// ----------------------------------------------------------------------------
// One of the most important patterns for full-stack development.
//
// ============================================================================

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  const ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });
}


// ============================================================================
// 23. API RESPONSE PRODUCT
// ============================================================================

void apiResponseExample() {
  final response =
      ApiResponse<ProductModel>(
    success: true,
    message: "Product loaded",
    data: const ProductModel(
      id: "p1",
      name: "iPhone",
      price: 100000,
    ),
  );

  print(response.data);
}


// ============================================================================
// 24. API RESPONSE LIST
// ----------------------------------------------------------------------------
// T itself can be a List<ProductModel>.
//
// ============================================================================

void apiListResponseExample() {
  final response =
      ApiResponse<
          List<ProductModel>>(
    success: true,
    message: "Products loaded",
    data: const [],
  );

  print(response.data);
}


// ============================================================================
// 25. API RESPONSE PAGINATION
// ============================================================================

class PaginatedData<T> {
  final List<T> items;
  final int page;
  final int limit;
  final int total;
  final bool hasNextPage;

  const PaginatedData({
    required this.items,
    required this.page,
    required this.limit,
    required this.total,
    required this.hasNextPage,
  });
}


// ============================================================================
// 26. PAGINATED PRODUCT RESPONSE
// ============================================================================

void paginationExample() {
  final data =
      PaginatedData<ProductModel>(
    items: const [],
    page: 1,
    limit: 20,
    total: 100,
    hasNextPage: true,
  );

  final response =
      ApiResponse<
          PaginatedData<
              ProductModel>>(
    success: true,
    message: "Products loaded",
    data: data,
  );

  print(response.data);
}


// ============================================================================
// 27. GENERIC RESULT
// ----------------------------------------------------------------------------
// Useful for clean error handling.
//
// ============================================================================

sealed class Result<T> {
  const Result();
}


// ============================================================================

class Success<T>
    extends Result<T> {
  final T data;

  const Success(
    this.data,
  );
}


// ============================================================================

class Failure<T>
    extends Result<T> {
  final AppException error;

  const Failure(
    this.error,
  );
}


// ============================================================================
// 28. RESULT USAGE
// ============================================================================

Result<ProductModel>
    getProductResult() {
  return const Success(
    ProductModel(
      id: "p1",
      name: "Laptop",
      price: 80000,
    ),
  );
}


// ============================================================================
// 29. RESULT WITH STRING
// ============================================================================

Result<String>
    getStringResult() {
  return const Success(
    "Success",
  );
}


// ============================================================================
// 30. PATTERN MATCHING RESULT
// ----------------------------------------------------------------------------
// Modern Dart supports pattern matching.
//
// ============================================================================

void handleResult(
  Result<ProductModel>
      result,
) {
  switch (result) {
    case Success<ProductModel>(
        data: final product,
      ):
      print(
        product.name,
      );

    case Failure<ProductModel>(
        error: final error,
      ):
      print(
        error.message,
      );
  }
}


// ============================================================================
// 31. GENERIC CACHE
// ============================================================================

class Cache<T> {
  final Map<String, T>
      _storage = {};

  void put(
    String key,
    T value,
  ) {
    _storage[key] = value;
  }

  T? get(
    String key,
  ) {
    return _storage[key];
  }

  void remove(
    String key,
  ) {
    _storage.remove(key);
  }

  void clear() {
    _storage.clear();
  }
}


// ============================================================================
// 32. PRODUCT CACHE
// ============================================================================

void cacheExample() {
  final cache =
      Cache<ProductModel>();

  cache.put(
    "product-1",
    const ProductModel(
      id: "product-1",
      name: "Phone",
      price: 50000,
    ),
  );

  final product =
      cache.get(
    "product-1",
  );

  print(product);
}


// ============================================================================
// 33. STRING CACHE
// ============================================================================

void stringCacheExample() {
  final cache =
      Cache<String>();

  cache.put(
    "token",
    "abc123",
  );

  final token =
      cache.get("token");

  print(token);
}


// ============================================================================
// 34. GENERIC STATE
// ----------------------------------------------------------------------------
// Useful for Flutter state management.
//
// ============================================================================

sealed class State<T> {
  const State();
}


class Initial<T>
    extends State<T> {
  const Initial();
}


class Loading<T>
    extends State<T> {
  const Loading();
}


class Loaded<T>
    extends State<T> {
  final T data;

  const Loaded(
    this.data,
  );
}


class ErrorState<T>
    extends State<T> {
  final String message;

  const ErrorState(
    this.message,
  );
}


// ============================================================================
// 35. PRODUCT STATE
// ============================================================================

void stateExample() {
  State<ProductModel>
      state =
      const Loaded(
    ProductModel(
      id: "p1",
      name: "Phone",
      price: 50000,
    ),
  );

  print(state);
}


// ============================================================================
// 36. GENERIC FUNCTION TYPE
// ----------------------------------------------------------------------------
// Functions themselves can have generic types.
//
// ============================================================================

typedef Mapper<T, R> =
    R Function(T value);


// ============================================================================
// 37. USING MAPPER
// ============================================================================

R mapValue<T, R>(
  T value,
  Mapper<T, R> mapper,
) {
  return mapper(value);
}


// ============================================================================

void mapperExample() {
  final result =
      mapValue<int, String>(
    100,
    (value) =>
        "Number: $value",
  );

  print(result);
}


// ============================================================================
// 38. GENERIC CALLBACK
// ============================================================================

void process<T>(
  T value,
  void Function(T)
      callback,
) {
  callback(value);
}


// ============================================================================

void callbackExample() {
  process<String>(
    "Hello",
    (value) {
      print(
        value.toUpperCase(),
      );
    },
  );
}


// ============================================================================
// 39. GENERIC EXTENSION
// ============================================================================

extension FirstOrNull<T>
    on List<T> {
  T? get firstOrNull {
    if (isEmpty) {
      return null;
    }

    return first;
  }
}


// ============================================================================
// 40. USING GENERIC EXTENSION
// ============================================================================

void extensionExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  final first =
      numbers.firstOrNull;

  print(first);
}


// ============================================================================
// 41. TYPE BOUNDS
// ----------------------------------------------------------------------------
// A generic can be restricted to a particular family of types.
//
// ============================================================================

class NumberBox<T extends num> {
  final T value;

  const NumberBox(
    this.value,
  );
}


// ============================================================================
// Allowed:
//
// NumberBox<int>
// NumberBox<double>
//
// Not allowed:
//
// NumberBox<String>
//
// ============================================================================
// 42. TYPE BOUND FUNCTION
// ============================================================================

T maximum<T extends num>(
  T a,
  T b,
) {
  return a > b
      ? a
      : b;
}


// ============================================================================
// 43. TYPE BOUND EXAMPLE
// ============================================================================

void typeBoundExample() {
  final result =
      maximum<int>(
    10,
    20,
  );

  print(result);
}


// ============================================================================
// 44. CUSTOM TYPE BOUND
// ============================================================================

abstract class Entity {
  String get id;
}


// ============================================================================

class User
    implements Entity {
  @override
  final String id;

  final String name;

  User({
    required this.id,
    required this.name,
  });
}


// ============================================================================

class EntityRepository<
    T extends Entity> {
  final List<T> items = [];

  void add(
    T item,
  ) {
    items.add(item);
  }

  T? findById(
    String id,
  ) {
    for (final item
        in items) {
      if (item.id == id) {
        return item;
      }
    }

    return null;
  }
}


// ============================================================================
// 45. ENTITY REPOSITORY
// ============================================================================

void entityRepositoryExample() {
  final repository =
      EntityRepository<User>();

  repository.add(
    User(
      id: "u1",
      name: "Palash",
    ),
  );

  final user =
      repository.findById(
    "u1",
  );

  print(user?.name);
}


// ============================================================================
// 46. WHY TYPE BOUNDS?
// ----------------------------------------------------------------------------
// Type bounds allow generic code to assume certain capabilities.
//
// T extends Entity
//
// means:
//
// Every T must be an Entity.
//
// Therefore:
//
// T.id
//
// is guaranteed to exist.
//
// ============================================================================
// 47. OBJECT
// ----------------------------------------------------------------------------
// Object represents any non-null Dart object.
//
// Examples:
//
// int
// String
// List
// User
//
// all are Objects.
//
// ============================================================================

void objectExample() {
  Object value =
      "Hello";

  value = 100;

  value = true;

  print(value);
}


// ============================================================================
// 48. OBJECT CANNOT BE NULL
// ============================================================================
//
// Object value = null;
//
// is not valid under sound null safety.
//
// Use:
//
// Object?
//
// ============================================================================
// 49. OBJECT?
// ----------------------------------------------------------------------------
// Object? means any object OR null.
//
// ============================================================================

void nullableObjectExample() {
  Object? value =
      "Hello";

  value = null;

  print(value);
}


// ============================================================================
// 50. DYNAMIC
// ----------------------------------------------------------------------------
// dynamic disables many compile-time type checks.
//
// ============================================================================

void dynamicExample() {
  dynamic value =
      "Hello";

  value = 100;

  value = true;

  print(value);
}


// ============================================================================
// 51. DYNAMIC DANGER
// ============================================================================

void dynamicDanger() {
  dynamic value =
      "Hello";

  // This compiles because value is dynamic.
  //
  // But it will fail at runtime:
  //
  // value.foo();
}


// ============================================================================
// 52. OBJECT VS DYNAMIC
// ----------------------------------------------------------------------------
//
// Object:
//
// You know it is an object but Dart doesn't know its specific type.
//
// You must perform type checks before using specific members.
//
//
//
// dynamic:
//
// Dart allows operations without compile-time verification.
//
//
//
// Prefer:
//
// Object / Object?
//
// when you don't actually know the type.
//
// Use dynamic only when genuinely necessary.
//
// ============================================================================
// 53. OBJECT TYPE CHECK
// ============================================================================

void objectTypeCheck(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// 54. TYPE PROMOTION
// ----------------------------------------------------------------------------
// After:
//
// value is String
//
// Dart promotes value to String inside the relevant scope.
//
// ============================================================================
// 55. IS OPERATOR
// ============================================================================

void isExample(
  Object value,
) {
  if (value is String) {
    print(
      value.toUpperCase(),
    );
  }

  if (value is int) {
    print(
      value.isEven,
    );
  }
}


// ============================================================================
// 56. IS! OPERATOR
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
// 57. AS OPERATOR
// ----------------------------------------------------------------------------
// `as` performs an explicit type cast.
//
// ============================================================================

void asExample(
  Object value,
) {
  final text =
      value as String;

  print(
    text.length,
  );
}


// ============================================================================
// WARNING
// ----------------------------------------------------------------------------
// If the value isn't actually String:
//
// Runtime error.
//
// Therefore:
//
// `is`
//
// is generally safer than blindly using:
//
// `as`
//
// ============================================================================
// 58. SAFE CAST PATTERN
// ============================================================================

void safeCast(
  Object value,
) {
  if (value is String) {
    print(
      value.length,
    );
  }
}


// ============================================================================
// 59. NULL
// ----------------------------------------------------------------------------
// `Null` is the type of the null value.
//
// ============================================================================

void nullExample() {
  Null value =
      null;

  print(value);
}


// ============================================================================
// In normal application code you rarely need to explicitly write:
//
// Null
//
// Instead you usually use:
//
// String?
// int?
// Object?
//
// ============================================================================
// 60. NEVER
// ----------------------------------------------------------------------------
// Never represents a value that can never successfully exist.
//
// A function returning Never never completes normally.
//
// ============================================================================

Never throwError(
  String message,
) {
  throw Exception(
    message,
  );
}


// ============================================================================
// 61. NEVER WITH INFINITE LOOP
// ============================================================================

Never runForever() {
  while (true) {
    // Never returns.
  }
}


// ============================================================================
// 62. WHY NEVER MATTERS
// ----------------------------------------------------------------------------
// Never is useful for:
//
//   • Throwing functions
//   • Exhaustive type analysis
//   • Control-flow reasoning
//   • Sealed classes
//
// ============================================================================
// 63. NEVER VS VOID
// ----------------------------------------------------------------------------
//
// void:
//
// Function returns normally but has no meaningful value.
//
//
//
// Never:
//
// Function never returns normally.
//
// ============================================================================
// 64. TYPE TEST
// ============================================================================

void typeTest(
  Object value,
) {
  if (value is String) {
    print("String");
  } else if (value is int) {
    print("Integer");
  } else {
    print("Other");
  }
}


// ============================================================================
// 65. RUNTIME TYPE
// ============================================================================

void runtimeTypeExample(
  Object value,
) {
  print(
    value.runtimeType,
  );
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// runtimeType is useful for inspection/debugging.
//
// Don't build your entire application architecture around runtimeType.
//
// Prefer static typing and explicit abstractions.
//
// ============================================================================
// 66. TYPEOF CONCEPT
// ----------------------------------------------------------------------------
// Dart doesn't use JavaScript-style:
//
// typeof value
//
// Instead use:
//
// is
//
// runtimeType
//
// ============================================================================
// 67. GENERIC TYPE CHECK
// ============================================================================

bool isType<T>(
  Object value,
) {
  return value is T;
}


// ============================================================================

void genericTypeCheckExample() {
  print(
    isType<String>(
      "Hello",
    ),
  );

  print(
    isType<int>(
      100,
    ),
  );
}


// ============================================================================
// 68. GENERIC CAST FUNCTION
// ============================================================================

T castValue<T>(
  Object value,
) {
  return value as T;
}


// ============================================================================
// WARNING
// ----------------------------------------------------------------------------
// Generic casts can still fail at runtime.
//
// Use them only when you know the data is actually of the expected type.
//
// ============================================================================
// 69. GENERIC LIST
// ============================================================================

void genericListExample() {
  final List<int>
      numbers = [
    1,
    2,
    3,
  ];

  final List<String>
      names = [
    "A",
    "B",
  ];

  print(numbers);
  print(names);
}


// ============================================================================
// 70. GENERIC MAP
// ============================================================================

void genericMapExample() {
  final Map<String, int>
      scores = {
    "Palash": 90,
    "Rahim": 80,
  };

  print(scores);
}


// ============================================================================
// 71. GENERIC SET
// ============================================================================

void genericSetExample() {
  final Set<String>
      tags = {
    "flutter",
    "dart",
    "backend",
  };

  print(tags);
}


// ============================================================================
// 72. GENERIC ITERABLE
// ============================================================================

Iterable<R> transform<T, R>(
  Iterable<T> values,
  R Function(T)
      converter,
) sync* {
  for (final value
      in values) {
    yield converter(
      value,
    );
  }
}


// ============================================================================
// 73. GENERIC ITERABLE USAGE
// ============================================================================

void iterableExample() {
  final result =
      transform<int, String>(
    [1, 2, 3],
    (number) =>
        "ID-$number",
  );

  print(
    result.toList(),
  );
}


// ============================================================================
// 74. GENERIC ASYNC FUNCTION
// ============================================================================

Future<T>
    delayedValue<T>(
  T value,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return value;
}


// ============================================================================
// 75. GENERIC STREAM
// ============================================================================

Stream<T> singleValueStream<T>(
  T value,
) async* {
  yield value;
}


// ============================================================================
// 76. GENERIC FUTURE REPOSITORY
// ============================================================================

abstract interface class
    DataSource<T> {
  Future<T> fetch();
}


// ============================================================================
// 77. GENERIC API DATA SOURCE
// ============================================================================

class ProductDataSource
    implements
        DataSource<
            List<ProductModel>> {
  @override
  Future<List<ProductModel>>
      fetch() async {
    return [];
  }
}


// ============================================================================
// 78. GENERIC RESPONSE PARSER
// ----------------------------------------------------------------------------
// In a real application this idea becomes very powerful.
//
// ============================================================================

ApiResponse<T>
    successResponse<T>(
  T data,
) {
  return ApiResponse<T>(
    success: true,
    message: "Success",
    data: data,
  );
}


// ============================================================================
// 79. ERROR RESPONSE
// ============================================================================

ApiResponse<T>
    errorResponse<T>(
  String message,
) {
  return ApiResponse<T>(
    success: false,
    message: message,
  );
}


// ============================================================================
// 80. GENERIC PAGINATION SERVICE
// ============================================================================

abstract interface class
    PaginationRepository<T> {
  Future<
      PaginatedData<T>>
      getPage(
    int page,
    int limit,
  );
}


// ============================================================================
// 81. PRODUCT PAGINATION
// ============================================================================

class ProductPaginationRepository
    implements
        PaginationRepository<
            ProductModel> {
  @override
  Future<
      PaginatedData<
          ProductModel>>
      getPage(
    int page,
    int limit,
  ) async {
    return PaginatedData<
        ProductModel>(
      items: const [],
      page: page,
      limit: limit,
      total: 0,
      hasNextPage: false,
    );
  }
}


// ============================================================================
// 82. GENERIC CRUD SERVICE
// ============================================================================

class CrudService<
    T extends Entity> {
  final EntityRepository<T>
      repository;

  CrudService(
    this.repository,
  );

  void add(
    T item,
  ) {
    repository.add(item);
  }

  T? find(
    String id,
  ) {
    return repository
        .findById(id);
  }
}


// ============================================================================
// 83. WHY THIS MATTERS FOR ERP
// ----------------------------------------------------------------------------
//
// Your ERP has:
//
// Product
// Customer
// Supplier
// Warehouse
// Branch
// Order
// PurchaseOrder
// Invoice
// Payment
// Employee
//
// Many entities have:
//
// id
//
// So a generic abstraction can operate on all entities that satisfy the
// Entity contract.
//
// ============================================================================
// 84. GENERIC VALIDATOR
// ============================================================================

typedef Validator<T> =
    String? Function(
  T value,
);


class Validators<T> {
  final List<Validator<T>>
      validators;

  const Validators(
    this.validators,
  );

  String? validate(
    T value,
  ) {
    for (final validator
        in validators) {
      final error =
          validator(value);

      if (error != null) {
        return error;
      }
    }

    return null;
  }
}


// ============================================================================
// 85. STRING VALIDATOR
// ============================================================================

void validatorExample() {
  final validator =
      Validators<String>(
    [
      (value) {
        if (value
            .trim()
            .isEmpty) {
          return "Required";
        }

        return null;
      },
      (value) {
        if (value.length <
            3) {
          return "Minimum 3 characters";
        }

        return null;
      },
    ],
  );

  print(
    validator.validate(
      "Hi",
    ),
  );
}


// ============================================================================
// 86. GENERIC COMPARER
// ============================================================================

typedef Comparer<T> =
    int Function(
  T a,
  T b,
);


// ============================================================================
// 87. SORT FUNCTION
// ============================================================================

List<T> sortItems<T>(
  List<T> items,
  Comparer<T> comparer,
) {
  final result =
      List<T>.from(items);

  result.sort(comparer);

  return result;
}


// ============================================================================
// 88. PRODUCT SORT
// ============================================================================

void productSortExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 100000,
    ),
  ];

  final sorted =
      sortItems<ProductModel>(
    products,
    (a, b) =>
        a.price.compareTo(
      b.price,
    ),
  );

  print(sorted);
}


// ============================================================================
// 89. COVARIANCE CONCEPT
// ----------------------------------------------------------------------------
// Variance becomes important when understanding:
//
// List<Subtype>
//
// versus:
//
// List<Supertype>
//
// Dart's generic classes such as List are covariant in their element type,
// with soundness rules enforced by the type system.
//
// ============================================================================
// 90. SIMPLE INHERITANCE
// ============================================================================

class Animal {
  void eat() {
    print("Eating");
  }
}


class Dog extends Animal {
  void bark() {
    print("Barking");
  }
}


// ============================================================================
// 91. COVARIANCE EXAMPLE
// ============================================================================

void covarianceExample() {
  List<Dog> dogs = [
    Dog(),
  ];

  List<Animal> animals =
      dogs;

  print(animals);
}


// ============================================================================
// The assignment can be useful because every Dog is an Animal.
//
// But because List is mutable, Dart protects type safety when you attempt
// to insert incompatible values.
//
// ============================================================================
// 92. COVARIANT KEYWORD
// ----------------------------------------------------------------------------
// Dart supports the `covariant` keyword for overriding parameter types in
// specific class/interface designs.
//
// Use it carefully.
//
// ============================================================================

class Parent {
  void setValue(
    Animal value,
  ) {}
}


class Child extends Parent {
  @override
  void setValue(
    covariant Dog value,
  ) {}
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// `covariant` can move some type errors from compile time to runtime.
//
// Therefore:
//
// DON'T use it casually.
//
// ============================================================================
// 93. FUNCTION TYPES
// ----------------------------------------------------------------------------
// A function is also a type.
//
// Example:
//
// String Function(int)
//
// means:
//
// A function that accepts int and returns String.
//
// ============================================================================

String numberToText(
  int number,
) {
  return number.toString();
}


// ============================================================================
// 94. FUNCTION VARIABLE
// ============================================================================

void functionTypeExample() {
  String Function(int)
      converter =
      numberToText;

  final result =
      converter(100);

  print(result);
}


// ============================================================================
// 95. FUNCTION TYPE WITH VOID
// ============================================================================

void printValue(
  String value,
) {
  print(value);
}


void callbackTypeExample() {
  void Function(String)
      callback =
      printValue;

  callback("Hello");
}


// ============================================================================
// 96. FUNCTION TYPE IN GENERICS
// ============================================================================

T execute<T>(
  T Function() function,
) {
  return function();
}


// ============================================================================
// 97. EXECUTE EXAMPLE
// ============================================================================

void executeExample() {
  final number =
      execute<int>(
    () => 100,
  );

  final text =
      execute<String>(
    () => "Hello",
  );

  print(number);
  print(text);
}


// ============================================================================
// 98. GENERIC WIDGET CONCEPT
// ----------------------------------------------------------------------------
// Flutter widgets can also be generic.
//
// Example concept:
//
// class DataList<T> extends StatelessWidget
//
// Then:
//
// DataList<Product>
// DataList<Order>
// DataList<Customer>
//
// ============================================================================
// 99. GENERIC LIST VIEW CONCEPT
// ----------------------------------------------------------------------------
// This is a Dart-level example of the idea.
//
// ============================================================================

class DataList<T> {
  final List<T> items;
  final String Function(T)
      titleBuilder;

  const DataList({
    required this.items,
    required this.titleBuilder,
  });

  List<String>
      titles() {
    return items
        .map(
          titleBuilder,
        )
        .toList();
  }
}


// ============================================================================
// 100. GENERIC LIST USAGE
// ============================================================================

void dataListExample() {
  final data =
      DataList<ProductModel>(
    items: const [
      ProductModel(
        id: "1",
        name: "Phone",
        price: 50000,
      ),
      ProductModel(
        id: "2",
        name: "Laptop",
        price: 100000,
      ),
    ],
    titleBuilder:
        (product) =>
            product.name,
  );

  print(
    data.titles(),
  );
}


// ============================================================================
// 101. NULLABLE GENERIC
// ----------------------------------------------------------------------------
// T itself can be nullable.
//
// ============================================================================

class NullableBox<T> {
  final T? value;

  const NullableBox(
    this.value,
  );
}


// ============================================================================
// 102. NULLABLE TYPE ARGUMENT
// ============================================================================

void nullableGenericExample() {
  final Box<String?> box =
      Box<String?>(
    null,
  );

  print(box.value);
}


// ============================================================================
// 103. T VS T?
// ----------------------------------------------------------------------------
//
// T:
//
// Whatever type the caller provides.
//
//
//
// T?:
//
// That type OR null.
//
// ============================================================================
// 104. GENERIC NULL CHECK
// ============================================================================

T? findItem<T>(
  List<T> items,
  bool Function(T)
      predicate,
) {
  for (final item
      in items) {
    if (predicate(item)) {
      return item;
    }
  }

  return null;
}


// ============================================================================
// 105. GENERIC FACTORY
// ============================================================================

class Factory<T> {
  final T Function()
      creator;

  const Factory(
    this.creator,
  );

  T create() {
    return creator();
  }
}


// ============================================================================
// 106. FACTORY EXAMPLE
// ============================================================================

void factoryExample() {
  final productFactory =
      Factory<ProductModel>(
    () => const ProductModel(
      id: "p1",
      name: "Phone",
      price: 50000,
    ),
  );

  final product =
      productFactory.create();

  print(product);
}


// ============================================================================
// 107. GENERIC CONVERTER
// ----------------------------------------------------------------------------
// Very useful when converting:
//
// JSON → Model
//
// ============================================================================

T fromJson<T>(
  Map<String, dynamic>
      json,
  T Function(
    Map<String, dynamic>,
  )
      factory,
) {
  return factory(json);
}


// ============================================================================
// 108. PRODUCT JSON CONVERTER
// ============================================================================

void jsonConverterExample() {
  final json =
      <String, dynamic>{
    "id": "p1",
    "name": "Phone",
    "price": 50000,
  };

  final product =
      fromJson<ProductModel>(
    json,
    ProductModel.fromJson,
  );

  print(product);
}


// ============================================================================
// 109. GENERIC API CLIENT CONCEPT
// ============================================================================

abstract interface class
    ApiClient {
  Future<ApiResponse<T>>
      get<T>(
    String endpoint,
    T Function(Object? data)
        parser,
  );
}


// ============================================================================
// 110. WHY GENERIC API CLIENT?
// ----------------------------------------------------------------------------
//
// One client can conceptually handle:
//
// GET /products
//      ↓
// ApiResponse<List<Product>>
//
// GET /orders
//      ↓
// ApiResponse<List<Order>>
//
// GET /customers
//      ↓
// ApiResponse<List<Customer>>
//
// ============================================================================
// 111. GENERIC ERROR HANDLER
// ============================================================================

Result<T> handleException<T>(
  Object error,
) {
  return Failure<T>(
    AppException(
      error.toString(),
    ),
  );
}


// ============================================================================
// 112. GENERIC SAFE EXECUTION
// ============================================================================

Future<Result<T>>
    safeExecute<T>(
  Future<T> Function()
      operation,
) async {
  try {
    final result =
        await operation();

    return Success<T>(
      result,
    );
  } catch (error) {
    return Failure<T>(
      AppException(
        error.toString(),
      ),
    );
  }
}


// ============================================================================
// 113. SAFE PRODUCT API
// ============================================================================

Future<
    Result<
        List<ProductModel>>>
    loadProductResult() {
  return safeExecute<
      List<ProductModel>>(
    () async {
      return [];
    },
  );
}


// ============================================================================
// 114. GENERIC PAGINATION STATE
// ============================================================================

class PaginationState<T> {
  final List<T> items;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? error;

  const PaginationState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
  });

  PaginationState<T>
      copyWith({
    List<T>? items,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? error,
  }) {
    return PaginationState<T>(
      items:
          items ?? this.items,
      isLoading:
          isLoading ?? this.isLoading,
      hasMore:
          hasMore ?? this.hasMore,
      page:
          page ?? this.page,
      error:
          error ?? this.error,
    );
  }
}


// ============================================================================
// 115. PRODUCT PAGINATION STATE
// ============================================================================

void productPaginationState() {
  final state =
      PaginationState<
          ProductModel>();

  print(
    state.items,
  );
}


// ============================================================================
// 116. GENERIC EVENT
// ============================================================================

sealed class Event<T> {
  const Event();
}


class DataEvent<T>
    extends Event<T> {
  final T data;

  const DataEvent(
    this.data,
  );
}


class ErrorEvent<T>
    extends Event<T> {
  final String message;

  const ErrorEvent(
    this.message,
  );
}


// ============================================================================
// 117. GENERIC EVENT HANDLER
// ============================================================================

void handleEvent<T>(
  Event<T> event,
) {
  switch (event) {
    case DataEvent<T>(
        data: final data,
      ):
      print(data);

    case ErrorEvent<T>(
        message: final message,
      ):
      print(message);
  }
}


// ============================================================================
// 118. GENERIC CONTROLLER
// ----------------------------------------------------------------------------
// Architectural concept.
//
// ============================================================================

abstract class Controller<T> {
  T? state;

  Future<void> load();

  void reset() {
    state = null;
  }
}


// ============================================================================
// 119. PRODUCT CONTROLLER
// ============================================================================

class ProductController
    extends Controller<
        List<ProductModel>> {
  @override
  Future<void> load() async {
    state = [];
  }
}


// ============================================================================
// 120. GENERIC FACTORY REGISTRY
// ----------------------------------------------------------------------------
// Useful concept for dependency registration.
//
// ============================================================================

class Registry {
  final Map<Type, Object>
      _services = {};

  void register<T>(
    T service,
  ) {
    _services[T] = service as Object;
  }

  T resolve<T>() {
    return _services[T] as T;
  }
}


// ============================================================================
// 121. REGISTRY USAGE
// ============================================================================

void registryExample() {
  final registry =
      Registry();

  registry.register<
      ProductRepository>(
    ProductRepository(),
  );

  final repository =
      registry.resolve<
          ProductRepository>();

  print(repository);
}


// ============================================================================
// 122. IMPORTANT WARNING ABOUT REGISTRY
// ----------------------------------------------------------------------------
// This is a learning example.
//
// Production dependency injection usually requires more sophisticated
// lifecycle management.
//
// ============================================================================
// 123. GENERIC TYPE ALIAS
// ============================================================================

typedef Id<T> = String;


// ============================================================================
// Example:
//
// Id<ProductModel>
//
// communicates intent even though the underlying representation is String.
//
// ============================================================================
// 124. GENERIC RESPONSE PIPELINE
// ----------------------------------------------------------------------------
//
// Server
//   ↓
// JSON
//   ↓
// API client
//   ↓
// parser
//   ↓
// ApiResponse<T>
//   ↓
// Repository<T>
//   ↓
// Service<T>
//   ↓
// Controller<T>
//   ↓
// Flutter UI
//
// This is one of the most important architectural applications of generics.
//
// ============================================================================
// 125. FULL GENERIC ARCHITECTURE EXAMPLE
// ============================================================================

abstract interface class
    GenericApi<T> {
  Future<ApiResponse<T>>
      fetch();
}


// ============================================================================

class GenericRepository<T> {
  final GenericApi<T> api;

  const GenericRepository(
    this.api,
  );

  Future<ApiResponse<T>>
      fetch() {
    return api.fetch();
  }
}


// ============================================================================

class GenericService<T> {
  final GenericRepository<T>
      repository;

  const GenericService(
    this.repository,
  );

  Future<ApiResponse<T>>
      load() {
    return repository
        .fetch();
  }
}


// ============================================================================
// 126. TYPE INFERENCE WITH CONSTRUCTORS
// ----------------------------------------------------------------------------
// Dart can often infer generic types.
//
// ============================================================================

void constructorInference() {
  final box =
      Box(100);

  final pair =
      Pair(
    "Age",
    25,
  );

  print(box);
  print(pair);
}


// ============================================================================
// 127. EXPLICIT TYPE ARGUMENT
// ----------------------------------------------------------------------------
// Sometimes explicit types improve readability.
//
// ============================================================================

void explicitGenericType() {
  final box =
      Box<int>(100);

  final response =
      ApiResponse<
          ProductModel>(
    success: true,
    message: "OK",
    data: const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
  );

  print(box);
  print(response);
}


// ============================================================================
// 128. WHEN TO USE DYNAMIC
// ----------------------------------------------------------------------------
//
// Use dynamic carefully.
//
// Appropriate examples may include:
//
//   • Truly dynamic external data
//   • Legacy APIs
//   • Certain reflection-like integrations
//
// But after receiving JSON:
//
// dynamic
//   ↓
// validate/parse
//   ↓
// strongly typed model
//
// ============================================================================
// 129. JSON BOUNDARY PRINCIPLE
// ----------------------------------------------------------------------------
//
// BAD:
//
// dynamic everywhere
//
// BETTER:
//
// dynamic/Object?
//      ↓
// parser
//      ↓
// ProductModel
//      ↓
// typed application
//
// ============================================================================
// 130. MODEL PARSING
// ============================================================================

ProductModel parseProduct(
  Map<String, dynamic>
      json,
) {
  return ProductModel
      .fromJson(json);
}


// ============================================================================
// 131. TYPE-SAFE APPLICATION CORE
// ----------------------------------------------------------------------------
// External data can be uncertain.
//
// Internal business logic should become strongly typed as early as practical.
//
// ============================================================================
// 132. GENERICS + NULL SAFETY
// ----------------------------------------------------------------------------
// Generic code must respect null safety.
//
// ============================================================================

T requireValue<T>(
  T? value,
) {
  if (value == null) {
    throw StateError(
      "Value is required",
    );
  }

  return value;
}


// ============================================================================
// 133. REQUIRE VALUE
// ============================================================================

void requireValueExample() {
  final String? name =
      "Palash";

  final String result =
      requireValue(name);

  print(result);
}


// ============================================================================
// 134. GENERIC OPTIONAL RESULT
// ============================================================================

class Optional<T> {
  final T? value;

  const Optional(
    this.value,
  );

  bool get hasValue =>
      value != null;

  R? map<R>(
    R Function(T value)
        mapper,
  ) {
    final current =
        value;

    if (current == null) {
      return null;
    }

    return mapper(current);
  }
}


// ============================================================================
// 135. OPTIONAL EXAMPLE
// ============================================================================

void optionalExample() {
  final optional =
      Optional<String>(
    "Dart",
  );

  final length =
      optional.map(
    (value) =>
        value.length,
  );

  print(length);
}


// ============================================================================
// 136. GENERIC EQUALITY HELPER
// ============================================================================

bool same<T>(
  T a,
  T b,
) {
  return a == b;
}


// ============================================================================
// 137. GENERIC COLLECTION HELPER
// ============================================================================

List<T> takeFirst<T>(
  Iterable<T> items,
  int count,
) {
  return items
      .take(count)
      .toList();
}


// ============================================================================
// 138. GENERIC GROUPING
// ============================================================================

Map<K, List<T>>
    groupBy<T, K>(
  Iterable<T> items,
  K Function(T item)
      keySelector,
) {
  final result =
      <K, List<T>>{};

  for (final item
      in items) {
    final key =
        keySelector(item);

    result
        .putIfAbsent(
      key,
      () => [],
    )
        .add(item);
  }

  return result;
}


// ============================================================================
// 139. GROUP PRODUCT BY PRICE CATEGORY
// ============================================================================

void groupExample() {
  final products = [
    const ProductModel(
      id: "1",
      name: "Phone",
      price: 50000,
    ),
    const ProductModel(
      id: "2",
      name: "Laptop",
      price: 100000,
    ),
  ];

  final grouped =
      groupBy<ProductModel,
          String>(
    products,
    (product) {
      if (product.price <
          75000) {
        return "budget";
      }

      return "premium";
    },
  );

  print(grouped);
}


// ============================================================================
// 140. GENERIC REDUCE
// ----------------------------------------------------------------------------

R fold<T, R>(
  Iterable<T> items,
  R initial,
  R Function(
    R previous,
    T current,
  ) operation,
) {
  var result = initial;

  for (final item
      in items) {
    result = operation(
      result,
      item,
    );
  }

  return result;
}


// ============================================================================
// 141. FOLD EXAMPLE
// ============================================================================

void foldExample() {
  final total =
      fold<int, int>(
    [1, 2, 3, 4],
    0,
    (sum, value) =>
        sum + value,
  );

  print(total);
}


// ============================================================================
// 142. GENERIC SEARCH
// ============================================================================

T? search<T>(
  Iterable<T> items,
  bool Function(T)
      predicate,
) {
  for (final item
      in items) {
    if (predicate(item)) {
      return item;
    }
  }

  return null;
}


// ============================================================================
// 143. GENERIC FILTER
// ============================================================================

List<T> filter<T>(
  Iterable<T> items,
  bool Function(T)
      predicate,
) {
  return items
      .where(predicate)
      .toList();
}


// ============================================================================
// 144. GENERIC API ERROR
// ============================================================================

class ApiError {
  final String code;
  final String message;

  const ApiError({
    required this.code,
    required this.message,
  });
}


class ApiResult<T> {
  final T? data;
  final ApiError? error;

  const ApiResult.success(
    T value,
  )   : data = value,
        error = null;

  const ApiResult.failure(
    ApiError value,
  )   : data = null,
        error = value;

  bool get isSuccess =>
      error == null;
}


// ============================================================================
// 145. API RESULT EXAMPLE
// ============================================================================

void apiResultExample() {
  final result =
      ApiResult<
          List<ProductModel>>.success(
    [],
  );

  print(
    result.isSuccess,
  );
}


// ============================================================================
// 146. GENERIC PAGINATION RESPONSE
// ============================================================================

class Page<T> {
  final List<T> data;
  final int page;
  final int pageSize;
  final int total;

  const Page({
    required this.data,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  bool get hasNext =>
      page * pageSize <
      total;
}


// ============================================================================
// 147. PAGE EXAMPLE
// ============================================================================

void pageExample() {
  final page =
      Page<ProductModel>(
    data: const [],
    page: 1,
    pageSize: 20,
    total: 100,
  );

  print(
    page.hasNext,
  );
}


// ============================================================================
// 148. GENERIC CACHE WITH TTL CONCEPT
// ----------------------------------------------------------------------------
// Real cache implementations need more details, but this demonstrates how
// generics allow reusable cached values.
//
// ============================================================================

class CacheEntry<T> {
  final T value;
  final DateTime createdAt;

  const CacheEntry({
    required this.value,
    required this.createdAt,
  });
}


class TypedCache<T> {
  final Map<String, CacheEntry<T>>
      _entries = {};

  void set(
    String key,
    T value,
  ) {
    _entries[key] =
        CacheEntry<T>(
      value: value,
      createdAt:
          DateTime.now(),
    );
  }

  T? get(
    String key,
  ) {
    return _entries[key]
        ?.value;
  }
}


// ============================================================================
// 149. GENERIC EVENT BUS CONCEPT
// ----------------------------------------------------------------------------

class EventBus<T> {
  final List<
          void Function(T)>
      _listeners = [];

  void subscribe(
    void Function(T)
        listener,
  ) {
    _listeners.add(listener);
  }

  void emit(
    T event,
  ) {
    for (final listener
        in _listeners) {
      listener(event);
    }
  }
}


// ============================================================================
// 150. EVENT BUS EXAMPLE
// ============================================================================

void eventBusExample() {
  final bus =
      EventBus<String>();

  bus.subscribe(
    (event) {
      print(
        "Received: $event",
      );
    },
  );

  bus.emit(
    "ProductCreated",
  );
}


// ============================================================================
// 151. IMPORTANT ARCHITECTURAL IDEA
// ----------------------------------------------------------------------------
// Generic abstractions should represent REAL reusable behavior.
//
// Don't create generics simply because:
//
// "Generics are advanced."
//
// Good:
//
// Repository<T>
//
// ApiResponse<T>
//
// Result<T>
//
// Cache<T>
//
// Pagination<T>
//
// Validator<T>
//
// Bad:
//
// Extremely complicated generic hierarchies that make code unreadable.
//
// ============================================================================
// 152. GENERIC COMPLEXITY RULE
// ----------------------------------------------------------------------------
//
// If a generic abstraction makes the code:
//
// harder to understand
// harder to debug
// harder to maintain
//
// simplify it.
//
// ============================================================================
// 153. TYPE SAFETY PRIORITY
// ----------------------------------------------------------------------------
//
// Prefer:
//
// Strong types
// ↓
// Explicit models
// ↓
// Generics
// ↓
// Type-safe abstractions
//
// Avoid:
//
// dynamic everywhere.
//
// ============================================================================
// 154. DYNAMIC VS OBJECT VS NEVER
// ----------------------------------------------------------------------------
//
// Object
// = any non-null object.
//
// Object?
// = any object or null.
//
// dynamic
// = disable many static checks.
//
// Never
// = impossible successful result.
//
// Null
// = null's type.
//
// ============================================================================
// 155. QUICK TYPE TABLE
// ----------------------------------------------------------------------------
//
// String
// → non-null String
//
// String?
// → String or null
//
// Object
// → any non-null object
//
// Object?
// → any object or null
//
// dynamic
// → dynamically typed value
//
// Never
// → never completes normally
//
// Null
// → null value type
//
// ============================================================================
// 156. PHASE 26 INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What are generics?
//
// 02. Why are generics useful?
//
// 03. What is T?
//
// 04. What is type inference?
//
// 05. What is a generic class?
//
// 06. What is a generic function?
//
// 07. What is a generic interface?
//
// 08. Can a generic class have multiple type parameters?
//
// 09. What is a type bound?
//
// 10. What does T extends num mean?
//
// 11. What does T extends Entity mean?
//
// 12. What is Object?
//
// 13. What is Object??
//
// 14. What is dynamic?
//
// 15. Difference between Object and dynamic?
//
// 16. What is Never?
//
// 17. Difference between Never and void?
//
// 18. What is Null?
//
// 19. What is type promotion?
//
// 20. What does `is` do?
//
// 21. What does `as` do?
//
// 22. Difference between `is` and `as`?
//
// 23. What is runtimeType?
//
// 24. What is covariance?
//
// 25. What does covariant mean?
//
// 26. What are function types?
//
// 27. What is a generic callback?
//
// 28. What is a generic repository?
//
// 29. Why is ApiResponse<T> useful?
//
// 30. Why is Result<T> useful?
//
// 31. How can generics improve ERP architecture?
//
// 32. How would you build a generic pagination class?
//
// 33. How would you build a generic cache?
//
// 34. How would you build a generic validator?
//
// 35. How would you convert JSON into T?
//
// ============================================================================
// 157. PHASE 26 MASTER CHECKLIST
// ----------------------------------------------------------------------------
//
// GENERICS
// [✓] Generic class
// [✓] Generic function
// [✓] Generic method
// [✓] Multiple type parameters
// [✓] Generic interface
// [✓] Generic callback
// [✓] Generic extension
// [✓] Generic Future
// [✓] Generic Stream
// [✓] Generic repository
// [✓] Generic service
// [✓] Generic cache
// [✓] Generic validator
// [✓] Generic pagination
// [✓] Generic state
// [✓] Generic result
// [✓] Generic API response
//
// TYPE SYSTEM
// [✓] Type inference
// [✓] Type bounds
// [✓] Object
// [✓] Object?
// [✓] dynamic
// [✓] Never
// [✓] Null
// [✓] Type promotion
// [✓] is
// [✓] is!
// [✓] as
// [✓] runtimeType
// [✓] covariant
// [✓] Function types
//
// ARCHITECTURE
// [✓] Repository<T>
// [✓] Service<T>
// [✓] ApiResponse<T>
// [✓] Result<T>
// [✓] Pagination<T>
// [✓] Cache<T>
// [✓] State<T>
// [✓] Validator<T>
// [✓] Generic API parser
//
// ============================================================================
// 158. PHASE 26 GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// Generics give reusable code without losing type safety.
//
// RULE 2:
// T represents a type parameter.
//
// RULE 3:
// Dart can often infer generic types automatically.
//
// RULE 4:
// Use explicit generic types when they improve readability.
//
// RULE 5:
// Use type bounds when generic code needs specific capabilities.
//
// RULE 6:
// `T extends Entity` guarantees T is an Entity.
//
// RULE 7:
// Prefer Object/Object? over dynamic when you want type safety.
//
// RULE 8:
// dynamic should be used intentionally, not everywhere.
//
// RULE 9:
// `is` performs a runtime type check.
//
// RULE 10:
// `as` performs an explicit cast and can fail at runtime.
//
// RULE 11:
// Never represents something that cannot successfully return.
//
// RULE 12:
// Future<T> means a Future that eventually produces T.
//
// RULE 13:
// Stream<T> means a Stream that emits values of type T.
//
// RULE 14:
// ApiResponse<T> is a powerful pattern for API architecture.
//
// RULE 15:
// Repository<T> allows reusable data-access abstractions.
//
// RULE 16:
// Result<T> is useful for typed success/error handling.
//
// RULE 17:
// Pagination<T> is ideal for reusable paginated APIs.
//
// RULE 18:
// Cache<T> provides type-safe caching.
//
// RULE 19:
// Generic abstractions should reduce duplication, not increase complexity.
//
// RULE 20:
// Strong typing becomes increasingly important as your application grows.
//
// ============================================================================
// PHASE 26 COMPLETE
// ============================================================================
//
// NEXT PHASE:
//
// PHASE 27 — DART PATTERN MATCHING, RECORDS, SEALED CLASSES,
//            DESTRUCTURING & MODERN DART
//
// You will learn:
//
//   • Records
//   • Named records
//   • Record destructuring
//   • List patterns
//   • Map patterns
//   • Object patterns
//   • Relational patterns
//   • Logical patterns
//   • Switch expressions
//   • Exhaustive matching
//   • Sealed classes
//   • Pattern-based state handling
//   • Modern Result<T> architecture
//   • DTO/model patterns
//   • Advanced Flutter state modeling
//
// ============================================================================
