// ============================================================================
// DART MASTER ROADMAP
// PHASE 9 — OBJECT-ORIENTED PROGRAMMING (OOP) DEEP DIVE
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// Master Dart OOP deeply enough to build professional Flutter applications,
// REST API clients, ERP/SaaS systems, reusable architecture, repositories,
// services, controllers, models, dependency injection, and scalable code.
//
// OOP is one of the MOST IMPORTANT parts of Dart for a professional
// Full-Stack Flutter Developer.
//
// You will use these concepts constantly in Flutter:
//
//   • Models
//   • API response classes
//   • Repository classes
//   • Services
//   • Controllers
//   • State management
//   • Dependency injection
//   • Authentication
//   • Database abstractions
//   • Payment systems
//   • ERP modules
//   • Design patterns
//
// ============================================================================
//
// PHASE 9 TOPICS
// ============================================================================
//
// BASIC OOP
//
// 01. Class
// 02. Object
// 03. Instance
// 04. Instance variables
// 05. Instance methods
// 06. this
// 07. Constructors
// 08. Default constructor
// 09. Named constructor
// 10. Parameterized constructor
// 11. Initializer list
//
// ENCAPSULATION
//
// 12. Private members
// 13. Public members
// 14. Getter
// 15. Setter
// 16. Computed properties
// 17. Validation inside setters
//
// INHERITANCE
//
// 18. extends
// 19. super
// 20. Parent class
// 21. Child class
// 22. Method overriding
// 23. @override
// 24. Constructor inheritance
//
// ABSTRACTION
//
// 25. abstract class
// 26. Abstract methods
// 27. Concrete methods
// 28. implements
// 29. Interface concept
//
// POLYMORPHISM
//
// 30. Upcasting
// 31. Runtime polymorphism
// 32. Method overriding
// 33. Interface polymorphism
//
// MIXINS
//
// 34. mixin
// 35. with
// 36. Multiple mixins
// 37. on constraint
//
// FACTORY
//
// 38. Factory constructor
// 39. Factory + JSON
// 40. Singleton concept
//
// ADVANCED OOP
//
// 41. static members
// 42. static methods
// 43. const constructors
// 44. final objects
// 45. covariant
// 46. operator overloading
// 47. call()
// 48. Equality
// 49. hashCode
//
// COMPOSITION
//
// 50. Composition
// 51. Aggregation
// 52. Inheritance vs composition
// 53. Dependency injection
//
// REAL FLUTTER ARCHITECTURE
//
// 54. Model
// 55. Repository
// 56. Service
// 57. Controller
// 58. API abstraction
// 59. Dependency injection
// 60. SOLID introduction
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
//   Product class
//
// describes what a Product should contain.
//
// ============================================================================

class Product {
  String name;
  double price;

  Product(
    this.name,
    this.price,
  );
}


// ============================================================================
// 02. OBJECT
// ============================================================================
//
// An object is an actual instance created from a class.
//
// ============================================================================

void objectExample() {
  final product = Product(
    "iPhone",
    120000,
  );

  print(product.name);
  print(product.price);
}


// ============================================================================
// 03. INSTANCE
// ============================================================================
//
// product above is an instance of Product.
//
// Multiple instances can be created from the same class.
//
// ============================================================================

void multipleObjectsExample() {
  final product1 = Product(
    "Phone",
    100000,
  );

  final product2 = Product(
    "Laptop",
    150000,
  );

  print(product1.name);
  print(product2.name);
}


// ============================================================================
// 04. INSTANCE VARIABLES
// ============================================================================
//
// Variables that belong to an object.
//
// ============================================================================

class User {
  String name;
  String email;
  int age;

  User(
    this.name,
    this.email,
    this.age,
  );
}


// ============================================================================
// 05. INSTANCE METHODS
// ============================================================================
//
// Methods that belong to an object.
//
// ============================================================================

class BankAccount {
  double balance;

  BankAccount(
    this.balance,
  );

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    balance -= amount;
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void instanceMethodExample() {
  final account = BankAccount(1000);

  account.deposit(500);
  account.withdraw(200);

  print(account.balance);
}


// ============================================================================
// 06. THIS
// ============================================================================
//
// this refers to the current object.
//
// ============================================================================

class Customer {
  String name;
  String phone;

  Customer(
    this.name,
    this.phone,
  );
}


// ============================================================================
// Equivalent long form:
//
// ============================================================================

class CustomerLongForm {
  String name;
  String phone;

  CustomerLongForm(
    String name,
    String phone,
  )   : this.name = name,
        this.phone = phone;
}


// ============================================================================
// IMPORTANT:
//
// "this.name"
//
// means:
//
// "the name belonging to this object."
//
// ============================================================================


// ============================================================================
// 07. CONSTRUCTOR
// ============================================================================
//
// A constructor initializes an object.
//
// ============================================================================

class Employee {
  String name;

  Employee(this.name);
}


// ============================================================================
// 08. DEFAULT CONSTRUCTOR
// ============================================================================
//
// The normal constructor.
//
// ============================================================================

class Company {
  String name;

  Company(this.name);
}


// ============================================================================
// 09. NAMED CONSTRUCTOR
// ============================================================================
//
// Dart supports named constructors.
//
// Useful when a class can be created in multiple meaningful ways.
//
// ============================================================================

class UserProfile {
  String name;
  int age;

  UserProfile(
    this.name,
    this.age,
  );

  UserProfile.guest()
      : name = "Guest",
        age = 0;
}


// ============================================================================
// Usage:
//
// ============================================================================

void namedConstructorExample() {
  final user1 = UserProfile(
    "Palash",
    25,
  );

  final guest = UserProfile.guest();

  print(user1.name);
  print(guest.name);
}


// ============================================================================
// 10. PARAMETERIZED CONSTRUCTOR
// ============================================================================

class ProductItem {
  final String id;
  final String name;
  final double price;

  ProductItem({
    required this.id,
    required this.name,
    required this.price,
  });
}


// ============================================================================
// Named parameters are highly recommended for large models because:
//
// ProductItem(
//   id: "P001",
//   name: "Phone",
//   price: 100000,
// )
//
// is much easier to understand than:
//
// ProductItem(
//   "P001",
//   "Phone",
//   100000,
// )
//
// ============================================================================


// ============================================================================
// 11. INITIALIZER LIST
// ============================================================================
//
// Initializer list runs before the constructor body.
//
// Useful for:
//
//   • Calculating values
//   • Validation
//   • Initializing final fields
//
// ============================================================================

class Rectangle {
  final double width;
  final double height;
  final double area;

