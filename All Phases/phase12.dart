// ============================================================================
// DART MASTER ROADMAP
// PHASE 12 — OBJECT-ORIENTED PROGRAMMING (OOP) MASTERCLASS
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// This phase takes you from basic Dart OOP to professional-level OOP used
// in real Flutter applications, scalable ERP/SaaS systems and backend APIs.
//
// OOP is one of the MOST IMPORTANT Dart topics for Flutter development.
//
// Flutter itself is heavily object-oriented.
//
// You will constantly work with:
//
//   • Classes
//   • Objects
//   • Constructors
//   • Models
//   • Services
//   • Repositories
//   • Controllers
//   • Providers / Notifiers
//   • API clients
//   • Exceptions
//   • Abstract classes
//   • Interfaces
//   • Mixins
//   • Extensions
//   • Dependency Injection
//
// ============================================================================
// PHASE 12 TOPICS
// ============================================================================
//
// 01. Class basics
// 02. Objects
// 03. Instance variables
// 04. Instance methods
// 05. this
// 06. Constructors
// 07. Default constructors
// 08. Named constructors
// 09. Redirecting constructors
// 10. Initializer lists
// 11. assert in constructors
// 12. Factory constructors
// 13. Factory constructor use cases
// 14. Private members
// 15. Getters
// 16. Setters
// 17. Computed properties
// 18. Static members
// 19. Static methods
// 20. Constant constructors
//
// INHERITANCE
//
// 21. extends
// 22. super
// 23. Method overriding
// 24. @override
// 25. Constructor inheritance
// 26. super parameters
// 27. Covariant
//
// ABSTRACTION
//
// 28. Abstract classes
// 29. Abstract methods
// 30. Concrete implementation
// 31. Interfaces
// 32. implements
// 33. Multiple interfaces
// 34. Abstract interface
//
// POLYMORPHISM
//
// 35. Polymorphism
// 36. Upcasting
// 37. Downcasting
// 38. Runtime type
// 39. is
// 40. as
//
// MIXINS
//
// 41. Mixin basics
// 42. with
// 43. Multiple mixins
// 44. on constraint
// 45. Mixin vs inheritance
//
// EXTENSIONS
//
// 46. Extension methods
// 47. Extension getters
// 48. Extension operators
// 49. Generic extensions
//
// OBJECT DESIGN
//
// 50. Encapsulation
// 51. Composition
// 52. Aggregation
// 53. Association
// 54. Dependency
// 55. Immutable classes
// 56. Value objects
//
// ADVANCED
//
// 57. ==
// 58. hashCode
// 59. toString
// 60. identical
// 61. Equatable concept
// 62. copyWith pattern
// 63. Sealed class hierarchy
// 64. Base classes
// 65. Interface classes
// 66. Final classes
// 67. Class modifiers
//
// ARCHITECTURE
//
// 68. Model classes
// 69. Entity classes
// 70. DTO concept
// 71. Repository pattern
// 72. Service pattern
// 73. Controller pattern
// 74. Dependency Injection
// 75. SOLID
// 76. Single Responsibility
// 77. Open/Closed
// 78. Liskov Substitution
// 79. Interface Segregation
// 80. Dependency Inversion
//
// REAL FLUTTER
//
// 81. User model
// 82. Product model
// 83. API service
// 84. Repository
// 85. Controller
// 86. Authentication architecture
// 87. Payment architecture
// 88. ERP architecture
//
// ============================================================================


// ============================================================================
// 01. CLASS BASICS
// ============================================================================
//
// A class is a blueprint for creating objects.
//
// ============================================================================

class User {
  String name = "";
  int age = 0;

  void introduce() {
    print(
      "My name is $name and I am $age years old.",
    );
  }
}


// ============================================================================
// 02. OBJECTS
// ============================================================================
//
// An object is an instance of a class.
//
// ============================================================================

void objectExample() {
  final user = User();

  user.name = "Palash";
  user.age = 25;

  user.introduce();
}


// ============================================================================
// 03. INSTANCE VARIABLES
// ============================================================================
//
// Variables that belong to each object are instance variables.
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

void instanceVariableExample() {
  final product1 =
      Product(
    "iPhone",
    120000,
  );

  final product2 =
      Product(
    "Samsung",
    90000,
  );

  print(product1.name);
  print(product2.name);
}


// ============================================================================
// Each object has its own values.
//
// product1.name != product2.name
//
// ============================================================================


// ============================================================================
// 04. INSTANCE METHODS
// ============================================================================

class BankAccount {
  double balance = 0;

  void deposit(
    double amount,
  ) {
    balance += amount;
  }

  void withdraw(
    double amount,
  ) {
    if (amount <= balance) {
      balance -= amount;
    }
  }
}


// ============================================================================

void instanceMethodExample() {
  final account =
      BankAccount();

  account.deposit(1000);
  account.withdraw(250);

  print(
    account.balance,
  );
}


// ============================================================================
// 05. THIS
// ============================================================================
//
// this refers to the current object.
//
// ============================================================================

class Customer {
  String name;

  Customer(
    this.name,
  );
}


