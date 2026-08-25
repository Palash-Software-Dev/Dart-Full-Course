// ============================================================================
// DART MASTER ROADMAP
// PHASE 6 — OBJECT-ORIENTED PROGRAMMING (OOP)
// ============================================================================
//
// Goal:
// Master Dart OOP from basic to advanced level so you can confidently build:
//
//   • Flutter applications
//   • API models
//   • Repository classes
//   • Services
//   • Controllers
//   • Business logic
//   • ERP modules
//   • Authentication systems
//   • Clean Architecture
//   • SOLID-based systems
//
// IMPORTANT:
// Flutter is heavily based on classes and objects.
// If your OOP foundation is weak, advanced Flutter architecture will become
// difficult.
//
// ============================================================================
//
// PHASE 6 TOPICS
//
// 01. What is OOP?
// 02. Class
// 03. Object
// 04. Properties / fields
// 05. Methods
// 06. Constructor
// 07. this
// 08. Named parameters in constructors
// 09. required constructor parameters
// 10. Optional constructor parameters
// 11. final fields
// 12. const constructors
// 13. Named constructors
// 14. Redirecting constructors
// 15. Factory constructors
// 16. Private members
// 17. Getters
// 18. Setters
// 19. Static members
// 20. Static methods
//
// 21. Instance members
// 22. Encapsulation
// 23. Inheritance
// 24. extends
// 25. super
// 26. Constructor inheritance
// 27. Method overriding
// 28. @override
// 29. super.method()
// 30. Abstract classes
// 31. Abstract methods
// 32. implements
// 33. Interfaces
// 34. Polymorphism
// 35. Upcasting
// 36. Downcasting
//
// 37. Mixins
// 38. with
// 39. on constraint for mixins
// 40. Multiple mixins
// 41. Enum with classes
// 42. Composition
// 43. Association
// 44. Dependency
// 45. Immutable objects
// 46. Equatable concept
// 47. copyWith concept
// 48. Model classes
// 49. Service classes
// 50. Repository classes
//
// 51. OOP in Flutter
// 52. OOP in API models
// 53. OOP in ERP architecture
// 54. SOLID preparation
//
// ============================================================================


// ============================================================================
// 1. WHAT IS OOP?
// ============================================================================
//
// OOP = Object-Oriented Programming.
//
// Instead of writing everything as independent functions,
// we organize code around:
//
//   Classes
//   Objects
//   Properties
//   Methods
//
// Example:
//
//   Product
//
// can contain:
//
//   id
//   name
//   price
//   stock
//
// and behaviors:
//
//   increaseStock()
//   decreaseStock()
//   calculateFinalPrice()
//
// ============================================================================


// ============================================================================
// 2. CLASS
// ============================================================================
//
// A class is a blueprint/template for creating objects.
//
// ============================================================================

class Product {
  String name;
  double price;
  int stock;

  Product({
    required this.name,
    required this.price,
    required this.stock,
  });

  void printProduct() {
    print(name);
    print(price);
    print(stock);
  }
}


// ============================================================================
// 3. OBJECT
// ============================================================================
//
// An object is an actual instance of a class.
//
// ============================================================================

void objectExample() {
  final product = Product(
    name: "iPhone",
    price: 100000,
    stock: 10,
  );

  print(product.name);
  print(product.price);
  print(product.stock);
}


// ============================================================================
// 4. MULTIPLE OBJECTS
// ============================================================================

void multipleObjectsExample() {
  final product1 = Product(
    name: "iPhone",
    price: 100000,
    stock: 10,
  );

  final product2 = Product(
    name: "Samsung",
    price: 80000,
    stock: 15,
  );

  print(product1.name);
  print(product2.name);
}


// ============================================================================
// 5. FIELDS / PROPERTIES
// ============================================================================
//
// Variables declared inside a class are called fields/properties.
//
// ============================================================================

class User {
  String name;
  String email;
  int age;

  User({
    required this.name,
    required this.email,
    required this.age,
  });
}


// ============================================================================
// 6. METHODS
// ============================================================================
//
// Functions inside a class are called methods.
//
// ============================================================================

class Calculator {
  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }
}


// ============================================================================
// 7. CONSTRUCTOR
// ============================================================================
//
// A constructor is used to create/initialize an object.
//
// ============================================================================

class Customer {
  String name;

  Customer(this.name);
}


// ============================================================================
// Usage:
//
// final customer = Customer("Palash");
//
// ============================================================================


// ============================================================================
// 8. this
// ============================================================================
//
// this refers to the current object.
//
// ============================================================================

class Employee {
  String name;
  double salary;

  Employee({
    required String name,
    required double salary,
  })  : name = name,
        salary = salary;
}


// ============================================================================
// The shorter and preferred Dart syntax:
//
// ============================================================================

class EmployeeShort {
  String name;
  double salary;

  EmployeeShort({
    required this.name,
    required this.salary,
  });
}


// ============================================================================
// 9. REQUIRED CONSTRUCTOR PARAMETERS
// ============================================================================

class Company {
  final String name;
  final String email;

  Company({
    required this.name,
    required this.email,
  });
}


// ============================================================================
// 10. OPTIONAL CONSTRUCTOR PARAMETERS
// ============================================================================

class OptionalUser {
  final String name;
  final String? phone;

