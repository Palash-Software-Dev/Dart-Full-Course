// ============================================================================
// DART MASTER ROADMAP
// PHASE 31 — OOP MASTERY + PROFESSIONAL ARCHITECTURE
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// In Phase 31, we move from:
//
// "I know Dart OOP syntax"
//
// to:
//
// "I can design maintainable, scalable, professional Dart/Flutter systems."
//
// These concepts are extremely important for:
// • Flutter
// • Clean Architecture
// • SOLID
// • Repository Pattern
// • Dependency Injection
// • ERP/SaaS applications
// • REST API clients
// • State management
// • Large-scale applications
// • Team development
//
// ============================================================================
// TOPICS
// ----------------------------------------------------------------------------
//
// 01. OOP recap
// 02. Class design
// 03. Encapsulation
// 04. Abstraction
// 05. Inheritance
// 06. Polymorphism
// 07. Composition
// 08. Composition vs inheritance
// 09. Abstract classes
// 10. Interfaces
// 11. Mixins
// 12. Factory constructors
// 13. Named constructors
// 14. Private members
// 15. Immutable classes
// 16. Value objects
// 17. Entity objects
// 18. SOLID principles
// 19. Single Responsibility Principle
// 20. Open/Closed Principle
// 21. Liskov Substitution Principle
// 22. Interface Segregation Principle
// 23. Dependency Inversion Principle
// 24. Dependency Injection
// 25. Constructor Injection
// 26. Service Locator concept
// 27. Repository Pattern
// 28. Service Layer
// 29. Use Case / Application Layer
// 30. Data Source abstraction
// 31. Factory Pattern
// 32. Strategy Pattern
// 33. Adapter Pattern
// 34. Observer Pattern
// 35. Singleton considerations
// 36. Dependency direction
// 37. Domain models
// 38. DTO concepts
// 39. Mapping models
// 40. Clean Architecture connection
// 41. Flutter architecture example
// 42. ERP architecture example
// 43. Common architecture mistakes
// 44. Practice projects
//
// ============================================================================


// ============================================================================
// 01. OOP RECAP
// ----------------------------------------------------------------------------
//
// OOP = Object-Oriented Programming.
//
// The four major ideas:
//
// 1. Encapsulation
// 2. Abstraction
// 3. Inheritance
// 4. Polymorphism
//
// Dart also strongly benefits from:
//
// • Composition
// • Interfaces
// • Mixins
// • Generics
//
// ============================================================================


// ============================================================================
// 02. CLASS DESIGN
// ----------------------------------------------------------------------------
//
// A class should represent one meaningful concept.
//
// Bad:
//
// class EverythingService {
//   // users
//   // payments
//   // products
//   // notifications
//   // reports
// }
//
// Better:
//
// UserRepository
// PaymentService
// ProductRepository
// NotificationService
// ReportService
//
// ============================================================================

class UserProfile {
  final String name;
  final String email;

  UserProfile({
    required this.name,
    required this.email,
  });
}


// ============================================================================
// 03. ENCAPSULATION
// ----------------------------------------------------------------------------
//
// Encapsulation means:
//
// Keep internal implementation details protected and expose only what
// consumers actually need.
//
// Dart uses "_" for library-private members.
//
// ============================================================================

class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError(
        "Amount must be greater than zero.",
      );
    }

    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= 0) {
      return false;
    }

    if (amount > _balance) {
      return false;
    }

    _balance -= amount;

    return true;
  }
}


// ============================================================================
// WHY ENCAPSULATION?
// ----------------------------------------------------------------------------
//
// Without encapsulation:
//
// account.balance = -500000;
//
// With encapsulation:
//
// account.deposit(...)
// account.withdraw(...)
//
// The class controls its own rules.
//
// ============================================================================


// ============================================================================
// 04. ABSTRACTION
// ----------------------------------------------------------------------------
//
// Abstraction means exposing WHAT an object does while hiding HOW it does it.
//
// Example:
//
// PaymentGateway.pay()
//
// The caller doesn't need to know how the payment provider internally works.
//
// ============================================================================

abstract interface class PaymentGateway {
  Future<bool> pay({
    required double amount,
  });
}


// ============================================================================
// 05. IMPLEMENTATION
// ============================================================================

class BkashPaymentGateway
    implements PaymentGateway {
  @override
  Future<bool> pay({
    required double amount,
  }) async {
    print(
      "Calling bKash API...",
    );

    return true;
  }
}


// ============================================================================
// 06. INHERITANCE
// ----------------------------------------------------------------------------
//
// Inheritance means one class derives behavior/structure from another.
//
// ============================================================================