// ============================================================================
//
// Equivalent long form:
//
// class Customer {
//   String name;
//
//   Customer(String name) {
//     this.name = name;
//   }
// }
//
// ============================================================================


// ============================================================================
// 06. CONSTRUCTORS
// ============================================================================
//
// Constructor initializes an object.
//
// ============================================================================

class Employee {
  final String name;
  final String role;

  Employee(
    this.name,
    this.role,
  );
}


// ============================================================================

void constructorExample() {
  final employee =
      Employee(
    "Palash",
    "Developer",
  );

  print(employee.name);
}


// ============================================================================
// 07. DEFAULT CONSTRUCTOR
// ============================================================================
//
// If you do not define a constructor, Dart provides an implicit default
// constructor in appropriate cases.
//
// ============================================================================

class EmptyClass {
  // Implicit default constructor.
}


// ============================================================================
// 08. NAMED CONSTRUCTORS
// ============================================================================
//
// Dart does not support multiple constructors with the same name.
//
// Named constructors solve this problem.
//
// ============================================================================

class UserProfile {
  final String name;
  final int age;

  UserProfile(
    this.name,
    this.age,
  );

  UserProfile.guest()
      : name = "Guest",
        age = 0;

  UserProfile.admin()
      : name = "Admin",
        age = 30;
}


// ============================================================================

void namedConstructorExample() {
  final user1 =
      UserProfile(
    "Palash",
    25,
  );

  final user2 =
      UserProfile.guest();

  final user3 =
      UserProfile.admin();

  print(user1.name);
  print(user2.name);
  print(user3.name);
}


// ============================================================================
// 09. REDIRECTING CONSTRUCTORS
// ============================================================================
//
// One constructor can redirect to another constructor.
//
// ============================================================================

class Account {
  final String type;
  final bool active;

  Account(
    this.type,
    this.active,
  );

  Account.user()
      : this(
          "user",
          true,
        );

  Account.admin()
      : this(
          "admin",
          true,
        );
}


// ============================================================================
// 10. INITIALIZER LIST
// ============================================================================
//
// Initializer lists run before the constructor body.
//
// Useful for:
//
//   • final variables
//   • validation
//   • calculations
//   • super constructor arguments
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

void initializerListExample() {
  final rectangle =
      Rectangle(
    10,
    5,
  );

  print(
    rectangle.area,
  );
}


// ============================================================================
// 11. ASSERT IN CONSTRUCTORS
// ============================================================================

class Age {
  final int value;

  Age(
    this.value,
  ) : assert(
          value >= 0,
          "Age cannot be negative",
        );
}


// ============================================================================
// Assert is mainly useful during development.
//
// Do NOT depend on assert for production input validation.
//
// ============================================================================


// ============================================================================
// 12. FACTORY CONSTRUCTORS
// ============================================================================
//
// A factory constructor does not necessarily create a new object every time.
//
// It can:
//
//   • return an existing object
//   • return a subclass
//   • perform validation
//   • parse JSON
//   • implement caching
//
// ============================================================================

class Logger {
  static final Logger _instance =
      Logger._internal();

  Logger._internal();

  factory Logger() {
    return _instance;
  }

  void log(
    String message,
  ) {
    print(message);
  }
}


// ============================================================================

void factoryExample() {
  final logger1 =
      Logger();

  final logger2 =
      Logger();

  print(
    identical(
      logger1,
      logger2,
    ),
  );
}


// ============================================================================
// 13. FACTORY CONSTRUCTOR USE CASE
// ============================================================================
//
// JSON → Dart model
//
// This is extremely important in Flutter.
//
// ============================================================================

class UserModel {
  final String id;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
    );
  }
}


// ============================================================================

void fromJsonExample() {
  final json = {
    "id": "U001",
    "name": "Palash",
    "email": "palash@example.com",
  };

  final user =
      UserModel.fromJson(
    json,
  );

  print(user.name);
}


// ============================================================================
// 14. PRIVATE MEMBERS
// ============================================================================
//
// A name beginning with _ is library-private in Dart.
//
// ============================================================================

class Wallet {
  double _balance = 0;

  void deposit(
    double amount,
  ) {
    if (amount <= 0) {
      return;
    }

    _balance += amount;
  }

  double get balance =>
      _balance;
}


// ============================================================================
// IMPORTANT:
//
// _balance should not be directly modified from outside the library.
//
// This is part of encapsulation.
//
// ============================================================================


// ============================================================================
// 15. GETTERS
// ============================================================================

class Person {
  final String firstName;
  final String lastName;

  Person(
    this.firstName,
    this.lastName,
  );

  String get fullName =>
      "$firstName $lastName";
}


// ============================================================================

void getterExample() {
  final person =
      Person(
    "Mohammad",
    "Palash",
  );

  print(
    person.fullName,
  );
}


// ============================================================================
// Getter usage:
//
// person.fullName
//
// NOT:
//
// person.fullName()
//
// ============================================================================


// ============================================================================
// 16. SETTERS
// ============================================================================

class Temperature {
  double _celsius = 0;

  double get celsius =>
      _celsius;

  set celsius(
    double value,
  ) {
    if (value >= -273.15) {
      _celsius = value;
    }
  }
}


