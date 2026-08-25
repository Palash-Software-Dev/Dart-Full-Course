// ============================================================================
// DART MASTER ROADMAP
// PHASE 16 — OBJECT-ORIENTED PROGRAMMING (OOP) DEEP DIVE
// ============================================================================
//
// GOAL:
// Learn OOP deeply enough to build professional Flutter applications,
// REST APIs, ERP systems, repositories, services, models and clean
// architecture.
//
// Flutter is heavily based on OOP.
// Widgets, Controllers, Models, Services, Repositories and many other
// components are classes/objects.
//
// ============================================================================
// TOPICS
// ============================================================================
//
// 01. Class
// 02. Object
// 03. Instance variables
// 04. Instance methods
// 05. this
// 06. Constructors
// 07. Default constructors
// 08. Named constructors
// 09. Factory constructors
// 10. Redirecting constructors
// 11. Constant constructors
// 12. Constructor parameters
// 13. Initializer lists
// 14. Private members
// 15. Getters
// 16. Setters
// 17. Static members
// 18. Static methods
// 19. Final fields
// 20. Immutable classes
// 21. Encapsulation
// 22. Inheritance
// 23. extends
// 24. super
// 25. Method overriding
// 26. Abstract classes
// 27. abstract methods
// 28. implements
// 29. Interfaces
// 30. Polymorphism
// 31. Upcasting
// 32. Downcasting
// 33. Mixins
// 34. with
// 35. Multiple mixins
// 36. Composition
// 37. Composition vs inheritance
// 38. Dependency injection
// 39. Model classes
// 40. Service classes
// 41. Repository classes
// 42. Factory + JSON
// 43. copyWith()
// 44. Equality
// 45. toString()
// 46. Real Flutter architecture
//
// ============================================================================


// ============================================================================
// 01. CLASS
// ============================================================================
//
// A class is a blueprint/template for creating objects.
//
// Example:
//
// Product
//
// can describe:
//
//   id
//   name
//   price
//   stock
//   methods
//
// ============================================================================

class Product {
  String name = "";
  double price = 0;
  int stock = 0;

  void printInfo() {
    print(name);
    print(price);
    print(stock);
  }
}


// ============================================================================
// 02. OBJECT
// ============================================================================
//
// An object is an actual instance of a class.
//
// ============================================================================

void objectExample() {
  final product = Product();

  product.name = "Laptop";
  product.price = 100000;
  product.stock = 10;

  product.printInfo();
}


// ============================================================================
// ONE CLASS → MANY OBJECTS
// ============================================================================

void multipleObjects() {
  final product1 = Product();
  final product2 = Product();

  product1.name = "Laptop";
  product1.price = 100000;

  product2.name = "Phone";
  product2.price = 50000;

  print(product1.name);
  print(product2.name);
}


// ============================================================================
// 03. INSTANCE VARIABLES
// ============================================================================
//
// Variables belonging to an object are called instance variables.
//
// ============================================================================

class User {
  String name = "";
  String email = "";
  int age = 0;
}


// ============================================================================
// Each User object has its own values.
//
// ============================================================================


// ============================================================================
// 04. INSTANCE METHODS
// ============================================================================
//
// Methods belonging to an object are instance methods.
//
// ============================================================================

class BankAccount {
  double balance = 0;

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
    }
  }
}


// ============================================================================
// 05. this
// ============================================================================
//
// this refers to the current object.
//
// ============================================================================

class Customer {
  String name = "";

  void setName(String name) {
    this.name = name;
  }
}


// ============================================================================
// Why:
//
// name = name;
//
// would be ambiguous.
//
// this.name = name;
//
// means:
//
// current object's name = parameter name
//
// ============================================================================


// ============================================================================
// 06. CONSTRUCTORS
// ============================================================================
//
// A constructor is used when creating an object.
//
// ============================================================================

class Student {
  String name;
  int age;