  Rectangle(
    this.width,
    this.height,
  ) : area = width * height;
}


// ============================================================================
// FINAL FIELDS + INITIALIZER LIST
// ============================================================================

class Order {
  final String id;
  final double total;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.total,
  }) : createdAt = DateTime.now();
}


// ============================================================================
// 12. PRIVATE MEMBERS
// ============================================================================
//
// Dart uses "_" to make members library-private.
//
// ============================================================================

class SecureAccount {
  double _balance = 0;

  void deposit(double amount) {
    _balance += amount;
  }
}


// ============================================================================
// _balance should not normally be modified directly from outside the
// library.
//
// ============================================================================


// ============================================================================
// 13. PUBLIC MEMBERS
// ============================================================================
//
// Members without "_" are public.
//
// ============================================================================

class PublicUser {
  String name = "Palash";

  void sayHello() {
    print("Hello");
  }
}


// ============================================================================
// 14. GETTER
// ============================================================================
//
// Getter provides controlled access to a value.
//
// ============================================================================

class Account {
  double _balance = 0;

  double get balance => _balance;
}


// ============================================================================
// Usage:
//
// ============================================================================

void getterExample() {
  final account = Account();

  print(account.balance);
}


// ============================================================================
// 15. SETTER
// ============================================================================
//
// Setter allows controlled modification.
//
// ============================================================================

class Wallet {
  double _balance = 0;

  double get balance => _balance;

  set balance(double value) {
    _balance = value;
  }
}


// ============================================================================
// 16. COMPUTED PROPERTY
// ============================================================================
//
// Getter can calculate a value dynamically.
//
// ============================================================================

class ShoppingCart {
  final List<double> prices;

  ShoppingCart(
    this.prices,
  );

  double get total {
    return prices.fold(
      0,
      (sum, price) => sum + price,
    );
  }
}


// ============================================================================
// 17. VALIDATION INSIDE SETTER
// ============================================================================

class ProductStock {
  int _stock = 0;

  int get stock => _stock;

  set stock(int value) {
    if (value < 0) {
      throw ArgumentError(
        "Stock cannot be negative",
      );
    }

    _stock = value;
  }
}


// ============================================================================
// This is especially useful for ERP/inventory systems.
//
// Never allow:
//
// stock = -10;
//
// ============================================================================


// ============================================================================
// 18. INHERITANCE — EXTENDS
// ============================================================================
//
// A child class inherits functionality from a parent class.
//
// ============================================================================

class Animal {
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog is barking");
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void inheritanceExample() {
  final dog = Dog();

  dog.eat();
  dog.bark();
}


// ============================================================================
// 19. SUPER
// ============================================================================
//
// super refers to the parent class.
//
// ============================================================================

class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  int studentId;

  Student(
    String name,
    this.studentId,
  ) : super(name);
}


// ============================================================================
// 20. PARENT CLASS
// ============================================================================

class Vehicle {
  void start() {
    print("Vehicle started");
  }
}


// ============================================================================
// 21. CHILD CLASS
// ============================================================================

class Car extends Vehicle {
  void drive() {
    print("Car is driving");
  }
}


// ============================================================================
// 22. METHOD OVERRIDING
// ============================================================================
//
// Child class can provide a different implementation.
//
// ============================================================================

class Payment {
  void pay() {
    print("Generic payment");
  }
}

class BkashPayment extends Payment {
  @override
  void pay() {
    print("Paid using bKash");
  }
}


// ============================================================================
// 23. @OVERRIDE
// ============================================================================
//
// @override tells Dart:
//
// "I intentionally override a parent member."
//
// It helps catch mistakes.
//
// ============================================================================


// ============================================================================
// 24. CONSTRUCTOR + INHERITANCE
// ============================================================================

class EmployeeBase {
  final String name;

  EmployeeBase(this.name);
}

class Manager extends EmployeeBase {
  final int teamSize;

  Manager({
    required String name,
    required this.teamSize,
  }) : super(name);
}


// ============================================================================
// 25. ABSTRACT CLASS
// ============================================================================
//
// An abstract class cannot normally be instantiated directly.
//
// It is used as a blueprint.
//
// ============================================================================

abstract class PaymentMethod {
  void pay(double amount);
}


// ============================================================================
// This is invalid:
//
// PaymentMethod();
//
// because PaymentMethod is abstract.
//
// ============================================================================


// ============================================================================
// 26. ABSTRACT METHODS
// ============================================================================
//
// A method without implementation.
//
// ============================================================================

abstract class Repository {
  Future<List<String>> getData();
}


// ============================================================================
// 27. CONCRETE METHODS IN ABSTRACT CLASS
// ============================================================================
//
// Abstract class can contain both:
//
//   • abstract methods
//   • implemented methods
//
// ============================================================================

abstract class BaseRepository {
  Future<List<String>> getData();

  void log(String message) {
    print(message);
  }
}


// ============================================================================
// 28. IMPLEMENTS
// ============================================================================
//
// implements means a class promises to implement an interface.
//
// ============================================================================

abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print(message);
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
//   follows a contract.
//
// ============================================================================


// ============================================================================
// 29. INTERFACE CONCEPT
// ============================================================================
//
// In Dart, every class implicitly defines an interface.
//
// Example:
//
// ============================================================================

class Printer {
  void printDocument() {
    print("Printing");
  }
}

class OfficePrinter implements Printer {
  @override
  void printDocument() {
    print("Office printer");
  }
}


// ============================================================================
// 30. UPCASTING
// ============================================================================
//
// Child object can be referenced using a parent type.
//
// ============================================================================

