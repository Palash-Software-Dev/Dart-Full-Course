// ============================================================================
// DART MASTER ROADMAP
// PHASE 28 — PACKAGES, PUBSPEC, TESTING, LINTING & PRODUCTION TOOLING
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// In Phase 28 you will learn how professional Dart projects are organized,
// how packages/dependencies work, how to test Dart code, how to use the Dart
// analyzer and formatter, and how to maintain production-quality code.
//
// IMPORTANT:
// This phase contains some YAML / terminal concepts because pubspec.yaml,
// package management, testing and analyzer configuration cannot be understood
// properly using Dart code alone.
//
// ============================================================================
// CONTENT
// ----------------------------------------------------------------------------
//
// 01. What is a Dart package?
// 02. Package vs application
// 03. Dart package structure
// 04. pubspec.yaml
// 05. package name
// 06. package description
// 07. version
// 08. environment
// 09. dependencies
// 10. dev_dependencies
// 11. dependency_overrides
// 12. dependency sources
// 13. hosted dependencies
// 14. git dependencies
// 15. path dependencies
// 16. SDK dependencies
// 17. pub get
// 18. pub upgrade
// 19. pub outdated
// 20. pub remove
// 21. pub add
// 22. pubspec.lock
// 23. .dart_tool
// 24. package imports
// 25. relative imports
// 26. package imports vs relative imports
// 27. library organization
// 28. exports
// 29. barrel files
// 30. private files
// 31. library privacy
// 32. dart analyze
// 33. dart format
// 34. dart fix
// 35. static analysis
// 36. lint rules
// 37. analysis_options.yaml
// 38. compiler errors
// 39. warnings
// 40. info messages
// 41. unit testing
// 42. test package
// 43. test folder
// 44. test files
// 45. test()
// 46. expect()
// 47. matchers
// 48. groups
// 49. setUp()
// 50. tearDown()
// 51. setUpAll()
// 52. tearDownAll()
// 53. testing exceptions
// 54. testing async code
// 55. testing Futures
// 56. testing Streams
// 57. testing classes
// 58. testing repositories
// 59. testing business logic
// 60. test naming
// 61. test organization
// 62. fake objects
// 63. mock concepts
// 64. integration testing concept
// 65. code coverage concept
// 66. CI quality checks
// 67. production workflow
//
// ============================================================================


// ============================================================================
// 01. WHAT IS A DART PACKAGE?
// ----------------------------------------------------------------------------
//
// A package is a reusable unit of Dart code.
//
// Examples:
//
// • Your own reusable package
// • HTTP package
// • Database package
// • Utility package
// • Flutter package
//
// A package normally contains:
//
// lib/
// test/
// pubspec.yaml
//
// ============================================================================


// ============================================================================
// 02. PACKAGE VS APPLICATION
// ----------------------------------------------------------------------------
//
// APPLICATION
// ------------
// A complete executable project.
//
// Example:
//
// Flutter application
//
// PACKAGE
// -------
// Reusable code that can be imported by another application.
//
// Example:
//
// authentication package
// payment package
// network package
//
// ============================================================================


// ============================================================================
// 03. TYPICAL DART PACKAGE STRUCTURE
// ----------------------------------------------------------------------------
//
// my_package/
// │
// ├── lib/
// │   ├── my_package.dart
// │   └── src/
// │       ├── models/
// │       ├── services/
// │       └── utils/
// │
// ├── test/
// │   └── my_package_test.dart
// │
// ├── pubspec.yaml
// ├── README.md
// └── CHANGELOG.md
//
// ============================================================================


// ============================================================================
// 04. PUBSPEC.YAML
// ----------------------------------------------------------------------------
//
// pubspec.yaml is the main configuration file for a Dart/Flutter package.
//
// It describes:
//
// • Project name
// • Version
// • SDK requirements
// • Dependencies
// • Dev dependencies
// • Assets in Flutter
// • Package metadata
//
// ============================================================================


// ============================================================================
// 05. EXAMPLE PUBSPEC.YAML
// ----------------------------------------------------------------------------
//
// NOTE:
// This is YAML, not Dart.
//
// name: ecommerce_core
// description: Core functionality for an e-commerce application.
// version: 1.0.0
//
// environment:
//   sdk: ^3.8.0
//
// dependencies:
//   http: ^1.5.0
//
// dev_dependencies:
//   test: ^1.26.0
//
// ============================================================================


// ============================================================================
// 06. PACKAGE NAME
// ----------------------------------------------------------------------------
//
// name: ecommerce_core
//
// The package name should:
//
// • Be lowercase
// • Use underscores
// • Be meaningful
//
// Good:
//
// ecommerce_core
// auth_service
// inventory_manager
//
// Avoid:
//
// EcommerceCore
// myPackage
//
// ============================================================================


// ============================================================================
// 07. DESCRIPTION
// ----------------------------------------------------------------------------
//
// description:
//
// Explains what the package does.
//
// Example:
//
// description:
//   Authentication and authorization utilities for Flutter applications.
//
// Keep it short and meaningful.
//
// ============================================================================


// ============================================================================
// 08. VERSION
// ----------------------------------------------------------------------------
//
// version: 1.0.0
//
// Standard semantic versioning:
//
// MAJOR.MINOR.PATCH
//
// Example:
//
// 1.0.0
// 1.2.0
// 1.2.1
// 2.0.0
//
// ============================================================================


// ============================================================================
// 09. SEMANTIC VERSIONING
// ----------------------------------------------------------------------------
//
// MAJOR
// -----
// Breaking changes.
//
// 1.0.0 → 2.0.0
//
// MINOR
// -----
// New backwards-compatible features.
//
// 1.0.0 → 1.1.0
//
// PATCH
// -----
// Bug fixes.
//
// 1.0.0 → 1.0.1
//
// ============================================================================


// ============================================================================
// 10. ENVIRONMENT
// ----------------------------------------------------------------------------
//
// environment:
//
// Defines supported SDK versions.
//
// Example:
//
// environment:
//   sdk: ^3.8.0
//
// This tells Dart which SDK versions the package supports.
//
// ============================================================================


// ============================================================================
// 11. DEPENDENCIES
// ----------------------------------------------------------------------------
//
// dependencies:
//
// Runtime packages required by your application.
//
// Example:
//
// dependencies:
//   http: ^1.5.0
//
// If your application uses the package at runtime,
// it normally belongs in dependencies.
//
// ============================================================================


// ============================================================================
// 12. DEV_DEPENDENCIES
// ----------------------------------------------------------------------------
//
// dev_dependencies:
//
// Packages needed only during development.
//
// Examples:
//
// • test
// • lints
// • code generation tools
//
// Example:
//
// dev_dependencies:
//   test: ^1.26.0
//   lints: ^6.0.0
//
// ============================================================================


// ============================================================================
// 13. DEPENDENCIES VS DEV_DEPENDENCIES
// ----------------------------------------------------------------------------
//
// dependencies:
//
// Needed by the application/package at runtime.
//
// dev_dependencies:
//
// Needed only to develop/test/build the project.
//
// Example:
//
// HTTP client:
//
// dependencies:
//
// Test framework:
//
// dev_dependencies:
//
// ============================================================================