  Student(
    this.name,
    this.age,
  );
}


// ============================================================================

void constructorExample() {
  final student =
      Student(
    "Palash",
    25,
  );

  print(student.name);
  print(student.age);
}


// ============================================================================
// 07. DEFAULT CONSTRUCTOR
// ============================================================================

class Employee {
  String name;
  double salary;

  Employee({
    required this.name,
    required this.salary,
  });
}


// ============================================================================

void namedArgumentConstructor() {
  final employee =
      Employee(
    name: "Palash",
    salary: 50000,
  );

  print(employee.name);
}


// ============================================================================
// 08. NAMED CONSTRUCTORS
// ============================================================================
//
// Dart allows multiple constructors using different names.
//
// ============================================================================

class UserAccount {
  String name;
  String role;

  UserAccount({
    required this.name,
    required this.role,
  });

  UserAccount.admin(
    String name,
  )   : name = name,
      role = "admin";

  UserAccount.employee(
    String name,
  )   : name = name,
      role = "employee";
}


// ============================================================================

void namedConstructorExample() {
  final admin =
      UserAccount.admin(
    "Palash",
  );

  final employee =
      UserAccount.employee(
    "Rahim",
  );

  print(admin.role);
  print(employee.role);
}


// ============================================================================
// 09. FACTORY CONSTRUCTORS
// ============================================================================
//
// factory constructors do not necessarily create a new object every time.
//
// They can:
//
//   • return an existing object
//   • return a subclass
//   • perform logic
//   • create objects from JSON
//
// This is VERY important for Flutter models.
//
// ============================================================================

class ProductModel {
  final String id;
  final String name;
  final double price;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      id: json["id"] as String,
      name: json["name"] as String,
      price:
          (json["price"] as num)
              .toDouble(),
    );
  }
}


// ============================================================================
// 10. REDIRECTING CONSTRUCTORS
// ============================================================================
//
// One constructor can redirect to another constructor.
//
// ============================================================================

class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age,
  });

  Person.guest()
      : this(
          name: "Guest",
          age: 0,
        );
}


// ============================================================================
// 11. CONST CONSTRUCTORS
// ============================================================================
//
// const constructor allows compile-time constant objects.
//
// Very important in Flutter.
//
// ============================================================================

class AppConfig {
  final String appName;
  final String version;

  const AppConfig({
    required this.appName,
    required this.version,
  });
}


// ============================================================================

void constExample() {
  const config =
      AppConfig(
    appName: "My ERP",
    version: "1.0.0",
  );

  print(config.appName);
}


// ============================================================================
// 12. CONSTRUCTOR PARAMETERS
// ============================================================================

class ProductInfo {
  final String name;
  final double price;
  final int stock;

  ProductInfo(
    this.name,
    this.price,
    this.stock,
  );
}


// ============================================================================
// Named parameters:
//
// ============================================================================

class ProductInfoNamed {
  final String name;
  final double price;
  final int stock;

  ProductInfoNamed({
    required this.name,
    required this.price,
    required this.stock,
  });
}


// ============================================================================
// 13. INITIALIZER LIST
// ============================================================================
//
// Initializer list runs before the constructor body.
//
// Useful for:
//
//   • validation
//   • calculated fields
//   • initializing final fields
//
// ============================================================================

class Price {
  final double original;
  final double discounted;

  Price(double original)
      : original = original,
        discounted =
            original * 0.9;
}


// ============================================================================
// Validation example:
//
// ============================================================================

class PositivePrice {
  final double value;

  PositivePrice(double value)
      : assert(value >= 0),
        value = value;
}


// ============================================================================
// 14. PRIVATE MEMBERS
// ============================================================================
//
// Dart privacy is library-based.
//
// A name beginning with _ is private to the library.
//
// ============================================================================

class Wallet {
  double _balance = 0;

  void deposit(
    double amount,
  ) {
    _balance += amount;
  }

  double get balance =>
      _balance;
}