// ============================================================================

void setterExample() {
  final temperature =
      Temperature();

  temperature.celsius =
      25;

  print(
    temperature.celsius,
  );
}


// ============================================================================
// 17. COMPUTED PROPERTIES
// ============================================================================

class Cart {
  final List<double> prices;

  Cart(
    this.prices,
  );

  double get total =>
      prices.fold(
        0,
        (sum, price) =>
            sum + price,
      );
}


// ============================================================================
// 18. STATIC MEMBERS
// ============================================================================
//
// static belongs to the class rather than a specific object.
//
// ============================================================================

class AppConfig {
  static const String
      appName =
      "My ERP";

  static const String
      version =
      "1.0.0";
}


// ============================================================================

void staticExample() {
  print(
    AppConfig.appName,
  );
}


// ============================================================================
// 19. STATIC METHODS
// ============================================================================

class MathUtils {
  static int square(
    int value,
  ) {
    return value * value;
  }
}


// ============================================================================

void staticMethodExample() {
  print(
    MathUtils.square(5),
  );
}


// ============================================================================
// 20. CONST CONSTRUCTORS
// ============================================================================
//
// const constructors allow compile-time constant objects when all fields
// are final and initialized appropriately.
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

void constConstructorExample() {
  const version =
      AppVersion(
    1,
    0,
  );

  print(
    version.major,
  );
}


// ============================================================================
// 21. EXTENDS
// ============================================================================
//
// extends creates inheritance.
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
  final dog =
      Dog();

  dog.eat();
  dog.bark();
}


// ============================================================================
// 22. SUPER
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

  void showBrand() {
    print(brand);
  }
}


class Car extends Vehicle {
  final int doors;

  Car(
    super.brand,
    this.doors,
  );

  void showCar() {
    super.showBrand();

    print(
      "Doors: $doors",
    );
  }
}


// ============================================================================
// 23. METHOD OVERRIDING
// ============================================================================

class Animal2 {
  void sound() {
    print("Animal sound");
  }
}


class Cat extends Animal2 {
  @override
  void sound() {
    print("Meow");
  }
}


// ============================================================================
// 24. @OVERRIDE
// ============================================================================
//
// @override tells Dart that a subclass is intentionally replacing a parent
// member.
//
// It also helps the analyzer detect mistakes.
//
// ============================================================================


// ============================================================================
// 25. CONSTRUCTOR INHERITANCE
// ============================================================================
//
// Constructors are NOT inherited in Dart.
//
// A subclass must define its own constructor if it needs one.
//
// ============================================================================


// ============================================================================
// 26. SUPER PARAMETERS
// ============================================================================
//
// super parameters make forwarding constructor parameters concise.
//
// ============================================================================

class Parent {
  final String name;

  Parent(
    this.name,
  );
}


class Child extends Parent {
  final int age;

  Child(
    super.name,
    this.age,
  );
}


// ============================================================================
// 27. COVARIANT
// ============================================================================
//
// covariant changes the parameter type relationship for overriding.
//
// Use it carefully because it can weaken static type guarantees.
//
// ============================================================================

class AnimalOwner {
  void setAnimal(
    Animal animal,
  ) {}
}


class DogOwner
    extends AnimalOwner {
  @override
  void setAnimal(
    covariant Dog animal,
  ) {}
}


// ============================================================================
// 28. ABSTRACT CLASSES
// ============================================================================
//
// Abstract classes cannot be directly instantiated.
//
// They are commonly used as contracts/base abstractions.
//
// ============================================================================

abstract class PaymentMethod {
  Future<void> pay(
    double amount,
  );
}


// ============================================================================
// 29. ABSTRACT METHODS
// ============================================================================
//
// An abstract method has no implementation in the abstract class.
//
// ============================================================================


// ============================================================================
// 30. CONCRETE IMPLEMENTATION
// ============================================================================

class BkashPayment
    extends PaymentMethod {
  @override
  Future<void> pay(
    double amount,
  ) async {
    print(
      "Paying $amount using bKash",
    );
  }
}


class CardPayment
    extends PaymentMethod {
  @override
  Future<void> pay(
    double amount,
  ) async {
    print(
      "Paying $amount using Card",
    );
  }
}


// ============================================================================
// 31. INTERFACES
// ============================================================================
//
// In Dart, every class implicitly defines an interface.
//
// Any class can be used as an interface with implements.
//
// ============================================================================


// ============================================================================
// 32. IMPLEMENTS
// ============================================================================

class Printable {
  void printData() {
    print("Data");
  }
}


class Report
    implements Printable {
  @override
  void printData() {
    print(
      "Printing report",
    );
  }
}


// ============================================================================
// IMPORTANT:
//
// extends
//   = inherit implementation
//
// implements
//   = promise to implement the interface
//
// ============================================================================


// ============================================================================
// 33. MULTIPLE INTERFACES
// ============================================================================

abstract class Readable {
  void read();
}


abstract class Writable {
  void write();
}


class FileManager
    implements Readable, Writable {
  @override
  void read() {
    print("Reading");
  }

  @override
  void write() {
    print("Writing");
  }
}


