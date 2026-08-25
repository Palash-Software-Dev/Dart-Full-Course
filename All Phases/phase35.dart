// ============================================================================
// DART MASTER ROADMAP
// LAST PHASE — PHASE 35
// ADVANCED GENERICS + TYPE-SAFE ARCHITECTURE
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// This is the FINAL phase of the Dart learning roadmap.
//
// At this point, you should already understand:
//
// ✓ Dart syntax
// ✓ Variables and data types
// ✓ Operators
// ✓ Conditions
// ✓ Loops
// ✓ Functions
// ✓ Collections
// ✓ OOP
// ✓ Constructors
// ✓ Inheritance
// ✓ Abstract classes
// ✓ Interfaces
// ✓ Mixins
// ✓ Extensions
// ✓ Enums
// ✓ Records
// ✓ Pattern matching
// ✓ Exception handling
// ✓ Async / await
// ✓ Future
// ✓ Stream
// ✓ JSON
// ✓ Null safety
//
// This final phase focuses on using Dart's type system to build
// PROFESSIONAL, REUSABLE and TYPE-SAFE Flutter architecture.
//
// These concepts are extremely useful for:
//
// • Flutter
// • REST APIs
// • Node.js backend communication
// • ERP applications
// • Repository pattern
// • Service layer
// • State management
// • Pagination
// • Authentication
// • Generic API responses
// • Clean Architecture
// • Reusable components
// ============================================================================


// ============================================================================
// PHASE 35 TOPICS
// ============================================================================
//
// 01. What are generics?
// 02. Why generics are needed
// 03. Generic functions
// 04. Generic classes
// 05. Generic methods
// 06. Type parameter T
// 07. Multiple type parameters
// 08. K and V
// 09. Generic collections
// 10. Generic interfaces
// 11. Generic abstract classes
// 12. Generic inheritance
// 13. Generic constraints
// 14. extends in generics
// 15. Generic nullable types
// 16. Generic Future<T>
// 17. Generic Stream<T>
// 18. Generic API responses
// 19. Generic Result<T>
// 20. Success / Failure
// 21. Generic repository
// 22. Generic service
// 23. Generic pagination
// 24. Generic models
// 25. Generic JSON parsing
// 26. Generic callbacks
// 27. Generic state
// 28. Generic utilities
// 29. Type-safe architecture
// 30. Final Dart architecture example
//
// ============================================================================


// ============================================================================
// 01. WHAT ARE GENERICS?
// ----------------------------------------------------------------------------
//
// Generics allow you to write reusable code that works with different types.
//
// Example:
//
// List<String>
//
// List<int>
//
// List<double>
//
// The List class itself doesn't need to be rewritten for every type.
//
// ============================================================================


// ============================================================================
// 02. BASIC GENERIC FUNCTION
// ----------------------------------------------------------------------------

T identity<T>(T value) {
  return value;
}


// ============================================================================
// USAGE
// ----------------------------------------------------------------------------

void genericFunctionExample() {
  final String name =
      identity<String>("Palash");

  final int age =
      identity<int>(25);

  final double price =
      identity<double>(99.99);

  print(name);
  print(age);
  print(price);
}


// ============================================================================
// 03. TYPE INFERENCE WITH GENERICS
// ----------------------------------------------------------------------------
//
// Dart can often infer T automatically.
//
// ============================================================================

void genericInference() {
  final name =
      identity("Palash");

  final age =
      identity(25);

  print(name);
  print(age);
}


// ============================================================================
// 04. WHY GENERICS?
// ----------------------------------------------------------------------------
//
// Without generics:
//
// dynamic returnValue(dynamic value) {
//   return value;
// }
//
// Problem:
//
// You lose type safety.
//
// With generics:
//
// T identity<T>(T value)
//
// Dart knows the exact type.
//
// ============================================================================


// ============================================================================
// 05. GENERIC CLASS
// ----------------------------------------------------------------------------

class Box<T> {
  final T value;

  Box(this.value);

  T getValue() {
    return value;
  }
}


// ============================================================================
// USAGE
// ----------------------------------------------------------------------------

void genericClassExample() {
  final stringBox =
      Box<String>("Flutter");

  final intBox =
      Box<int>(100);

  print(
    stringBox.getValue(),
  );

  print(
    intBox.getValue(),
  );
}


// ============================================================================
// 06. GENERIC CLASS WITH MULTIPLE TYPES
// ----------------------------------------------------------------------------

class Pair<A, B> {
  final A first;
  final B second;

  Pair(
    this.first,
    this.second,
  );
}


// ============================================================================
// USAGE
// ----------------------------------------------------------------------------

void pairExample() {
  final user =
      Pair<String, int>(
    "Palash",
    25,
  );

  print(user.first);
  print(user.second);
}


// ============================================================================
// 07. MULTIPLE GENERIC TYPES
// ----------------------------------------------------------------------------