  OptionalUser({
    required this.name,
    this.phone,
  });
}


// ============================================================================
// 11. FINAL FIELDS
// ============================================================================
//
// final fields can be assigned only once.
//
// ============================================================================

class ProductFinal {
  final String id;
  final String name;

  ProductFinal({
    required this.id,
    required this.name,
  });
}


// ============================================================================
// This is NOT allowed:
//
// product.id = "P002";
//
// because id is final.
//
// ============================================================================


// ============================================================================
// 12. CONST CONSTRUCTOR
// ============================================================================
//
// const objects are compile-time constants when all required conditions
// are satisfied.
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
// Create const object:
//
// ============================================================================

const config = AppConfig(
  appName: "ERP App",
  version: "1.0.0",
);


// ============================================================================
// IMPORTANT FLUTTER CONNECTION
// ============================================================================
//
// Flutter frequently uses:
//
//   const Widget(...)
//
// because immutable const objects can improve efficiency.
//
// ============================================================================


// ============================================================================
// 13. NAMED CONSTRUCTORS
// ============================================================================
//
// A class can have multiple constructors.
//
// ============================================================================

class UserAccount {
  final String name;
  final String role;

  UserAccount({
    required this.name,
    required this.role,
  });

  UserAccount.admin({
    required this.name,
  }) : role = "admin";

  UserAccount.vendor({
    required this.name,
  }) : role = "vendor";
}


// ============================================================================
// Usage:
//
// ============================================================================

void namedConstructorExample() {
  final admin = UserAccount.admin(
    name: "Palash",
  );

  final vendor = UserAccount.vendor(
    name: "Rahim",
  );

  print(admin.role);
  print(vendor.role);
}


// ============================================================================
// 14. REDIRECTING CONSTRUCTOR
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
// 15. FACTORY CONSTRUCTOR
// ============================================================================
//
// factory allows a constructor to return an existing object,
// a subclass object, or a specially created object.
//
// ============================================================================

class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();

  void log(String message) {
    print(message);
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void factoryExample() {
  final logger1 = Logger();
  final logger2 = Logger();

  print(identical(logger1, logger2));

  logger1.log("Application started");
}


// ============================================================================
// 16. PRIVATE MEMBERS
// ============================================================================
//
// In Dart, a name beginning with _ is private to the library.
//
// ============================================================================

class BankAccount {
  double _balance = 0;

  double get balance => _balance;
}


// ============================================================================
// External code should not directly modify:
//
//   account._balance
//
// Instead expose controlled methods/getters.
//
// ============================================================================


// ============================================================================
// 17. GETTER
// ============================================================================
//
// Getter looks like a property but executes logic.
//
// ============================================================================

class Rectangle {
  final double width;
  final double height;

  Rectangle({
    required this.width,
    required this.height,
  });

  double get area => width * height;
}


// ============================================================================
// Usage:
//
// ============================================================================

void getterExample() {
  final rectangle = Rectangle(
    width: 10,
    height: 5,
  );

  print(rectangle.area);
}


// ============================================================================
// 18. GETTER WITH LOGIC
// ============================================================================

class ProductPricing {
  final double price;
  final double discount;

  ProductPricing({
    required this.price,
    required this.discount,
  });

  double get finalPrice {
    return price - discount;
  }
}


// ============================================================================
// 19. SETTER
// ============================================================================
//
// Setter allows controlled modification of a property.
//
// ============================================================================

class Temperature {
  double _celsius = 0;

  double get celsius => _celsius;

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
// 20. GETTER + SETTER ENCAPSULATION
// ============================================================================

class Wallet {
  double _balance = 0;

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      throw ArgumentError(
        "Balance cannot be negative.",
      );
    }

    _balance = value;
  }
}


// ============================================================================
// 21. STATIC FIELD
// ============================================================================
//
// static belongs to the class itself,
// not to individual objects.
//
// ============================================================================

class AppConstants {
  static const String appName = "ERP System";
  static const String version = "1.0.0";
}


// ============================================================================
// Usage:
//
// ============================================================================

void staticFieldExample() {
  print(AppConstants.appName);
  print(AppConstants.version);
}


// ============================================================================
// 22. STATIC METHOD
// ============================================================================

class MathUtils {
  static int square(int number) {
    return number * number;
  }