// ============================================================================
// 34. ABSTRACT INTERFACE
// ============================================================================
//
// Dart allows explicit interface-style declarations:
//
// abstract interface class
//
// ============================================================================

abstract interface class Repository {
  Future<void> save();
}


// ============================================================================
// 35. POLYMORPHISM
// ============================================================================
//
// One interface can represent different implementations.
//
// ============================================================================

void processPayment(
  PaymentMethod payment,
) async {
  await payment.pay(
    1000,
  );
}


// ============================================================================

void polymorphismExample() {
  final methods =
      <PaymentMethod>[
    BkashPayment(),
    CardPayment(),
  ];

  for (final method in methods) {
    processPayment(method);
  }
}


// ============================================================================
// 36. UPCASTING
// ============================================================================
//
// Child → Parent type.
//
// ============================================================================

void upcastingExample() {
  Animal animal =
      Dog();

  animal.eat();
}


// ============================================================================
// The object is actually Dog,
// but the variable type is Animal.
//
// ============================================================================


// ============================================================================
// 37. DOWNCASTING
// ============================================================================

void downcastingExample() {
  Animal animal =
      Dog();

  final dog =
      animal as Dog;

  dog.bark();
}


// ============================================================================
// 38. RUNTIME TYPE
// ============================================================================

void runtimeTypeExample() {
  final dog =
      Dog();

  print(
    dog.runtimeType,
  );
}


// ============================================================================
// 39. IS
// ============================================================================

void isExample(
  Animal animal,
) {
  if (animal is Dog) {
    animal.bark();
  }
}


// ============================================================================
// 40. AS
// ============================================================================
//
// as explicitly casts a value.
//
// Be careful:
//
// Wrong cast → runtime error.
//
// Prefer:
//
// if (value is Type)
//
// when possible.
//
// ============================================================================


// ============================================================================
// 41. MIXIN BASICS
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


// ============================================================================
// 42. WITH
// ============================================================================

class UserService
    with LoggerMixin {
  void createUser() {
    log(
      "Creating user",
    );
  }
}


// ============================================================================
// 43. MULTIPLE MIXINS
// ============================================================================

mixin CacheMixin {
  void cache(
    String key,
    dynamic value,
  ) {
    print(
      "Cached: $key",
    );
  }
}


class ProductService
    with LoggerMixin, CacheMixin {
  void saveProduct() {
    log(
      "Saving product",
    );

    cache(
      "product",
      "iPhone",
    );
  }
}


// ============================================================================
// 44. ON CONSTRAINT
// ============================================================================
//
// Restricts a mixin to a particular class hierarchy.
//
// ============================================================================

class BaseController {
  void refresh() {
    print("Refreshing");
  }
}


mixin LoadingMixin
    on BaseController {
  bool isLoading = false;

  void startLoading() {
    isLoading = true;
  }

  void stopLoading() {
    isLoading = false;
  }
}


class ProductController
    extends BaseController
    with LoadingMixin {}


// ============================================================================
// 45. MIXIN VS INHERITANCE
// ============================================================================
//
// extends:
//
//   "is a" relationship
//
// Dog extends Animal
//
//
//
// mixin:
//
//   reusable behavior
//
// LoggerMixin
// CacheMixin
// LoadingMixin
//
// ============================================================================
// 46. EXTENSION METHODS
// ============================================================================
//
// Extension methods add functionality to existing types without modifying
// their source code.
//
// ============================================================================

extension StringExtensions
    on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }

    return "${this[0].toUpperCase()}${substring(1)}";
  }
}


// ============================================================================

void extensionExample() {
  print(
    "flutter".capitalizeFirst(),
  );
}


// ============================================================================
// 47. EXTENSION GETTERS
// ============================================================================

extension StringValidation
    on String {
  bool get isEmail {
    return contains("@") &&
        contains(".");
  }
}


// ============================================================================

void extensionGetterExample() {
  print(
    "test@example.com".isEmail,
  );
}


// ============================================================================
// 48. EXTENSION OPERATORS
// ============================================================================
//
// Extensions can also define operators where appropriate.
//
// ============================================================================

extension IntExtensions
    on int {
  bool get isEvenNumber =>
      this % 2 == 0;
}


// ============================================================================
// 49. GENERIC EXTENSIONS
// ============================================================================

extension ListExtensions<T>
    on List<T> {
  T? get firstOrNull {
    if (isEmpty) {
      return null;
    }

    return first;
  }
}


// ============================================================================
// 50. ENCAPSULATION
// ============================================================================
//
// Encapsulation means controlling access to internal state and exposing a
// clean public API.
//
// ============================================================================

class SecureAccount {
  double _balance;

  SecureAccount(
    this._balance,
  );

  double get balance =>
      _balance;

  void deposit(
    double amount,
  ) {
    if (amount > 0) {
      _balance += amount;
    }
  }
}


// ============================================================================
// Outside code cannot directly access _balance from another library.
//
// ============================================================================


// ============================================================================
// 51. COMPOSITION
// ============================================================================
//
// Composition means building a class using other objects.
//
// "has-a" relationship.
//
// ============================================================================