// ============================================================================
// External code cannot directly access:
//
// wallet._balance
//
// Instead use public methods/getters.
//
// ============================================================================


// ============================================================================
// 15. GETTERS
// ============================================================================
//
// Getter looks like a property but executes logic.
//
// ============================================================================

class Rectangle {
  final double width;
  final double height;

  const Rectangle({
    required this.width,
    required this.height,
  });

  double get area =>
      width * height;
}


// ============================================================================

void getterExample() {
  const rectangle =
      Rectangle(
    width: 10,
    height: 5,
  );

  print(
    rectangle.area,
  );
}


// ============================================================================
// 16. SETTERS
// ============================================================================
//
// Setter controls how a value is assigned.
//
// ============================================================================

class Temperature {
  double _celsius = 0;

  double get celsius =>
      _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      throw ArgumentError(
        "Temperature cannot be below absolute zero.",
      );
    }

    _celsius = value;
  }
}


// ============================================================================
// 17. STATIC MEMBERS
// ============================================================================
//
// static belongs to the class itself,
// not to individual objects.
//
// ============================================================================

class MathUtil {
  static const double pi =
      3.141592653589793;

  static double square(
    double value,
  ) {
    return value * value;
  }
}


// ============================================================================

void staticExample() {
  print(MathUtil.pi);
  print(
    MathUtil.square(5),
  );
}


// ============================================================================
// 18. STATIC METHODS
// ============================================================================
//
// Call without creating an object.
//
// ============================================================================


// Example:
//
// MathUtil.square(5);
//
// No:
//
// final math = MathUtil();
//
// ============================================================================


// ============================================================================
// 19. FINAL FIELDS
// ============================================================================
//
// final means the value can be assigned only once.
//
// ============================================================================

class Account {
  final String id;
  final String email;

  Account({
    required this.id,
    required this.email,
  });
}


// ============================================================================
// 20. IMMUTABLE CLASSES
// ============================================================================
//
// Immutable object means its state cannot change after creation.
//
// ============================================================================

class ImmutableUser {
  final String id;
  final String name;
  final String email;

  const ImmutableUser({
    required this.id,
    required this.name,
    required this.email,
  });
}


// ============================================================================
// Flutter heavily uses immutable objects.
//
// Examples include many:
//
//   Widget configurations
//   Theme data
//   state objects
//   model objects
//
// ============================================================================
// 21. ENCAPSULATION
// ============================================================================
//
// Encapsulation means:
//
// Keep internal implementation hidden
// and expose only what other code needs.
//
// ============================================================================

class SecureAccount {
  double _balance = 0;

  double get balance =>
      _balance;

  void deposit(
    double amount,
  ) {
    if (amount <= 0) {
      throw ArgumentError(
        "Amount must be positive",
      );
    }

    _balance += amount;
  }
}


// ============================================================================
// External code cannot directly manipulate:
//
// _balance
//
// This protects business rules.
//
// ============================================================================
// 22. INHERITANCE
// ============================================================================
//
// One class can inherit behavior from another class.
//
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

void inheritanceExample() {
  final dog = Dog();

  dog.eat();
  dog.bark();
}


// ============================================================================
// 23. extends
// ============================================================================
//
// extends creates an inheritance relationship.
//
// ============================================================================


// Animal
//   ↑
//   │
//  Dog
//
// ============================================================================
// 24. super
// ============================================================================
//
// super refers to the parent class.
//
// ============================================================================

class Vehicle {
  final String brand;

  Vehicle(
    this.brand,
  );

  void start() {
    print(
      "$brand started",
    );
  }
}


class Car extends Vehicle {
  final int doors;

  Car(
    String brand,
    this.doors,
  ) : super(brand);
}


// ============================================================================

void superExample() {
  final car =
      Car("Toyota", 4);

  car.start();

  print(car.doors);
}


// ============================================================================
// Calling parent method:
//
// ============================================================================