  static int cube(int number) {
    return number * number * number;
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void staticMethodExample() {
  print(MathUtils.square(5));
  print(MathUtils.cube(3));
}


// ============================================================================
// 23. INSTANCE VS STATIC
// ============================================================================
//
// Instance:
//
//   final user = User(...);
//   user.name
//
// Static:
//
//   AppConstants.appName
//
// Instance belongs to an object.
//
// Static belongs to the class.
//
// ============================================================================


// ============================================================================
// 24. ENCAPSULATION
// ============================================================================
//
// Encapsulation means controlling how internal data is accessed/modified.
//
// ============================================================================

class Inventory {
  int _stock = 0;

  int get stock => _stock;

  void increaseStock(int quantity) {
    if (quantity <= 0) {
      throw ArgumentError(
        "Quantity must be greater than zero.",
      );
    }

    _stock += quantity;
  }

  void decreaseStock(int quantity) {
    if (quantity <= 0) {
      throw ArgumentError(
        "Quantity must be greater than zero.",
      );
    }

    if (quantity > _stock) {
      throw StateError(
        "Insufficient stock.",
      );
    }

    _stock -= quantity;
  }
}


// ============================================================================
// IMPORTANT ERP CONNECTION
// ============================================================================
//
// We don't want this:
//
//   inventory._stock = -500;
//
// Instead:
//
//   inventory.decreaseStock(5);
//
// This keeps business rules inside the class.
//
// ============================================================================


// ============================================================================
// 25. INHERITANCE
// ============================================================================
//
// Inheritance allows one class to inherit members from another class.
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
// 26. extends
// ============================================================================
//
// extends creates an inheritance relationship.
//
// ============================================================================

class Vehicle {
  void move() {
    print("Vehicle is moving");
  }
}

class Car extends Vehicle {
  void drive() {
    print("Car is driving");
  }
}


// ============================================================================
// 27. super
// ============================================================================
//
// super refers to the parent class.
//
// ============================================================================

class Parent {
  String name = "Parent";

  void show() {
    print("Parent show");
  }
}

class Child extends Parent {
  void printParentName() {
    print(super.name);
  }
}


// ============================================================================
// 28. super METHOD
// ============================================================================

class BaseController {
  void initialize() {
    print("Base controller initialized");
  }
}

class ProductController extends BaseController {
  @override
  void initialize() {
    super.initialize();

    print("Product controller initialized");
  }
}


// ============================================================================
// 29. CONSTRUCTOR + SUPER
// ============================================================================

class PersonBase {
  final String name;

  PersonBase(this.name);
}

class Student extends PersonBase {
  final String university;

  Student({
    required String name,
    required this.university,
  }) : super(name);
}


// ============================================================================
// 30. METHOD OVERRIDING
// ============================================================================
//
// Child class can provide its own implementation.
//
// ============================================================================

class NotificationService {
  void send() {
    print("Sending notification");
  }
}

class EmailNotification extends NotificationService {
  @override
  void send() {
    print("Sending email");
  }
}

class SmsNotification extends NotificationService {
  @override
  void send() {
    print("Sending SMS");
  }
}


// ============================================================================
// 31. @override
// ============================================================================
//
// @override tells Dart:
//
// "This method is overriding a parent member."
//
// It helps catch mistakes.
//
// ============================================================================


// ============================================================================
// 32. ABSTRACT CLASS
// ============================================================================
//
// An abstract class cannot be directly instantiated.
//
// ============================================================================

abstract class PaymentMethod {
  void pay(double amount);
}


// ============================================================================
// You cannot do:
//
//   final payment = PaymentMethod();
//
// ============================================================================


// ============================================================================
// 33. ABSTRACT METHOD
// ============================================================================
//
// A method without implementation inside an abstract class.
//
// ============================================================================

abstract class Storage {
  void save(String data);

  String load();
}


// ============================================================================
// 34. IMPLEMENT ABSTRACT CLASS
// ============================================================================

class LocalStorage implements Storage {
  String _data = "";

  @override
  void save(String data) {
    _data = data;
  }

  @override
  String load() {
    return _data;
  }
}


// ============================================================================
// 35. implements
// ============================================================================
//
// implements means:
//
// "This class promises to provide the interface of another class."
//
// ============================================================================

abstract class LoggerInterface {
  void log(String message);
}

class ConsoleLogger implements LoggerInterface {
  @override
  void log(String message) {
    print(message);
  }
}


// ============================================================================
// 36. extends VS implements
// ============================================================================
//
// extends:
//
//   Inherits implementation.
//
// implements:
//
//   Must implement the interface.
//
// Example:
//
//   class Dog extends Animal
//
//   class MyStorage implements Storage
//
// ============================================================================


// ============================================================================
// 37. POLYMORPHISM
// ============================================================================
//
// Same interface/reference can represent different implementations.
//
// ============================================================================

void processPayment(PaymentMethod payment) {
  payment.pay(1000);
}


// ============================================================================
// Implementations:
//
// ============================================================================

class BkashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid $amount using bKash");
  }
}

class CardPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid $amount using card");
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void polymorphismExample() {
  final PaymentMethod payment1 =
      BkashPayment();

  final PaymentMethod payment2 =
      CardPayment();

  processPayment(payment1);
  processPayment(payment2);
}


// ============================================================================
// 38. UPCASTING
// ============================================================================
//
// Child object stored in parent type.
//
// ============================================================================

void upcastingExample() {
  PaymentMethod payment =
      BkashPayment();

  payment.pay(500);
}


// ============================================================================
// 39. DOWNCASTING
// ============================================================================
//
// Converting a parent reference back to a specific child type.
//
// ============================================================================

void downcastingExample() {
  PaymentMethod payment =
      BkashPayment();

  if (payment is BkashPayment) {
    payment.pay(1000);
  }
}


// ============================================================================
// IMPORTANT:
// Prefer polymorphism instead of unnecessary downcasting.
//
// ============================================================================


// ============================================================================
// 40. MIXIN
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

class UserService with LoggerMixin {
  void createUser() {
    log("Creating user");
  }
}


// ============================================================================
// 41. with
// ============================================================================
//
// "with" applies a mixin to a class.
//
// ============================================================================

class ProductService with LoggerMixin {
  void createProduct() {
    log("Creating product");
  }
}