// ============================================================================
// 14. DEPENDENCY OVERRIDES
// ----------------------------------------------------------------------------
//
// dependency_overrides:
//
// Forces a particular dependency version/source.
//
// Example:
//
// dependency_overrides:
//   some_package:
//     path: ../some_package
//
// This is powerful but should be used carefully.
//
// Do NOT use dependency_overrides casually in production.
//
// ============================================================================


// ============================================================================
// 15. HOSTED DEPENDENCY
// ----------------------------------------------------------------------------
//
// Most packages come from pub.dev.
//
// Example:
//
// dependencies:
//   http: ^1.5.0
//
// The default source is the Dart package repository.
//
// ============================================================================


// ============================================================================
// 16. GIT DEPENDENCY
// ----------------------------------------------------------------------------
//
// You can depend on a Git repository.
//
// Example:
//
// dependencies:
//   my_package:
//     git:
//       url: https://github.com/example/my_package.git
//
// This is useful when:
//
// • Package isn't published yet
// • You need a specific repository version
// • You need a development branch
//
// ============================================================================


// ============================================================================
// 17. PATH DEPENDENCY
// ----------------------------------------------------------------------------
//
// Useful for local packages.
//
// Example:
//
// dependencies:
//   shared_core:
//     path: ../shared_core
//
// Directory:
//
// project/
// ├── app/
// └── shared_core/
//
// ============================================================================


// ============================================================================
// 18. SDK DEPENDENCY
// ----------------------------------------------------------------------------
//
// A package can come from an SDK.
//
// Example:
//
// dependencies:
//   flutter:
//     sdk: flutter
//
// In Flutter applications this is very common.
//
// ============================================================================


// ============================================================================
// 19. PUB GET
// ----------------------------------------------------------------------------
//
// Command:
//
// dart pub get
//
// It resolves dependencies and downloads required packages.
//
// Flutter:
//
// flutter pub get
//
// ============================================================================


// ============================================================================
// 20. PUB ADD
// ----------------------------------------------------------------------------
//
// Instead of manually editing pubspec.yaml:
//
// dart pub add http
//
// This adds a dependency automatically.
//
// Dev dependency:
//
// dart pub add --dev test
//
// Flutter:
//
// flutter pub add http
//
// ============================================================================


// ============================================================================
// 21. PUB REMOVE
// ----------------------------------------------------------------------------
//
// Remove a dependency:
//
// dart pub remove http
//
// Flutter:
//
// flutter pub remove http
//
// ============================================================================


// ============================================================================
// 22. PUB UPGRADE
// ----------------------------------------------------------------------------
//
// Updates dependencies according to your constraints.
//
// Command:
//
// dart pub upgrade
//
// Flutter:
//
// flutter pub upgrade
//
// ============================================================================


// ============================================================================
// 23. PUB OUTDATED
// ----------------------------------------------------------------------------
//
// Shows outdated dependencies.
//
// Command:
//
// dart pub outdated
//
// This helps you understand:
//
// • Current version
// • Upgradable version
// • Resolvable version
// • Latest version
//
// ============================================================================


// ============================================================================
// 24. PUBSPEC.LOCK
// ----------------------------------------------------------------------------
//
// pubspec.lock stores resolved dependency versions.
//
// Example:
//
// Your pubspec says:
//
// http: ^1.5.0
//
// pub may resolve:
//
// http 1.5.0
//
// The lock file records the resolved version.
//
// ============================================================================


// ============================================================================
// 25. SHOULD PUBSPEC.LOCK BE COMMITTED?
// ----------------------------------------------------------------------------
//
// For applications:
//
// Usually YES.
//
// This makes dependency resolution reproducible.
//
// For reusable packages/libraries:
//
// The usual practice differs; lock files generally aren't committed for
// published libraries/packages.
//
// Remember this distinction.
//
// ============================================================================


// ============================================================================
// 26. .DART_TOOL
// ----------------------------------------------------------------------------
//
// .dart_tool/
//
// Contains generated tooling information.
//
// Examples:
//
// • Package configuration
// • Build/tool metadata
//
// Usually:
//
// DO NOT manually edit it.
//
// DO NOT commit it to Git.
//
// ============================================================================


// ============================================================================
// 27. PACKAGE IMPORT
// ----------------------------------------------------------------------------
//
// Example:
//
// import 'package:http/http.dart' as http;
//
// Package imports identify the package by name.
//
// ============================================================================


// ============================================================================
// 28. RELATIVE IMPORT
// ----------------------------------------------------------------------------
//
// Example:
//
// import '../models/user.dart';
//
// This references a file relative to the current file.
//
// ============================================================================


// ============================================================================
// 29. PACKAGE IMPORT VS RELATIVE IMPORT
// ----------------------------------------------------------------------------
//
// In large applications, package imports are generally preferable for files
// inside lib/.
//
// Example:
//
// import 'package:my_app/models/user.dart';
//
// Instead of:
//
// import '../../models/user.dart';
//
// Why?
//
// • Easier refactoring
// • Cleaner architecture
// • Less path traversal
// • Easier to understand
//
// ============================================================================


// ============================================================================
// 30. IMPORTANT FLUTTER IMPORT RULE
// ----------------------------------------------------------------------------
//
// Prefer:
//
// import 'package:my_app/...';
//
// for files inside your own lib/ directory.
//
// Use relative imports only when there is a clear reason.
//
// ============================================================================


// ============================================================================
// 31. LIBRARY
// ----------------------------------------------------------------------------
//
// A Dart library is a unit of code that can expose or hide declarations.
//
// Modern Dart usually doesn't require an explicit:
//
// library;
//
// declaration for ordinary files.
//
// ============================================================================


// ============================================================================
// 32. PRIVATE DECLARATIONS
// ----------------------------------------------------------------------------
//
// Dart uses `_` to make a declaration library-private.
//
// Example:
//
// class _UserMapper {}
//
// This class is accessible only within the same Dart library.
//
// ============================================================================

class _PrivateHelper {
  const _PrivateHelper();

  void execute() {
    print("Private helper");
  }
}


// ============================================================================
// 33. PUBLIC DECLARATION
// ----------------------------------------------------------------------------
//
// No `_`:
//
// class User {}
//
// It can be accessed from other libraries.
//
// ============================================================================

class PublicUser {
  final String name;

  const PublicUser(
    this.name,
  );
}


// ============================================================================
// 34. PRIVATE VARIABLES
// ============================================================================

class Account {
  String _password = "";

  void setPassword(
    String password,
  ) {
    _password = password;
  }
}


// ============================================================================
// 35. EXPORT
// ----------------------------------------------------------------------------
//
// export allows another library to expose declarations from another library.
//
// Example:
//
// export 'src/models/user.dart';
// export 'src/services/auth_service.dart';
//
// ============================================================================


// ============================================================================
// 36. BARREL FILE
// ----------------------------------------------------------------------------
//
// A barrel file exports multiple files.
//
// Example:
//
// lib/
// ├── app.dart
// ├── models/
// │   ├── user.dart
// │   ├── product.dart
// │   └── order.dart
//
// You can create:
//
// lib/models/models.dart
//
// containing:
//
// export 'user.dart';
// export 'product.dart';
// export 'order.dart';
//
// ============================================================================