class Shape {
  double area() => 0;
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

void upcastingExample() {
  Shape shape = Circle(10);

  print(shape.area());
}


// ============================================================================
// 31. RUNTIME POLYMORPHISM
// ============================================================================
//
// The actual object determines which overridden method executes.
//
// ============================================================================

class Notification {
  void send() {
    print("Notification");
  }
}

class EmailNotification
    extends Notification {
  @override
  void send() {
    print("Email sent");
  }
}

class SmsNotification
    extends Notification {
  @override
  void send() {
    print("SMS sent");
  }
}

void polymorphismExample() {
  final notifications =
      <Notification>[
    EmailNotification(),
    SmsNotification(),
  ];

  for (final notification
      in notifications) {
    notification.send();
  }
}


// ============================================================================
// 32. METHOD OVERRIDING
// ============================================================================
//
// Already seen above.
//
// Parent:
//
//   send()
//
// Child:
//
//   send() differently.
//
// ============================================================================


// ============================================================================
// 33. INTERFACE POLYMORPHISM
// ============================================================================

abstract class Storage {
  Future<void> save(
    String key,
    String value,
  );
}

class LocalStorage implements Storage {
  @override
  Future<void> save(
    String key,
    String value,
  ) async {
    print(
      "Saving locally: $key = $value",
    );
  }
}

class CloudStorage implements Storage {
  @override
  Future<void> save(
    String key,
    String value,
  ) async {
    print(
      "Saving to cloud: $key = $value",
    );
  }
}


// ============================================================================
// 34. MIXIN
// ============================================================================
//
// A mixin allows reusable behavior to be added to classes.
//
// ============================================================================

mixin LoggerMixin {
  void log(String message) {
    print("[LOG] $message");
  }
}


// ============================================================================
// 35. WITH
// ============================================================================

class UserController
    with LoggerMixin {
  void loadUser() {
    log("Loading user");
  }
}


// ============================================================================
// 36. MULTIPLE MIXINS
// ============================================================================

mixin ValidationMixin {
  bool isValidEmail(String email) {
    return email.contains("@");
  }
}

mixin LoadingMixin {
  bool isLoading = false;
}

class LoginController
    with
        LoggerMixin,
        ValidationMixin,
        LoadingMixin {
  void login(String email) {
    if (isValidEmail(email)) {
      log("Valid email");
    }
  }
}


// ============================================================================
// 37. MIXIN ON CONSTRAINT
// ============================================================================
//
// A mixin can specify which type it can be used with.
//
// ============================================================================

class BaseController {
  void refresh() {
    print("Refreshing");
  }
}

mixin ControllerLogger
    on BaseController {
  void logRefresh() {
    print("Controller refreshed");
  }
}

class ProductControllerV2
    extends BaseController
    with ControllerLogger {}


// ============================================================================
// 38. FACTORY CONSTRUCTOR
// ============================================================================
//
// factory can return an existing object, a subclass object, or a new
// object created conditionally.
//
// One of the MOST important Dart features for model parsing.
//
// ============================================================================

class UserModel {
  final String id;
  final String name;