// ============================================================================
// 42. MULTIPLE MIXINS
// ============================================================================

mixin ValidationMixin {
  bool isValid(String value) {
    return value.trim().isNotEmpty;
  }
}

mixin CacheMixin {
  final Map<String, dynamic> cache = {};

  void putCache(
    String key,
    dynamic value,
  ) {
    cache[key] = value;
  }
}

class UserManager
    with LoggerMixin, ValidationMixin, CacheMixin {
  void create(String name) {
    if (!isValid(name)) {
      log("Invalid user");
      return;
    }

    putCache("user", name);

    log("User created");
  }
}


// ============================================================================
// 43. MIXIN on CONSTRAINT
// ============================================================================
//
// A mixin can be restricted to a specific parent type.
//
// ============================================================================

class Controller {
  void refresh() {
    print("Refreshing");
  }
}

mixin LoadingMixin on Controller {
  void showLoading() {
    print("Loading...");
  }
}

class ProductController2
    extends Controller
    with LoadingMixin {}


// ============================================================================
// 44. ENUM WITH CLASS
// ============================================================================

enum UserRole {
  admin,
  employee,
  vendor,
}

class AppUser {
  final String name;
  final UserRole role;

  AppUser({
    required this.name,
    required this.role,
  });
}


// ============================================================================
// 45. ENUM-BASED BUSINESS LOGIC
// ============================================================================

String getRoleName(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return "Administrator";

    case UserRole.employee:
      return "Employee";

    case UserRole.vendor:
      return "Vendor";
  }
}


// ============================================================================
// 46. COMPOSITION
// ============================================================================
//
// Composition means:
//
// "A class contains another object."
//
// This is often preferred over inheritance.
//
// ============================================================================

class Engine {
  void start() {
    print("Engine started");
  }
}

class CarWithEngine {
  final Engine engine;

  CarWithEngine({
    required this.engine,
  });

  void drive() {
    engine.start();
    print("Car is driving");
  }
}


// ============================================================================
// 47. COMPOSITION EXAMPLE FOR ERP
// ============================================================================

class ProductRepository {
  void saveProduct() {
    print("Product saved");
  }
}

class ProductService2 {
  final ProductRepository repository;

  ProductService2({
    required this.repository,
  });

  void createProduct() {
    repository.saveProduct();
  }
}


// ============================================================================
// This pattern becomes extremely important later:
//
//   UI
//    ↓
//   Controller
//    ↓
//   Service
//    ↓
//   Repository
//    ↓
//   API / Database
//
// ============================================================================


// ============================================================================
// 48. ASSOCIATION
// ============================================================================
//
// One object knows about another object.
//
// ============================================================================

class CustomerAccount {
  final String name;

  CustomerAccount(this.name);
}

class Order {
  final CustomerAccount customer;

  Order({
    required this.customer,
  });
}


// ============================================================================
// 49. DEPENDENCY
// ============================================================================
//
// A class depends on another class to perform its work.
//
// ============================================================================

class EmailService {
  void sendEmail(String email) {
    print("Sending email to $email");
  }
}

class AuthService {
  final EmailService emailService;

  AuthService({
    required this.emailService,
  });

  void register(String email) {
    print("Registering $email");

    emailService.sendEmail(email);
  }
}


// ============================================================================
// 50. IMMUTABLE CLASS
// ============================================================================
//
// Immutable object:
//
// Once created, its state does not change.
//
// Use:
//
//   final fields
//   const constructor when possible
//
// ============================================================================

class ImmutableProduct {
  final String id;
  final String name;
  final double price;

  const ImmutableProduct({
    required this.id,
    required this.name,
    required this.price,
  });
}


// ============================================================================
// 51. copyWith CONCEPT
// ============================================================================
//
// Flutter applications frequently need to create a modified copy of an
// immutable object.
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

  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void copyWithExample() {
  const product = ProductModel(
    id: "P001",
    name: "Phone",
    price: 50000,
  );

  final updatedProduct = product.copyWith(
    price: 45000,
  );

  print(product.price);
  print(updatedProduct.price);
}


// ============================================================================
// IMPORTANT copyWith PROBLEM
// ============================================================================
//
// The simple:
//
//   value ?? this.value
//
// cannot distinguish:
//
//   "don't change value"
//
// from:
//
//   "explicitly set nullable value to null"
//
// For advanced nullable models, a more sophisticated copyWith design may be
// required.
//
// ============================================================================


// ============================================================================
// 52. MODEL CLASS
// ============================================================================
//
// A model class represents structured application data.
//
// ============================================================================

class ProductData {
  final String id;
  final String name;
  final double price;
  final int stock;
  final double? discount;
  final String? image;

  const ProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    this.discount,
    this.image,
  });

  double get finalPrice {
    return price - (discount ?? 0);
  }
}


// ============================================================================
// 53. SERVICE CLASS
// ============================================================================
//
// Service contains business/application operations.
//
// ============================================================================

class ProductService3 {
  void createProduct(ProductData product) {
    print(
      "Creating product: ${product.name}",
    );
  }

  void deleteProduct(String productId) {
    print(
      "Deleting product: $productId",
    );
  }
}


// ============================================================================
// 54. REPOSITORY CLASS
// ============================================================================
//
// Repository handles data access.
//
// ============================================================================

abstract class ProductRepositoryInterface {
  Future<void> save(ProductData product);