class Animal {
  void eat() {
    print(
      "Animal is eating.",
    );
  }
}

class Dog extends Animal {
  void bark() {
    print(
      "Dog is barking.",
    );
  }
}


// ============================================================================
// 07. POLYMORPHISM
// ----------------------------------------------------------------------------
//
// Polymorphism means:
//
// One abstraction can represent multiple implementations.
//
// ============================================================================

abstract interface class NotificationSender {
  void send(
    String message,
  );
}

class EmailSender
    implements NotificationSender {
  @override
  void send(
    String message,
  ) {
    print(
      "Email: $message",
    );
  }
}

class SmsSender
    implements NotificationSender {
  @override
  void send(
    String message,
  ) {
    print(
      "SMS: $message",
    );
  }
}


// ============================================================================
// POLYMORPHISM IN ACTION
// ============================================================================

void sendNotification(
  NotificationSender sender,
) {
  sender.send(
    "Order created.",
  );
}


// ============================================================================
// USAGE:
//
// sendNotification(EmailSender());
// sendNotification(SmsSender());
//
// The function doesn't care which implementation it receives.
//
// ============================================================================


// ============================================================================
// 08. COMPOSITION
// ----------------------------------------------------------------------------
//
// Composition means building a class using other objects.
//
// "Has-a" relationship.
//
// Example:
//
// OrderService HAS-A PaymentGateway.
//
// ============================================================================

class OrderService {
  final PaymentGateway paymentGateway;

  OrderService({
    required this.paymentGateway,
  });

  Future<bool> placeOrder(
    double amount,
  ) async {
    return paymentGateway.pay(
      amount: amount,
    );
  }
}


// ============================================================================
// 09. COMPOSITION VS INHERITANCE
// ----------------------------------------------------------------------------
//
// Inheritance:
//
// Dog IS-A Animal.
//
// Composition:
//
// OrderService HAS-A PaymentGateway.
//
// In large applications, composition is often more flexible.
//
// ============================================================================


// ============================================================================
// 10. ABSTRACT CLASS
// ----------------------------------------------------------------------------
//
// Abstract classes cannot normally be instantiated directly.
//
// They can contain:
//
// • abstract methods
// • implemented methods
// • fields
//
// ============================================================================

abstract class Employee {
  final String name;

  Employee(
    this.name,
  );

  void work();

  void introduce() {
    print(
      "Employee: $name",
    );
  }
}


// ============================================================================
// 11. ABSTRACT CLASS IMPLEMENTATION
// ============================================================================

class Developer extends Employee {
  Developer(
    super.name,
  );

  @override
  void work() {
    print(
      "$name is coding.",
    );
  }
}


// ============================================================================
// 12. INTERFACE
// ----------------------------------------------------------------------------
//
// In Dart, every class can act as an interface.
//
// For architecture, explicit:
//
// abstract interface class
//
// is often clearer.
//
// ============================================================================

abstract interface class UserRepository {
  Future<User?> findById(
    String id,
  );

  Future<List<User>> getAll();
}


// ============================================================================
// 13. MODEL
// ============================================================================

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// 14. MIXIN
// ----------------------------------------------------------------------------
//
// Mixins allow behavior to be reused without normal inheritance.
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
// 15. USING MIXIN
// ============================================================================

class UserService
    with LoggerMixin {
  void createUser() {
    log(
      "Creating user.",
    );
  }
}


// ============================================================================
// 16. PRIVATE MEMBERS
// ----------------------------------------------------------------------------
//
// A name beginning with "_" is private to the Dart library.
//
// ============================================================================

class ProductService {
  final String _apiKey;

  ProductService(
    this._apiKey,
  );

  String get apiKey =>
      _apiKey;
}


// ============================================================================
// 17. FACTORY CONSTRUCTORS
// ----------------------------------------------------------------------------
//
// Factory constructors don't necessarily create a new instance every time.
//
// They can:
//
// • return cached objects
// • return subclasses
// • validate data
// • choose implementations
//
// ============================================================================

class AppConfig {
  final String environment;

  AppConfig._(
    this.environment,
  );

  factory AppConfig.fromEnvironment(
    String value,
  ) {
    return AppConfig._(
      value.trim(),
    );
  }
}


// ============================================================================
// 18. FACTORY FOR DIFFERENT IMPLEMENTATIONS
// ============================================================================

abstract class Storage {
  void save(
    String key,
    String value,
  );

  factory Storage.memory() {
    return MemoryStorage();
  }
}

class MemoryStorage
    implements Storage {
  final Map<String, String> _data = {};

  @override
  void save(
    String key,
    String value,
  ) {
    _data[key] = value;
  }
}