class Triple<A, B, C> {
  final A first;
  final B second;
  final C third;

  Triple(
    this.first,
    this.second,
    this.third,
  );
}


// ============================================================================
// 08. K AND V
// ----------------------------------------------------------------------------
//
// K commonly means:
//
// Key
//
// V commonly means:
//
// Value
//
// You will see this in Map-related code.
//
// ============================================================================

class KeyValue<K, V> {
  final K key;
  final V value;

  KeyValue(
    this.key,
    this.value,
  );
}


// ============================================================================
// 09. GENERIC LIST
// ----------------------------------------------------------------------------

void genericListExample() {
  final List<String> names = [
    "Palash",
    "Ahmed",
  ];

  final List<int> ages = [
    20,
    25,
    30,
  ];

  print(names);
  print(ages);
}


// ============================================================================
// 10. GENERIC MAP
// ----------------------------------------------------------------------------

void genericMapExample() {
  final Map<String, int> scores = {
    "Palash": 90,
    "Ahmed": 85,
  };

  print(scores);
}


// ============================================================================
// 11. GENERIC SET
// ----------------------------------------------------------------------------

void genericSetExample() {
  final Set<String> roles = {
    "admin",
    "employee",
    "vendor",
  };

  print(roles);
}


// ============================================================================
// 12. GENERIC FUNCTION WITH LIST
// ----------------------------------------------------------------------------

T firstItem<T>(
  List<T> items,
) {
  return items.first;
}


// ============================================================================
// USAGE
// ----------------------------------------------------------------------------

void firstItemExample() {
  final firstName =
      firstItem<String>([
    "Palash",
    "Ahmed",
  ]);

  final firstNumber =
      firstItem<int>([
    10,
    20,
  ]);

  print(firstName);
  print(firstNumber);
}


// ============================================================================
// 13. GENERIC FUNCTION WITH NULLABLE VALUE
// ----------------------------------------------------------------------------

T? findItem<T>(
  List<T> items,
  bool Function(T item) test,
) {
  for (final item in items) {
    if (test(item)) {
      return item;
    }
  }

  return null;
}


// ============================================================================
// 14. GENERIC SEARCH
// ----------------------------------------------------------------------------

void genericSearchExample() {
  final numbers = [
    10,
    20,
    30,
  ];

  final result =
      findItem<int>(
    numbers,
    (number) => number > 15,
  );

  print(result);
}


// ============================================================================
// 15. GENERIC CALLBACK
// ----------------------------------------------------------------------------

void processValue<T>(
  T value,
  void Function(T value) callback,
) {
  callback(value);
}


// ============================================================================
// USAGE
// ----------------------------------------------------------------------------

void callbackExample() {
  processValue<String>(
    "Hello",
    (value) {
      print(
        value.toUpperCase(),
      );
    },
  );
}


// ============================================================================
// 16. GENERIC INTERFACE
// ----------------------------------------------------------------------------

abstract interface class Repository<T> {
  Future<List<T>> getAll();

  Future<T?> getById(
    String id,
  );
}


// ============================================================================
// 17. PRODUCT MODEL
// ----------------------------------------------------------------------------

class Product {
  final String id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}


// ============================================================================
// 18. PRODUCT REPOSITORY
// ----------------------------------------------------------------------------

class ProductRepository
    implements Repository<Product> {
  @override
  Future<List<Product>> getAll() async {
    return [
      Product(
        id: "P001",
        name: "Phone",
        price: 1000,
      ),
    ];
  }

  @override
  Future<Product?> getById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// 19. USER MODEL
// ----------------------------------------------------------------------------

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// 20. USER REPOSITORY
// ----------------------------------------------------------------------------

class UserRepository
    implements Repository<User> {
  @override
  Future<List<User>> getAll() async {
    return [
      User(
        id: "U001",
        name: "Palash",
      ),
    ];
  }

  @override
  Future<User?> getById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// 21. WHY THIS IS POWERFUL
// ----------------------------------------------------------------------------
//
// Instead of creating:
//
// ProductRepositoryBase
// UserRepositoryBase
// OrderRepositoryBase
// CustomerRepositoryBase
//
// You can define one reusable contract:
//
// Repository<T>
//
// Then:
//
// Repository<Product>
// Repository<User>
// Repository<Order>
// Repository<Customer>
//
// ============================================================================


// ============================================================================
// 22. GENERIC ABSTRACT SERVICE
// ----------------------------------------------------------------------------

abstract class ApiService<T> {
  Future<T> fetch();
}


// ============================================================================
// 23. PRODUCT SERVICE
// ----------------------------------------------------------------------------

class ProductService
    extends ApiService<Product> {
  @override
  Future<Product> fetch() async {
    return Product(
      id: "P001",
      name: "Laptop",
      price: 2000,
    );
  }
}


// ============================================================================
// 24. FUTURE<T>
// ----------------------------------------------------------------------------
//
// Future itself is generic.
//
// Future<String>
//
// Future<int>
//
// Future<Product>
//
// Future<List<Product>>
//
// Future<Product?>
//
// ============================================================================

Future<Product> fetchProduct() async {
  return Product(
    id: "P001",
    name: "Phone",
    price: 1200,
  );
}


// ============================================================================
// 25. FUTURE<List<T>>
// ----------------------------------------------------------------------------

Future<List<Product>> fetchProducts() async {
  return [];
}


// ============================================================================
// 26. STREAM<T>
// ----------------------------------------------------------------------------

Stream<Product> productStream() async* {
  yield Product(
    id: "P001",
    name: "Phone",
    price: 1000,
  );

  yield Product(
    id: "P002",
    name: "Laptop",
    price: 2000,
  );
}


// ============================================================================
// 27. GENERIC API RESPONSE
// ----------------------------------------------------------------------------
//
// This is one of the MOST IMPORTANT concepts for Flutter API development.
//
// You may receive:
//
// {
//   "success": true,
//   "message": "Success",
//   "data": {...}
// }
//
// The data type changes:
//
// Product
// User
// Order
// List<Product>
//
// Generics solve this elegantly.
//
// ============================================================================

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });
}