  UserModel({
    required this.id,
    required this.name,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}


// ============================================================================
// 39. FACTORY + JSON
// ============================================================================
//
// This is extremely common in Flutter:
//
// API JSON
//    ↓
// fromJson()
//    ↓
// Dart Model
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
      price: (json["price"] as num)
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
// JSON → MODEL
// ============================================================================

void jsonModelExample() {
  final json = {
    "id": "P001",
    "name": "iPhone",
    "price": 120000,
  };

  final product =
      ProductModel.fromJson(json);

  print(product.name);
}


// ============================================================================
// MODEL → JSON
// ============================================================================

void modelJsonExample() {
  final product = ProductModel(
    id: "P001",
    name: "iPhone",
    price: 120000,
  );

  final json = product.toJson();

  print(json);
}


// ============================================================================
// 40. FACTORY + SUBCLASS
// ============================================================================

abstract class UserType {
  factory UserType.fromRole(
    String role,
  ) {
    switch (role) {
      case "admin":
        return AdminUser();
      case "vendor":
        return VendorUser();
      default:
        return EmployeeUser();
    }
  }

  void access();
}

class AdminUser implements UserType {
  @override
  void access() {
    print("Full access");
  }
}

class VendorUser implements UserType {
  @override
  void access() {
    print("Vendor access");
  }
}

class EmployeeUser implements UserType {
  @override
  void access() {
    print("Employee access");
  }
}


// ============================================================================
// 41. STATIC MEMBERS
// ============================================================================
//
// static belongs to the class rather than an individual object.
//
// ============================================================================

class AppConfig {
  static const String appName =
      "My ERP";
}


// ============================================================================
// Usage:
//
// ============================================================================

void staticExample() {
  print(AppConfig.appName);
}


// ============================================================================
// 42. STATIC METHODS
// ============================================================================

class MathHelper {
  static int add(
    int a,
    int b,
  ) {
    return a + b;
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void staticMethodExample() {
  print(
    MathHelper.add(10, 20),
  );
}


// ============================================================================
// 43. CONST CONSTRUCTOR
// ============================================================================
//
// const constructors allow compile-time constant objects when possible.
//
// Very important in Flutter because const widgets improve performance
// and reduce unnecessary object creation.
//
// ============================================================================

class AppVersion {
  final int major;
  final int minor;

  const AppVersion(
    this.major,
    this.minor,
  );
}


// ============================================================================
// Usage:
//
// ============================================================================

const version =
    AppVersion(1, 0);


// ============================================================================
// 44. FINAL OBJECTS
// ============================================================================
//
// final prevents reassignment of the variable.
//
// It does NOT necessarily make the object immutable.
//
// ============================================================================

void finalObjectExample() {
  final product = Product(
    "Phone",
    100000,
  );

  product.price = 90000;

  // product = Product("Laptop", 150000);
  //
  // INVALID because product is final.
}


// ============================================================================
// IMPORTANT:
//
// final Product object
//
// means:
//
// the variable cannot point to another Product.
//
// It doesn't automatically make every field immutable.
//
// ============================================================================


// ============================================================================
// 45. COVARIANT
// ============================================================================
//
// Advanced Dart topic.
//
// covariant changes parameter type checking behavior for overridden
// members.
//
// Use carefully because it can reduce type safety.
//
// ============================================================================

class AnimalHandler {
  void handle(Animal animal) {
    print("Animal");
  }
}

class DogHandler extends AnimalHandler {
  @override
  void handle(covariant Dog dog) {
    print("Dog");
  }
}


// ============================================================================
// In normal application development, avoid covariant unless you clearly
// understand why it is required.
//
// ============================================================================


// ============================================================================
// 46. OPERATOR OVERLOADING
// ============================================================================
//
// Dart allows certain operators to be customized.
//
// ============================================================================

class Money {
  final double amount;

  const Money(this.amount);

  Money operator +(
    Money other,
  ) {
    return Money(
      amount + other.amount,
    );
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void operatorExample() {
  const money1 = Money(100);
  const money2 = Money(200);

  final total =
      money1 + money2;

  print(total.amount);
}


// ============================================================================
// 47. CALL()
// ============================================================================
//
// A class can be made callable like a function.
//
// ============================================================================

class Validator {
  bool call(String value) {
    return value.isNotEmpty;
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void callableClassExample() {
  final validator = Validator();

  final result =
      validator("Hello");

  print(result);
}


// ============================================================================
// This:
//
// validator("Hello")
//
// actually calls:
//
// validator.call("Hello")
//
// ============================================================================


// ============================================================================
// 48. EQUALITY
// ============================================================================
//
// By default, two separate objects are not necessarily equal just because
// their values are the same.
//
// ============================================================================

class ProductIdentity {
  final String id;

  const ProductIdentity(this.id);

  @override
  bool operator ==(
    Object other,
  ) {
    return other is ProductIdentity &&
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}


// ============================================================================
// 49. HASHCODE
// ============================================================================
//
// If you override ==, you should also override hashCode.
//
// This matters when using objects in:
//
//   • Set
//   • Map keys
//   • Collections
//
// ============================================================================


// ============================================================================
// 50. COMPOSITION
// ============================================================================
//
// Composition means building a class using other classes.
//
// "HAS-A" relationship.
//
// Example:
//
// Order HAS-A PaymentMethod.
//
// ============================================================================

class PaymentProcessor {
  void process(double amount) {
    print(
      "Processing $amount",
    );
  }
}

class Checkout {
  final PaymentProcessor processor;

  Checkout(this.processor);

  void pay(double amount) {
    processor.process(amount);
  }
}


// ============================================================================
// 51. AGGREGATION
// ============================================================================
//
// Aggregation is also a HAS-A relationship where the contained object
// can exist independently.
//
// ============================================================================

class EmployeeData {
  final String name;

  EmployeeData(this.name);
}

class Department {
  final List<EmployeeData> employees;

  Department(this.employees);
}


// ============================================================================
// 52. INHERITANCE VS COMPOSITION
// ============================================================================
//
// INHERITANCE:
//
//   Car extends Vehicle
//
// "Car IS-A Vehicle"
//
//
//
// COMPOSITION:
//
//   Checkout has PaymentProcessor
//
// "Checkout HAS-A PaymentProcessor"
//
//
//
// Prefer composition when you simply need reusable behavior or
// dependencies.
//
// ============================================================================


// ============================================================================
// 53. DEPENDENCY INJECTION
// ============================================================================
//
// Instead of creating dependencies inside a class:
//
// BAD:
//
// class UserService {
//   final ApiClient api = ApiClient();
// }
//
// Better:
//
// class UserService {
//   final ApiClient api;
//
//   UserService(this.api);
// }
//
// The dependency is injected from outside.
//
// ============================================================================

class ApiClient {
  Future<String> get(
    String endpoint,
  ) async {
    return "Response from $endpoint";
  }
}

class UserService {
  final ApiClient apiClient;

  UserService(
    this.apiClient,
  );

  Future<String> getUser() {
    return apiClient.get(
      "/users/me",
    );
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

Future<void> dependencyInjectionExample()
    async {
  final apiClient = ApiClient();

  final service =
      UserService(apiClient);

  final result =
      await service.getUser();

  print(result);
}


// ============================================================================
// WHY DEPENDENCY INJECTION?
// ----------------------------------------------------------------------------
//
// It makes code:
//
//   • Testable
//   • Reusable
//   • Flexible
//   • Maintainable
//   • Easier to mock
//
// ============================================================================


// ============================================================================
// 54. MODEL LAYER
// ============================================================================

class CustomerModel {
  final String id;
  final String name;
  final String phone;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory CustomerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CustomerModel(
      id: json["id"] as String,
      name: json["name"] as String,
      phone: json["phone"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
    };
  }
}


// ============================================================================
// 55. REPOSITORY LAYER
// ============================================================================
//
// Repository handles data access.
//
// ============================================================================

abstract class CustomerRepository {
  Future<List<CustomerModel>>
      getCustomers();
}


// ============================================================================
// 56. REPOSITORY IMPLEMENTATION
// ============================================================================

class CustomerRepositoryImpl
    implements CustomerRepository {
  final ApiClient apiClient;

  CustomerRepositoryImpl(
    this.apiClient,
  );

  @override
  Future<List<CustomerModel>>
      getCustomers() async {
    await apiClient.get(
      "/customers",
    );

    return const [
      CustomerModel(
        id: "C001",
        name: "Customer One",
        phone: "01700000000",
      ),
    ];
  }
}


// ============================================================================
// 57. SERVICE LAYER
// ============================================================================

class CustomerService {
  final CustomerRepository repository;

  CustomerService(
    this.repository,
  );

  Future<List<CustomerModel>>
      getCustomers() {
    return repository.getCustomers();
  }
}


// ============================================================================
// 58. CONTROLLER LAYER
// ============================================================================

class CustomerController {
  final CustomerService service;

  CustomerController(
    this.service,
  );

  List<CustomerModel> customers = [];

  bool isLoading = false;

  String? error;

  Future<void> loadCustomers()
      async {
    isLoading = true;
    error = null;

    try {
      customers =
          await service.getCustomers();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}


// ============================================================================
// 59. API ABSTRACTION
// ============================================================================
//
// Instead of tightly coupling your repository to one HTTP package:
//
// ============================================================================

abstract class HttpClient {
  Future<dynamic> get(
    String endpoint,
  );

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
  });
}


// ============================================================================
// 60. HTTP CLIENT IMPLEMENTATION
// ============================================================================

class HttpClientImpl
    implements HttpClient {
  @override
  Future<dynamic> get(
    String endpoint,
  ) async {
    print("GET $endpoint");

    return {};
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    dynamic body,
  }) async {
    print("POST $endpoint");

    return {};
  }
}


// ============================================================================
// 61. PROGRAM TO AN ABSTRACTION
// ============================================================================
//
// Instead of:
//
// UserService → Dio
//
// Prefer:
//
// UserService → HttpClient
//                   ↑
//             HttpClientImpl
//
// This makes replacing/testing the HTTP client easier.
//
// ============================================================================


// ============================================================================
// 62. SOLID — S: SINGLE RESPONSIBILITY PRINCIPLE
// ============================================================================
//
// A class should have one primary responsibility.
//
// BAD:
//
// class UserController {
//   login()
//   saveToDatabase()
//   sendEmail()
//   generatePdf()
//   uploadImage()
// }
//
// Too many responsibilities.
//
// Better:
//
// AuthService
// UserRepository
// EmailService
// PdfService
// ImageService
//
// ============================================================================


// ============================================================================
// 63. SOLID — O: OPEN/CLOSED PRINCIPLE
// ============================================================================
//
// Open for extension.
// Closed for modification.
//
// Example:
//
// ============================================================================

abstract class Discount {
  double calculate(double price);
}

class RegularDiscount
    implements Discount {
  @override
  double calculate(double price) {
    return price * 0.05;
  }
}

class PremiumDiscount
    implements Discount {
  @override
  double calculate(double price) {
    return price * 0.15;
  }
}


// ============================================================================
// Add new discount type without changing existing classes.
//
// ============================================================================


// ============================================================================
// 64. SOLID — L: LISKOV SUBSTITUTION PRINCIPLE
// ============================================================================
//
// A child implementation should be usable where its parent abstraction
// is expected without breaking the program.
//
// ============================================================================

abstract class StorageProvider {
  Future<void> save(String value);
}

class LocalStorageProvider
    implements StorageProvider {
  @override
  Future<void> save(String value) async {
    print("Saved locally");
  }
}

class RemoteStorageProvider
    implements StorageProvider {
  @override
  Future<void> save(String value) async {
    print("Saved remotely");
  }
}


// ============================================================================
// 65. SOLID — I: INTERFACE SEGREGATION PRINCIPLE
// ============================================================================
//
// Don't force classes to implement methods they don't need.
//
// BAD:
//
// abstract class Machine {
//   void print();
//   void scan();
//   void fax();
// }
//
// Better:
//
// ============================================================================

abstract class PrinterDevice {
  void printDocument();
}

abstract class ScannerDevice {
  void scanDocument();
}

class SimplePrinter
    implements PrinterDevice {
  @override
  void printDocument() {
    print("Printing");
  }
}


// ============================================================================
// 66. SOLID — D: DEPENDENCY INVERSION PRINCIPLE
// ============================================================================
//
// High-level code should depend on abstractions, not concrete
// implementations.
//
// ============================================================================

abstract class PaymentGateway {
  Future<void> pay(double amount);
}

class StripeGateway
    implements PaymentGateway {
  @override
  Future<void> pay(double amount) async {
    print(
      "Stripe payment: $amount",
    );
  }
}

class PaymentService {
  final PaymentGateway gateway;

  PaymentService(this.gateway);

  Future<void> pay(double amount) {
    return gateway.pay(amount);
  }
}


// ============================================================================
// 67. SINGLETON CONCEPT
// ============================================================================
//
// Singleton means only one shared instance is used.
//
// Use carefully.
//
// ============================================================================

class AppLogger {
  AppLogger._();

  static final AppLogger instance =
      AppLogger._();

  void log(String message) {
    print(message);
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void singletonExample() {
  AppLogger.instance.log(
    "Application started",
  );
}


// ============================================================================
// IMPORTANT:
//
// Don't make every service a singleton just because you can.
//
// Dependency injection is often cleaner for large applications.
//
// ============================================================================


// ============================================================================
// 68. IMMUTABLE MODEL
// ============================================================================
//
// Professional Flutter models are commonly immutable.
//
// Use:
//
//   final
//
// fields.
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
// 69. COPYWITH CONCEPT
// ============================================================================
//
// Flutter state management frequently needs immutable state updates.
//
// ============================================================================

class UserState {
  final String name;
  final bool isLoading;

  const UserState({
    required this.name,
    required this.isLoading,
  });

  UserState copyWith({
    String? name,
    bool? isLoading,
  }) {
    return UserState(
      name: name ?? this.name,
      isLoading:
          isLoading ?? this.isLoading,
    );
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void copyWithExample() {
  const state = UserState(
    name: "Palash",
    isLoading: false,
  );

  final loadingState =
      state.copyWith(
    isLoading: true,
  );

  print(loadingState.isLoading);
}


// ============================================================================
// 70. ENUM + MODEL
// ============================================================================

enum UserRole {
  admin,
  branchManager,
  vendor,
}

class AdminUserModel {
  final String id;
  final String name;
  final UserRole role;

  const AdminUserModel({
    required this.id,
    required this.name,
    required this.role,
  });
}


// ============================================================================
// 71. MODEL VALIDATION
// ============================================================================

class RegistrationModel {
  final String email;
  final String password;

  const RegistrationModel({
    required this.email,
    required this.password,
  });

  bool get isValid {
    return email.contains("@") &&
        password.length >= 8;
  }
}


// ============================================================================
// 72. DOMAIN MODEL
// ============================================================================
//
// Domain models contain business meaning.
//
// ============================================================================

class InventoryItem {
  final String productId;
  final int stock;

  const InventoryItem({
    required this.productId,
    required this.stock,
  });

  bool get isLowStock =>
      stock > 0 && stock <= 10;

  bool get isOutOfStock =>
      stock == 0;
}


// ============================================================================
// 73. BUSINESS LOGIC INSIDE MODEL
// ============================================================================

class OrderModel {
  final double subtotal;
  final double deliveryCharge;
  final double discount;

  const OrderModel({
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
  });

  double get total {
    return subtotal +
        deliveryCharge -
        discount;
  }
}


// ============================================================================
// 74. SPECIALIZED PAYMENT DESIGN
// ============================================================================

abstract class PaymentProcessor {
  Future<String> process(
    double amount,
  );
}

class BkashProcessor
    implements PaymentProcessor {
  @override
  Future<String> process(
    double amount,
  ) async {
    return "bKash payment successful";
  }
}

class CardProcessor
    implements PaymentProcessor {
  @override
  Future<String> process(
    double amount,
  ) async {
    return "Card payment successful";
  }
}

class PaymentManager {
  final PaymentProcessor processor;

  PaymentManager(this.processor);

  Future<String> pay(
    double amount,
  ) {
    return processor.process(amount);
  }
}


// ============================================================================
// 75. POLYMORPHIC PAYMENT
// ============================================================================

Future<void> paymentExample() async {
  final bKash =
      PaymentManager(
    BkashProcessor(),
  );

  final card =
      PaymentManager(
    CardProcessor(),
  );

  print(
    await bKash.pay(1000),
  );

  print(
    await card.pay(2000),
  );
}


// ============================================================================
// 76. FACTORY FOR PAYMENT METHODS
// ============================================================================

class PaymentFactory {
  static PaymentProcessor create(
    String method,
  ) {
    switch (method) {
      case "bkash":
        return BkashProcessor();

      case "card":
        return CardProcessor();

      default:
        throw ArgumentError(
          "Unsupported payment method",
        );
    }
  }
}


// ============================================================================
// 77. REPOSITORY CONTRACT
// ============================================================================

abstract class ProductRepositoryContract {
  Future<List<ProductModel>>
      getProducts();

  Future<ProductModel> getProductById(
    String id,
  );

  Future<void> createProduct(
    ProductModel product,
  );

  Future<void> deleteProduct(
    String id,
  );
}


// ============================================================================
// 78. REPOSITORY IMPLEMENTATION
// ============================================================================

class ProductRepositoryImplementation
    implements ProductRepositoryContract {
  final HttpClient httpClient;

  ProductRepositoryImplementation(
    this.httpClient,
  );

  @override
  Future<List<ProductModel>>
      getProducts() async {
    final response =
        await httpClient.get(
      "/products",
    );

    final list =
        response as List<dynamic>? ??
            [];

    return list
        .map(
          (item) =>
              ProductModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<ProductModel>
      getProductById(
    String id,
  ) async {
    final response =
        await httpClient.get(
      "/products/$id",
    );

    return ProductModel.fromJson(
      response as Map<String, dynamic>,
    );
  }

  @override
  Future<void> createProduct(
    ProductModel product,
  ) async {
    await httpClient.post(
      "/products",
      body: product.toJson(),
    );
  }

  @override
  Future<void> deleteProduct(
    String id,
  ) async {
    await httpClient.post(
      "/products/$id/delete",
    );
  }
}


// ============================================================================
// 79. SERVICE LAYER
// ============================================================================

class ProductServiceV2 {
  final ProductRepositoryContract
      repository;

  ProductServiceV2(
    this.repository,
  );

  Future<List<ProductModel>>
      getProducts() {
    return repository.getProducts();
  }

  Future<ProductModel> getProduct(
    String id,
  ) {
    return repository.getProductById(
      id,
    );
  }

  Future<void> createProduct(
    ProductModel product,
  ) {
    return repository.createProduct(
      product,
    );
  }
}


// ============================================================================
// 80. CONTROLLER LAYER
// ============================================================================

class ProductControllerV3 {
  final ProductServiceV2 service;

  ProductControllerV3(
    this.service,
  );

  List<ProductModel> products = [];

  bool isLoading = false;

  String? errorMessage;

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;

    try {
      products =
          await service.getProducts();
    } catch (error) {
      errorMessage =
          error.toString();
    } finally {
      isLoading = false;
    }
  }
}


// ============================================================================
// 81. OOP ARCHITECTURE FLOW
// ============================================================================
//
// UI
//  ↓
// ProductController
//  ↓
// ProductService
//  ↓
// ProductRepositoryContract
//  ↓
// ProductRepositoryImplementation
//  ↓
// HttpClient
//  ↓
// Node.js / Express
//  ↓
// MongoDB
//
// This is the kind of separation that makes large Flutter applications
// maintainable.
//
// ============================================================================


// ============================================================================
// 82. DEPENDENCY INJECTION FLOW
// ============================================================================

void buildProductArchitecture() {
  final httpClient =
      HttpClientImpl();

  final repository =
      ProductRepositoryImplementation(
    httpClient,
  );

  final service =
      ProductServiceV2(
    repository,
  );

  final controller =
      ProductControllerV3(
    service,
  );

  controller.loadProducts();
}


// ============================================================================
// 83. WHY THIS ARCHITECTURE IS POWERFUL
// ----------------------------------------------------------------------------
//
// You can replace:
//
// HttpClientImpl
//
// with:
//
// MockHttpClient
//
// during testing.
//
// You can replace:
//
// ProductRepositoryImplementation
//
// with:
//
// LocalProductRepository
//
// without changing the controller.
//
// ============================================================================


// ============================================================================
// 84. MOCK IMPLEMENTATION CONCEPT
// ============================================================================

class MockProductRepository
    implements ProductRepositoryContract {
  @override
  Future<List<ProductModel>>
      getProducts() async {
    return const [
      ProductModel(
        id: "TEST-001",
        name: "Test Product",
        price: 100,
      ),
    ];
  }

  @override
  Future<ProductModel>
      getProductById(
    String id,
  ) async {
    return const ProductModel(
      id: "TEST-001",
      name: "Test Product",
      price: 100,
    );
  }

  @override
  Future<void> createProduct(
    ProductModel product,
  ) async {}

  @override
  Future<void> deleteProduct(
    String id,
  ) async {}
}


// ============================================================================
// 85. TESTING CONCEPT
// ============================================================================
//
// Controller doesn't need to know whether repository uses:
//
//   • Real API
//   • Mock API
//   • Local database
//   • Cache
//
// It only knows the contract.
//
// ============================================================================


// ============================================================================
// 86. ABSTRACT FACTORY CONCEPT
// ============================================================================

abstract class Database {
  Future<void> save(
    String key,
    String value,
  );

  Future<String?> get(
    String key,
  );
}

class MemoryDatabase
    implements Database {
  final Map<String, String> _data =
      {};

  @override
  Future<void> save(
    String key,
    String value,
  ) async {
    _data[key] = value;
  }

  @override
  Future<String?> get(
    String key,
  ) async {
    return _data[key];
  }
}


// ============================================================================
// 87. COMPOSITION-BASED SERVICE
// ============================================================================

class UserCache {
  final Database database;

  UserCache(this.database);

  Future<void> saveUser(
    String id,
  ) {
    return database.save(
      "user",
      id,
    );
  }

  Future<String?> getUser() {
    return database.get(
      "user",
    );
  }
}


// ============================================================================
// 88. NULLABLE OBJECT DEPENDENCY
// ============================================================================
//
// Avoid unnecessary nullable dependencies.
//
// Prefer:
//
// final ApiClient client;
//
// rather than:
//
// final ApiClient? client;
//
// unless null is a valid state.
//
// ============================================================================


// ============================================================================
// 89. LATE
// ============================================================================
//
// late tells Dart that a non-nullable variable will be initialized later.
//
// ============================================================================

class AppManager {
  late String token;

  void initialize() {
    token = "TOKEN";
  }
}


// ============================================================================
// IMPORTANT:
//
// Accessing token before initialize() would throw a runtime error.
//
// Use late only when initialization order is guaranteed.
//
// ============================================================================


// ============================================================================
// 90. LATE FINAL
// ============================================================================

class Session {
  late final String token;

  void initialize(String value) {
    token = value;
  }
}


// ============================================================================
// late final can be assigned once later.
//
// ============================================================================


// ============================================================================
// 91. REDUCING COUPLING
// ============================================================================
//
// BAD:
//
// class OrderService {
//   final BkashProcessor processor =
//       BkashProcessor();
// }
//
// Now OrderService is tightly coupled to bKash.
//
//
//
// BETTER:
//
// class OrderService {
//   final PaymentProcessor processor;
//
//   OrderService(this.processor);
// }
//
// ============================================================================


// ============================================================================
// 92. HIGH COHESION
// ============================================================================
//
// A class should keep closely related responsibilities together.
//
// Example:
//
// ProductValidator
//
// should focus on product validation.
//
// Don't put unrelated email sending logic inside it.
//
// ============================================================================


// ============================================================================
// 93. IMMUTABLE BUSINESS OBJECT
// ============================================================================

class MoneyValue {
  final double amount;
  final String currency;

  const MoneyValue({
    required this.amount,
    required this.currency,
  });

  MoneyValue add(
    MoneyValue other,
  ) {
    if (currency != other.currency) {
      throw ArgumentError(
        "Currency mismatch",
      );
    }

    return MoneyValue(
      amount: amount + other.amount,
      currency: currency,
    );
  }
}


// ============================================================================
// 94. VALUE OBJECT
// ============================================================================
//
// A value object is defined by its value rather than identity.
//
// Examples:
//
//   Money
//   Email
//   PhoneNumber
//   Address
//
// ============================================================================

class EmailAddress {
  final String value;

  const EmailAddress(
    this.value,
  );

  bool get isValid =>
      value.contains("@");

  @override
  bool operator ==(
    Object other,
  ) {
    return other is EmailAddress &&
        other.value == value;
  }

  @override
  int get hashCode =>
      value.hashCode;
}


// ============================================================================
// 95. DOMAIN VALUE OBJECT
// ============================================================================

class ProductSku {
  final String value;

  const ProductSku(this.value);

  bool get isValid =>
      value.trim().isNotEmpty;
}


// ============================================================================
// 96. OOP WITH GENERICS
// ============================================================================

abstract class RepositoryGeneric<T> {
  Future<List<T>> getAll();

  Future<T> getById(
    String id,
  );
}


// ============================================================================
// 97. GENERIC PRODUCT REPOSITORY
// ============================================================================

class ProductGenericRepository
    implements RepositoryGeneric<ProductModel> {
  @override
  Future<List<ProductModel>>
      getAll() async {
    return const [];
  }

  @override
  Future<ProductModel>
      getById(
    String id,
  ) async {
    return const ProductModel(
      id: "P001",
      name: "Product",
      price: 100,
    );
  }
}


// ============================================================================
// 98. GENERIC API RESPONSE
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

  factory ApiResponse.success(
    T data,
  ) {
    return ApiResponse(
      success: true,
      data: data,
    );
  }

  factory ApiResponse.failure(
    String message,
  ) {
    return ApiResponse(
      success: false,
      message: message,
    );
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void genericResponseExample() {
  final response =
      ApiResponse<List<ProductModel>>.success(
    const [],
  );

  print(response.success);
}


// ============================================================================
// 99. GENERIC SERVICE
// ============================================================================

class GenericService<T> {
  final RepositoryGeneric<T> repository;

  GenericService(
    this.repository,
  );

  Future<List<T>> getAll() {
    return repository.getAll();
  }
}


// ============================================================================
// 100. COMPLETE PROFESSIONAL OOP EXAMPLE
// ============================================================================
//
// Domain:
//
// Product
//
// Repository:
//
// ProductRepository
//
// Service:
//
// ProductService
//
// Controller:
//
// ProductController
//
// Dependency:
//
// HttpClient
//
// ============================================================================

abstract class ProductDataSource {
  Future<List<ProductModel>>
      fetchProducts();

  Future<void> saveProduct(
    ProductModel product,
  );
}


// ============================================================================

class ProductRemoteDataSource
    implements ProductDataSource {
  final HttpClient client;

  ProductRemoteDataSource(
    this.client,
  );

  @override
  Future<List<ProductModel>>
      fetchProducts() async {
    final response =
        await client.get(
      "/products",
    );

    final list =
        response as List<dynamic>? ??
            [];

    return list
        .map(
          (json) =>
              ProductModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveProduct(
    ProductModel product,
  ) async {
    await client.post(
      "/products",
      body: product.toJson(),
    );
  }
}


// ============================================================================

class ProductRepositoryFinal {
  final ProductDataSource dataSource;

  ProductRepositoryFinal(
    this.dataSource,
  );

  Future<List<ProductModel>>
      getProducts() {
    return dataSource.fetchProducts();
  }

  Future<void> createProduct(
    ProductModel product,
  ) {
    return dataSource.saveProduct(
      product,
    );
  }
}


// ============================================================================

class ProductServiceFinal {
  final ProductRepositoryFinal repository;

  ProductServiceFinal(
    this.repository,
  );

  Future<List<ProductModel>>
      getProducts() {
    return repository.getProducts();
  }

  Future<void> createProduct(
    ProductModel product,
  ) {
    return repository.createProduct(
      product,
    );
  }
}


// ============================================================================

class ProductControllerFinal {
  final ProductServiceFinal service;

  ProductControllerFinal(
    this.service,
  );

  List<ProductModel> products = [];

  bool loading = false;

  String? error;

  Future<void> loadProducts() async {
    loading = true;
    error = null;

    try {
      products =
          await service.getProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }

  Future<void> addProduct(
    ProductModel product,
  ) async {
    try {
      await service.createProduct(
        product,
      );

      await loadProducts();
    } catch (e) {
      error = e.toString();
    }
  }
}


// ============================================================================
// 101. FINAL ARCHITECTURE
// ============================================================================
//
//                    FLUTTER UI
//                        │
//                        ▼
//               ProductController
//                        │
//                        ▼
//                 ProductService
//                        │
//                        ▼
//               ProductRepository
//                        │
//                        ▼
//              ProductDataSource
//                        │
//                        ▼
//                   HttpClient
//                        │
//                        ▼
//                Node.js / Express
//                        │
//                        ▼
//                    MongoDB
//
// ============================================================================
//
// This architecture uses:
//
//   ✓ Class
//   ✓ Object
//   ✓ Constructor
//   ✓ Encapsulation
//   ✓ Getter
//   ✓ Setter
//   ✓ Inheritance
//   ✓ Abstract class
//   ✓ Interface
//   ✓ implements
//   ✓ Polymorphism
//   ✓ Mixins
//   ✓ Factory constructor
//   ✓ Static
//   ✓ const
//   ✓ Composition
//   ✓ Dependency injection
//   ✓ Generics
//   ✓ Immutable models
//   ✓ Repository pattern
//   ✓ Service pattern
//   ✓ Controller pattern
//   ✓ SOLID principles
//
// ============================================================================


// ============================================================================
// 102. OOP GOLDEN RULES
// ============================================================================
//
// RULE 1:
// Classes should have clear responsibilities.
//
// RULE 2:
// Prefer composition over inheritance when appropriate.
//
// RULE 3:
// Depend on abstractions rather than concrete implementations.
//
// RULE 4:
// Keep models immutable whenever practical.
//
// RULE 5:
// Use final for fields that shouldn't change.
//
// RULE 6:
// Use private fields when direct modification should be prevented.
//
// RULE 7:
// Use getters for calculated/read-only values.
//
// RULE 8:
// Use setters only when controlled mutation is actually needed.
//
// RULE 9:
// Use abstract classes/interfaces for contracts.
//
// RULE 10:
// Use factory constructors for controlled object creation and JSON
// conversion.
//
// RULE 11:
// Don't create unnecessary singletons.
//
// RULE 12:
// Inject dependencies instead of constructing them deep inside classes.
//
// RULE 13:
// Keep UI/business/data responsibilities separate.
//
// RULE 14:
// Override == and hashCode together.
//
// RULE 15:
// Use const constructors for immutable compile-time objects where
// appropriate.
//
// ============================================================================


// ============================================================================
// 103. EXTENDS VS IMPLEMENTS VS WITH
// ============================================================================
//
// EXTENDS:
//
// class B extends A {}
//
// B inherits A's implementation.
//
//
//
// IMPLEMENTS:
//
// class B implements A {}
//
// B must implement A's contract.
//
//
//
// WITH:
//
// class B with MixinA, MixinB {}
//
// B receives reusable mixin behavior.
//
//
//
// EASY MEMORY:
//
// extends    = IS-A + inheritance
//
// implements = CONTRACT
//
// with       = REUSABLE BEHAVIOR
//
// ============================================================================


// ============================================================================
// 104. ABSTRACT CLASS VS INTERFACE
// ============================================================================
//
// ABSTRACT CLASS:
//
// Can contain:
//
//   • fields
//   • constructors
//   • implemented methods
//   • abstract methods
//
//
//
// INTERFACE:
//
// Focuses on a contract.
//
//
//
// Example:
//
// abstract class Repository {
//   Future<void> save();
//   void log() {}
// }
//
//
//
// class RepositoryImpl
//     implements Repository {
//
//   @override
//   Future<void> save() async {}
//
//   @override
//   void log() {}
// }
//
// ============================================================================


// ============================================================================
// 105. INHERITANCE VS COMPOSITION — FINAL MEMORY
// ============================================================================
//
// IS-A:
//
//   Dog IS-A Animal
//
// Use inheritance.
//
//
//
// HAS-A:
//
//   Order HAS-A PaymentProcessor
//
// Use composition.
//
//
//
// In large Flutter applications, composition + dependency injection
// will often be more useful than deep inheritance trees.
//
// ============================================================================


// ============================================================================
// 106. PHASE 9 MASTER CHECKLIST
// ============================================================================
//
// BASIC OOP
//
// [ ] Class
// [ ] Object
// [ ] Instance
// [ ] Instance variables
// [ ] Instance methods
// [ ] this
// [ ] Constructor
// [ ] Named constructor
// [ ] Parameterized constructor
// [ ] Initializer list
//
// ENCAPSULATION
//
// [ ] Private members
// [ ] Public members
// [ ] Getter
// [ ] Setter
// [ ] Computed properties
// [ ] Validation
//
// INHERITANCE
//
// [ ] extends
// [ ] super
// [ ] Parent
// [ ] Child
// [ ] @override
// [ ] Method overriding
//
// ABSTRACTION
//
// [ ] abstract class
// [ ] Abstract method
// [ ] Concrete method
// [ ] implements
// [ ] Interface
//
// POLYMORPHISM
//
// [ ] Upcasting
// [ ] Runtime polymorphism
// [ ] Interface polymorphism
//
// MIXINS
//
// [ ] mixin
// [ ] with
// [ ] Multiple mixins
// [ ] on constraint
//
// FACTORY
//
// [ ] factory constructor
// [ ] fromJson()
// [ ] toJson()
// [ ] Factory pattern
//
// ADVANCED
//
// [ ] static
// [ ] const constructor
// [ ] final
// [ ] late
// [ ] covariant
// [ ] operator
// [ ] call()
// [ ] ==
// [ ] hashCode
//
// ARCHITECTURE
//
// [ ] Composition
// [ ] Aggregation
// [ ] Dependency injection
// [ ] Model
// [ ] Repository
// [ ] Service
// [ ] Controller
// [ ] DataSource
// [ ] API abstraction
// [ ] Generics
// [ ] Immutable state
// [ ] copyWith
//
// SOLID
//
// [ ] Single Responsibility
// [ ] Open/Closed
// [ ] Liskov Substitution
// [ ] Interface Segregation
// [ ] Dependency Inversion
//
// ============================================================================
//
// ⭐ MOST IMPORTANT THINGS TO MASTER
// ============================================================================
//
// 1. Class/Object
//
// 2. Constructor
//
// 3. Encapsulation
//
// 4. extends
//
// 5. implements
//
// 6. abstract
//
// 7. polymorphism
//
// 8. mixin
//
// 9. factory
//
// 10. fromJson/toJson
//
// 11. composition
//
// 12. dependency injection
//
// 13. immutable model
//
// 14. generics
//
// 15. Repository → Service → Controller architecture
//
// 16. SOLID
//
// ============================================================================
//
// ⭐ FULL-STACK FLUTTER CONNECTION
// ============================================================================
//
// Your future Flutter project will repeatedly contain classes like:
//
//   UserModel
//   ProductModel
//   OrderModel
//   ApiResponse<T>
//   AuthRepository
//   ProductRepository
//   AuthService
//   ProductService
//   AuthController
//   ProductController
//   ApiClient
//   LocalStorage
//   PaymentGateway
//   NotificationService
//
// Understanding OOP means you understand the foundation behind these
// structures.
//
// ============================================================================
//
// ⭐ FINAL CONCEPT
// ============================================================================
//
// Class
//   ↓
// Object
//   ↓
// Encapsulation
//   ↓
// Abstraction
//   ↓
// Inheritance
//   ↓
// Polymorphism
//   ↓
// Composition
//   ↓
// Dependency Injection
//   ↓
// SOLID
//   ↓
// Scalable Flutter Architecture
//
// ============================================================================
//
// NEXT:
//
// PHASE 10 — DART COLLECTIONS + GENERICS + ADVANCED TYPE SYSTEM
//
// Topics will include:
//
//   • List deep dive
//   • Set deep dive
//   • Map deep dive
//   • Iterable
//   • Collection methods
//   • where
//   • map
//   • expand
//   • reduce
//   • fold
//   • any
//   • every
//   • firstWhere
//   • singleWhere
//   • collection if
//   • collection for
//   • spread operator
//   • null-aware spread
//   • generic classes
//   • generic methods
//   • type constraints
//   • records
//   • patterns
//   • sealed classes
//   • enums deep dive
//   • typedef
//   • function types
//   • variance
//   • advanced type safety
//   • real Flutter/API examples
//
// ============================================================================
//
// END OF PHASE 9
// ============================================================================\