class Parent {
  void message() {
    print("Parent");
  }
}


class Child extends Parent {
  @override
  void message() {
    super.message();

    print("Child");
  }
}


// ============================================================================
// 25. METHOD OVERRIDING
// ============================================================================
//
// Child class can provide its own implementation.
//
// ============================================================================

class Shape {
  double area() {
    return 0;
  }
}


class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14159 *
        radius *
        radius;
  }
}


// ============================================================================
// 26. ABSTRACT CLASSES
// ============================================================================
//
// abstract class cannot be directly instantiated.
//
// It is used as a blueprint.
//
// ============================================================================

abstract class PaymentMethod {
  void pay(
    double amount,
  );
}


// ============================================================================
// Cannot:
//
// final payment = PaymentMethod();
//
// ============================================================================
// 27. ABSTRACT METHODS
// ============================================================================
//
// Abstract method has no implementation in the parent.
//
// ============================================================================

class BkashPayment
    extends PaymentMethod {
  @override
  void pay(
    double amount,
  ) {
    print(
      "Paid $amount using bKash",
    );
  }
}


class CardPayment
    extends PaymentMethod {
  @override
  void pay(
    double amount,
  ) {
    print(
      "Paid $amount using card",
    );
  }
}


// ============================================================================
// 28. implements
// ============================================================================
//
// implements means:
//
// "This class promises to provide the interface."
//
// ============================================================================

abstract class Logger {
  void log(String message);
}


class ConsoleLogger
    implements Logger {
  @override
  void log(String message) {
    print(message);
  }
}


// ============================================================================
// 29. INTERFACES
// ============================================================================
//
// In Dart every class implicitly defines an interface.
//
// So a class can be used as a contract.
//
// ============================================================================

class Repository {
  Future<void> save() async {
    print("Saving");
  }
}


class ProductRepository
    implements Repository {
  @override
  Future<void> save() async {
    print(
      "Saving product",
    );
  }
}


// ============================================================================
// IMPORTANT:
//
// extends:
//
//   inherits implementation.
//
// implements:
//
//   follows contract.
//
// ============================================================================
// 30. POLYMORPHISM
// ============================================================================
//
// One parent type can refer to different child implementations.
//
// ============================================================================

void paymentExample(
  PaymentMethod payment,
) {
  payment.pay(1000);
}


// ============================================================================

void polymorphismExample() {
  PaymentMethod payment1 =
      BkashPayment();

  PaymentMethod payment2 =
      CardPayment();

  payment1.pay(500);
  payment2.pay(1000);
}


// ============================================================================
// Same method:
//
// pay()
//
// Different behavior.
//
// This is polymorphism.
//
// ============================================================================
// 31. UPCASTING
// ============================================================================
//
// Child → Parent.
//
// ============================================================================

void upcastingExample() {
  final Dog dog =
      Dog();

  final Animal animal =
      dog;

  animal.eat();
}


// ============================================================================
// 32. DOWNCASTING
// ============================================================================
//
// Parent → Child.
//
// Only safe if the actual object is that child type.
//
// ============================================================================

void downcastingExample() {
  final Animal animal =
      Dog();

  if (animal is Dog) {
    final dog =
        animal as Dog;

    dog.bark();
  }
}


// ============================================================================
// 33. MIXINS
// ============================================================================
//
// Mixins allow reusable behavior without traditional inheritance.
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


class OrderService
    with LoggerMixin {
  void createOrder() {
    log("Creating order");
  }
}


// ============================================================================
// 34. with
// ============================================================================
//
// with applies a mixin to a class.
//
// ============================================================================


// OrderService
//     +
// LoggerMixin
//
// ============================================================================
// 35. MULTIPLE MIXINS
// ============================================================================

mixin ValidationMixin {
  bool isValid(String value) {
    return value.trim().isNotEmpty;
  }
}