// ============================================================================
// 28. PRODUCT API RESPONSE
// ----------------------------------------------------------------------------

void productApiResponse() {
  final response =
      ApiResponse<Product>(
    success: true,
    message: "Product loaded",
    data: Product(
      id: "P001",
      name: "Phone",
      price: 1000,
    ),
  );

  print(
    response.data?.name,
  );
}


// ============================================================================
// 29. USER API RESPONSE
// ----------------------------------------------------------------------------

void userApiResponse() {
  final response =
      ApiResponse<User>(
    success: true,
    message: "User loaded",
    data: User(
      id: "U001",
      name: "Palash",
    ),
  );

  print(
    response.data?.name,
  );
}


// ============================================================================
// 30. LIST API RESPONSE
// ----------------------------------------------------------------------------

void listApiResponse() {
  final response =
      ApiResponse<List<Product>>(
    success: true,
    message: "Products loaded",
    data: [],
  );

  print(
    response.data?.length,
  );
}


// ============================================================================
// 31. GENERIC RESULT
// ----------------------------------------------------------------------------
//
// A professional application often needs to represent:
//
// SUCCESS
//
// or:
//
// FAILURE
//
// ============================================================================

sealed class Result<T> {
  const Result();
}


// ============================================================================
// 32. SUCCESS
// ----------------------------------------------------------------------------

class Success<T>
    extends Result<T> {
  final T data;

  const Success(this.data);
}


// ============================================================================
// 33. FAILURE
// ----------------------------------------------------------------------------

class Failure<T>
    extends Result<T> {
  final String message;

  const Failure(this.message);
}


// ============================================================================
// 34. RESULT FUNCTION
// ----------------------------------------------------------------------------

Future<Result<Product>>
loadProduct() async {
  try {
    final product =
        await fetchProduct();

    return Success<Product>(
      product,
    );
  } catch (error) {
    return Failure<Product>(
      error.toString(),
    );
  }
}


// ============================================================================
// 35. USING RESULT
// ----------------------------------------------------------------------------

Future<void> handleProduct() async {
  final result =
      await loadProduct();

  switch (result) {
    case Success<Product>(
        data: final product,
      ):
      print(
        product.name,
      );

    case Failure<Product>(
        message: final message,
      ):
      print(
        message,
      );
  }
}


// ============================================================================
// 36. WHY RESULT<T> IS USEFUL
// ----------------------------------------------------------------------------
//
// Instead of throwing errors everywhere:
//
// Result<Product>
//
// Result<User>
//
// Result<List<Product>>
//
// Result<Order>
//
// This can make API/service layers easier to reason about.
//
// ============================================================================


// ============================================================================
// 37. GENERIC PAGINATION
// ----------------------------------------------------------------------------
//
// ERP applications often have:
//
// Products
// Orders
// Customers
// Vendors
// Employees
// Purchases
//
// All can be paginated.
//
// ============================================================================

class PaginatedResponse<T> {
  final List<T> items;
  final int page;
  final int limit;
  final int total;
  final bool hasNextPage;

  const PaginatedResponse({
    required this.items,
    required this.page,
    required this.limit,
    required this.total,
    required this.hasNextPage,
  });
}


// ============================================================================
// 38. PRODUCT PAGINATION
// ----------------------------------------------------------------------------

void productPagination() {
  final response =
      PaginatedResponse<Product>(
    items: [],
    page: 1,
    limit: 20,
    total: 100,
    hasNextPage: true,
  );

  print(
    response.items,
  );
}