  Future<ProductData?> findById(String id);
}


// ============================================================================
// Example implementation:
//
// ============================================================================

class MemoryProductRepository
    implements ProductRepositoryInterface {
  final Map<String, ProductData> _products = {};

  @override
  Future<void> save(ProductData product) async {
    _products[product.id] = product;
  }

  @override
  Future<ProductData?> findById(
    String id,
  ) async {
    return _products[id];
  }
}


// ============================================================================
// 55. SERVICE + REPOSITORY
// ============================================================================

class ProductApplicationService {
  final ProductRepositoryInterface repository;

  ProductApplicationService({
    required this.repository,
  });

  Future<void> createProduct(
    ProductData product,
  ) async {
    if (product.price < 0) {
      throw ArgumentError(
        "Price cannot be negative.",
      );
    }

    await repository.save(product);
  }
}


// ============================================================================
// 56. ABSTRACT REPOSITORY
// ============================================================================
//
// Why abstract?
//
// Because the service should not care whether data comes from:
//
//   MongoDB
//   REST API
//   SQLite
//   Local memory
//   Firebase
//
// It only depends on the contract.
//
// ============================================================================


// ============================================================================
// 57. INTERFACE SEGREGATION PREPARATION
// ============================================================================

abstract class ProductReader {
  Future<ProductData?> findById(String id);
}

abstract class ProductWriter {
  Future<void> save(ProductData product);
}


// ============================================================================
// A class can implement both:
//
// ============================================================================

class NewProductRepository
    implements ProductReader, ProductWriter {
  final Map<String, ProductData> _data = {};

  @override
  Future<ProductData?> findById(
    String id,
  ) async {
    return _data[id];
  }

  @override
  Future<void> save(
    ProductData product,
  ) async {
    _data[product.id] = product;
  }
}


// ============================================================================
// 58. POLYMORPHISM WITH REPOSITORY
// ============================================================================

class FakeProductRepository
    implements ProductReader {
  @override
  Future<ProductData?> findById(
    String id,
  ) async {
    return null;
  }
}


// ============================================================================
// Service can accept either implementation:
//
//   ProductReader
//
// This is the foundation of dependency inversion.
//
// ============================================================================


// ============================================================================
// 59. OOP + ERROR HANDLING
// ============================================================================

class ProductException implements Exception {
  final String message;

  ProductException(this.message);

  @override
  String toString() {
    return "ProductException: $message";
  }
}

class ProductManager {
  final ProductRepositoryInterface repository;

  ProductManager({
    required this.repository,
  });

  Future<void> create(
    ProductData product,
  ) async {
    if (product.name.trim().isEmpty) {
      throw ProductException(
        "Product name is required.",
      );
    }

    if (product.price < 0) {
      throw ProductException(
        "Price cannot be negative.",
      );
    }

    if (product.stock < 0) {
      throw ProductException(
        "Stock cannot be negative.",
      );
    }

    await repository.save(product);
  }
}


// ============================================================================
// 60. OOP + NULL SAFETY
// ============================================================================

class UserModel {
  final String id;
  final String name;
  final String? phone;
  final String? image;

  const UserModel({
    required this.id,
    required this.name,
    this.phone,
    this.image,
  });

  String get displayImage {
    return image ?? "default-image.png";
  }

  String get displayPhone {
    return phone ?? "No phone";
  }
}


// ============================================================================
// 61. OOP + FACTORY + JSON PREPARATION
// ============================================================================
//
// Factory constructors are extremely useful when converting JSON into model
// objects.
//
// ============================================================================

class SimpleUser {
  final String id;
  final String name;

  const SimpleUser({
    required this.id,
    required this.name,
  });

  factory SimpleUser.fromJson(
    Map<String, dynamic> json,
  ) {
    return SimpleUser(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
    );
  }
}


// ============================================================================
// 62. TO JSON
// ============================================================================

class ProductJsonModel {
  final String id;
  final String name;
  final double price;

  const ProductJsonModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductJsonModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductJsonModel(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0,
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
// 63. ENUM + MODEL
// ============================================================================

enum ProductStatus {
  active,
  inactive,
  archived,
}

class ProductEntity {
  final String id;
  final String name;
  final ProductStatus status;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.status,
  });

  bool get isActive {
    return status == ProductStatus.active;
  }
}


// ============================================================================
// 64. ABSTRACT PAYMENT ARCHITECTURE
// ============================================================================

abstract class PaymentGateway {
  Future<void> pay(double amount);
}

class BkashGateway implements PaymentGateway {
  @override
  Future<void> pay(double amount) async {
    print("Processing bKash payment: $amount");
  }
}

class StripeGateway implements PaymentGateway {
  @override
  Future<void> pay(double amount) async {
    print("Processing Stripe payment: $amount");
  }
}


// ============================================================================
// 65. PAYMENT SERVICE
// ============================================================================

class PaymentService {
  final PaymentGateway gateway;

  PaymentService({
    required this.gateway,
  });

  Future<void> process(double amount) async {
    if (amount <= 0) {
      throw ArgumentError(
        "Amount must be greater than zero.",
      );
    }

    await gateway.pay(amount);
  }
}