// ============================================================================
// 19. NAMED CONSTRUCTORS
// ============================================================================
//
// Named constructors improve readability.
//
// ============================================================================

class UserAccount {
  final String name;

  UserAccount(
    this.name,
  );

  UserAccount.guest()
      : name = "Guest";

  UserAccount.admin()
      : name = "Administrator";
}


// ============================================================================
// 20. IMMUTABLE OBJECTS
// ----------------------------------------------------------------------------
//
// An immutable object cannot change after creation.
//
// ============================================================================

class ImmutableUser {
  final String name;
  final String email;

  const ImmutableUser({
    required this.name,
    required this.email,
  });
}


// ============================================================================
// WHY IMMUTABILITY?
// ----------------------------------------------------------------------------
//
// Immutability makes state easier to reason about.
//
// Especially useful in:
//
// • Flutter widgets
// • State management
// • Redux-like architecture
// • Caching
// • Concurrent/asynchronous code
// • Domain models
//
// ============================================================================


// ============================================================================
// 21. VALUE OBJECTS
// ----------------------------------------------------------------------------
//
// A value object represents a value with business meaning.
//
// Example:
//
// Instead of:
//
// String email;
//
// Create:
//
// Email
//
// ============================================================================

class Email {
  final String value;

  Email(
    String value,
  ) : value = value.trim().toLowerCase() {
    if (!value.contains("@")) {
      throw ArgumentError(
        "Invalid email.",
      );
    }
  }
}


// ============================================================================
// 22. PRODUCT ID VALUE OBJECT
// ============================================================================

class ProductId {
  final String value;

  const ProductId(
    this.value,
  );
}


// ============================================================================
// 23. ENTITY VS VALUE OBJECT
// ----------------------------------------------------------------------------
//
// Entity:
//
// Has identity.
//
// Example:
//
// User(id: "U001")
//
// Value object:
//
// Defined primarily by its value.
//
// Example:
//
// Email("test@example.com")
//
// ============================================================================


// ============================================================================
// 24. SOLID
// ----------------------------------------------------------------------------
//
// SOLID:
//
// S = Single Responsibility Principle
// O = Open/Closed Principle
// L = Liskov Substitution Principle
// I = Interface Segregation Principle
// D = Dependency Inversion Principle
//
// These principles help you design maintainable applications.
//
// ============================================================================


// ============================================================================
// 25. SINGLE RESPONSIBILITY PRINCIPLE
// ----------------------------------------------------------------------------
//
// A class should have one primary responsibility.
//
// Bad:
//
// class UserService {
//   createUser();
//   sendEmail();
//   generatePdf();
//   saveToDatabase();
//   uploadImage();
// }
//
// Better:
//
// UserService
// EmailService
// PdfService
// UserRepository
// ImageStorage
//
// ============================================================================


// ============================================================================
// 26. GOOD SRP EXAMPLE
// ============================================================================

class UserValidator {
  bool isValid(
    User user,
  ) {
    return user.name.trim().isNotEmpty;
  }
}

class UserRepositoryImpl
    implements UserRepository {
  @override
  Future<User?> findById(
    String id,
  ) async {
    return null;
  }

  @override
  Future<List<User>> getAll() async {
    return [];
  }
}


// ============================================================================
// 27. OPEN/CLOSED PRINCIPLE
// ----------------------------------------------------------------------------
//
// Software entities should be:
//
// OPEN for extension
// CLOSED for modification
//
// Example:
//
// PaymentGateway interface.
//
// New payment providers can be added without rewriting OrderService.
//
// ============================================================================


// ============================================================================
// 28. GOOD OCP EXAMPLE
// ============================================================================

class StripePaymentGateway
    implements PaymentGateway {
  @override
  Future<bool> pay({
    required double amount,
  }) async {
    print(
      "Stripe payment: $amount",
    );

    return true;
  }
}


// ============================================================================
// OrderService doesn't change.
//
// You can inject:
//
// BkashPaymentGateway
// StripePaymentGateway
//
// ============================================================================


// ============================================================================
// 29. LISKOV SUBSTITUTION PRINCIPLE
// ----------------------------------------------------------------------------
//
// A subtype should be usable wherever its parent abstraction is expected.
//
// Example:
//
// PaymentGateway gateway = BkashPaymentGateway();
//
// This should behave according to the PaymentGateway contract.
//
// ============================================================================


// ============================================================================
// BAD LSP EXAMPLE
// ----------------------------------------------------------------------------
//
// If an implementation throws:
//
// "This operation is not supported"
//
// for a required interface method, the abstraction may be poorly designed.
//
// ============================================================================