// ============================================================================
// 39. USER PAGINATION
// ----------------------------------------------------------------------------

void userPagination() {
  final response =
      PaginatedResponse<User>(
    items: [],
    page: 1,
    limit: 20,
    total: 50,
    hasNextPage: true,
  );

  print(
    response.total,
  );
}


// ============================================================================
// 40. GENERIC PAGINATION BENEFIT
// ----------------------------------------------------------------------------
//
// One reusable model:
//
// PaginatedResponse<T>
//
// can represent:
//
// PaginatedResponse<Product>
// PaginatedResponse<User>
// PaginatedResponse<Order>
// PaginatedResponse<Customer>
//
// ============================================================================


// ============================================================================
// 41. GENERIC CONSTRAINTS
// ----------------------------------------------------------------------------
//
// Sometimes you don't want ANY type.
//
// You want a specific family of types.
//
// ============================================================================

abstract class Entity {
  String get id;
}


// ============================================================================
// 42. GENERIC EXTENDS CONSTRAINT
// ----------------------------------------------------------------------------

class EntityRepository<T extends Entity> {
  T? findById(
    List<T> entities,
    String id,
  ) {
    for (final entity in entities) {
      if (entity.id == id) {
        return entity;
      }
    }

    return null;
  }
}


// ============================================================================
// 43. PRODUCT AS ENTITY
// ----------------------------------------------------------------------------