// ============================================================================
// Notice:
//
// PaymentService does NOT know:
//
//   How bKash works.
//   How Stripe works.
//
// It only knows:
//
//   PaymentGateway
//
// This is a major architecture principle.
//
// ============================================================================


// ============================================================================
// 66. OOP PRINCIPLE — ENCAPSULATION
// ============================================================================
//
// Keep internal state protected.
//
// Example:
//
//   private field
//   controlled methods
//   validation
//
// ============================================================================


// ============================================================================
// 67. OOP PRINCIPLE — ABSTRACTION
// ============================================================================
//
// Hide unnecessary implementation details.
//
// Example:
//
//   PaymentGateway
//
// UI doesn't need to know how payment API works.
//
// ============================================================================


// ============================================================================
// 68. OOP PRINCIPLE — INHERITANCE
// ============================================================================
//
// Reuse behavior through parent-child relationships.
//
// ============================================================================


// ============================================================================
// 69. OOP PRINCIPLE — POLYMORPHISM
// ============================================================================
//
// Same contract, different implementation.
//
// Example:
//
//   PaymentGateway
//
//   BkashGateway
//   StripeGateway
//   CardGateway
//
// ============================================================================


// ============================================================================
// 70. COMPOSITION VS INHERITANCE
// ============================================================================
//
// Prefer composition when:
//
//   "has-a" relationship.
//
// Example:
//
//   Car HAS an Engine.
//
// Use inheritance when:
//
//   "is-a" relationship.
//
// Example:
//
//   Dog IS an Animal.
//
// ============================================================================


// ============================================================================
// 71. FLUTTER CONNECTION — WIDGETS
// ============================================================================
//
// Flutter widgets are classes.
//
// Conceptually:
//
//   class MyWidget extends StatelessWidget
//
// This means:
//
//   MyWidget
//      ↓
//   is a StatelessWidget
//
// And:
//
//   build()
//
// is an overridden method.
//
// ============================================================================


// ============================================================================
// 72. FLUTTER CONNECTION — STATE
// ============================================================================
//
// StatefulWidget architecture uses classes such as:
//
//   StatefulWidget
//   State<T>
//
// You will use inheritance, overriding, constructors, fields and methods
// constantly in Flutter.
//
// ============================================================================


// ============================================================================
// 73. FLUTTER CONNECTION — MODEL
// ============================================================================
//
// Example:
//
//   ProductModel
//
// contains:
//
//   fields
//   constructor
//   fromJson()
//   toJson()
//   copyWith()
//
// This is pure Dart OOP.
//
// ============================================================================


// ============================================================================
// 74. FLUTTER CONNECTION — REPOSITORY
// ============================================================================
//
// Example:
//
//   abstract class AuthRepository
//
// then:
//
//   ApiAuthRepository
//   LocalAuthRepository
//
// Both implement the same contract.
//
// ============================================================================


// ============================================================================
// 75. FLUTTER CONNECTION — SERVICE
// ============================================================================
//
// Example:
//
//   AuthService
//   ProductService
//   OrderService
//   PaymentService
//
// Each class handles a specific responsibility.
//
// ============================================================================


// ============================================================================
// 76. FLUTTER CONNECTION — DEPENDENCY INJECTION
// ============================================================================
//
// Instead of:
//
//   class ProductService {
//     final ProductRepository repository =
//         ProductRepository();
//   }
//
// Prefer:
//
//   class ProductService {
//     final ProductRepository repository;
//
//     ProductService({
//       required this.repository,
//     });
//   }
//
// Then:
//
//   ProductService(
//     repository: repository,
//   );
//
// This makes code easier to:
//
//   test
//   replace
//   maintain
//   scale
//
// ============================================================================


// ============================================================================
// 77. SINGLE RESPONSIBILITY PREPARATION
// ============================================================================
//
// A class should have one clear responsibility.
//
// Bad:
//
//   UserManager
//     → login
//     → database
//     → email
//     → payment
//     → image upload
//
// Better:
//
//   AuthService
//   UserRepository
//   EmailService
//   PaymentService
//   ImageService
//
// This prepares you for SOLID.
//
// ============================================================================


// ============================================================================
// 78. OPEN/CLOSED PRINCIPLE PREPARATION
// ============================================================================
//
// Code should be open for extension,
// but closed for unnecessary modification.
//
// Example:
//
//   PaymentGateway
//
// Add:
//
//   StripeGateway
//   BkashGateway
//   CardGateway
//
// without rewriting PaymentService.
//
// ============================================================================


// ============================================================================
// 79. LISKOV SUBSTITUTION PREPARATION
// ============================================================================
//
// If class B is a valid subtype of class A,
// code using A should be able to work with B.
//
// Example:
//
//   PaymentGateway
//
// should work with:
//
//   BkashGateway
//   StripeGateway
//
// ============================================================================


// ============================================================================
// 80. INTERFACE SEGREGATION PREPARATION
// ============================================================================
//
// Prefer small focused interfaces.
//
// Instead of:
//
//   HugeRepository
//
// use:
//
//   ProductReader
//   ProductWriter
//
// when appropriate.
//
// ============================================================================


// ============================================================================
// 81. DEPENDENCY INVERSION PREPARATION
// ============================================================================
//
// High-level classes should depend on abstractions.
//
// Example:
//
//   ProductService
//
// depends on:
//
//   ProductRepositoryInterface
//
// instead of:
//
//   MongoProductRepository
//
// directly.
//
// ============================================================================