mixin CacheMixin {
  final Map<String, dynamic>
      cache = {};

  void saveCache(
    String key,
    dynamic value,
  ) {
    cache[key] = value;
  }
}


class UserService
    with
        LoggerMixin,
        ValidationMixin,
        CacheMixin {
  void processUser(
    String name,
  ) {
    if (!isValid(name)) {
      log("Invalid user");
      return;
    }

    saveCache(
      "user",
      name,
    );

    log(
      "User processed",
    );
  }
}


// ============================================================================
// 36. COMPOSITION
// ============================================================================
//
// Composition means:
//
// A class contains/uses other objects.
//
// "has-a" relationship.
//
// ============================================================================

class EmailService {
  void send(
    String email,
  ) {
    print(
      "Email sent to $email",
    );
  }
}


class NotificationService {
  final EmailService
      emailService;

  NotificationService({
    required this.emailService,
  });

  void notify(
    String email,
  ) {
    emailService.send(
      email,
    );
  }
}


// ============================================================================
// 37. COMPOSITION VS INHERITANCE
// ============================================================================
//
// Inheritance:
//
// Dog IS an Animal.
//
// Composition:
//
// NotificationService HAS an EmailService.
//
//
//
// In modern application architecture,
// composition is often preferred when there is no true "is-a"
// relationship.
//
// ============================================================================
// 38. DEPENDENCY INJECTION
// ============================================================================
//
// Dependency Injection means:
//
// Instead of a class creating its dependencies itself,
// dependencies are provided from outside.
//
// ============================================================================

// BAD:
//
// class UserService {
//   final ApiClient apiClient = ApiClient();
// }
//
//
//
// BETTER:
//
// ============================================================================

class ApiClient {
  Future<void> getUsers() async {
    print("Fetching users...");
  }
}


class BetterUserService {
  final ApiClient apiClient;

  BetterUserService({
    required this.apiClient,
  });

  Future<void> loadUsers() async {
    await apiClient.getUsers();
  }
}


// ============================================================================

void dependencyInjectionExample() {
  final apiClient =
      ApiClient();

  final service =
      BetterUserService(
    apiClient: apiClient,
  );

  service.loadUsers();
}


// ============================================================================
// Why DI is important:
//
// • testing
// • maintainability
// • loose coupling
// • swapping implementations
// • clean architecture
//
// ============================================================================
// 39. MODEL CLASSES
// ============================================================================
//
// A model represents structured application data.
//
// ============================================================================

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}


// ============================================================================
// 40. SERVICE CLASSES
// ============================================================================
//
// Service contains business/technical operations.
//
// ============================================================================

class UserServiceApi {
  final ApiClient apiClient;

  UserServiceApi({
    required this.apiClient,
  });

  Future<void> fetchUsers() async {
    await apiClient.getUsers();
  }
}


// ============================================================================
// 41. REPOSITORY CLASSES
// ============================================================================
//
// Repository abstracts data sources.
//
// ============================================================================

abstract class UserRepository {
  Future<List<UserModel>>
      getUsers();
}


// ============================================================================

class UserRepositoryImpl
    implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({
    required this.apiClient,
  });

  @override
  Future<List<UserModel>>
      getUsers() async {
    // Real implementation would
    // call the API here.

    return [];
  }
}


// ============================================================================
// 42. FACTORY + JSON
// ============================================================================
//
// This is one of the most important patterns for Flutter development.
//
// API:
//
// JSON
//   ↓
// Model.fromJson()
//   ↓
// Dart object
//
// Dart object
//   ↓
// Model.toJson()
//   ↓
// JSON
//
// ============================================================================

class Product {
  final String id;
  final String name;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Product.fromJson(
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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
    };
  }
}


// ============================================================================
// 43. copyWith()
// ============================================================================
//
// copyWith creates a new object while changing selected fields.
//
// Extremely important for Flutter state management.
//
// ============================================================================

class AppUser {
  final String id;
  final String name;
  final String email;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}