// ============================================================================
// 30. INTERFACE SEGREGATION PRINCIPLE
// ----------------------------------------------------------------------------
//
// Don't force classes to implement methods they don't need.
//
// Bad:
//
// abstract interface class Machine {
//   void print();
//   void scan();
//   void fax();
// }
//
// A simple printer may not support scan/fax.
//
// Better:
//
// abstract interface class Printer {
//   void print();
// }
//
// abstract interface class Scanner {
//   void scan();
// }
//
// abstract interface class Fax {
//   void fax();
// }
//
// ============================================================================


// ============================================================================
// 31. DEPENDENCY INVERSION PRINCIPLE
// ----------------------------------------------------------------------------
//
// High-level code should depend on abstractions,
// not concrete implementations.
//
// Bad:
//
// class OrderService {
//   final BkashPaymentGateway gateway =
//       BkashPaymentGateway();
// }
//
// Good:
//
// class OrderService {
//   final PaymentGateway gateway;
//
//   OrderService({
//     required this.gateway,
//   });
// }
//
// ============================================================================


// ============================================================================
// 32. DEPENDENCY INJECTION
// ----------------------------------------------------------------------------
//
// Dependency Injection = providing dependencies from outside.
//
// ============================================================================

class ProductServiceDI {
  final UserRepository repository;

  ProductServiceDI({
    required this.repository,
  });
}


// ============================================================================
// 33. CONSTRUCTOR INJECTION
// ----------------------------------------------------------------------------
//
// Constructor injection is usually the cleanest form.
//
// ============================================================================

class UserUseCase {
  final UserRepository repository;

  UserUseCase({
    required this.repository,
  });

  Future<User?> execute(
    String id,
  ) {
    return repository.findById(
      id,
    );
  }
}


// ============================================================================
// 34. WHY DEPENDENCY INJECTION?
// ----------------------------------------------------------------------------
//
// Without DI:
//
// class UserUseCase {
//   final ApiUserRepository repository =
//       ApiUserRepository();
// }
//
// Hard to test.
//
// With DI:
//
// UserUseCase(
//   repository: FakeUserRepository(),
// )
//
// Much easier to test.
//
// ============================================================================


// ============================================================================
// 35. SERVICE LOCATOR
// ----------------------------------------------------------------------------
//
// A Service Locator stores dependencies centrally.
//
// Concept:
//
// ServiceLocator.get<UserRepository>()
//
// This can be useful in some systems, but excessive global access can make
// dependencies harder to see and test.
//
// Prefer explicit dependency injection when practical.
//
// ============================================================================


// ============================================================================
// 36. REPOSITORY PATTERN
// ----------------------------------------------------------------------------
//
// Repository hides data-source details.
//
// UI/use-case layer:
//
// UserRepository
//
// Data layer:
//
// ApiUserRepository
// LocalUserRepository
//
// ============================================================================

abstract interface class ProductRepository {
  Future<Product?> getProduct(
    String id,
  );

  Future<List<Product>> getProducts();
}


// ============================================================================
// 37. REMOTE DATA SOURCE
// ============================================================================

class ProductRemoteDataSource {
  Future<Product?> getProduct(
    String id,
  ) async {
    // HTTP request would happen here.
    return null;
  }
}


// ============================================================================
// 38. REPOSITORY IMPLEMENTATION
// ============================================================================

class ProductRepositoryImpl
    implements ProductRepository {
  final ProductRemoteDataSource remote;

  ProductRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Product?> getProduct(
    String id,
  ) {
    return remote.getProduct(
      id,
    );
  }

  @override
  Future<List<Product>> getProducts() async {
    return [];
  }
}


// ============================================================================
// 39. SERVICE LAYER
// ----------------------------------------------------------------------------
//
// A service coordinates application operations.
//
// ============================================================================

class OrderServiceLayer {
  final PaymentGateway paymentGateway;

  OrderServiceLayer({
    required this.paymentGateway,
  });

  Future<bool> checkout(
    double amount,
  ) async {
    return paymentGateway.pay(
      amount: amount,
    );
  }
}


// ============================================================================
// 40. USE CASE
// ----------------------------------------------------------------------------
//
// A use case represents one business action.
//
// Examples:
//
// LoginUser
// CreateOrder
// UpdateProduct
// DeleteCustomer
// TransferStock
// ApprovePurchaseOrder
//
// ============================================================================

class CreateProductUseCase {
  final ProductRepository repository;

  CreateProductUseCase({
    required this.repository,
  });

  Future<Product> execute(
    Product product,
  ) async {
    // Business rules would be applied here.

    return product;
  }
}