class Engine {
  void start() {
    print(
      "Engine started",
    );
  }
}


class Car2 {
  final Engine engine;

  Car2(
    this.engine,
  );

  void start() {
    engine.start();
  }
}


// ============================================================================
// 52. AGGREGATION
// ============================================================================
//
// A class contains references to objects that can exist independently.
//
// ============================================================================

class Department {
  final List<Employee> employees;

  Department(
    this.employees,
  );
}


// ============================================================================
// 53. ASSOCIATION
// ============================================================================
//
// Two objects know about each other or interact,
// but neither necessarily owns the other.
//
// ============================================================================


// ============================================================================
// 54. DEPENDENCY
// ============================================================================
//
// A class depends on another object to perform its job.
//
// ============================================================================

class EmailService {
  void send(
    String message,
  ) {
    print(
      "Email: $message",
    );
  }
}


class NotificationService {
  final EmailService emailService;

  NotificationService(
    this.emailService,
  );

  void notifyUser() {
    emailService.send(
      "Hello user",
    );
  }
}


// ============================================================================
// 55. IMMUTABLE CLASSES
// ============================================================================
//
// Immutable object state cannot change after creation.
//
// Use final fields + const constructor when possible.
//
// ============================================================================

class Money {
  final double amount;
  final String currency;

  const Money({
    required this.amount,
    required this.currency,
  });
}


// ============================================================================
// 56. VALUE OBJECTS
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
//   ProductSku
//
// ============================================================================


// ============================================================================
// 57. ==
// ============================================================================
//
// By default, objects compare using identity unless equality is overridden.
//
// ============================================================================

class ProductSku {
  final String value;

  const ProductSku(
    this.value,
  );

  @override
  bool operator ==(
    Object other,
  ) {
    return other is ProductSku &&
        other.value == value;
  }

  @override
  int get hashCode =>
      value.hashCode;
}


// ============================================================================
// 58. HASHCODE
// ============================================================================
//
// If you override ==, you should also override hashCode consistently.
//
// ============================================================================


// ============================================================================
// 59. TOSTRING
// ============================================================================

class ProductInfo {
  final String id;
  final String name;

  ProductInfo({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return "ProductInfo(id: $id, name: $name)";
  }
}


// ============================================================================
// 60. IDENTICAL
// ============================================================================
//
// identical(a, b) checks whether two references refer to the same object.
//
// ============================================================================

void identicalExample() {
  final a =
      User();

  final b = a;

  final c =
      User();

  print(
    identical(a, b),
  ); // true

  print(
    identical(a, c),
  ); // false
}


// ============================================================================
// 61. EQUATABLE CONCEPT
// ============================================================================
//
// Packages such as Equatable can reduce boilerplate equality code.
//
// Core Dart itself does not provide Equatable.
//
// Concept:
//
// Two model objects with the same important properties can be considered
// equal by value.
//
// ============================================================================


// ============================================================================
// 62. COPYWITH PATTERN
// ============================================================================
//
// copyWith creates a new object while changing selected fields.
//
// Extremely common in Flutter state management.
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

  print(
    updated.email,
  );
}


// ============================================================================
// 63. SEALED CLASS HIERARCHY
// ============================================================================
//
// Sealed classes are useful for modeling finite state/result types.
//
// ============================================================================

sealed class LoginState {}

class LoginInitial
    extends LoginState {}

class LoginLoading
    extends LoginState {}

class LoginSuccess
    extends LoginState {
  final UserModel user;

  LoginSuccess(
    this.user,
  );
}

class LoginFailure
    extends LoginState {
  final String message;

  LoginFailure(
    this.message,
  );
}


// ============================================================================
// 64. BASE CLASSES
// ============================================================================
//
// base class restricts how the class can be extended/implemented outside
// its library.
//
// ============================================================================

base class BaseRepository {
  void dispose() {
    print(
      "Repository disposed",
    );
  }
}


// ============================================================================
// 65. INTERFACE CLASSES
// ============================================================================

abstract interface class ApiClient {
  Future<Map<String, dynamic>>
      get(
    String path,
  );
}


// ============================================================================
// 66. FINAL CLASSES
// ============================================================================
//
// final class prevents further subclassing.
//
// ============================================================================

final class AppEnvironment {
  final String name;

  const AppEnvironment(
    this.name,
  );
}


// ============================================================================
// 67. CLASS MODIFIERS
// ============================================================================
//
// Dart provides class modifiers such as:
//
//   • abstract
//   • base
//   • interface
//   • final
//   • sealed
//
// They allow you to control how classes can be:
//
//   • extended
//   • implemented
//   • instantiated
//
// Learn these carefully when designing large applications.
//
// ============================================================================
// 68. MODEL CLASSES
// ============================================================================
//
// Models represent application data.
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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
    };
  }

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
// 69. ENTITY CLASSES
// ============================================================================
//
// Entity represents important business/domain identity.
//
// Example:
//
// Product
// Customer
// Order
// Invoice
// Warehouse
// Supplier
//
// In larger Clean Architecture projects, Entity and API DTO can be separate.
//
// ============================================================================