// ============================================================================

void copyWithExample() {
  const user =
      AppUser(
    id: "U001",
    name: "Palash",
    email: "old@example.com",
  );

  final updated =
      user.copyWith(
    email: "new@example.com",
  );

  print(user.email);
  print(updated.email);
}


// ============================================================================
// IMPORTANT:
//
// Original object is unchanged.
//
// This is useful for immutable state.
//
// ============================================================================
// 44. EQUALITY
// ============================================================================
//
// By default, two separate objects are generally different instances.
//
// ============================================================================

class SimpleUser {
  final String id;

  const SimpleUser({
    required this.id,
  });
}


// ============================================================================
// For value-based equality, override:
//
// ==
//
// and:
//
// hashCode
//
// ============================================================================

class ValueUser {
  final String id;
  final String name;

  const ValueUser({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(
    Object other,
  ) {
    return other is ValueUser &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode =>
      Object.hash(
        id,
        name,
      );
}


// ============================================================================
// 45. toString()
// ============================================================================
//
// Useful for debugging.
//
// ============================================================================

class DebugUser {
  final String id;
  final String name;

  const DebugUser({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return "DebugUser("
        "id: $id, "
        "name: $name"
        ")";
  }
}


// ============================================================================
// 46. REAL FLUTTER-STYLE ARCHITECTURE
// ============================================================================
//
// A common architecture:
//
// UI
//  ↓
// Controller / State
//  ↓
// Repository
//  ↓
// API Service
//  ↓
// Backend
//
// Models move between layers.
//
// ============================================================================


// ============================================================================
// EXAMPLE:
// ============================================================================

abstract class ProductRepositoryInterface {
  Future<List<Product>>
      getProducts();
}


class ProductApiService {
  final ApiClient client;

  ProductApiService({
    required this.client,
  });

  Future<List<Product>>
      fetchProducts() async {
    // API request would happen here.

    return [];
  }
}


class ProductRepositoryService
    implements
        ProductRepositoryInterface {
  final ProductApiService
      apiService;

  ProductRepositoryService({
    required this.apiService,
  });

  @override
  Future<List<Product>>
      getProducts() async {
    return apiService
        .fetchProducts();
  }
}


// ============================================================================
// ⭐ REAL ERP ARCHITECTURE EXAMPLE
// ============================================================================
//
// ProductScreen
//      ↓
// ProductController
//      ↓
// ProductRepository
//      ↓
// ProductApiService
//      ↓
// Node.js / Express API
//      ↓
// MongoDB
//
//
//
// ProductModel:
//
// JSON ↔ Dart object
//
// ============================================================================


// ============================================================================
// CONTROLLER
// ============================================================================

class ProductController {
  final ProductRepositoryInterface
      repository;

  ProductController({
    required this.repository,
  });

  Future<List<Product>>
      loadProducts() async {
    return repository
        .getProducts();
  }
}


// ============================================================================
// COMPLETE DEPENDENCY CHAIN
// ============================================================================

void completeArchitectureExample() {
  final apiClient =
      ApiClient();

  final apiService =
      ProductApiService(
    client: apiClient,
  );

  final repository =
      ProductRepositoryService(
    apiService: apiService,
  );

  final controller =
      ProductController(
    repository: repository,
  );

  controller.loadProducts();
}


// ============================================================================
// ⭐ OOP RELATIONSHIP CHEAT SHEET
// ============================================================================
//
// IS-A
//
// inheritance:
//
// Dog IS-A Animal
//
// extends
//
//
//
// HAS-A
//
// composition:
//
// Car HAS-A Engine
//
//
//
// CAN-DO
//
// mixin:
//
// Logger CAN log
//
//
//
// CONTRACT
//
// interface:
//
// Repository MUST implement getUsers()
//
// ============================================================================
// ⭐ EXTENDS VS IMPLEMENTS VS WITH
// ============================================================================
//
// extends
//
//     class Child extends Parent
//
//     → inheritance
//     → gets implementation
//     → one superclass
//
//
//
// implements
//
//     class Child implements Parent
//
//     → follows contract/interface
//     → must implement required members
//
//
//
// with
//
//     class Child with LoggerMixin
//
//     → reuses mixin behavior
//
// ============================================================================
// ⭐ FACTORY VS NORMAL CONSTRUCTOR
// ============================================================================
//
// Normal:
//
// Product();
//
// Creates an object directly.
//
//
//
// Factory:
//
// Product.fromJson();
//
// Can perform logic before returning an object.
//
//
//
// Factory is especially useful for:
//
//   • JSON parsing
//   • caching
//   • singleton patterns
//   • returning subclasses
//
// ============================================================================
// ⭐ CLASS DESIGN RULES
// ============================================================================
//
// 1. Keep classes focused.
//
// 2. Hide internal state.
//
// 3. Prefer final fields when possible.
//
// 4. Use immutable models for application state.
//
// 5. Use constructors to guarantee valid objects.
//
// 6. Use factory constructors for parsing/creation logic.
//
// 7. Use repositories to abstract data access.
//
// 8. Use services for external operations.
//
// 9. Use dependency injection.
//
// 10. Prefer composition when inheritance is unnecessary.
//
// ============================================================================
// ⭐ PHASE 16 MASTER CHECKLIST
// ============================================================================
//
// [ ] Class
// [ ] Object
// [ ] Instance variable
// [ ] Instance method
// [ ] this
// [ ] Constructor
// [ ] Named constructor
// [ ] Factory constructor
// [ ] Redirecting constructor
// [ ] Const constructor
// [ ] Initializer list
// [ ] Private member
// [ ] Getter
// [ ] Setter
// [ ] Static
// [ ] Final
// [ ] Immutable class
// [ ] Encapsulation
// [ ] Inheritance
// [ ] extends
// [ ] super
// [ ] override
// [ ] Abstract class
// [ ] Abstract method
// [ ] implements
// [ ] Interface
// [ ] Polymorphism
// [ ] Upcasting
// [ ] Downcasting
// [ ] Mixin
// [ ] with
// [ ] Composition
// [ ] Dependency injection
// [ ] Model
// [ ] Service
// [ ] Repository
// [ ] fromJson
// [ ] toJson
// [ ] copyWith
// [ ] Equality
// [ ] toString
//
// ============================================================================
// ⭐ MOST IMPORTANT THINGS TO MASTER FOR FLUTTER
// ============================================================================
//
// If you have limited time, master these FIRST:
//
// 1. Classes
// 2. Constructors
// 3. Named constructors
// 4. Factory constructors
// 5. final
// 6. private members
// 7. getters/setters
// 8. inheritance
// 9. abstract classes
// 10. implements
// 11. polymorphism
// 12. mixins
// 13. composition
// 14. dependency injection
// 15. model classes
// 16. fromJson()
// 17. toJson()
// 18. copyWith()
//
// ============================================================================
// END OF PHASE 16
// ============================================================================
//
// NEXT:
//
// PHASE 17 — ADVANCED FUNCTIONS, CALLBACKS & FUNCTIONAL DART
//
// Topics:
//
//   • Functions as first-class objects
//   • Function types
//   • Anonymous functions
//   • Arrow functions
//   • Higher-order functions
//   • Callbacks
//   • typedef
//   • Function parameters
//   • Optional positional parameters
//   • Named parameters
//   • Closures
//   • Lexical scope
//   • Function composition
//   • tear-offs
//   • callable classes
//   • collection callbacks
//   • map()
//   • where()
//   • reduce()
//   • fold()
//   • any()
//   • every()
//   • firstWhere()
//   • singleWhere()
//   • expand()
//   • Flutter callback patterns
//   • async callbacks
//   • production examples
//
// ============================================================================