// ============================================================================
// 41. DATA SOURCE ABSTRACTION
// ----------------------------------------------------------------------------
//
// A repository can hide whether data comes from:
//
// • REST API
// • GraphQL
// • SQLite
// • Hive
// • SharedPreferences
// • Cache
//
// ============================================================================


// ============================================================================
// 42. FACTORY PATTERN
// ----------------------------------------------------------------------------
//
// Factory pattern centralizes object creation.
//
// ============================================================================

abstract interface class ReportGenerator {
  String generate();
}

class SalesReport
    implements ReportGenerator {
  @override
  String generate() {
    return "Sales Report";
  }
}

class InventoryReport
    implements ReportGenerator {
  @override
  String generate() {
    return "Inventory Report";
  }
}


class ReportFactory {
  static ReportGenerator create(
    String type,
  ) {
    return switch (type) {
      "sales" => SalesReport(),
      "inventory" => InventoryReport(),
      _ => throw ArgumentError(
          "Unknown report type.",
        ),
    };
  }
}


// ============================================================================
// 43. STRATEGY PATTERN
// ----------------------------------------------------------------------------
//
// Strategy allows behavior to be changed without changing the main class.
//
// Example:
//
// Different discount algorithms.
//
// ============================================================================

abstract interface class DiscountStrategy {
  double calculate(
    double price,
  );
}

class NoDiscount
    implements DiscountStrategy {
  @override
  double calculate(
    double price,
  ) {
    return price;
  }
}

class TenPercentDiscount
    implements DiscountStrategy {
  @override
  double calculate(
    double price,
  ) {
    return price * 0.90;
  }
}


// ============================================================================
// 44. USING STRATEGY
// ============================================================================

class PricingService {
  final DiscountStrategy strategy;

  PricingService({
    required this.strategy,
  });

  double finalPrice(
    double price,
  ) {
    return strategy.calculate(
      price,
    );
  }
}


// ============================================================================
// 45. ADAPTER PATTERN
// ----------------------------------------------------------------------------
//
// Adapter makes an incompatible API fit your application's interface.
//
// ============================================================================

class OldPaymentSdk {
  bool makePayment(
    double amount,
  ) {
    print(
      "Old SDK payment: $amount",
    );

    return true;
  }
}


class OldPaymentAdapter
    implements PaymentGateway {
  final OldPaymentSdk sdk;

  OldPaymentAdapter(
    this.sdk,
  );

  @override
  Future<bool> pay({
    required double amount,
  }) async {
    return sdk.makePayment(
      amount,
    );
  }
}


// ============================================================================
// 46. OBSERVER PATTERN
// ----------------------------------------------------------------------------
//
// One object notifies multiple listeners when something changes.
//
// Dart's Stream system is heavily useful for this kind of architecture.
//
// ============================================================================

class EventBus {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get events =>
      _controller.stream;

  void emit(
    String event,
  ) {
    _controller.add(
      event,
    );
  }

  Future<void> dispose() {
    return _controller.close();
  }
}


// ============================================================================
// IMPORTANT:
// ----------------------------------------------------------------------------
//
// The above example requires:
//
// import 'dart:async';
//
// Add this import at the top when using EventBus.
//
// ============================================================================


// ============================================================================
// 47. SINGLETON
// ----------------------------------------------------------------------------
//
// Singleton means only one shared instance.
//
// ============================================================================

class AppLogger {
  AppLogger._();

  static final AppLogger instance =
      AppLogger._();

  void log(
    String message,
  ) {
    print(message);
  }
}


// ============================================================================
// SINGLETON WARNING
// ----------------------------------------------------------------------------
//
// Don't turn every service into a singleton.
//
// Excessive singletons create:
//
// • Hidden dependencies
// • Global state
// • Testing problems
// • Tight coupling
//
// Use them intentionally.
//
// ============================================================================


// ============================================================================
// 48. DEPENDENCY DIRECTION
// ----------------------------------------------------------------------------
//
// Good architecture:
//
// Presentation
//      ↓
// Domain
//      ↓
// Data
//
// But domain should not depend on Flutter UI or HTTP implementation details.
//
// ============================================================================


// ============================================================================
// 49. DOMAIN MODEL
// ----------------------------------------------------------------------------
//
// Domain model represents business concepts.
//
// Example:
//
// Product
// Order
// Customer
// Warehouse
// Invoice
// Payment
//
// ============================================================================


// ============================================================================
// 50. DTO
// ----------------------------------------------------------------------------
//
// DTO = Data Transfer Object.
//
// It represents the structure used for communication with external systems.
//
// Example:
//
// ProductDto
//
// It may match API JSON structure exactly.
//
// ============================================================================