// ============================================================================
// 70. DTO CONCEPT
// ============================================================================
//
// DTO = Data Transfer Object.
//
// Example:
//
// API response JSON
//       ↓
// ProductDto
//       ↓
// ProductEntity
//       ↓
// Domain logic
//
// This separation becomes useful in large enterprise applications.
//
// ============================================================================
// 71. REPOSITORY PATTERN
// ============================================================================

abstract interface class ProductRepository {
  Future<List<ProductModel>>
      getProducts();

  Future<ProductModel>
      getProductById(
    String id,
  );
}


// ============================================================================
// 72. SERVICE PATTERN
// ============================================================================

class ProductService {
  final ProductRepository repository;

  ProductService(
    this.repository,
  );

  Future<List<ProductModel>>
      getProducts() {
    return repository
        .getProducts();
  }
}


// ============================================================================
// 73. CONTROLLER PATTERN
// ============================================================================

class ProductController {
  final ProductService service;

  ProductController(
    this.service,
  );

  List<ProductModel> products =
      [];

  Future<void> loadProducts() async {
    products =
        await service.getProducts();
  }
}


// ============================================================================
// 74. DEPENDENCY INJECTION
// ============================================================================
//
// Instead of creating dependencies inside a class:
//
// WRONG:
//
// class ProductService {
//   final ProductRepository repository =
//       ProductRepositoryImpl();
// }
//
// Better:
//
// class ProductService {
//   final ProductRepository repository;
//
//   ProductService(this.repository);
// }
//
// This is dependency injection.
//
// ============================================================================
// 75. SOLID
// ============================================================================
//
// SOLID:
//
// S = Single Responsibility Principle
// O = Open/Closed Principle
// L = Liskov Substitution Principle
// I = Interface Segregation Principle
// D = Dependency Inversion Principle
//
// ============================================================================
// 76. SINGLE RESPONSIBILITY PRINCIPLE
// ============================================================================
//
// A class should have one main responsibility.
//
// Bad:
//
// UserService
//   • login
//   • database
//   • email
//   • image upload
//   • payment
//   • PDF generation
//
// Better:
//
// AuthService
// UserRepository
// EmailService
// ImageService
// PaymentService
// PdfService
//
// ============================================================================
// 77. OPEN/CLOSED PRINCIPLE
// ============================================================================
//
// Open for extension,
// closed for modification.
//
// Example:
//
// PaymentMethod
//
// Add:
//
// BkashPayment
// CardPayment
// StripePayment
// PaypalPayment
//
// without rewriting the core payment flow.
//
// ============================================================================
// 78. LISKOV SUBSTITUTION PRINCIPLE
// ============================================================================
//
// Child implementations should be safely usable wherever the parent
// abstraction is expected.
//
// ============================================================================
// 79. INTERFACE SEGREGATION PRINCIPLE
// ============================================================================
//
// Prefer small focused interfaces instead of one huge interface.
//
// Bad:
//
// HugeRepository
//
// Better:
//
// UserReader
// UserWriter
// UserDeleter
//
// ============================================================================
// 80. DEPENDENCY INVERSION PRINCIPLE
// ============================================================================
//
// High-level code should depend on abstractions rather than concrete
// implementations.
//
// ============================================================================
// Example:
//
// Controller
//     ↓
// ProductRepository (abstraction)
//     ↓
// ProductRepositoryImpl
//
// Not:
//
// Controller
//     ↓
// MongoRepositoryDirectly
//
// ============================================================================
// 81. USER MODEL
// ============================================================================

class FullUserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;

  const FullUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });

  factory FullUserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return FullUserModel(
      id: json["id"] as String,
      firstName:
          json["firstName"] as String,
      lastName:
          json["lastName"] as String,
      email: json["email"] as String,
      role: json["role"] as String,
    );
  }

  String get fullName =>
      "$firstName $lastName";

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "role": role,
    };
  }
}


// ============================================================================
// 82. PRODUCT MODEL
// ============================================================================
//
// A more realistic ERP product model.
//
// ============================================================================

class ErpProduct {
  final String id;
  final String sku;
  final String name;
  final double sellingPrice;
  final int stock;

  const ErpProduct({
    required this.id,
    required this.sku,
    required this.name,
    required this.sellingPrice,
    required this.stock,
  });

  bool get isOutOfStock =>
      stock <= 0;

  bool get isLowStock =>
      stock > 0 && stock <= 5;

  factory ErpProduct.fromJson(
    Map<String, dynamic> json,
  ) {
    return ErpProduct(
      id: json["_id"] as String,
      sku: json["sku"] as String,
      name: json["name"] as String,
      sellingPrice:
          (json["sellingPrice"] as num)
              .toDouble(),
      stock: json["stock"] as int,
    );
  }
}


// ============================================================================
// 83. API SERVICE
// ============================================================================

class ProductApiService {
  Future<List<ErpProduct>>
      fetchProducts() async {
    // In a real Flutter app:
    //
    // final response =
    //     await http.get(...);
    //
    // final json = jsonDecode(response.body);
    //
    // return ...
    //
    // Here we use mock data.

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    return const [
      ErpProduct(
        id: "P001",
        sku: "IPH-001",
        name: "iPhone",
        sellingPrice: 120000,
        stock: 10,
      ),
    ];
  }
}