// ============================================================================
// 37. BARREL FILE USAGE
// ----------------------------------------------------------------------------
//
// Instead of:
//
// import 'package:app/models/user.dart';
// import 'package:app/models/product.dart';
// import 'package:app/models/order.dart';
//
// You can use:
//
// import 'package:app/models/models.dart';
//
// ============================================================================


// ============================================================================
// 38. BARREL FILE WARNING
// ----------------------------------------------------------------------------
//
// Don't create giant barrel files that export your entire application.
//
// Huge barrel files can:
//
// • Increase coupling
// • Hide dependencies
// • Create circular dependency problems
//
// Use them thoughtfully.
//
// ============================================================================


// ============================================================================
// 39. EXPORT WITH SHOW
// ----------------------------------------------------------------------------
//
// You can expose only specific declarations.
//
// Example:
//
// export 'src/models.dart'
//     show User, Product;
//
// ============================================================================


// ============================================================================
// 40. EXPORT WITH HIDE
// ----------------------------------------------------------------------------
//
// You can hide declarations.
//
// Example:
//
// export 'src/models.dart'
//     hide InternalHelper;
//
// ============================================================================


// ============================================================================
// 41. IMPORT WITH SHOW
// ----------------------------------------------------------------------------
//
// import 'package:app/models.dart'
//     show User;
//
// Only User is imported.
//
// ============================================================================


// ============================================================================
// 42. IMPORT WITH HIDE
// ----------------------------------------------------------------------------
//
// import 'package:app/models.dart'
//     hide InternalModel;
//
// ============================================================================


// ============================================================================
// 43. IMPORT AS
// ----------------------------------------------------------------------------
//
// Useful when two libraries contain the same name.
//
// ============================================================================

import 'dart:math' as math;


// ============================================================================
// 44. USING IMPORT PREFIX
// ============================================================================

void importPrefixExample() {
  final value =
      math.max(
    10,
    20,
  );

  print(value);
}


// ============================================================================
// 45. CONDITIONAL IMPORTS
// ----------------------------------------------------------------------------
//
// Dart can choose different implementations depending on platform/library
// availability.
//
// Concept:
//
// import 'stub.dart'
//   if (dart.library.io) 'io.dart'
//   if (dart.library.html) 'web.dart';
//
// This is useful for cross-platform packages.
//
// ============================================================================


// ============================================================================
// 46. DART ANALYZE
// ----------------------------------------------------------------------------
//
// Command:
//
// dart analyze
//
// It checks your code using static analysis.
//
// Flutter:
//
// flutter analyze
//
// ============================================================================


// ============================================================================
// 47. WHY dart analyze MATTERS
// ----------------------------------------------------------------------------
//
// It catches:
//
// • Undefined names
// • Type problems
// • Invalid overrides
// • Unused imports
// • Suspicious code
// • Lint violations
// • API misuse
//
// Use it regularly.
//
// ============================================================================


// ============================================================================
// 48. DART FORMAT
// ----------------------------------------------------------------------------
//
// Command:
//
// dart format .
//
// Formats Dart source code.
//
// Flutter:
//
// dart format .
//
// or:
//
// flutter format
//
// depending on your workflow/tooling.
//
// ============================================================================


// ============================================================================
// 49. WHY FORMAT CODE?
// ----------------------------------------------------------------------------
//
// Formatting gives:
//
// • Consistent indentation
// • Consistent line breaks
// • Cleaner diffs
// • Easier code review
// • Better readability
//
// Don't manually fight the formatter.
//
// ============================================================================


// ============================================================================
// 50. DART FIX
// ----------------------------------------------------------------------------
//
// Command:
//
// dart fix --dry-run
//
// Shows automated fixes.
//
// Apply fixes:
//
// dart fix --apply
//
// Always review changes after automated fixes.
//
// ============================================================================


// ============================================================================
// 51. STATIC ANALYSIS
// ----------------------------------------------------------------------------
//
// Static analysis means examining source code without executing it.
//
// Example:
//
// int age = "25";
//
// Analyzer can detect that:
//
// String
//
// cannot be assigned to:
//
// int
//
// ============================================================================


// ============================================================================
// 52. COMPILE-TIME ERROR
// ----------------------------------------------------------------------------
//
// Example:
//
// int calculate() {
//   return "hello";
// }
//
// This is a type error.
//
// The compiler/analyzer can catch it before runtime.
//
// ============================================================================


// ============================================================================
// 53. WARNING
// ----------------------------------------------------------------------------
//
// Some problems may be warnings rather than fatal errors depending on the
// analyzer rule and configuration.
//
// Treat important warnings seriously.
//
// Production code should ideally have no analyzer issues.
//
// ============================================================================


// ============================================================================
// 54. LINT
// ----------------------------------------------------------------------------
//
// A lint is a rule that detects potentially undesirable code style or
// practices.
//
// Example:
//
// Unused local variables
// Unnecessary casts
// Poor naming
// Missing documentation in certain APIs
//
// ============================================================================


// ============================================================================
// 55. ANALYSIS_OPTIONS.YAML
// ----------------------------------------------------------------------------
//
// This file configures analyzer/lint behavior.
//
// Typical structure:
//
// include: package:lints/recommended.yaml
//
// analyzer:
//   exclude:
//     - build/**
//
// linter:
//   rules:
//     - avoid_print
//
// ============================================================================


// ============================================================================
// 56. LINT RULE EXAMPLE
// ----------------------------------------------------------------------------
//
// avoid_print
//
// In production Flutter applications you often use:
//
// logger
//
// instead of:
//
// print()
//
// But print is still useful during learning/debugging.
//
// ============================================================================


// ============================================================================
// 57. CUSTOM LINT CONFIGURATION
// ----------------------------------------------------------------------------
//
// Example:
//
// linter:
//   rules:
//     avoid_print: true
//
// YAML is configuration, not Dart.
//
// ============================================================================


// ============================================================================
// 58. TESTING
// ----------------------------------------------------------------------------
//
// Testing verifies that your code behaves correctly.
//
// Main categories:
//
// • Unit tests
// • Widget tests
// • Integration tests
//
// Phase 28 focuses primarily on Dart unit testing concepts.
//
// ============================================================================


// ============================================================================
// 59. UNIT TEST
// ----------------------------------------------------------------------------
//
// A unit test tests a small unit of logic independently.
//
// Example:
//
// add(2, 3)
//
// should return:
//
// 5
//
// ============================================================================


// ============================================================================
// 60. TEST PACKAGE
// ----------------------------------------------------------------------------
//
// Dart uses the `test` package for unit testing.
//
// Add:
//
// dev_dependencies:
//   test: ...
//
// Then:
//
// dart pub get
//
// ============================================================================


// ============================================================================
// 61. TEST FILE STRUCTURE
// ----------------------------------------------------------------------------
//
// test/
// ├── calculator_test.dart
// ├── user_test.dart
// └── product_test.dart
//
// Test files conventionally end with:
//
// _test.dart
//
// ============================================================================


// ============================================================================
// 62. BASIC FUNCTION TO TEST
// ============================================================================