// ============================================================================
// 82. FACTORY FOR DIFFERENT TYPES
// ============================================================================

abstract class Notification {
  void send();
}

class EmailNotification2 extends Notification {
  @override
  void send() {
    print("Email sent");
  }
}

class SmsNotification2 extends Notification {
  @override
  void send() {
    print("SMS sent");
  }
}

class NotificationFactory {
  static Notification create(
    String type,
  ) {
    switch (type) {
      case "email":
        return EmailNotification2();

      case "sms":
        return SmsNotification2();

      default:
        throw ArgumentError(
          "Unsupported notification type",
        );
    }
  }
}


// ============================================================================
// 83. FACTORY USAGE
// ============================================================================

void notificationFactoryExample() {
  final notification =
      NotificationFactory.create("email");

  notification.send();
}


// ============================================================================
// 84. ABSTRACT FACTORY-STYLE CONCEPT
// ============================================================================
//
// The important idea:
//
// Caller asks for an abstraction,
// not a concrete implementation.
//
// ============================================================================


// ============================================================================
// 85. MODEL WITH BUSINESS METHODS
// ============================================================================

class BankAccountModel {
  final String accountNumber;
  double _balance;

  BankAccountModel({
    required this.accountNumber,
    double balance = 0,
  }) : _balance = balance;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError(
        "Deposit must be greater than zero.",
      );
    }

    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError(
        "Withdrawal must be greater than zero.",
      );
    }

    if (amount > _balance) {
      throw StateError(
        "Insufficient balance.",
      );
    }

    _balance -= amount;
  }
}


// ============================================================================
// 86. CONSTRUCTOR INITIALIZER LIST
// ============================================================================
//
// Initializer list:
//
//   : field = value
//
// runs before the constructor body.
//
// ============================================================================

class Circle {
  final double radius;
  final double area;

  Circle(double radius)
      : radius = radius,
        area = 3.141592653589793 *
            radius *
            radius;
}


// ============================================================================
// 87. ASSERT IN CONSTRUCTOR
// ============================================================================

class PositiveNumber {
  final int value;

  PositiveNumber(this.value)
      : assert(value > 0);
}


// ============================================================================
// 88. REDUCED CONSTRUCTOR SYNTAX
// ============================================================================

class SimpleProduct {
  final String name;
  final double price;

  const SimpleProduct(
    this.name,
    this.price,
  );
}


// ============================================================================
// 89. NAMED + POSITIONAL CONSTRUCTOR
// ============================================================================

class Coordinate {
  final double x;
  final double y;

  const Coordinate(
    this.x,
    this.y,
  );

  const Coordinate.origin()
      : x = 0,
        y = 0;
}


// ============================================================================
// 90. OPTIONAL POSITIONAL PARAMETERS
// ============================================================================

class PersonDetails {
  final String name;
  final int? age;

  PersonDetails(
    this.name, [
    this.age,
  ]);
}


// ============================================================================
// 91. PRIVATE CONSTRUCTOR
// ============================================================================
//
// Useful when controlling object creation.
//
// ============================================================================

class Database {
  Database._();

  static final Database instance =
      Database._();
}


// ============================================================================
// 92. FACTORY + PRIVATE CONSTRUCTOR
// ============================================================================

class AppDatabase {
  static final AppDatabase _instance =
      AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal();

  void connect() {
    print("Database connected");
  }
}


// ============================================================================
// 93. IDENTITY
// ============================================================================
//
// Two objects can have the same values but still be different objects.
//
// ============================================================================

class Box {
  final int value;

  Box(this.value);
}

void identityExample() {
  final box1 = Box(10);
  final box2 = Box(10);

  print(box1 == box2);
  print(identical(box1, box2));
}


// ============================================================================
// IMPORTANT:
//
// By default, == on normal objects behaves based on object identity unless
// equality is overridden.
//
// In real Flutter projects, equality handling becomes important for models,
// state management and testing.
//
// ============================================================================


// ============================================================================
// 94. OVERRIDE == CONCEPT
// ============================================================================

class UserValueObject {
  final String id;

  const UserValueObject(this.id);

  @override
  bool operator ==(Object other) {
    return other is UserValueObject &&
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}


// ============================================================================
// 95. VALUE EQUALITY
// ============================================================================

void equalityExample() {
  const user1 = UserValueObject("U001");
  const user2 = UserValueObject("U001");

  print(user1 == user2);
}


// ============================================================================
// 96. COMPLETE ERP PRODUCT MODEL
// ============================================================================

enum ProductType {
  manual,
  vendor,
  imported,
}

enum ProductStatus2 {
  active,
  inactive,
  archived,
}

class ErpProduct {
  final String id;
  final String name;
  final double price;
  final double? discount;
  final int stock;
  final ProductType type;
  final ProductStatus2 status;
  final String? image;

  const ErpProduct({
    required this.id,
    required this.name,
    required this.price,
    this.discount,
    required this.stock,
    required this.type,
    required this.status,
    this.image,
  });

  double get finalPrice {
    return price - (discount ?? 0);
  }

  bool get isInStock {
    return stock > 0;
  }

  bool get isActive {
    return status == ProductStatus2.active;
  }