// ============================================================================
// 84. REPOSITORY
// ============================================================================

class ErpProductRepository {
  final ProductApiService
      apiService;

  ErpProductRepository(
    this.apiService,
  );

  Future<List<ErpProduct>>
      getProducts() {
    return apiService
        .fetchProducts();
  }
}


// ============================================================================
// 85. CONTROLLER
// ============================================================================

class ErpProductController {
  final ErpProductRepository
      repository;

  ErpProductController(
    this.repository,
  );

  List<ErpProduct> products =
      [];

  bool isLoading = false;

  String? errorMessage;

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;

    try {
      products =
          await repository
              .getProducts();
    } catch (error) {
      errorMessage =
          error.toString();
    } finally {
      isLoading = false;
    }
  }
}


// ============================================================================
// 86. AUTHENTICATION ARCHITECTURE
// ============================================================================

abstract interface class AuthRepository {
  Future<LoginResponse> login(
    String email,
    String password,
  );

  Future<void> logout();

  Future<FullUserModel>
      getCurrentUser();
}


// ============================================================================
// 87. PAYMENT ARCHITECTURE
// ============================================================================

abstract interface class PaymentGateway {
  Future<String> createPayment({
    required double amount,
    required String currency,
  });
}


// ============================================================================

class BkashGateway
    implements PaymentGateway {
  @override
  Future<String> createPayment({
    required double amount,
    required String currency,
  }) async {
    return "BKASH_PAYMENT_ID";
  }
}


class StripeGateway
    implements PaymentGateway {
  @override
  Future<String> createPayment({
    required double amount,
    required String currency,
  }) async {
    return "STRIPE_PAYMENT_ID";
  }
}


// ============================================================================
// 88. ERP ARCHITECTURE
// ============================================================================
//
// Example:
//
// ProductController
//       ↓
// ProductService
//       ↓
// ProductRepository
//       ↓
// ProductApiService
//       ↓
// Node.js / Express API
//
// The controller doesn't need to know how HTTP works.
//
// The repository doesn't need to know how the UI works.
//
// This separation makes large ERP systems easier to maintain.
//
// ============================================================================
// ⭐ MASTER OOP EXAMPLE
// ============================================================================
//
// This combines:
//
//   • abstraction
//   • interface
//   • inheritance
//   • polymorphism
//   • dependency injection
//   • repository
//   • service
//   • controller
//   • models
//
// ============================================================================

abstract interface class ProductDataSource {
  Future<List<ErpProduct>>
      fetchProducts();
}


// ============================================================================

class RemoteProductDataSource
    implements ProductDataSource {
  final ProductApiService api;

  RemoteProductDataSource(
    this.api,
  );

  @override
  Future<List<ErpProduct>>
      fetchProducts() {
    return api.fetchProducts();
  }
}


// ============================================================================

class ProductRepositoryImpl
    implements ProductRepository {
  final ProductDataSource
      dataSource;

  ProductRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<List<ProductModel>>
      getProducts() async {
    final products =
        await dataSource
            .fetchProducts();

    return products
        .map(
          (product) => ProductModel(
            id: product.id,
            name: product.name,
            price:
                product.sellingPrice,
          ),
        )
        .toList();
  }

  @override
  Future<ProductModel>
      getProductById(
    String id,
  ) async {
    final products =
        await getProducts();

    return products.firstWhere(
      (product) =>
          product.id == id,
    );
  }
}


// ============================================================================
// DEPENDENCY INJECTION:
//
// ============================================================================

void dependencyInjectionExample() {
  final api =
      ProductApiService();

  final dataSource =
      RemoteProductDataSource(
    api,
  );

  final repository =
      ProductRepositoryImpl(
    dataSource,
  );

  final service =
      ProductService(
    repository,
  );

  final controller =
      ProductController(
    service,
  );

  controller.loadProducts();
}