int add(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================
// 63. BASIC TEST
// ----------------------------------------------------------------------------
//
// File:
//
// test/calculator_test.dart
//
// Example:
//
// import 'package:test/test.dart';
//
// void main() {
//   test(
//     'adds two numbers',
//     () {
//       expect(
//         add(2, 3),
//         equals(5),
//       );
//     },
//   );
// }
//
// ============================================================================


// ============================================================================
// 64. TEST()
// ----------------------------------------------------------------------------
//
// test() defines an individual test.
//
// Syntax:
//
// test(
//   'description',
//   () {
//     // assertions
//   },
// );
//
// ============================================================================


// ============================================================================
// 65. EXPECT()
// ----------------------------------------------------------------------------
//
// expect(actual, matcher)
//
// Example:
//
// expect(
//   add(2, 3),
//   equals(5),
// );
//
// First argument:
//
// actual result
//
// Second argument:
//
// expected condition
//
// ============================================================================


// ============================================================================
// 66. EQUALS MATCHER
// ============================================================================

void equalityTestConcept() {
  // expect(
  //   add(10, 20),
  //   equals(30),
  // );
}


// ============================================================================
// 67. TRUE / FALSE MATCHERS
// ----------------------------------------------------------------------------
//
// expect(value, isTrue);
//
// expect(value, isFalse);
//
// ============================================================================


// ============================================================================
// 68. NULL MATCHER
// ----------------------------------------------------------------------------
//
// expect(value, isNull);
//
// expect(value, isNotNull);
//
// ============================================================================


// ============================================================================
// 69. TYPE MATCHER
// ----------------------------------------------------------------------------
//
// expect(value, isA<String>());
//
// ============================================================================


// ============================================================================
// 70. GREATER / LESS MATCHERS
// ----------------------------------------------------------------------------
//
// expect(value, greaterThan(10));
//
// expect(value, lessThan(100));
//
// expect(value, greaterThanOrEqualTo(10));
//
// expect(value, lessThanOrEqualTo(100));
//
// ============================================================================


// ============================================================================
// 71. CONTAINS MATCHER
// ----------------------------------------------------------------------------
//
// expect(
//   ["Dart", "Flutter"],
//   contains("Dart"),
// );
//
// ============================================================================


// ============================================================================
// 72. CONTAINS MATCHER FOR STRING
// ----------------------------------------------------------------------------
//
// expect(
//   "Hello Dart",
//   contains("Dart"),
// );
//
// ============================================================================


// ============================================================================
// 73. LIST MATCHER
// ----------------------------------------------------------------------------
//
// expect(
//   [1, 2, 3],
//   equals([1, 2, 3]),
// );
//
// ============================================================================


// ============================================================================
// 74. STRING MATCHER
// ----------------------------------------------------------------------------
//
// expect(
//   "Palash",
//   startsWith("Pal"),
// );
//
// expect(
//   "Palash",
//   endsWith("ash"),
// );
//
// ============================================================================


// ============================================================================
// 75. GROUP
// ----------------------------------------------------------------------------
//
// group() organizes related tests.
//
// Example:
//
// group(
//   'Calculator',
//   () {
//
//     test(...);
//
//     test(...);
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 76. SETUP
// ----------------------------------------------------------------------------
//
// setUp() runs before every test in the group.
//
// Concept:
//
// group(
//   'User service',
//   () {
//
//     setUp(() {
//       // prepare data
//     });
//
//     test(...);
//     test(...);
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 77. TEARDOWN
// ----------------------------------------------------------------------------
//
// tearDown() runs after every test.
//
// Useful for cleanup.
//
// ============================================================================


// ============================================================================
// 78. SETUP ALL
// ----------------------------------------------------------------------------
//
// setUpAll() runs once before all tests in a group.
//
// Useful for:
//
// • Expensive initialization
// • Test database setup
// • Shared resources
//
// ============================================================================


// ============================================================================
// 79. TEARDOWN ALL
// ----------------------------------------------------------------------------
//
// tearDownAll() runs once after all tests.
//
// Useful for cleanup of shared resources.
//
// ============================================================================


// ============================================================================
// 80. CLASS TO TEST
// ============================================================================

class Calculator {
  int add(
    int a,
    int b,
  ) {
    return a + b;
  }

  int subtract(
    int a,
    int b,
  ) {
    return a - b;
  }

  int multiply(
    int a,
    int b,
  ) {
    return a * b;
  }
}


// ============================================================================
// 81. TESTING A CLASS
// ----------------------------------------------------------------------------
//
// Example:
//
// group(
//   'Calculator',
//   () {
//
//     final calculator = Calculator();
//
//     test(
//       'adds',
//       () {
//         expect(
//           calculator.add(2, 3),
//           equals(5),
//         );
//       },
//     );
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 82. TESTING EXCEPTIONS
// ----------------------------------------------------------------------------
//
// Use:
//
// throwsA()
//
// Example:
//
// expect(
//   () => functionThatThrows(),
//   throwsA(isA<ArgumentError>()),
// );
//
// ============================================================================


// ============================================================================
// 83. FUNCTION THAT THROWS
// ============================================================================

int divide(
  int a,
  int b,
) {
  if (b == 0) {
    throw ArgumentError(
      "Cannot divide by zero",
    );
  }

  return a ~/ b;
}


// ============================================================================
// 84. EXCEPTION TEST CONCEPT
// ----------------------------------------------------------------------------
//
// expect(
//   () => divide(10, 0),
//   throwsA(
//     isA<ArgumentError>(),
//   ),
// );
//
// ============================================================================


// ============================================================================
// 85. ASYNC TESTING
// ----------------------------------------------------------------------------
//
// Tests can be async.
//
// Example:
//
// test(
//   'loads user',
//   () async {
//
//     final user =
//         await loadUser();
//
//     expect(
//       user.name,
//       equals("Palash"),
//     );
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 86. ASYNC FUNCTION
// ============================================================================

Future<String> loadName() async {
  await Future.delayed(
    const Duration(
      milliseconds: 10,
    ),
  );

  return "Palash";
}


// ============================================================================
// 87. ASYNC TEST CONCEPT
// ----------------------------------------------------------------------------
//
// test(
//   'loads name',
//   () async {
//
//     final name =
//         await loadName();
//
//     expect(
//       name,
//       equals("Palash"),
//     );
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 88. FUTURE ERROR TEST
// ----------------------------------------------------------------------------
//
// expect(
//   () async {
//     await failingFunction();
//   },
//   throwsA(isA<Exception>()),
// );
//
// ============================================================================


// ============================================================================
// 89. TESTING STREAMS
// ----------------------------------------------------------------------------
//
// Stream tests can use matchers designed for streams.
//
// Concept:
//
// expect(
//   stream,
//   emitsInOrder([
//     1,
//     2,
//     3,
//   ]),
// );
//
// ============================================================================


// ============================================================================
// 90. STREAM EXAMPLE
// ============================================================================

Stream<int> numbers() async* {
  yield 1;
  yield 2;
  yield 3;
}


// ============================================================================
// 91. STREAM TEST CONCEPT
// ----------------------------------------------------------------------------
//
// expect(
//   numbers(),
//   emitsInOrder([
//     1,
//     2,
//     3,
//   ]),
// );
//
// ============================================================================


// ============================================================================
// 92. TESTING MODELS
// ----------------------------------------------------------------------------
//
// Example model:
//
// class User {
//   final String name;
//   final int age;
//
//   const User({
//     required this.name,
//     required this.age,
//   });
// }
//
// Tests can verify:
//
// • Constructor behavior
// • Getters
// • Methods
// • Serialization
// • Equality
//
// ============================================================================


// ============================================================================
// 93. TESTING BUSINESS LOGIC
// ----------------------------------------------------------------------------
//
// Example:
//
// calculateDiscount()
//
// should be tested with:
//
// • 0%
// • 10%
// • 50%
// • 100%
// • Negative input
// • Invalid input
//
// ============================================================================

double calculateDiscount(
  double price,
  double percentage,
) {
  if (price < 0) {
    throw ArgumentError(
      "Price cannot be negative",
    );
  }

  if (percentage < 0 ||
      percentage > 100) {
    throw ArgumentError(
      "Invalid discount",
    );
  }

  return price -
      (price * percentage / 100);
}


// ============================================================================
// 94. BUSINESS LOGIC TEST CASES
// ----------------------------------------------------------------------------
//
// Example expectations:
//
// calculateDiscount(
//   1000,
//   10,
// )
//
// → 900
//
// calculateDiscount(
//   1000,
//   50,
// )
//
// → 500
//
// ============================================================================


// ============================================================================
// 95. FLOATING POINT TESTING
// ----------------------------------------------------------------------------
//
// Don't always expect exact floating-point equality.
//
// Prefer:
//
// closeTo()
//
// Example:
//
// expect(
//   result,
//   closeTo(
//     900.0,
//     0.001,
//   ),
// );
//
// ============================================================================


// ============================================================================
// 96. TESTING REPOSITORIES
// ----------------------------------------------------------------------------
//
// Repository:
//
// ProductRepository
//
// You should test:
//
// • Successful request
// • Empty response
// • Server error
// • Parsing error
// • Network exception
//
// ============================================================================


// ============================================================================
// 97. TESTING CONTROLLERS
// ----------------------------------------------------------------------------
//
// Controller tests should verify state transitions.
//
// Example:
//
// Initial
//   ↓
// Loading
//   ↓
// Success
//
// Or:
//
// Initial
//   ↓
// Loading
//   ↓
// Error
//
// ============================================================================


// ============================================================================
// 98. TESTING SEALED STATES
// ----------------------------------------------------------------------------
//
// Example:
//
// final state =
//     const ProductLoading();
//
// expect(
//   state,
//   isA<ProductLoading>(),
// );
//
// ============================================================================


// ============================================================================
// 99. TESTING SUCCESS STATE
// ----------------------------------------------------------------------------
//
// final state =
//     ProductLoaded(
//       [product],
//     );
//
// expect(
//   state,
//   isA<ProductLoaded>(),
// );
//
// ============================================================================


// ============================================================================
// 100. TEST NAMING
// ----------------------------------------------------------------------------
//
// Bad:
//
// test('test1', ...)
//
// Better:
//
// test(
//   'returns discounted price when discount is 10%',
//   ...
// );
//
// A good test name describes:
//
// WHAT
// +
// CONDITION
// +
// EXPECTED RESULT
//
// ============================================================================


// ============================================================================
// 101. TEST ARRANGE-ACT-ASSERT
// ----------------------------------------------------------------------------
//
// A very useful pattern:
//
// ARRANGE
// -------
// Prepare data.
//
// ACT
// ---
// Execute function.
//
// ASSERT
// ------
// Verify result.
//
// ============================================================================


// ============================================================================
// 102. ARRANGE-ACT-ASSERT EXAMPLE
// ----------------------------------------------------------------------------
//
// test(
//   'calculates 10 percent discount',
//   () {
//
//     // Arrange
//     const price = 1000.0;
//
//     // Act
//     final result =
//         calculateDiscount(
//       price,
//       10,
//     );
//
//     // Assert
//     expect(
//       result,
//       closeTo(
//         900,
//         0.001,
//       ),
//     );
//
//   },
// );
//
// ============================================================================


// ============================================================================
// 103. TEST EDGE CASES
// ----------------------------------------------------------------------------
//
// Always test:
//
// • Minimum value
// • Maximum value
// • Empty data
// • Null data
// • Invalid data
// • Boundary values
// • Exceptions
//
// ============================================================================


// ============================================================================
// 104. ERP STOCK TEST EXAMPLE
// ----------------------------------------------------------------------------

String stockLabel(
  int stock,
) {
  if (stock <= 0) {
    return "Out of Stock";
  }

  if (stock <= 5) {
    return "Low Stock";
  }

  return "In Stock";
}


// ============================================================================
// TEST CASES SHOULD INCLUDE:
//
// stock = 0
// → Out of Stock
//
// stock = -1
// → Out of Stock
//
// stock = 1
// → Low Stock
//
// stock = 5
// → Low Stock
//
// stock = 6
// → In Stock
//
// ============================================================================


// ============================================================================
// 105. FAKE
// ----------------------------------------------------------------------------
//
// A fake is a simplified test implementation.
//
// Example:
//
// Instead of connecting to a real server,
// use:
//
// FakeProductRepository
//
// ============================================================================

abstract interface class
    ProductRepository {
  Future<List<ProductModel>>
      getProducts();
}


// ============================================================================
// 106. FAKE REPOSITORY
// ============================================================================

class FakeProductRepository
    implements ProductRepository {
  @override
  Future<List<ProductModel>>
      getProducts() async {
    return [
      ProductModel(
        id: "1",
        name: "Test Product",
        price: 1000,
      ),
    ];
  }
}


// ============================================================================
// 107. WHY FAKES?
// ----------------------------------------------------------------------------
//
// Tests should be:
//
// • Fast
// • Predictable
// • Isolated
//
// Real API calls can make tests:
//
// • Slow
// • Fragile
// • Dependent on internet
//
// ============================================================================


// ============================================================================
// 108. MOCK CONCEPT
// ----------------------------------------------------------------------------
//
// A mock records/intercepts interactions so you can verify:
//
// "Was this method called?"
//
// Example concept:
//
// repository.getProducts()
//
// was called exactly once.
//
// Mocking libraries can automate this.
//
// ============================================================================


// ============================================================================
// 109. FAKE VS MOCK
// ----------------------------------------------------------------------------
//
// FAKE:
//
// Provides a working simplified implementation.
//
// MOCK:
//
// Focuses on verifying interactions.
//
// STUB:
//
// Provides predefined responses.
//
// You should understand all three concepts.
//
// ============================================================================


// ============================================================================
// 110. TEST DOUBLE
// ----------------------------------------------------------------------------
//
// Fake
// Mock
// Stub
//
// are commonly called:
//
// Test Doubles
//
// ============================================================================


// ============================================================================
// 111. UNIT TEST ISOLATION
// ----------------------------------------------------------------------------
//
// Avoid depending on:
//
// • Internet
// • Real database
// • Real filesystem
// • Real payment gateway
//
// for ordinary unit tests.
//
// ============================================================================


// ============================================================================
// 112. INTEGRATION TEST CONCEPT
// ----------------------------------------------------------------------------
//
// Integration tests verify multiple components working together.
//
// Example:
//
// Flutter UI
//     ↓
// Controller
//     ↓
// Repository
//     ↓
// API
//
// This is different from a small unit test.
//
// ============================================================================


// ============================================================================
// 113. WIDGET TEST CONCEPT
// ----------------------------------------------------------------------------
//
// Flutter widget tests verify widgets.
//
// Example:
//
// • Button exists
// • Text appears
// • User taps button
// • UI changes
//
// This belongs more deeply to Flutter testing than pure Dart testing.
//
// ============================================================================


// ============================================================================
// 114. CODE COVERAGE
// ----------------------------------------------------------------------------
//
// Coverage measures how much code is executed by tests.
//
// High coverage does NOT automatically mean high-quality tests.
//
// Example:
//
// 100% coverage
//
// can still have poor assertions.
//
// Quality matters more than a number.
//
// ============================================================================


// ============================================================================
// 115. TEST PYRAMID
// ----------------------------------------------------------------------------
//
//                 Integration
//                     ▲
//                    / \
//                   /   \
//                  /     \
//                 / Widget\
//                /---------\
//               /   Unit    \
//              /-------------\
//
// Usually:
//
// Many unit tests
// Some widget tests
// Fewer integration tests
//
// ============================================================================
// 116. PRODUCTION QUALITY CHECK
// ----------------------------------------------------------------------------
//
// Before pushing code:
//
// dart format .
//
// dart analyze
//
// dart test
//
// These three commands should become a habit.
//
// ============================================================================


// ============================================================================
// 117. RECOMMENDED COMMAND WORKFLOW
// ----------------------------------------------------------------------------
//
// 1. Write code.
//
// 2. Format:
//
// dart format .
//
// 3. Analyze:
//
// dart analyze
//
// 4. Test:
//
// dart test
//
// 5. Fix issues.
//
// 6. Run again.
//
// ============================================================================


// ============================================================================
// 118. FLUTTER PROJECT WORKFLOW
// ----------------------------------------------------------------------------
//
// flutter pub get
//
// dart format .
//
// flutter analyze
//
// flutter test
//
// ============================================================================


// ============================================================================
// 119. CI/CD QUALITY GATE
// ----------------------------------------------------------------------------
//
// In professional projects:
//
// Pull Request
//      ↓
// Format check
//      ↓
// Static analysis
//      ↓
// Unit tests
//      ↓
// Build
//      ↓
// Deploy
//
// ============================================================================


// ============================================================================
// 120. FORMAT CHECK IN CI
// ----------------------------------------------------------------------------
//
// You can check formatting without modifying files:
//
// dart format --output=none --set-exit-if-changed .
//
// If formatting is wrong:
//
// CI fails.
//
// ============================================================================


// ============================================================================
// 121. ANALYZE IN CI
// ----------------------------------------------------------------------------
//
// dart analyze
//
// If analyzer finds a configured error:
//
// CI should fail.
//
// ============================================================================


// ============================================================================
// 122. TEST IN CI
// ----------------------------------------------------------------------------
//
// dart test
//
// All unit tests should pass.
//
// ============================================================================


// ============================================================================
// 123. DON'T IGNORE TEST FAILURES
// ----------------------------------------------------------------------------
//
// Bad workflow:
//
// Test fails
// ↓
// Comment it out
//
// Good workflow:
//
// Test fails
// ↓
// Understand why
// ↓
// Fix implementation or test
// ↓
// Run again
//
// ============================================================================


// ============================================================================
// 124. DEPENDENCY MANAGEMENT RULE
// ----------------------------------------------------------------------------
//
// Don't add packages just because they look interesting.
//
// Every dependency adds:
//
// • Maintenance
// • Security considerations
// • Upgrade work
// • Build complexity
//
// Ask:
//
// "Do I really need this package?"
//
// ============================================================================


// ============================================================================
// 125. DEPENDENCY VERSION RULE
// ----------------------------------------------------------------------------
//
// Avoid blindly copying:
//
// latest version
//
// Understand:
//
// SDK compatibility
// Package compatibility
// Flutter compatibility
//
// before upgrading major dependencies.
//
// ============================================================================


// ============================================================================
// 126. PACKAGE UPDATE RULE
// ----------------------------------------------------------------------------
//
// Before a major dependency upgrade:
//
// 1. Read changelog.
//
// 2. Check breaking changes.
//
// 3. Check SDK requirements.
//
// 4. Run tests.
//
// 5. Run analyzer.
//
// 6. Test application.
//
// ============================================================================


// ============================================================================
// 127. CIRCULAR DEPENDENCY
// ----------------------------------------------------------------------------
//
// Bad architecture:
//
// A → B
// B → C
// C → A
//
// This creates circular dependency problems.
//
// Keep architecture directional.
//
// ============================================================================


// ============================================================================
// 128. CLEAN PACKAGE STRUCTURE
// ----------------------------------------------------------------------------
//
// lib/
// ├── src/
// │   ├── models/
// │   ├── repositories/
// │   ├── services/
// │   ├── controllers/
// │   └── utils/
// │
// └── package.dart
//
// package.dart:
//
// export public APIs.
//
// Keep internal implementation inside src/.
//
// ============================================================================


// ============================================================================
// 129. LIB/SRC CONCEPT
// ----------------------------------------------------------------------------
//
// Convention:
//
// lib/src/
//
// contains implementation details.
//
// Users of your package should preferably import:
//
// package:my_package/my_package.dart
//
// rather than:
//
// package:my_package/src/internal.dart
//
// ============================================================================


// ============================================================================
// 130. PUBLIC API
// ----------------------------------------------------------------------------
//
// A package should expose only what consumers need.
//
// Example:
//
// lib/my_package.dart
//
// export 'src/auth/auth_service.dart';
// export 'src/models/user.dart';
//
// Internal helpers remain hidden.
//
// ============================================================================


// ============================================================================
// 131. PACKAGE API DESIGN
// ----------------------------------------------------------------------------
//
// Good:
//
// Small
// Clear
// Stable
// Documented
//
// Bad:
//
// Exposing every internal class.
//
// ============================================================================


// ============================================================================
// 132. DOCUMENTATION COMMENTS
// ----------------------------------------------------------------------------
//
// Use:
//
// ///
//
// for API documentation.
//
// Example:
//
// /// Calculates the final price after applying a discount.
//
// ============================================================================

/// Calculates the final price after applying
/// a percentage discount.
double finalPrice(
  double price,
  double discount,
) {
  return price -
      (price * discount / 100);
}


// ============================================================================
// 133. DOCUMENTATION VS NORMAL COMMENTS
// ----------------------------------------------------------------------------
//
// Normal comment:
//
// // This calculates discount.
//
// Documentation:
//
// /// Calculates the final price after discount.
//
// Documentation comments can be consumed by Dart documentation tooling.
//
// ============================================================================


// ============================================================================
// 134. NAMING RULES
// ----------------------------------------------------------------------------
//
// Classes:
//
// PascalCase
//
// UserModel
// ProductRepository
//
// Variables/functions:
//
// camelCase
//
// userName
// getProducts()
//
// Constants:
//
// Dart style usually uses camelCase.
//
// maxRetryCount
//
// Files:
//
// snake_case
//
// product_repository.dart
//
// ============================================================================


// ============================================================================
// 135. CONSTANTS
// ----------------------------------------------------------------------------
//
// Prefer const when possible.
//
// ============================================================================

const int maxRetryCount = 3;


// ============================================================================
// 136. FINAL VS CONST IN PRODUCTION
// ----------------------------------------------------------------------------
//
// final:
//
// Assigned once at runtime.
//
// const:
//
// Compile-time constant.
//
// ============================================================================

void finalConstExample() {
  final now =
      DateTime.now();

  const max =
      100;

  print(now);
  print(max);
}


// ============================================================================
// 137. AVOID UNNECESSARY DYNAMIC
// ----------------------------------------------------------------------------
//
// Bad:
//
// dynamic user;
//
// Better:
//
// User user;
//
// Strong typing helps:
//
// • Analyzer
// • Autocomplete
// • Refactoring
// • Safety
//
// ============================================================================
// 138. AVOID UNNECESSARY NULL ASSERTION
// ----------------------------------------------------------------------------
//
// Bad:
//
// user!.name
//
// when you don't know if user is null.
//
// Better:
//
// if (user != null) {
//   print(user.name);
// }
//
// Or pattern matching.
//
// ============================================================================
// 139. ERROR HANDLING
// ----------------------------------------------------------------------------
//
// Production code should distinguish:
//
// • Validation error
// • Network error
// • Authentication error
// • Permission error
// • Server error
// • Unexpected error
//
// Don't blindly catch everything and hide the problem.
//
// ============================================================================
// 140. BAD ERROR HANDLING
// ----------------------------------------------------------------------------
//
// try {
//
// } catch (e) {
//
// }
//
// with no logging and no meaningful result.
//
// This hides bugs.
//
// ============================================================================
// 141. BETTER ERROR HANDLING
// ----------------------------------------------------------------------------
//
// try {
//
// } catch (error, stackTrace) {
//
//   logError(
//     error,
//     stackTrace,
//   );
//
//   rethrow;
//
// }
//
// Depending on the layer, you may instead convert the exception into a
// domain-specific error/result.
//
// ============================================================================
// 142. LOGGING
// ----------------------------------------------------------------------------
//
// In production applications:
//
// Prefer a structured logging solution.
//
// Avoid scattering:
//
// print()
//
// everywhere.
//
// ============================================================================
// 143. TESTABLE CODE
// ----------------------------------------------------------------------------
//
// Code is easier to test when:
//
// • Dependencies are injected
// • Functions are small
// • Business logic is separated
// • Side effects are isolated
//
// ============================================================================
// 144. DEPENDENCY INJECTION CONCEPT
// ----------------------------------------------------------------------------
//
// Instead of:
//
// class ProductService {
//
//   final repository =
//       RealProductRepository();
//
// }
//
// Prefer:
//
// class ProductService {
//
//   final ProductRepository repository;
//
//   ProductService(
//     this.repository,
//   );
//
// }
//
// Now tests can inject:
//
// FakeProductRepository
//
// ============================================================================
// 145. TESTABLE SERVICE
// ============================================================================

class ProductService {
  final ProductRepository
      repository;

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
// 146. TESTING SERVICE CONCEPT
// ----------------------------------------------------------------------------
//
// final repository =
//     FakeProductRepository();
//
// final service =
//     ProductService(
//       repository,
//     );
//
// final products =
//     await service.getProducts();
//
// expect(
//   products,
//   isNotEmpty,
// );
//
// ============================================================================
// 147. PURE FUNCTION
// ----------------------------------------------------------------------------
//
// A pure function:
//
// • Same input → same output
// • No hidden side effects
//
// Example:
//
// ============================================================================

int square(
  int value,
) {
  return value * value;
}


// ============================================================================
// 148. PURE FUNCTIONS ARE EASY TO TEST
// ----------------------------------------------------------------------------
//
// square(5)
//
// → 25
//
// No:
//
// • Network
// • Database
// • File
// • Global state
//
// Therefore very easy to test.
//
// ============================================================================
// 149. SIDE EFFECT
// ----------------------------------------------------------------------------
//
// Side effects include:
//
// • Network requests
// • Database writes
// • File writes
// • Logging
// • Global state modification
//
// Keep them at boundaries where possible.
//
// ============================================================================
// 150. TESTABLE ARCHITECTURE
// ----------------------------------------------------------------------------
//
// UI
//  ↓
// Controller
//  ↓
// Service
//  ↓
// Repository
//  ↓
// Data Source
//
// Each layer can be tested independently.
//
// ============================================================================
// 151. PACKAGE ARCHITECTURE FOR YOUR ERP
// ----------------------------------------------------------------------------
//
// For your large ERP, you can conceptually separate:
//
// core/
// ├── errors/
// ├── network/
// ├── utils/
// ├── constants/
// └── result/
//
// features/
// ├── auth/
// ├── products/
// ├── inventory/
// ├── orders/
// ├── suppliers/
// ├── warehouses/
// ├── branches/
// ├── payments/
// └── reports/
//
// ============================================================================
// 152. TEST STRUCTURE FOR ERP
// ----------------------------------------------------------------------------
//
// test/
// ├── core/
// │   ├── result_test.dart
// │   └── validator_test.dart
// │
// ├── auth/
// │   └── auth_service_test.dart
// │
// ├── products/
// │   ├── product_model_test.dart
// │   └── product_service_test.dart
// │
// ├── inventory/
// │   └── inventory_service_test.dart
// │
// └── orders/
//     └── order_service_test.dart
//
// ============================================================================
// 153. TEST BUSINESS RULES
// ----------------------------------------------------------------------------
//
// For ERP systems this is extremely important.
//
// Example:
//
// "Stock must never become negative."
//
// Test:
//
// stock = 5
// sale = 3
// result = 2
//
// stock = 5
// sale = 5
// result = 0
//
// stock = 5
// sale = 6
// → reject operation
//
// ============================================================================
// 154. TEST IMEI RULES
// ----------------------------------------------------------------------------
//
// If your system tracks IMEI:
//
// Test:
//
// • Valid IMEI
// • Duplicate IMEI
// • Missing IMEI
// • Wrong length
// • IMEI already sold
// • IMEI transferred
//
// Business rules should be tested independently of UI.
//
// ============================================================================
// 155. TEST PURCHASE RULES
// ----------------------------------------------------------------------------
//
// Example:
//
// Purchase order approved
// ↓
// GRN generated
// ↓
// Warehouse receives stock
//
// Tests should verify every important transition.
//
// ============================================================================
// 156. TEST PAYMENT RULES
// ----------------------------------------------------------------------------
//
// Example:
//
// Pending
// ↓
// Verified
// ↓
// Paid
//
// Invalid transition:
//
// Paid
// ↓
// Pending
//
// Business rules should reject invalid transitions.
//
// ============================================================================
// 157. STATE TRANSITION TESTING
// ----------------------------------------------------------------------------
//
// A state machine can be tested like:
//
// Pending → Approved
// Pending → Rejected
//
// Approved → Processing
//
// Processing → Completed
//
// Invalid:
//
// Completed → Processing
//
// ============================================================================
// 158. TESTING STATE TRANSITIONS
// ----------------------------------------------------------------------------
//
// Example concept:
//
// expect(
//   canTransition(
//     OrderStatus.completed,
//     OrderStatus.processing,
//   ),
//   isFalse,
// );
//
// ============================================================================
// 159. PRODUCTION DEFINITION OF DONE
// ----------------------------------------------------------------------------
//
// A Dart feature should ideally satisfy:
//
// [✓] Code compiles
// [✓] Analyzer clean
// [✓] Formatter clean
// [✓] Unit tests pass
// [✓] Edge cases handled
// [✓] Errors handled
// [✓] Public API clear
// [✓] Dependencies justified
// [✓] No unnecessary dynamic
// [✓] No unnecessary nullable assertions
//
// ============================================================================
// 160. PHASE 28 INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is a Dart package?
//
// 02. What is pubspec.yaml?
//
// 03. What is the difference between dependencies and dev_dependencies?
//
// 04. What is pubspec.lock?
//
// 05. What is dependency_overrides?
//
// 06. What is a Git dependency?
//
// 07. What is a path dependency?
//
// 08. What does dart pub get do?
//
// 09. What does dart pub upgrade do?
//
// 10. What does dart pub outdated do?
//
// 11. Why use package imports?
//
// 12. What is a barrel file?
//
// 13. What is an export?
//
// 14. What does `_` mean for Dart declarations?
//
// 15. What is dart analyze?
//
// 16. What is dart format?
//
// 17. What is dart fix?
//
// 18. What is static analysis?
//
// 19. What is a lint?
//
// 20. What is analysis_options.yaml?
//
// 21. What is a unit test?
//
// 22. What is expect()?
//
// 23. What is a matcher?
//
// 24. What is group()?
//
// 25. Difference between setUp and setUpAll?
//
// 26. How do you test exceptions?
//
// 27. How do you test async functions?
//
// 28. What is a fake?
//
// 29. What is a mock?
//
// 30. What is a stub?
//
// 31. What is a test double?
//
// 32. What is dependency injection?
//
// 33. Why is dependency injection useful for testing?
//
// 34. What is code coverage?
//
// 35. Why doesn't 100% coverage guarantee quality?
//
// 36. What is the Arrange-Act-Assert pattern?
//
// 37. What is a pure function?
//
// 38. What is a side effect?
//
// 39. What is a public API?
//
// 40. Why should package internals remain private?
//
// ============================================================================
// 161. PHASE 28 PRACTICE TASKS
// ----------------------------------------------------------------------------
//
// TASK 1
// -------
// Create:
//
// calculator.dart
//
// Implement:
//
// add
// subtract
// multiply
// divide
//
// Write tests for all functions.
//
//
//
// TASK 2
// -------
// Create:
//
// discount.dart
//
// Implement:
//
// calculateDiscount()
//
// Test:
//
// 0%
// 10%
// 50%
// 100%
// invalid percentage
// negative price
//
//
//
// TASK 3
// -------
// Create:
//
// stock_manager.dart
//
// Implement:
//
// stockLabel()
//
// Test:
//
// -1
// 0
// 1
// 5
// 6
//
//
//
// TASK 4
// -------
// Create:
//
// sealed ProductState
//
// Implement:
//
// Initial
// Loading
// Loaded
// Empty
// Error
//
// Write a switch handler.
//
//
//
// TASK 5
// -------
// Create:
//
// FakeProductRepository
//
// Create:
//
// ProductService
//
// Inject the fake repository.
//
// Test the service.
//
//
//
// TASK 6
// -------
// Run:
//
// dart format .
//
// dart analyze
//
// dart test
//
//
//
// TASK 7
// -------
// Create a barrel file:
//
// models.dart
//
// Export:
//
// User
// Product
// Order
//
// ============================================================================
// 162. PHASE 28 GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// pubspec.yaml controls your package/application metadata and dependencies.
//
// RULE 2:
// dependencies are runtime dependencies.
//
// RULE 3:
// dev_dependencies are development/test dependencies.
//
// RULE 4:
// Don't add dependencies unnecessarily.
//
// RULE 5:
// Use package imports consistently in large projects.
//
// RULE 6:
// Keep internal implementation private when possible.
//
// RULE 7:
// Use barrel files carefully.
//
// RULE 8:
// Run dart format regularly.
//
// RULE 9:
// Run dart analyze regularly.
//
// RULE 10:
// Tests should verify behavior, not implementation details unnecessarily.
//
// RULE 11:
// Test edge cases.
//
// RULE 12:
// Test failures should not be ignored.
//
// RULE 13:
// Prefer dependency injection for testability.
//
// RULE 14:
// Keep business logic separate from UI.
//
// RULE 15:
// Pure functions are extremely easy to test.
//
// RULE 16:
// Keep side effects at boundaries.
//
// RULE 17:
// Use fakes/mocks/stubs appropriately.
//
// RULE 18:
// High coverage does not automatically mean good tests.
//
// RULE 19:
// A production feature is incomplete if critical business rules are untested.
//
// RULE 20:
// For your ERP, test stock, payment, order, inventory and permission rules
// independently from Flutter UI.
//
// ============================================================================
// 163. PHASE 28 FINAL PROFESSIONAL WORKFLOW
// ----------------------------------------------------------------------------
//
//                 WRITE CODE
//                     │
//                     ▼
//               dart format
//                     │
//                     ▼
//               dart analyze
//                     │
//                     ▼
//                 dart test
//                     │
//             ┌───────┴───────┐
//             │               │
//           PASS             FAIL
//             │               │
//             ▼               ▼
//           REVIEW          FIX
//             │               │
//             └───────┬───────┘
//                     ▼
//                  COMMIT
//                     │
//                     ▼
//                    CI
//                     │
//              ┌──────┴──────┐
//              ▼             ▼
//           ANALYZE         TEST
//              │             │
//              └──────┬──────┘
//                     ▼
//                   BUILD
//                     │
//                     ▼
//                  DEPLOY
//
// ============================================================================
// PHASE 28 COMPLETE
// ============================================================================
//
// NEXT:
//
// PHASE 29 — ADVANCED DART CONCURRENCY
//
// Topics:
//
// • Future deep dive
// • async / await internals
// • event loop
// • microtask queue
// • event queue
// • Future scheduling
// • Future.wait
// • Future.any
// • Future.forEach
// • Stream fundamentals
// • StreamController
// • single-subscription streams
// • broadcast streams
// • StreamSubscription
// • pause/resume/cancel
// • async*
//
// • yield
// • yield*
// • Stream transformations
// • map
// • where
// • asyncMap
// • asyncExpand
// • listen
// • errors
// • zones
// • isolates
// • SendPort
// • ReceivePort
// • compute-style workloads
// • concurrency vs parallelism
// • Flutter performance use cases
//
// ============================================================================