class ProductDto {
  final String id;
  final String productName;

  ProductDto({
    required this.id,
    required this.productName,
  });

  factory ProductDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductDto(
      id: json["id"] as String,
      productName:
          json["productName"] as String,
    );
  }
}


// ============================================================================
// 51. DOMAIN MODEL
// ============================================================================

class ProductDomain {
  final ProductId id;
  final String name;

  ProductDomain({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// 52. MAPPING DTO → DOMAIN
// ============================================================================

extension ProductDtoMapper
    on ProductDto {
  ProductDomain toDomain() {
    return ProductDomain(
      id: ProductId(id),
      name: productName,
    );
  }
}


// ============================================================================
// WHY SEPARATE DTO AND DOMAIN?
// ----------------------------------------------------------------------------
//
// API may change:
//
// "productName"
//
// becomes:
//
// "name"
//
// Your domain/business logic doesn't have to depend directly on the API.
//
// ============================================================================


// ============================================================================
// 53. CLEAN ARCHITECTURE
// ----------------------------------------------------------------------------
//
// A common Flutter structure:
//
// lib/
//
// ├── core/
// │   ├── error/
// │   ├── network/
// │   ├── constants/
// │   └── utils/
//
// ├── features/
// │   └── product/
// │       ├── data/
// │       ├── domain/
// │       └── presentation/
//
// ============================================================================


// ============================================================================
// 54. DATA LAYER
// ----------------------------------------------------------------------------
//
// Data layer:
//
// • API
// • Database
// • DTO
// • Data source
// • Repository implementation
//
// ============================================================================


// ============================================================================
// 55. DOMAIN LAYER
// ----------------------------------------------------------------------------
//
// Domain layer:
//
// • Entity
// • Repository contract
// • Use case
// • Business rules
//
// ============================================================================


// ============================================================================
// 56. PRESENTATION LAYER
// ----------------------------------------------------------------------------
//
// Presentation:
//
// • Flutter widgets
// • Pages
// • Controllers
// • State
// • View models
//
// ============================================================================


// ============================================================================
// 57. COMPLETE FLOW
// ----------------------------------------------------------------------------
//
// UI
// ↓
// Controller / Cubit / Notifier
// ↓
// UseCase
// ↓
// Repository Interface
// ↓
// Repository Implementation
// ↓
// DataSource
// ↓
// API
//
// Response:
//
// API
// ↓
// DTO
// ↓
// Repository
// ↓
// Domain Entity
// ↓
// UseCase
// ↓
// State
// ↓
// UI
//
// ============================================================================


// ============================================================================
// 58. ERP EXAMPLE
// ----------------------------------------------------------------------------
//
// User taps:
//
// "Create Purchase Order"
//
// Flow:
//
// PurchaseOrderPage
//       ↓
// PurchaseOrderController
//       ↓
// CreatePurchaseOrderUseCase
//       ↓
// PurchaseOrderRepository
//       ↓
// PurchaseOrderRepositoryImpl
//       ↓
// PurchaseOrderRemoteDataSource
//       ↓
// Node.js API
//       ↓
// MongoDB
//
// ============================================================================


// ============================================================================
// 59. WHY THIS MATTERS FOR YOUR ERP
// ----------------------------------------------------------------------------
//
// Your ERP contains:
//
// Users
// Companies
// Branches
// Warehouses
// Products
// Variants
// Suppliers
// Vendors
// Purchase Orders
// GRN
// Inventory
// Orders
// Payments
// Repairs
// Warranty
// Reports
//
// If every screen directly calls the API:
//
// The project becomes difficult to maintain.
//
// Architecture prevents that complexity from spreading.
//
// ============================================================================


// ============================================================================
// 60. BAD FLUTTER ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Widget:
//
// onPressed: () async {
//
//   final response = await http.post(...);
//
//   if (...) {
//
//     // validation
//
//   }
//
//   // database logic
//
//   // business logic
//
//   // UI logic
// }
//
// Problems:
//
// • UI knows API
// • UI knows business rules
// • Difficult testing
// • Difficult reuse
// • Difficult maintenance
//
// ============================================================================


// ============================================================================
// 61. BETTER ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Widget:
//
// onPressed: () {
//
//   controller.createOrder();
//
// }
//
// Controller:
//
// calls UseCase.
//
// UseCase:
//
// applies business rules.
//
// Repository:
//
// manages data.
//
// DataSource:
//
// communicates with API.
//
// ============================================================================


// ============================================================================
// 62. SOLID + FLUTTER
// ----------------------------------------------------------------------------
//
// SOLID is NOT about creating hundreds of classes.
//
// The goal is:
//
// LOW COUPLING
// HIGH COHESION
//
// ============================================================================


// ============================================================================
// 63. HIGH COHESION
// ----------------------------------------------------------------------------
//
// Related responsibilities stay together.
//
// ProductRepository:
//
// product-related data operations.
//
// ============================================================================


// ============================================================================
// 64. LOW COUPLING
// ----------------------------------------------------------------------------
//
// Components should depend on abstractions rather than implementation details.
//
// ============================================================================


// ============================================================================
// 65. PRACTICE PROJECT 1
// ----------------------------------------------------------------------------
//
// Build:
//
// Payment System
//
// Interface:
//
// PaymentGateway
//
// Implement:
//
// BkashGateway
// NagadGateway
// StripeGateway
//
// Service:
//
// CheckoutService
//
// Inject gateway using constructor.
//
// ============================================================================


// ============================================================================
// 66. PRACTICE PROJECT 2
// ----------------------------------------------------------------------------
//
// Build:
//
// Inventory System
//
// Classes:
//
// Product
// Warehouse
// StockItem
// InventoryRepository
// InventoryService
//
// Add:
//
// validation
// repository abstraction
// dependency injection
//
// ============================================================================


// ============================================================================
// 67. PRACTICE PROJECT 3
// ----------------------------------------------------------------------------
//
// Build:
//
// Authentication Architecture
//
// Interface:
//
// AuthRepository
//
// Implement:
//
// ApiAuthRepository
//
// Use cases:
//
// LoginUser
// LogoutUser
// RegisterUser
// RefreshToken
//
// States:
//
// AuthInitial
// AuthLoading
// Authenticated
// Unauthenticated
// AuthError
//
// ============================================================================


// ============================================================================
// 68. PRACTICE PROJECT 4
// ----------------------------------------------------------------------------
//
// Build:
//
// ERP Order Module
//
// Domain:
//
// Order
// OrderItem
// Customer
//
// Repository:
//
// OrderRepository
//
// Use cases:
//
// CreateOrder
// CancelOrder
// ApproveOrder
// ShipOrder
// DeliverOrder
//
// State:
//
// OrderInitial
// OrderLoading
// OrderLoaded
// OrderError
//
// ============================================================================


// ============================================================================
// 69. COMMON MISTAKE #1
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Create interfaces for every tiny class without a reason.
//
// Architecture should solve real problems.
//
// ============================================================================


// ============================================================================
// 70. COMMON MISTAKE #2
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Use inheritance everywhere.
//
// Prefer composition when behavior needs to be combined flexibly.
//
// ============================================================================


// ============================================================================
// 71. COMMON MISTAKE #3
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Make everything singleton.
//
// Global state is not automatically good architecture.
//
// ============================================================================


// ============================================================================
// 72. COMMON MISTAKE #4
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Put business logic inside widgets.
//
// Keep widgets focused on presentation.
//
// ============================================================================


// ============================================================================
// 73. COMMON MISTAKE #5
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Let domain code depend directly on:
//
// Flutter
// Dio
// http
// SharedPreferences
// MongoDB
// Firebase
//
// Domain should remain independent whenever practical.
//
// ============================================================================


// ============================================================================
// 74. COMMON MISTAKE #6
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Create huge "God classes".
//
// Example:
//
// AppManager
//
// containing:
//
// auth
// users
// orders
// products
// payments
// reports
// notifications
//
// Split responsibilities.
//
// ============================================================================


// ============================================================================
// 75. COMMON MISTAKE #7
// ----------------------------------------------------------------------------
//
// DON'T:
//
// Over-engineer small features.
//
// Architecture should be proportional to project complexity.
//
// ============================================================================


// ============================================================================
// 76. ARCHITECTURE GOLDEN RULE
// ----------------------------------------------------------------------------
//
// UI should answer:
//
// "How should this look?"
//
// Domain should answer:
//
// "What should the business do?"
//
// Data layer should answer:
//
// "Where/how do we get the data?"
//
// ============================================================================


// ============================================================================
// 77. MINI PROFESSIONAL EXAMPLE
// ============================================================================

abstract interface class OrderRepository {
  Future<bool> createOrder(
    Order order,
  );
}


class Order {
  final String id;
  final double total;

  Order({
    required this.id,
    required this.total,
  });
}


class CreateOrderUseCase {
  final OrderRepository repository;

  CreateOrderUseCase({
    required this.repository,
  });

  Future<bool> execute(
    Order order,
  ) async {
    if (order.total <= 0) {
      return false;
    }

    return repository.createOrder(
      order,
    );
  }
}


// ============================================================================
// 78. WHY THIS IS PROFESSIONAL
// ----------------------------------------------------------------------------
//
// CreateOrderUseCase does NOT know:
//
// • HTTP
// • Dio
// • JSON
// • MongoDB
// • Flutter
//
// It only knows:
//
// OrderRepository
//
// This is Dependency Inversion.
//
// ============================================================================


// ============================================================================
// 79. TESTABILITY
// ----------------------------------------------------------------------------
//
// Because repository is an abstraction:
//
// class FakeOrderRepository
//     implements OrderRepository {
//
//   @override
//   Future<bool> createOrder(
//     Order order,
//   ) async {
//     return true;
//   }
// }
//
// Then:
//
// final useCase =
//     CreateOrderUseCase(
//       repository:
//           FakeOrderRepository(),
//     );
//
// You can test business logic without a real API.
//
// ============================================================================


// ============================================================================
// 80. PHASE 31 FINAL CHECKLIST
// ----------------------------------------------------------------------------
//
// You should now understand:
//
// [ ] Class design
// [ ] Encapsulation
// [ ] Abstraction
// [ ] Inheritance
// [ ] Polymorphism
// [ ] Composition
// [ ] Abstract classes
// [ ] Interfaces
// [ ] Mixins
// [ ] Factory constructors
// [ ] Named constructors
// [ ] Immutable classes
// [ ] Value objects
// [ ] Entities
// [ ] SOLID
// [ ] Dependency Injection
// [ ] Repository Pattern
// [ ] Service Layer
// [ ] Use Cases
// [ ] Data Sources
// [ ] DTOs
// [ ] Mapping
// [ ] Factory Pattern
// [ ] Strategy Pattern
// [ ] Adapter Pattern
// [ ] Observer concept
// [ ] Singleton trade-offs
// [ ] Clean Architecture
// [ ] Flutter architecture
// [ ] ERP architecture
//
// ============================================================================
// INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is encapsulation?
//
// 02. What is abstraction?
//
// 03. Inheritance vs composition?
//
// 04. What is polymorphism?
//
// 05. Why is composition often preferred over inheritance?
//
// 06. What is dependency injection?
//
// 07. Constructor injection vs service locator?
//
// 08. What is the repository pattern?
//
// 09. Why should UI not directly call APIs?
//
// 10. What is SOLID?
//
// 11. Explain SRP.
//
// 12. Explain OCP.
//
// 13. Explain LSP.
//
// 14. Explain ISP.
//
// 15. Explain DIP.
//
// 16. What is a DTO?
//
// 17. DTO vs domain entity?
//
// 18. What is a value object?
//
// 19. What is dependency inversion?
//
// 20. What is a factory pattern?
//
// 21. What is a strategy pattern?
//
// 22. What is an adapter?
//
// 23. Why can excessive singletons be harmful?
//
// 24. What belongs in the domain layer?
//
// 25. What belongs in the data layer?
//
// 26. What belongs in the presentation layer?
//
// 27. How would you architect an ERP order module?
//
// 28. How would you make a Flutter feature testable?
//
// ============================================================================
// FINAL MENTAL MODEL
// ----------------------------------------------------------------------------
//
//                         FLUTTER UI
//                             │
//                             ▼
//                      PRESENTATION
//                             │
//                             ▼
//                         USE CASE
//                             │
//                             ▼
//                  REPOSITORY INTERFACE
//                             │
//                             ▼
//                  REPOSITORY IMPLEMENTATION
//                             │
//                             ▼
//                       DATA SOURCE
//                             │
//                             ▼
//                            API
//
// The important principle:
//
// UI depends on business abstractions.
// Business logic depends on contracts.
// Data implementations depend on external systems.
//
// ============================================================================
// PHASE 31 COMPLETE
// ============================================================================
//
// NEXT PHASE:
// ----------------------------------------------------------------------------
// PHASE 32 — DART ASYNC PROGRAMMING MASTERY
//
// Topics will include:
//
// • Future
// • async
// • await
// • Future chaining
// • Future.wait
// • Future.any
// • Error propagation
// • try/catch/finally
// • Zones
// • Stream
// • StreamController
// • Single-subscription streams
// • Broadcast streams
// • Stream transformations
// • StreamSubscription
// • Cancellation
// • async*
/* • yield */
// • yield*
// • Isolates
// • compute-style workloads
// • Event loop
// • Microtask queue
// • Event queue
// • Concurrency vs parallelism
// • Async API architecture
// • Flutter async patterns
// • Production error handling
//
// ============================================================================
// END OF PHASE 31
// ============================================================================