// ============================================================================
// ⭐ OOP RELATIONSHIP MAP
// ============================================================================
//
// INHERITANCE:
//
// Dog extends Animal
//
//       Animal
//          ▲
//          │
//         Dog
//
//
//
// IMPLEMENTATION:
//
// PaymentMethod
//       ▲
//       │
//   ┌───┴────┐
//   │        │
// Bkash    Card
//
//
//
// COMPOSITION:
//
// Car
//  │
//  └── Engine
//
//
//
// DEPENDENCY INJECTION:
//
// Controller
//      ↓
//  Service
//      ↓
// Repository
//      ↓
// DataSource
//
// ============================================================================
// ⭐ EXTENDS VS IMPLEMENTS VS WITH
// ============================================================================
//
// extends:
//
//   Reuse parent implementation.
//
// class Dog extends Animal {}
//
//
//
// implements:
//
//   Follow a contract/interface.
//
// class Bkash implements PaymentMethod {}
//
//
//
// with:
//
//   Reuse mixin behavior.
//
// class Controller with LoggerMixin {}
//
// ============================================================================
// ⭐ FACTORY VS NORMAL CONSTRUCTOR
// ============================================================================
//
// Normal constructor:
//
//   creates/initializes an object.
//
// factory:
//
//   controls how an object is returned.
//
// Factory can:
//
//   • return cached object
//   • return subclass
//   • parse JSON
//   • validate data
//   • implement singleton
//
// ============================================================================
// ⭐ MODEL FLOW
// ============================================================================
//
// JSON:
//
// {
//   "_id": "P001",
//   "name": "iPhone",
//   "sellingPrice": 120000
// }
//
//         ↓
//
// ProductModel.fromJson()
//
//         ↓
//
// Dart Object
//
//         ↓
//
// Business Logic
//
//         ↓
//
// ProductModel.toJson()
//
//         ↓
//
// JSON
//
// ============================================================================
// ⭐ WHY OOP MATTERS FOR FLUTTER
// ============================================================================
//
// Flutter widgets themselves are classes:
//
// StatelessWidget
// StatefulWidget
// State
// BuildContext
// Widget
// Element
//
// You will create:
//
// UserModel
// ProductModel
// OrderModel
// AuthService
// ApiService
// Repository
// Controller
// Exception
// State
//
// Therefore OOP is not optional for professional Flutter development.
//
// ============================================================================
// ⭐ PHASE 12 MASTER CHECKLIST
// ============================================================================
//
// CLASS
//
// [ ] Classes
// [ ] Objects
// [ ] Instance variables
// [ ] Instance methods
// [ ] this
// [ ] Constructors
// [ ] Named constructors
// [ ] Redirecting constructors
// [ ] Initializer lists
// [ ] assert
// [ ] factory
// [ ] Private members
// [ ] Getter
// [ ] Setter
// [ ] Static
// [ ] Const constructor
//
// INHERITANCE
//
// [ ] extends
// [ ] super
// [ ] @override
// [ ] Constructor forwarding
// [ ] super parameters
// [ ] covariant
//
// ABSTRACTION
//
// [ ] abstract class
// [ ] abstract method
// [ ] interface
// [ ] implements
// [ ] multiple interfaces
// [ ] abstract interface class
//
// POLYMORPHISM
//
// [ ] Polymorphism
// [ ] Upcasting
// [ ] Downcasting
// [ ] runtimeType
// [ ] is
// [ ] as
//
// MIXINS
//
// [ ] mixin
// [ ] with
// [ ] multiple mixins
// [ ] on
// [ ] mixin vs inheritance
//
// EXTENSIONS
//
// [ ] extension method
// [ ] extension getter
// [ ] generic extension
//
// OBJECT DESIGN
//
// [ ] Encapsulation
// [ ] Composition
// [ ] Aggregation
// [ ] Association
// [ ] Dependency
// [ ] Immutable object
// [ ] Value object
//
// ADVANCED
//
// [ ] ==
// [ ] hashCode
// [ ] toString
// [ ] identical
// [ ] copyWith
// [ ] sealed class
// [ ] base class
// [ ] interface class
// [ ] final class
// [ ] class modifiers
//
// ARCHITECTURE
//
// [ ] Model
// [ ] Entity
// [ ] DTO
// [ ] Repository
// [ ] Service
// [ ] Controller
// [ ] Dependency Injection
// [ ] SOLID
//
// ============================================================================
// ⭐ MOST IMPORTANT TOPICS TO MASTER
// ============================================================================
//
// 1. Class & Object
// 2. Constructor
// 3. Named Constructor
// 4. Factory Constructor
// 5. Getter / Setter
// 6. Encapsulation
// 7. extends
// 8. implements
// 9. abstract
// 10. polymorphism
// 11. mixin
// 12. extension
// 13. == / hashCode
// 14. copyWith
// 15. sealed classes
// 16. composition
// 17. dependency injection
// 18. repository pattern
// 19. SOLID
// 20. JSON model architecture
//
// ============================================================================
// ⭐ FULL-STACK FLUTTER OOP ARCHITECTURE
// ============================================================================
//
//                  FLUTTER UI
//                      │
//                      ▼
//                 Controller
//                      │
//                      ▼
//                   Service
//                      │
//                      ▼
//              Repository Interface
//                      │
//                      ▼
//            Repository Implementation
//                      │
//                      ▼
//                 Data Source
//                      │
//                      ▼
//                 API Service
//                      │
//                      ▼
//              Node.js / Express
//                      │
//                      ▼
//                  MongoDB
//
// ============================================================================
// END OF PHASE 12
// ============================================================================
//
// NEXT:
//
// PHASE 13 — DART COLLECTIONS + GENERICS + ITERABLE MASTERCLASS
//
// It will cover:
//
//   • List deep dive
//   • Set deep dive
//   • Map deep dive
//   • Iterable
//   • Iterators
//   • where
//   • map
//   • expand
//   • fold
//   • reduce
//   • any
//   • every
//   • firstWhere
//   • singleWhere
//   • collection performance
//   • generic classes
//   • generic methods
//   • generic constraints
//   • covariance / contravariance concepts
//   • type-safe API models
//   • pagination data
//   • inventory data
//   • ERP collection examples
//
// ============================================================================