class ProductEntity
    extends Entity {
  @override
  final String id;

  final String name;

  ProductEntity({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// 44. CONSTRAINED REPOSITORY
// ----------------------------------------------------------------------------

void constrainedRepository() {
  final repository =
      EntityRepository<ProductEntity>();

  final products = [
    ProductEntity(
      id: "P001",
      name: "Phone",
    ),
  ];

  final product =
      repository.findById(
    products,
    "P001",
  );

  print(
    product?.name,
  );
}


// ============================================================================
// 45. WHY CONSTRAINTS MATTER
// ----------------------------------------------------------------------------
//
// T extends Entity
//
// means:
//
// T MUST be an Entity or subclass.
//
// Therefore:
//
// T.id
//
// is guaranteed to exist.
//
// ============================================================================


// ============================================================================
// 46. GENERIC JSON PARSER
// ----------------------------------------------------------------------------
//
// One challenge:
//
// JSON cannot automatically know what T means.
//
// So we provide a parser function.
//
// ============================================================================

T parseJson<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic>) parser,
) {
  return parser(json);
}


// ============================================================================
// 47. PRODUCT JSON PARSER
// ----------------------------------------------------------------------------

Product productFromJson(
  Map<String, dynamic> json,
) {
  return Product(
    id: json["id"] as String,
    name: json["name"] as String,
    price:
        (json["price"] as num)
            .toDouble(),
  );
}


// ============================================================================
// 48. USING GENERIC JSON PARSER
// ----------------------------------------------------------------------------

void genericJsonExample() {
  final json = {
    "id": "P001",
    "name": "Phone",
    "price": 1000,
  };

  final product =
      parseJson<Product>(
    json,
    productFromJson,
  );

  print(
    product.name,
  );
}


// ============================================================================
// 49. GENERIC MODEL PARSER
// ----------------------------------------------------------------------------

class GenericApiResponse<T> {
  final bool success;
  final T data;

  const GenericApiResponse({
    required this.success,
    required this.data,
  });

  static GenericApiResponse<T>
      fromJson<T>(
    Map<String, dynamic> json,
    T Function(dynamic data) parser,
  ) {
    return GenericApiResponse<T>(
      success:
          json["success"] as bool? ??
              false,
      data: parser(
        json["data"],
      ),
    );
  }
}


// ============================================================================
// 50. PARSE PRODUCT RESPONSE
// ----------------------------------------------------------------------------

void parseProductResponse() {
  final json = {
    "success": true,
    "data": {
      "id": "P001",
      "name": "Phone",
      "price": 1000,
    },
  };

  final response =
      GenericApiResponse<Product>
          .fromJson(
    json,
    (data) {
      final map =
          data as Map<String, dynamic>;

      return Product(
        id: map["id"] as String,
        name: map["name"] as String,
        price:
            (map["price"] as num)
                .toDouble(),
      );
    },
  );

  print(
    response.data.name,
  );
}


// ============================================================================
// 51. GENERIC HTTP CLIENT CONCEPT
// ----------------------------------------------------------------------------
//
// Professional architecture often looks like:
//
// ApiClient
//     ↓
// Generic request<T>
//     ↓
// parser
//     ↓
// T
//
// Example:
//
// Future<T> get<T>(
//   String endpoint,
//   T Function(dynamic data) parser,
// )
//
// ============================================================================

abstract class ApiClient {
  Future<T> get<T>(
    String endpoint,
    T Function(dynamic data) parser,
  );
}


// ============================================================================
// 52. GENERIC SERVICE CONCEPT
// ----------------------------------------------------------------------------

abstract class CrudService<T> {
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
// 53. PRODUCT CRUD SERVICE
// ----------------------------------------------------------------------------

class ProductCrudService
    implements CrudService<Product> {
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
// 54. GENERIC STATE
// ----------------------------------------------------------------------------
//
// UI states can also be generic.
//
// ============================================================================

sealed class State<T> {
  const State();
}


class Loading<T>
    extends State<T> {
  const Loading();
}


class Data<T>
    extends State<T> {
  final T value;

  const Data(this.value);
}


class ErrorState<T>
    extends State<T> {
  final String message;

  const ErrorState(
    this.message,
  );
}


// ============================================================================
// 55. PRODUCT STATE
// ----------------------------------------------------------------------------

void productStateExample() {
  State<Product> state =
      const Loading<Product>();

  state = Data<Product>(
    Product(
      id: "P001",
      name: "Phone",
      price: 1000,
    ),
  );

  print(state);
}


// ============================================================================
// 56. GENERIC STATE MANAGEMENT IDEA
// ----------------------------------------------------------------------------
//
// This pattern is useful for:
//
// Riverpod
// Bloc
// Cubit
// Provider
// ChangeNotifier
// Custom state management
//
// Concept:
//
// Loading
// ↓
// Success<T>
// ↓
// Error
//
// ============================================================================


// ============================================================================
// 57. GENERIC CACHE
// ----------------------------------------------------------------------------

class Cache<T> {
  T? _value;

  void save(T value) {
    _value = value;
  }

  T? get value => _value;

  void clear() {
    _value = null;
  }
}


// ============================================================================
// 58. PRODUCT CACHE
// ----------------------------------------------------------------------------

void cacheExample() {
  final productCache =
      Cache<Product>();

  productCache.save(
    Product(
      id: "P001",
      name: "Phone",
      price: 1000,
    ),
  );

  print(
    productCache.value?.name,
  );
}


// ============================================================================
// 59. GENERIC PAGINATION CONTROLLER
// ----------------------------------------------------------------------------

class PaginationController<T> {
  final List<T> items = [];

  int currentPage = 1;

  bool hasNextPage = true;

  void addItems(
    List<T> newItems,
  ) {
    items.addAll(newItems);
  }

  void clear() {
    items.clear();
    currentPage = 1;
    hasNextPage = true;
  }
}


// ============================================================================
// 60. PRODUCT PAGINATION CONTROLLER
// ----------------------------------------------------------------------------

void paginationControllerExample() {
  final controller =
      PaginationController<Product>();

  controller.addItems([
    Product(
      id: "P001",
      name: "Phone",
      price: 1000,
    ),
  ]);

  print(
    controller.items.length,
  );
}


// ============================================================================
// 61. GENERIC UTILITY
// ----------------------------------------------------------------------------

List<T> mapItems<T, R>(
  List<R> items,
  T Function(R item) mapper,
) {
  return items
      .map(mapper)
      .toList();
}


// ============================================================================
// 62. GENERIC MAPPING
// ----------------------------------------------------------------------------

void mapItemsExample() {
  final products = [
    Product(
      id: "P001",
      name: "Phone",
      price: 1000,
    ),
    Product(
      id: "P002",
      name: "Laptop",
      price: 2000,
    ),
  ];

  final names =
      mapItems<String, Product>(
    products,
    (product) => product.name,
  );

  print(names);
}


// ============================================================================
// 63. GENERIC REPOSITORY ARCHITECTURE
// ----------------------------------------------------------------------------
//
// A professional Flutter project may look like:
//
// lib/
// ├── core/
// │   ├── network/
// │   ├── error/
// │   └── utils/
// │
// ├── data/
// │   ├── models/
// │   ├── datasources/
// │   └── repositories/
// │
// ├── domain/
// │   ├── entities/
// │   ├── repositories/
// │   └── usecases/
// │
// └── presentation/
//     ├── screens/
//     ├── widgets/
//     └── state/
//
// Generics can be used throughout this architecture.
//
// ============================================================================


// ============================================================================
// 64. GENERIC DATA FLOW
// ----------------------------------------------------------------------------
//
// UI
// ↓
// State<T>
// ↓
// UseCase<T>
// ↓
// Repository<T>
// ↓
// ApiClient
// ↓
// ApiResponse<T>
// ↓
// Model<T>
//
// ============================================================================


// ============================================================================
// 65. COMPLETE GENERIC FLOW
// ----------------------------------------------------------------------------

abstract interface class GenericRepository<T> {
  Future<Result<T>> getById(
    String id,
  );
}


// ============================================================================
// 66. PRODUCT GENERIC REPOSITORY
// ----------------------------------------------------------------------------

class ProductGenericRepository
    implements GenericRepository<Product> {
  @override
  Future<Result<Product>> getById(
    String id,
  ) async {
    try {
      final product =
          await fetchProduct();

      return Success<Product>(
        product,
      );
    } catch (e) {
      return Failure<Product>(
        e.toString(),
      );
    }
  }
}


// ============================================================================
// 67. USE CASE
// ----------------------------------------------------------------------------

class GetProductUseCase {
  final GenericRepository<Product>
      repository;

  GetProductUseCase(
    this.repository,
  );

  Future<Result<Product>> call(
    String id,
  ) {
    return repository.getById(id);
  }
}


// ============================================================================
// 68. USE CASE USAGE
// ----------------------------------------------------------------------------

Future<void> useCaseExample() async {
  final repository =
      ProductGenericRepository();

  final useCase =
      GetProductUseCase(
    repository,
  );

  final result =
      await useCase("P001");

  print(result);
}


// ============================================================================
// 69. GENERIC CRUD ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Generic repository:
//
// Repository<T>
//
// Generic response:
//
// ApiResponse<T>
//
// Generic result:
//
// Result<T>
//
// Generic pagination:
//
// PaginatedResponse<T>
//
// Generic state:
//
// State<T>
//
// Generic service:
//
// Service<T>
//
// These patterns are extremely useful in large applications.
//
// ============================================================================


// ============================================================================
// 70. ERP EXAMPLE
// ----------------------------------------------------------------------------
//
// The same architecture can support:
//
// Product
// Order
// Customer
// Supplier
// Vendor
// Employee
// Branch
// Warehouse
// PurchaseOrder
// GRN
// Invoice
// Payment
//
// Example:
//
// Repository<Product>
//
// Repository<Order>
//
// Repository<Customer>
//
// Repository<Warehouse>
//
// ============================================================================


// ============================================================================
// 71. GENERIC TYPE ALIASES
// ----------------------------------------------------------------------------
//
// You can create readable aliases.
//
// ============================================================================

typedef ProductResult =
    Result<Product>;

typedef ProductList =
    List<Product>;

typedef ProductPage =
    PaginatedResponse<Product>;


// ============================================================================
// 72. GENERIC NULLABLE TYPES
// ----------------------------------------------------------------------------
//
// T itself may be nullable.
//
// Example:
//
// ApiResponse<String?>
//
// Or:
//
// Future<T?>
//
// ============================================================================

Future<T?> nullableFuture<T>(
  T? value,
) async {
  return value;
}


// ============================================================================
// 73. GENERIC FUNCTION WITH NULL
// ----------------------------------------------------------------------------

void genericNullableExample() {
  final result =
      nullableFuture<String>(
    null,
  );

  print(result);
}


// ============================================================================
// 74. GENERIC EXTENSION
// ----------------------------------------------------------------------------
//
// Extensions can also be generic.
//
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
// 75. USING GENERIC EXTENSION
// ----------------------------------------------------------------------------

void extensionExample() {
  final products =
      <Product>[];

  final first =
      products.firstOrNull;

  print(first);
}


// ============================================================================
// 76. GENERIC RECORD CONCEPT
// ----------------------------------------------------------------------------
//
// Generics can work with records too.
//
// ============================================================================

(T, R) combine<T, R>(
  T first,
  R second,
) {
  return (
    first,
    second,
  );
}


// ============================================================================
// 77. RECORD GENERIC USAGE
// ----------------------------------------------------------------------------

void genericRecordExample() {
  final result =
      combine<String, int>(
    "Palash",
    25,
  );

  print(result.$1);
  print(result.$2);
}


// ============================================================================
// 78. TYPE-SAFE DESIGN
// ----------------------------------------------------------------------------
//
// BAD:
//
// dynamic data;
//
// Better:
//
// Product product;
//
// Better:
//
// Result<Product>
//
// Better:
//
// Future<Result<Product>>
//
// Best architecture:
//
// Future<Result<Product>>
//
// because it communicates:
//
// asynchronous
// +
// success/failure
// +
// exact data type
//
// ============================================================================


// ============================================================================
// 79. TYPE-SAFE API EXAMPLE
// ----------------------------------------------------------------------------

Future<Result<List<Product>>>
getProducts() async {
  try {
    final products =
        await fetchProducts();

    return Success<
        List<Product>>(
      products,
    );
  } catch (e) {
    return Failure<
        List<Product>>(
      e.toString(),
    );
  }
}


// ============================================================================
// 80. TYPE-SAFE AUTH EXAMPLE
// ----------------------------------------------------------------------------

Future<Result<User>>
loginUser() async {
  try {
    return Success<User>(
      User(
        id: "U001",
        name: "Palash",
      ),
    );
  } catch (e) {
    return Failure<User>(
      e.toString(),
    );
  }
}


// ============================================================================
// 81. TYPE-SAFE ORDER EXAMPLE
// ----------------------------------------------------------------------------

class OrderModel {
  final String id;
  final double total;

  OrderModel({
    required this.id,
    required this.total,
  });
}


Future<Result<OrderModel>>
createOrder() async {
  return Success<OrderModel>(
    OrderModel(
      id: "O001",
      total: 5000,
    ),
  );
}


// ============================================================================
// 82. GENERIC ERROR HANDLING
// ----------------------------------------------------------------------------
//
// Instead of:
//
// Future<dynamic>
//
// use:
//
// Future<Result<T>>
//
// This makes your service contract much clearer.
//
// ============================================================================


// ============================================================================
// 83. IMPORTANT GENERIC RULE
// ----------------------------------------------------------------------------
//
// T is a placeholder.
//
// If you write:
//
// Repository<Product>
//
// T becomes:
//
// Product
//
// If you write:
//
// Repository<User>
//
// T becomes:
//
// User
//
// ============================================================================


// ============================================================================
// 84. T / E / K / V
// ----------------------------------------------------------------------------
//
// Common naming conventions:
//
// T = Type
//
// E = Element
//
// K = Key
//
// V = Value
//
// R = Result / Return type
//
// A / B / C = additional generic types
//
// These are conventions, not language requirements.
//
// ============================================================================


// ============================================================================
// 85. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// Question:
//
// Why use generics instead of dynamic?
//
// Answer:
//
// Generics preserve compile-time type safety while allowing reusable code.
//
// dynamic sacrifices much of that static type checking.
//
// ============================================================================


// ============================================================================
// 86. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// What is:
//
// Repository<Product>
//
// Answer:
//
// It is a Repository whose generic type T is Product.
//
// ============================================================================


// ============================================================================
// 87. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// What does:
//
// T extends Entity
//
// mean?
//
// Answer:
//
// T must be Entity or a subclass of Entity.
//
// ============================================================================


// ============================================================================
// 88. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// Why use:
//
// Future<List<Product>>
//
// instead of:
//
// Future<List<dynamic>>
//
// Answer:
//
// Because the compiler knows the exact data type,
// reducing runtime errors and improving autocomplete/refactoring.
//
// ============================================================================


// ============================================================================
// 89. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// What is:
//
// ApiResponse<T>?
//
// Answer:
//
// A reusable response model whose data type can change.
//
// ============================================================================


// ============================================================================
// 90. GENERIC INTERVIEW QUESTION
// ----------------------------------------------------------------------------
//
// What is:
//
// Result<T>?
//
// Answer:
//
// A type-safe representation of an operation result,
// usually success or failure.
//
// ============================================================================


// ============================================================================
// 91. FINAL ARCHITECTURE EXAMPLE
// ----------------------------------------------------------------------------
//
// This is the kind of Dart thinking you should now have:
//
// class Product
//
// ↓
//
// ApiResponse<Product>
//
// ↓
//
// Result<Product>
//
// ↓
//
// Repository<Product>
//
// ↓
//
// GetProductUseCase
//
// ↓
//
// State<Product>
//
// ↓
//
// Flutter UI
//
// ============================================================================


// ============================================================================
// 92. FINAL MINI PROJECT
// ----------------------------------------------------------------------------
//
// Build a small console Dart application:
//
// PRODUCT MANAGEMENT SYSTEM
//
// Features:
//
// 1. Product model
// 2. User model
// 3. Generic repository
// 4. Product repository
// 5. Generic API response
// 6. Result<T>
// 7. Success<T>
// 8. Failure<T>
// 9. Pagination
// 10. Generic cache
// 11. Product service
// 12. Product use case
// 13. Product search
// 14. JSON parsing
// 15. Error handling
//
// ============================================================================


// ============================================================================
// 93. FINAL PRACTICE PROJECT STRUCTURE
// ----------------------------------------------------------------------------
//
// dart_project/
// │
// ├── models/
// │   ├── product.dart
// │   └── user.dart
// │
// ├── core/
// │   ├── result.dart
// │   └── api_response.dart
// │
// ├── repositories/
// │   ├── repository.dart
// │   └── product_repository.dart
// │
// ├── services/
// │   └── product_service.dart
// │
// ├── usecases/
// │   └── get_product.dart
// │
// └── main.dart
//
// ============================================================================


// ============================================================================
// 94. WHAT YOU SHOULD NOW UNDERSTAND
// ----------------------------------------------------------------------------
//
// After Phase 35:
//
// ✓ Generics
// ✓ Generic functions
// ✓ Generic classes
// ✓ Generic methods
// ✓ T
// ✓ K
// ✓ V
// ✓ E
// ✓ Multiple generic parameters
// ✓ Generic constraints
// ✓ T extends Entity
// ✓ Generic repositories
// ✓ Generic services
// ✓ Generic API responses
// ✓ Result<T>
// ✓ Success<T>
// ✓ Failure<T>
// ✓ Pagination<T>
// ✓ State<T>
// ✓ Future<T>
// ✓ Stream<T>
// ✓ Generic JSON parsing
// ✓ Generic callbacks
// ✓ Generic extensions
// ✓ Type-safe architecture
//
// ============================================================================


// ============================================================================
// 95. FULL-STACK FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
// You are learning Dart for Flutter.
//
// Therefore, don't learn these concepts in isolation.
//
// Think:
//
// DART
// ↓
// FLUTTER
// ↓
// REST API
// ↓
// NODE.JS / EXPRESS
// ↓
// MONGODB
//
// Example:
//
// MongoDB
//     ↓
// Node.js API
//     ↓
// JSON
//     ↓
// Dart Model
//     ↓
// ApiResponse<Product>
//     ↓
// Result<Product>
//     ↓
// Repository<Product>
//     ↓
// UseCase<Product>
//     ↓
// State<Product>
//     ↓
// Flutter Screen
//
// This is how your Dart knowledge becomes useful in real-world
// full-stack Flutter development.
//
// ============================================================================


// ============================================================================
// 96. FINAL DART MASTER RULES
// ----------------------------------------------------------------------------
//
// 01. Prefer strong typing.
//
// 02. Avoid unnecessary dynamic.
//
// 03. Use null safety properly.
//
// 04. Use generics for reusable type-safe code.
//
// 05. Keep models strongly typed.
//
// 06. Parse API data carefully.
//
// 07. Separate API, repository and UI responsibilities.
//
// 08. Use Result<T> when a clear success/failure contract is useful.
//
// 09. Use Future<T> for asynchronous typed results.
//
// 10. Use Stream<T> for continuous typed data.
//
// 11. Use T extends Entity when a generic needs guaranteed capabilities.
//
// 12. Don't use generics just to make code complicated.
//
// 13. Choose readability over cleverness.
//
// 14. Build reusable abstractions only when they provide real value.
//
// 15. Always understand the type flowing through your application.
//
// ============================================================================


// ============================================================================
// 97. DART ROADMAP COMPLETE
// ----------------------------------------------------------------------------
//
//                    DART
//                      │
//        ┌─────────────┴─────────────┐
//        │                           │
//      BASIC                     ADVANCED
//        │                           │
// Variables                    Generics
// Conditions                   Null Safety
// Loops                        Async
// Functions                    Streams
// Collections                  Patterns
// OOP                          Extensions
//        │                           │
//        └─────────────┬─────────────┘
//                      │
//                FLUTTER DEVELOPMENT
//                      │
//               REST API / JSON
//                      │
//                 NODE.JS API
//                      │
//                  DATABASE
//                      │
//             FULL-STACK FLUTTER
//
// ============================================================================


// ============================================================================
// FINAL NOTE
// ----------------------------------------------------------------------------
//
// You do NOT need to memorize every line of Dart.
//
// A professional developer should be able to:
//
// 1. Understand the concept.
// 2. Read existing Dart code.
// 3. Write the correct structure.
// 4. Search documentation when needed.
// 5. Debug type errors.
// 6. Design type-safe models.
// 7. Build reusable abstractions.
// 8. Apply the concepts in Flutter projects.
//
// If you can confidently understand and build the examples in Phases 1–35,
// you have covered the Dart language foundation needed to move seriously
// into professional Flutter development.
//
// ============================================================================
// DART PHASE 35 — COMPLETE
// DART MASTER ROADMAP — COMPLETE
// ============================================================================


// ============================================================================
// WHAT COMES NEXT?
// ----------------------------------------------------------------------------
//
// The Dart LANGUAGE roadmap is now complete.
//
// Your next major learning stage should NOT be another Dart phase.
//
// It should be:
//
//                    FLUTTER
//
// Recommended next roadmap:
//
// PHASE 1  → Flutter Fundamentals
// PHASE 2  → Widgets & Widget Tree
// PHASE 3  → Layout System
// PHASE 4  → Navigation & Routing
// PHASE 5  → Forms & Validation
// PHASE 6  → HTTP & REST API
// PHASE 7  → JSON & Model Integration
// PHASE 8  → Authentication
// PHASE 9  → State Management
// PHASE 10 → Local Storage
// PHASE 11 → Firebase / Notifications
// PHASE 12 → Clean Architecture
// PHASE 13 → Testing
// PHASE 14 → Performance
// PHASE 15 → Production App
// PHASE 16 → Full-Stack Flutter + Node.js
// PHASE 17 → Advanced ERP Architecture
//
// ============================================================================
//
// CONGRATULATIONS 🎉
//
// DART LANGUAGE ROADMAP COMPLETE.
// ============================================================================