  ErpProduct copyWith({
    String? id,
    String? name,
    double? price,
    double? discount,
    int? stock,
    ProductType? type,
    ProductStatus2? status,
    String? image,
  }) {
    return ErpProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      stock: stock ?? this.stock,
      type: type ?? this.type,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }
}


// ============================================================================
// 97. ERP PRODUCT SERVICE
// ============================================================================

class ErpProductService {
  final ProductRepositoryInterface repository;

  ErpProductService({
    required this.repository,
  });

  Future<void> createProduct(
    ErpProduct product,
  ) async {
    if (product.name.trim().isEmpty) {
      throw ProductException(
        "Product name is required.",
      );
    }

    if (product.price < 0) {
      throw ProductException(
        "Product price cannot be negative.",
      );
    }

    if (product.stock < 0) {
      throw ProductException(
        "Product stock cannot be negative.",
      );
    }

    final model = ProductData(
      id: product.id,
      name: product.name,
      price: product.price,
      stock: product.stock,
      discount: product.discount,
      image: product.image,
    );

    await repository.save(model);
  }
}


// ============================================================================
// 98. COMPLETE ARCHITECTURE CONCEPT
// ============================================================================
//
// Presentation Layer
//        ↓
// Controller / ViewModel
//        ↓
// Service / UseCase
//        ↓
// Repository Interface
//        ↓
// Repository Implementation
//        ↓
// API / Database
//
// OOP concepts used:
//
//   class
//   object
//   abstraction
//   interface
//   inheritance
//   composition
//   encapsulation
//   polymorphism
//   dependency injection
//   factory
//   immutable models
//
// ============================================================================


// ============================================================================
// 99. PHASE 6 MASTER CHECKLIST
// ============================================================================
//
// BASIC OOP
//
// [ ] Class
// [ ] Object
// [ ] Field
// [ ] Method
// [ ] Constructor
// [ ] this
// [ ] final field
// [ ] const constructor
// [ ] Named constructor
// [ ] Redirecting constructor
// [ ] Factory constructor
//
// ENCAPSULATION
//
// [ ] Private member
// [ ] Getter
// [ ] Setter
// [ ] Static member
// [ ] Static method
//
// INHERITANCE
//
// [ ] extends
// [ ] super
// [ ] Constructor inheritance
// [ ] Method overriding
// [ ] @override
//
// ABSTRACTION
//
// [ ] abstract class
// [ ] abstract method
// [ ] implements
// [ ] Interface
//
// ADVANCED OOP
//
// [ ] Polymorphism
// [ ] Upcasting
// [ ] Downcasting
// [ ] Mixins
// [ ] with
// [ ] Mixin constraints
// [ ] Multiple mixins
// [ ] Composition
// [ ] Association
// [ ] Dependency
// [ ] Immutable object
// [ ] copyWith
// [ ] Equality
// [ ] hashCode
//
// ARCHITECTURE
//
// [ ] Model
// [ ] Service
// [ ] Repository
// [ ] Repository interface
// [ ] Dependency injection
// [ ] Factory pattern
// [ ] Separation of responsibilities
// [ ] SOLID preparation
//
// ============================================================================
//
// MOST IMPORTANT CONCEPTS TO MASTER
//
// 1. class
// 2. object
// 3. constructor
// 4. final
// 5. named constructor
// 6. factory
// 7. getter/setter
// 8. private members
// 9. extends
// 10. super
// 11. @override
// 12. abstract
// 13. implements
// 14. polymorphism
// 15. mixin
// 16. composition
// 17. immutable model
// 18. copyWith
// 19. repository
// 20. dependency injection
//
// ============================================================================
//
// FULL-STACK FLUTTER CONNECTION
// -----------------------------
//
// You will use these concepts everywhere:
//
// Flutter Widgets
//     ↓
// State classes
//     ↓
// Models
//     ↓
// Controllers
//     ↓
// Services
//     ↓
// Repositories
//     ↓
// API clients
//     ↓
// Database
//
// For your ERP/SaaS application, classes will represent things like:
//
//   User
//   Company
//   Branch
//   Warehouse
//   Supplier
//   Vendor
//   Product
//   ProductVariant
//   PurchaseOrder
//   GRN
//   Inventory
//   StockTransfer
//   Customer
//   Order
//   Payment
//   Subscription
//   Invoice
//   Notification
//   AuditLog
//
// Each will eventually have:
//
//   Model/Entity
//   Repository
//   Service/UseCase
//   Controller/ViewModel
//
// ============================================================================
//
// NEXT PHASE:
//
// PHASE 7 — DART COLLECTIONS + FUNCTIONAL PROGRAMMING (ADVANCED)
//
// Topics:
//
//   • List deeply
//   • Set deeply
//   • Map deeply
//   • Iterable
//   • where()
//   • map()
//   • expand()
//   • reduce()
//   • fold()
//   • firstWhere()
//   • singleWhere()
//   • any()
//   • every()
//   • contains()
//   • take()
//   • skip()
//   • toList()
//   • toSet()
//   • collection transformations
//   • cascade operator
//   • spread operator
//   • collection-if
//   • collection-for
//   • higher-order functions
//   • closures
//   • anonymous functions
//   • tear-offs
//   • function composition
//   • practical Flutter/API/ERP collection patterns
//
// ============================================================================
//
// END OF PHASE 6
// ============================================================================