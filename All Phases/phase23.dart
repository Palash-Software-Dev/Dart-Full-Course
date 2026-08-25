// ============================================================================
// DART MASTER ROADMAP
// PHASE 23 — ERROR HANDLING & PRODUCTION-SAFE EXCEPTION ARCHITECTURE
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// In this phase you will learn how professional Dart/Flutter applications
// detect, throw, catch, transform, propagate, log, and recover from errors.
//
// This is especially important for your Full-Stack Flutter + Node.js ERP
// applications because errors can come from:
//
//   • User input
//   • Validation
//   • Business rules
//   • Network/API
//   • Authentication
//   • Authorization
//   • Database
//   • JSON parsing
//   • File system
//   • Timeout
//   • Internet connection
//   • Server errors
//   • Unexpected programming bugs
//
// We will cover:
//
//   01. Error vs Exception
//   02. Exception hierarchy
//   03. throw
//   04. try
//   05. catch
//   06. stackTrace
//   07. finally
//   08. rethrow
//   09. custom exceptions
//   10. exception inheritance
//   11. checked vs unchecked exceptions
//   12. synchronous errors
//   13. asynchronous errors
//   14. Future error handling
//   15. async/await errors
//   16. Stream errors
//   17. error propagation
//   18. error transformation
//   19. Result pattern
//   20. Failure pattern
//   21. domain failures
//   22. API failures
//   23. validation failures
//   24. authentication failures
//   25. authorization failures
//   26. network failures
//   27. timeout failures
//   28. parsing failures
//   29. repository error handling
//   30. service-layer error handling
//   31. global error handling concepts
//   32. logging
//   33. safe error messages
//   34. retry
//   35. timeout
//   36. fallback
//   37. production architecture
//
// ============================================================================


// ============================================================================
// 01. WHAT IS AN ERROR?
// ============================================================================
//
// An error means something went wrong while the program is executing.
//
// Examples:
//
//   • Invalid operation
//   • Invalid input
//   • Network unavailable
//   • Server returned an error
//   • JSON has unexpected structure
//   • Database request failed
//   • Programming bug
//
// ============================================================================


// ============================================================================
// 02. ERROR VS EXCEPTION
// ============================================================================
//
// Dart provides:
//
//   Error
//   Exception
//
// They are both objects that can be thrown.
//
//
//
// EXCEPTION:
//
// Usually represents something the application may reasonably handle.
//
// Example:
//
//   Invalid login
//   Network unavailable
//   Invalid user input
//   Unauthorized request
//
//
//
// ERROR:
//
// Usually indicates a programming/runtime problem.
//
// Example:
//
//   AssertionError
//   TypeError
//   RangeError
//   StateError
//
// ============================================================================


// ============================================================================
// 03. THROW
// ============================================================================
//
// Any Dart object can technically be thrown.
//
// ============================================================================

void basicThrowExample() {
  throw Exception(
    "Something went wrong",
  );
}


// ============================================================================
// IMPORTANT:
//
// throw immediately stops normal execution of the current flow until the
// exception is caught somewhere higher in the call stack.
//
// ============================================================================


// ============================================================================
// 04. THROW STRING
// ============================================================================
//
// Dart technically allows this:
//
// ============================================================================

void badThrowExample() {
  // throw "Something went wrong";
}


// ============================================================================
//
// Although Dart allows arbitrary objects to be thrown,
// production applications should generally throw Exception/Error objects,
// not random strings.
//
// GOOD:
//
// throw Exception("Something went wrong");
//
// BETTER:
//
// throw InvalidProductException();
//
// ============================================================================


// ============================================================================
// 05. TRY
// ============================================================================
//
// `try` contains code that may throw.
//
// ============================================================================

void tryExample() {
  try {
    print(
      "Code that may fail",
    );
  }
}


// ============================================================================
// 06. TRY + CATCH
// ============================================================================

void tryCatchExample() {
  try {
    throw Exception(
      "Database failed",
    );
  } catch (error) {
    print(
      "Caught: $error",
    );
  }
}


// ============================================================================
// 07. WHAT DOES CATCH RECEIVE?
// ============================================================================
//
// catch receives the object that was thrown.
//
// ============================================================================

void catchObjectExample() {
  try {
    throw Exception(
      "Invalid operation",
    );
  } catch (error) {
    print(
      error.runtimeType,
    );

    print(error);
  }
}


// ============================================================================
// 08. STACK TRACE
// ============================================================================
//
// A stack trace tells you where the error happened.
//
// ============================================================================

void stackTraceExample() {
  try {
    throw Exception(
      "Something failed",
    );
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);
  }
}


// ============================================================================
// WHY STACK TRACE MATTERS:
//
// Error:
//
// "Something failed"
//
// is not enough.
//
// Stack trace tells you:
//
// function A
//   ↓
// function B
//   ↓
// function C
//   ↓
// error happened here
//
// This is extremely important during debugging.
//
// ============================================================================


// ============================================================================
// 09. FINALLY
// ============================================================================
//
// `finally` runs whether an exception occurs or not.
//
// ============================================================================

void finallyExample() {
  try {
    print(
      "Doing work...",
    );
  } catch (error) {
    print(error);
  } finally {
    print(
      "Cleanup",
    );
  }
}


// ============================================================================
// 10. FINALLY WITHOUT CATCH
// ============================================================================

void finallyWithoutCatch() {
  try {
    print(
      "Work",
    );
  } finally {
    print(
      "Cleanup",
    );
  }
}


// ============================================================================
// If the try block throws,
// the finally block still executes,
// then the error continues upward if it wasn't caught.
//
// ============================================================================


// ============================================================================
// 11. REAL-WORLD FINALLY
// ============================================================================
//
// Common use cases:
//
//   • Close resource
//   • Release lock
//   • Stop loading state
//   • Cleanup temporary state
//
// ============================================================================


// ============================================================================
// 12. BASIC EXCEPTION FLOW
// ============================================================================
//
// try
//   ↓
// exception occurs
//   ↓
// catch
//   ↓
// finally
//
//
//
// If no catch exists:
//
// try
//   ↓
// exception
//   ↓
// finally
//   ↓
// exception propagates upward
//
// ============================================================================


// ============================================================================
// 13. MULTIPLE CATCH TYPES
// ============================================================================
//
// You can handle different exception types separately.
//
// ============================================================================

void multipleCatchExample() {
  try {
    throw FormatException(
      "Invalid format",
    );
  } on FormatException catch (
    error,
  ) {
    print(
      "Format error: $error",
    );
  } on StateError catch (
    error,
  ) {
    print(
      "State error: $error",
    );
  } catch (error) {
    print(
      "Unknown error: $error",
    );
  }
}


// ============================================================================
// 14. ON
// ============================================================================
//
// `on` specifies the exception type.
//
// Example:
//
// ============================================================================

void onExample() {
  try {
    throw FormatException(
      "Invalid JSON",
    );
  } on FormatException {
    print(
      "Invalid format",
    );
  }
}


// ============================================================================
// 15. ON + CATCH
// ============================================================================
//
// Use this when you need both:
//
//   • Type filtering
//   • Error object
//
// ============================================================================

void onCatchExample() {
  try {
    throw FormatException(
      "Invalid JSON",
    );
  } on FormatException catch (
    error,
  ) {
    print(error.message);
  }
}


// ============================================================================
// 16. CATCH ALL
// ============================================================================

void catchAllExample() {
  try {
    throw Exception(
      "Unknown problem",
    );
  } catch (error) {
    print(error);
  }
}


// ============================================================================
// 17. CATCH WITH STACK TRACE
// ============================================================================

void catchWithStackTrace() {
  try {
    throw Exception(
      "Something failed",
    );
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);
  }
}


// ============================================================================
// 18. RETHROW
// ============================================================================
//
// `rethrow` throws the SAME exception again.
//
// ============================================================================

void rethrowExample() {
  try {
    throw Exception(
      "Database failed",
    );
  } catch (
    error,
    stackTrace,
  ) {
    print(
      "Logging error...",
    );

    print(stackTrace);

    rethrow;
  }
}


// ============================================================================
// IMPORTANT:
//
// `rethrow` preserves the original stack trace.
//
// This makes it preferable when you want to log/inspect an error and then
// allow the original error to continue propagating.
//
// ============================================================================


// ============================================================================
// 19. THROW ERROR AGAIN
// ============================================================================
//
// This is different:
//
// ============================================================================

void throwAgainExample() {
  try {
    throw Exception(
      "Original error",
    );
  } catch (error) {
    // throw error;
  }
}


// ============================================================================
//
// `throw error` can alter the point from which the exception is observed.
//
// Prefer `rethrow` when re-propagating the same caught exception.
//
// ============================================================================


// ============================================================================
// 20. ERROR PROPAGATION
// ============================================================================
//
// Suppose:
//
// main()
//   ↓
// service()
//   ↓
// repository()
//   ↓
// API
//
// repository throws.
//
// If repository doesn't catch it:
//
// repository
//   ↓
// service
//   ↓
// main/UI
//
// The exception propagates upward.
//
// ============================================================================
// 21. FUNCTION CHAIN
// ============================================================================

void apiCall() {
  throw Exception(
    "API failed",
  );
}


// ============================================================================

void repositoryCall() {
  apiCall();
}


// ============================================================================

void serviceCall() {
  repositoryCall();
}


// ============================================================================

void controllerCall() {
  try {
    serviceCall();
  } catch (error) {
    print(
      "Controller handled: $error",
    );
  }
}


// ============================================================================
// 22. DON'T CATCH EVERYTHING EVERYWHERE
// ============================================================================
//
// BAD:
//
// try {
//   ...
// } catch (_) {
//   // Ignore
// }
//
//
//
// Why bad?
//
// You can hide real bugs.
//
// ============================================================================
// 23. EMPTY CATCH IS DANGEROUS
// ============================================================================

void dangerousCatch() {
  try {
    riskyOperation();
  } catch (_) {
    // Nothing
  }
}


// ============================================================================
// This can make debugging extremely difficult.
//
// ============================================================================

void riskyOperation() {
  throw Exception(
    "Important failure",
  );
}


// ============================================================================
// 24. CATCH ONLY WHEN YOU CAN DO SOMETHING USEFUL
// ============================================================================
//
// Good reasons:
//
//   • Recover
//   • Convert error
//   • Add context
//   • Log
//   • Show appropriate UI state
//   • Retry
//   • Return fallback
//
// ============================================================================
// 25. CUSTOM EXCEPTION
// ============================================================================
//
// Professional applications should define meaningful exception types.
//
// ============================================================================

class InvalidProductException
    implements Exception {
  final String message;

  const InvalidProductException(
    this.message,
  );

  @override
  String toString() =>
      "InvalidProductException: $message";
}


// ============================================================================
// 26. THROW CUSTOM EXCEPTION
// ============================================================================

void customExceptionExample() {
  throw const InvalidProductException(
    "Product name cannot be empty",
  );
}


// ============================================================================
// 27. CUSTOM EXCEPTION WITH DATA
// ============================================================================

class ProductNotFoundException
    implements Exception {
  final String productId;

  const ProductNotFoundException(
    this.productId,
  );

  @override
  String toString() =>
      "Product not found: $productId";
}


// ============================================================================
// 28. USING CUSTOM EXCEPTION
// ============================================================================

void findProduct(
  String id,
) {
  if (id.isEmpty) {
    throw const InvalidProductException(
      "Product ID is empty",
    );
  }

  throw ProductNotFoundException(
    id,
  );
}


// ============================================================================
// 29. CUSTOM EXCEPTION HIERARCHY
// ============================================================================
//
// You can create a common application exception.
//
// ============================================================================

abstract class AppException
    implements Exception {
  final String message;

  const AppException(
    this.message,
  );

  @override
  String toString() =>
      "$runtimeType: $message";
}


// ============================================================================
// 30. NETWORK EXCEPTION
// ============================================================================

class NetworkException
    extends AppException {
  const NetworkException(
    super.message,
  );
}


// ============================================================================
// 31. TIMEOUT EXCEPTION
// ============================================================================

class RequestTimeoutException
    extends AppException {
  const RequestTimeoutException(
    super.message,
  );
}


// ============================================================================
// 32. AUTH EXCEPTION
// ============================================================================

class AuthenticationException
    extends AppException {
  const AuthenticationException(
    super.message,
  );
}


// ============================================================================
// 33. AUTHORIZATION EXCEPTION
// ============================================================================

class AuthorizationException
    extends AppException {
  const AuthorizationException(
    super.message,
  );
}


// ============================================================================
// 34. VALIDATION EXCEPTION
// ============================================================================

class ValidationException
    extends AppException {
  const ValidationException(
    super.message,
  );
}


// ============================================================================
// 35. SERVER EXCEPTION
// ============================================================================

class ServerException
    extends AppException {
  final int statusCode;

  const ServerException(
    this.statusCode,
    super.message,
  );
}


// ============================================================================
// 36. PARSING EXCEPTION
// ============================================================================

class ParsingException
    extends AppException {
  const ParsingException(
    super.message,
  );
}


// ============================================================================
// 37. DATABASE EXCEPTION
// ============================================================================

class DatabaseException
    extends AppException {
  const DatabaseException(
    super.message,
  );
}


// ============================================================================
// 38. FILE EXCEPTION
// ============================================================================

class FileException
    extends AppException {
  const FileException(
    super.message,
  );
}


// ============================================================================
// 39. EXCEPTION CATEGORIES
// ============================================================================
//
// A production application can have categories like:
//
// AppException
// ├── NetworkException
// ├── TimeoutException
// ├── AuthenticationException
// ├── AuthorizationException
// ├── ValidationException
// ├── ServerException
// ├── ParsingException
// └── DatabaseException
//
// This allows centralized handling.
//
// ============================================================================
// 40. EXCEPTION VS FAILURE
// ============================================================================
//
// An Exception represents an exceptional event.
//
// A Failure is often used in application architecture to represent an
// expected unsuccessful result.
//
// Example:
//
// Login request:
//
// Success → User
//
// Failure → Invalid credentials
//
// This can be represented without throwing an exception for every normal
// business failure.
//
// ============================================================================
// 41. RESULT PATTERN
// ============================================================================
//
// A Result represents:
//
// Success
// OR
// Failure
//
// Conceptually:
//
// Result<T>
//   ├── Success<T>
//   └── Failure
//
// ============================================================================
// 42. SIMPLE RESULT
// ============================================================================

sealed class Result<T> {
  const Result();
}


// ============================================================================
// 43. SUCCESS
// ============================================================================

class Success<T>
    extends Result<T> {
  final T data;

  const Success(
    this.data,
  );
}


// ============================================================================
// 44. FAILURE
// ============================================================================

class Failure<T>
    extends Result<T> {
  final AppException exception;

  const Failure(
    this.exception,
  );
}


// ============================================================================
// 45. RESULT EXAMPLE
// ============================================================================

Result<ProductModel>
    getProduct(
  String id,
) {
  if (id.isEmpty) {
    return const Failure(
      ValidationException(
        "Product ID is required",
      ),
    );
  }

  return const Success(
    ProductModel(
      id: "P001",
      name: "Phone",
      price: 50000,
    ),
  );
}


// ============================================================================
// 46. HANDLING RESULT
// ============================================================================

void handleResult(
  Result<ProductModel> result,
) {
  switch (result) {
    case Success<ProductModel>(
        :final data,
      ):
      print(
        "Product: ${data.name}",
      );

    case Failure<ProductModel>(
        :final exception,
      ):
      print(
        "Error: ${exception.message}",
      );
  }
}


// ============================================================================
// 47. WHY RESULT?
// ============================================================================
//
// Result makes failure part of the function's type.
//
// Instead of:
//
// Product getProduct()
//
// secretly throwing:
//
//
//
// you can explicitly say:
//
// Result<ProductModel> getProduct()
//
// This communicates:
//
// "This operation may fail."
//
// ============================================================================
// 48. EXCEPTION VS RESULT
// ============================================================================
//
// EXCEPTION:
//
// Good for unexpected failures or failures naturally represented by
// exceptions.
//
// RESULT:
//
// Good when failure is an expected part of normal application flow.
//
//
//
// Example:
//
// Invalid login credentials
//
// can reasonably be represented as:
//
// Failure(AuthenticationException(...))
//
//
//
// Programming bug:
//
// Null dereference / assertion / invalid internal state
//
// should not necessarily be converted into a normal Failure.
//
// ============================================================================
// 49. DON'T SWALLOW PROGRAMMING BUGS
// ============================================================================
//
// Example:
//
// A developer writes:
//
// list[999]
//
// and causes:
//
// RangeError
//
// Don't simply convert every such error into:
//
// "Something went wrong"
//
// Fix the bug.
//
// ============================================================================
// 50. ASSERTION
// ============================================================================
//
// Assertions are useful during development for assumptions that should hold.
//
// ============================================================================

void assertionExample(
  double price,
) {
  assert(
    price >= 0,
    "Price cannot be negative",
  );
}


// ============================================================================
// NOTE:
//
// Assertions are primarily development/debugging tools.
//
// Do not use assert as your only production validation mechanism.
//
// ============================================================================
// 51. VALIDATION
// ============================================================================
//
// Business validation should explicitly execute.
//
// ============================================================================

void validatePrice(
  double price,
) {
  if (price < 0) {
    throw const ValidationException(
      "Price cannot be negative",
    );
  }
}


// ============================================================================
// 52. VALIDATION MULTIPLE ERRORS
// ============================================================================
//
// Sometimes you need more than one validation message.
//
// ============================================================================

class ValidationFailure
    extends AppException {
  final Map<String, String>
      fieldErrors;

  const ValidationFailure({
    required this.fieldErrors,
  }) : super(
          "Validation failed",
        );
}


// ============================================================================
// 53. VALIDATION EXAMPLE
// ============================================================================

ValidationFailure?
    validateProductForm({
  required String name,
  required double price,
}) {
  final errors =
      <String, String>{};

  if (name.trim().isEmpty) {
    errors["name"] =
        "Name is required";
  }

  if (price < 0) {
    errors["price"] =
        "Price cannot be negative";
  }

  if (errors.isEmpty) {
    return null;
  }

  return ValidationFailure(
    fieldErrors: errors,
  );
}


// ============================================================================
// 54. JSON PARSING ERROR
// ============================================================================
//
// API response may not match your expected structure.
//
// ============================================================================

import 'dart:convert';


// ============================================================================

ProductDto parseProduct(
  String jsonString,
) {
  try {
    final json =
        jsonDecode(jsonString);

    if (json
        is! Map<String, dynamic>) {
      throw const ParsingException(
        "Expected JSON object",
      );
    }

    return ProductDto.fromJson(
      json,
    );
  } on FormatException catch (
    error,
  ) {
    throw ParsingException(
      "Invalid JSON: ${error.message}",
    );
  } catch (error) {
    if (error
        is ParsingException) {
      rethrow;
    }

    throw ParsingException(
      "Unable to parse product",
    );
  }
}


// ============================================================================
// 55. IMPORTANT IMPORT NOTE
// ============================================================================
//
// The examples in this file are educational.
//
// If you save everything into one file,
// Dart may report duplicate import placement issues because imports must
// appear before declarations.
//
// For real projects:
//
// Put all imports at the top.
//
// ============================================================================
// 56. ASYNC EXCEPTIONS
// ============================================================================
//
// Async code has special error behavior.
//
// ============================================================================

Future<String>
    loadProduct() async {
  throw const NetworkException(
    "Server unavailable",
  );
}


// ============================================================================
// 57. ASYNC TRY/CATCH
// ============================================================================

Future<void>
    asyncCatchExample() async {
  try {
    final result =
        await loadProduct();

    print(result);
  } catch (error) {
    print(
      "Caught: $error",
    );
  }
}


// ============================================================================
// 58. ASYNC STACK TRACE
// ============================================================================

Future<void>
    asyncStackTraceExample() async {
  try {
    await loadProduct();
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);
  }
}


// ============================================================================
// 59. FUTURE CATCHERROR
// ============================================================================
//
// Future also provides catchError.
//
// ============================================================================

Future<void>
    futureCatchErrorExample() {
  return loadProduct().then(
    (value) {
      print(value);
    },
  ).catchError(
    (error) {
      print(error);
    },
  );
}


// ============================================================================
// In modern Dart code, async/await + try/catch is often easier to read.
//
// ============================================================================
// 60. ASYNC TRY/CATCH IS PREFERRED FOR COMPLEX FLOW
// ============================================================================

Future<void>
    readableAsyncExample() async {
  try {
    final product =
        await loadProduct();

    print(product);
  } on NetworkException catch (
    error,
  ) {
    print(
      "Network: ${error.message}",
    );
  } on TimeoutException catch (
    error,
  ) {
    print(
      "Timeout: $error",
    );
  }
}


// ============================================================================
// 61. DART TIMEOUT EXCEPTION
// ============================================================================
//
// `TimeoutException` is available from dart:async.
//
// ============================================================================

Future<String>
    requestWithTimeout() async {
  try {
    return await loadProduct()
        .timeout(
      const Duration(
        seconds: 5,
      ),
    );
  } on TimeoutException {
    throw const RequestTimeoutException(
      "Request timed out",
    );
  }
}


// ============================================================================
// 62. TIMEOUT IS IMPORTANT
// ============================================================================
//
// NEVER assume a network request will finish quickly.
//
// A request can:
//
//   • hang
//   • become slow
//   • lose connection
//   • wait indefinitely depending on client/server behavior
//
// Production network layers should define appropriate timeouts.
//
// ============================================================================
// 63. NETWORK ERROR TRANSFORMATION
// ============================================================================
//
// Lower layer:
//
// SocketException
//
// Repository can transform it into:
//
// NetworkException
//
// UI doesn't need to know low-level networking details.
//
// ============================================================================
// 64. ERROR TRANSLATION
// ============================================================================

AppException translateError(
  Object error,
) {
  if (error
      is TimeoutException) {
    return const RequestTimeoutException(
      "Request timed out",
    );
  }

  if (error
      is FormatException) {
    return const ParsingException(
      "Invalid response format",
    );
  }

  return const NetworkException(
    "Network request failed",
  );
}


// ============================================================================
// 65. REPOSITORY PATTERN
// ============================================================================

abstract interface class
    ProductRepository {
  Future<
      Result<ProductModel>>
      getProduct(
    String id,
  );
}


// ============================================================================
// 66. REPOSITORY IMPLEMENTATION
// ============================================================================

class ProductRepositoryImpl
    implements ProductRepository {
  @override
  Future<
      Result<ProductModel>>
      getProduct(
    String id,
  ) async {
    try {
      if (id.isEmpty) {
        return const Failure(
          ValidationException(
            "Product ID is required",
          ),
        );
      }

      final product =
          await _requestProduct(
        id,
      );

      return Success(
        product,
      );
    } on AppException catch (
      error,
    ) {
      return Failure(
        error,
      );
    } catch (
      error,
      stackTrace,
    ) {
      print(
        "Unexpected error: $error",
      );

      print(stackTrace);

      return const Failure(
        NetworkException(
          "Unexpected request failure",
        ),
      );
    }
  }

  Future<ProductModel>
      _requestProduct(
    String id,
  ) async {
    return const ProductModel(
      id: "P001",
      name: "Phone",
      price: 50000,
    );
  }
}


// ============================================================================
// 67. DOMAIN LAYER
// ============================================================================
//
// Business logic should not depend heavily on HTTP details.
//
// BAD:
//
// if statusCode == 404
//
// everywhere in UI.
//
//
//
// Better:
//
// ProductNotFoundException
//
// or:
//
// ProductNotFoundFailure
//
// ============================================================================
// 68. NOT FOUND FAILURE
// ============================================================================

class ProductNotFoundFailure
    extends AppException {
  final String productId;

  const ProductNotFoundFailure(
    this.productId,
  ) : super(
          "Product not found",
        );
}


// ============================================================================
// 69. API ERROR MODEL
// ============================================================================

class ApiError {
  final String code;
  final String message;

  const ApiError({
    required this.code,
    required this.message,
  });
}


// ============================================================================
// 70. HTTP STATUS MAPPING
// ============================================================================
//
// Typical conceptual mapping:
//
// 400 → Validation
// 401 → Authentication
// 403 → Authorization
// 404 → Not Found
// 409 → Conflict
// 422 → Validation / semantic error
// 429 → Rate Limited
// 500 → Server
// 502 → Gateway
// 503 → Service unavailable
// 504 → Gateway timeout
//
// Exact handling depends on your backend API contract.
//
// ============================================================================
// 71. CONFLICT
// ============================================================================
//
// ERP example:
//
// Creating a product with an existing SKU.
//
// Server:
//
// 409 Conflict
//
// Client:
//
// ProductConflictFailure
//
// ============================================================================

class ProductConflictFailure
    extends AppException {
  const ProductConflictFailure(
    super.message,
  );
}


// ============================================================================
// 72. AUTHENTICATION VS AUTHORIZATION
// ============================================================================
//
// Authentication:
//
// "Who are you?"
//
// Authorization:
//
// "Are you allowed to do this?"
//
// Example:
//
// Login failed
// → Authentication
//
// Employee tries to delete company
// → Authorization
//
// ============================================================================
// 73. AUTHENTICATION FAILURE
// ============================================================================

class InvalidCredentialsFailure
    extends AppException {
  const InvalidCredentialsFailure()
      : super(
          "Invalid email or password",
        );
}


// ============================================================================
// 74. AUTHORIZATION FAILURE
// ============================================================================

class PermissionDeniedFailure
    extends AppException {
  final String permission;

  const PermissionDeniedFailure(
    this.permission,
  ) : super(
          "Permission denied",
        );
}


// ============================================================================
// 75. NEVER EXPOSE SENSITIVE DETAILS
// ============================================================================
//
// BAD UI:
//
// "MongoDB connection failed at 10.0.0.4 because credentials XYZ..."
//
// GOOD:
//
// "Unable to load products. Please try again."
//
// Logs can contain technical details under controlled conditions.
//
// ============================================================================
// 76. USER-FACING ERROR VS INTERNAL ERROR
// ============================================================================
//
// Internal:
//
// SocketException
// StackTrace
// HTTP headers
// SQL/database details
//
// User-facing:
//
// "No internet connection."
// "You don't have permission."
// "Product could not be loaded."
//
// Keep these layers separate.
//
// ============================================================================
// 77. ERROR MESSAGE DESIGN
// ============================================================================
//
// Good:
//
// "Product could not be loaded."
//
// Better when actionable:
//
// "Product could not be loaded. Please try again."
//
// Avoid exposing:
//
// stack traces
// database details
// tokens
// passwords
// internal URLs
// server secrets
//
// ============================================================================
// 78. LOGGING
// ============================================================================
//
// Production applications need structured logging.
//
// ============================================================================

void logError(
  Object error,
  StackTrace stackTrace,
) {
  print(
    "ERROR: $error",
  );

  print(
    "STACK: $stackTrace",
  );
}


// ============================================================================
// 79. DEBUG LOGGING
// ============================================================================
//
// Avoid blindly logging sensitive data.
//
// Never log:
//
//   • Password
//   • Access token
//   • Refresh token
//   • OTP
//   • Payment credentials
//   • Secret keys
//
// ============================================================================
// 80. LOG CONTEXT
// ============================================================================
//
// Useful context:
//
//   • Feature
//   • Request ID
//   • User/company ID when appropriate and safe
//   • Endpoint
//   • Operation
//   • Error type
//
// Be careful with personal/sensitive information.
//
// ============================================================================
// 81. CENTRALIZED ERROR LOGGER
// ============================================================================

class ErrorLogger {
  const ErrorLogger();

  void log(
    Object error,
    StackTrace stackTrace,
  ) {
    print(
      "Error: $error",
    );

    print(
      "StackTrace: $stackTrace",
    );
  }
}


// ============================================================================
// 82. GLOBAL ERROR HANDLING CONCEPT
// ============================================================================
//
// Not every error can be handled locally.
//
// You should have a top-level safety net for unexpected errors.
//
// In Flutter:
//
//   FlutterError.onError
//
// can be used for Flutter framework errors.
//
// There are also mechanisms for uncaught asynchronous errors.
//
// ============================================================================
// 83. FLUTTER ERROR HANDLER
// ============================================================================
//
// Example concept:
//
// FlutterError.onError = (details) {
//   // log details
// };
//
//
//
// Keep the actual Flutter implementation in your Flutter project,
// not in pure Dart domain code.
//
// ============================================================================
// 84. ZONE-LEVEL UNCAUGHT ERRORS
// ============================================================================
//
// Dart provides mechanisms such as:
//
// runZonedGuarded()
//
// for catching uncaught asynchronous errors within a zone.
//
// ============================================================================
// 85. CONCEPTUAL EXAMPLE
// ============================================================================

import 'dart:async';


// ============================================================================

void zoneExample() {
  runZonedGuarded(
    () {
      Future<void>.delayed(
        const Duration(
          milliseconds: 100,
        ),
        () {
          throw Exception(
            "Unexpected async error",
          );
        },
      );
    },
    (
      error,
      stackTrace,
    ) {
      print(
        "Global error: $error",
      );

      print(stackTrace);
    },
  );
}


// ============================================================================
// 86. GLOBAL HANDLER IS NOT A SUBSTITUTE FOR LOCAL HANDLING
// ============================================================================
//
// Local errors that can be handled should be handled locally.
//
// Global handler is a safety net.
//
// ============================================================================
// 87. RETRY
// ============================================================================
//
// Some errors are temporary.
//
// Example:
//
// Network unavailable
// Server temporarily unavailable
//
// Retrying can be useful.
//
//
//
// But don't retry every error.
//
// ============================================================================
// 88. DO NOT RETRY VALIDATION ERRORS
// ============================================================================
//
// Example:
//
// Invalid product name.
//
// Retrying 5 times won't fix it.
//
// ============================================================================
// 89. RETRYABLE VS NON-RETRYABLE
// ============================================================================
//
// Retryable examples:
//
//   • temporary network failure
//   • timeout
//   • some 5xx responses
//   • rate limiting with server guidance
//
// Usually not retryable:
//
//   • invalid input
//   • invalid credentials
//   • permission denied
//   • product not found
//   • malformed request
//
// Exact policy depends on your API.
//
// ============================================================================
// 90. SIMPLE RETRY
// ============================================================================

Future<T> retry<T>(
  Future<T> Function() operation, {
  int maxAttempts = 3,
}) async {
  Object? lastError;
  StackTrace? lastStackTrace;

  for (
    int attempt = 1;
    attempt <= maxAttempts;
    attempt++
  ) {
    try {
      return await operation();
    } catch (
      error,
      stackTrace,
    ) {
      lastError = error;
      lastStackTrace = stackTrace;

      if (attempt ==
          maxAttempts) {
        Error.throwWithStackTrace(
          lastError,
          lastStackTrace,
        );
      }
    }
  }

  throw StateError(
    "Retry failed",
  );
}


// ============================================================================
// 91. ERROR.THROWWITHSTACKTRACE
// ============================================================================
//
// This allows you to throw an error while explicitly preserving/providing
// a StackTrace.
//
// ============================================================================
// 92. RETRY DELAY
// ============================================================================

Future<T> retryWithDelay<T>(
  Future<T> Function() operation, {
  int maxAttempts = 3,
  Duration delay =
      const Duration(
    seconds: 1,
  ),
}) async {
  Object? lastError;
  StackTrace? lastStackTrace;

  for (
    int attempt = 1;
    attempt <= maxAttempts;
    attempt++
  ) {
    try {
      return await operation();
    } catch (
      error,
      stackTrace,
    ) {
      lastError = error;
      lastStackTrace = stackTrace;

      if (attempt <
          maxAttempts) {
        await Future.delayed(
          delay,
        );
      }
    }
  }

  Error.throwWithStackTrace(
    lastError!,
    lastStackTrace!,
  );
}


// ============================================================================
// 93. EXPONENTIAL BACKOFF
// ============================================================================
//
// Production retry systems often use increasing delays:
//
// attempt 1 → 1 sec
// attempt 2 → 2 sec
// attempt 3 → 4 sec
// attempt 4 → 8 sec
//
// This reduces pressure on a struggling server.
//
// ============================================================================
// 94. SIMPLE BACKOFF
// ============================================================================

Duration backoff(
  int attempt,
) {
  final seconds =
      1 << (attempt - 1);

  return Duration(
    seconds: seconds,
  );
}


// ============================================================================
// 95. MAXIMUM BACKOFF
// ============================================================================
//
// Real systems should usually cap the delay.
//
// Example:
//
// maximum 30 seconds.
//
// Otherwise exponential growth can become excessive.
//
// ============================================================================
// 96. JITTER
// ============================================================================
//
// Production distributed systems may add random jitter to retry delays.
//
// Why?
//
// If thousands of clients retry at exactly the same moment,
// they can create another traffic spike.
//
// ============================================================================
// 97. FALLBACK
// ============================================================================
//
// Sometimes an operation can return a safe fallback.
//
// Example:
//
// If a non-critical analytics request fails:
//
// return cached analytics.
//
// But don't hide critical failures.
//
// ============================================================================
// 98. CACHE FALLBACK
// ============================================================================

Future<List<ProductModel>>
    loadProductsWithFallback(
  Future<List<ProductModel>>
      Function()
      remoteRequest,
  List<ProductModel>
      cachedProducts,
) async {
  try {
    return await remoteRequest();
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);

    return cachedProducts;
  }
}


// ============================================================================
// 99. IMPORTANT FALLBACK RULE
// ============================================================================
//
// Only return stale/cached data when the application can safely do so.
//
// For financial transactions:
//
// Don't silently use stale data.
//
// ============================================================================
// 100. PAYMENT EXAMPLE
// ============================================================================
//
// Suppose:
//
// Payment submission fails.
//
// NEVER do:
//
// catch (_) {
//   return success;
// }
//
// That could corrupt financial state.
//
// Critical operations need explicit success confirmation.
//
// ============================================================================
// 101. IDEMPOTENCY
// ============================================================================
//
// Retry can accidentally perform an operation twice.
//
// Example:
//
// Create order
//
// Request reaches server.
//
// Client times out.
//
// Client retries.
//
// Server may already have created the order.
//
//
//
// Therefore important APIs should use idempotency mechanisms where appropriate.
//
// ============================================================================
// 102. ERP IDEMPOTENCY EXAMPLE
// ============================================================================
//
// Create payment:
//
// clientRequestId = "PAY-12345"
//
// If request is retried,
// server recognizes the same request ID.
//
// This prevents duplicate processing.
//
// ============================================================================
// 103. ERROR HANDLING FOR CRUD
// ============================================================================
//
// CREATE:
//
// validation
// authentication
// authorization
// conflict
// network
// server
//
// READ:
//
// network
// timeout
// not found
// parsing
//
// UPDATE:
//
// validation
// authorization
// conflict
// network
//
// DELETE:
//
// authorization
// not found
// conflict
// network
//
// ============================================================================
// 104. BUSINESS RULE EXCEPTION
// ============================================================================

class InsufficientStockException
    extends AppException {
  final String productId;
  final int requested;
  final int available;

  const InsufficientStockException({
    required this.productId,
    required this.requested,
    required this.available,
  }) : super(
          "Insufficient stock",
        );
}


// ============================================================================
// 105. ERP BUSINESS RULE
// ============================================================================

void validateStock({
  required String productId,
  required int requested,
  required int available,
}) {
  if (requested > available) {
    throw InsufficientStockException(
      productId: productId,
      requested: requested,
      available: available,
    );
  }
}


// ============================================================================
// 106. WHY BUSINESS EXCEPTIONS MATTER
// ============================================================================
//
// UI can show:
//
// "Not enough stock available."
//
// instead of:
//
// "Exception: something went wrong."
//
// ============================================================================
// 107. PERMISSION ERROR
// ============================================================================

void deleteProduct({
  required bool canDelete,
}) {
  if (!canDelete) {
    throw const PermissionDeniedFailure(
      "product.delete",
    );
  }

  print(
    "Product deleted",
  );
}


// ============================================================================
// 108. ERROR MAPPING TO UI
// ============================================================================

String userMessage(
  Object error,
) {
  if (error
      is NetworkException) {
    return "No internet connection.";
  }

  if (error
      is RequestTimeoutException) {
    return "The request took too long. Please try again.";
  }

  if (error
      is AuthenticationException) {
    return "Please log in again.";
  }

  if (error
      is AuthorizationException) {
    return "You do not have permission to perform this action.";
  }

  if (error
      is ValidationException) {
    return error.message;
  }

  if (error
      is ProductNotFoundFailure) {
    return "Product was not found.";
  }

  if (error
      is InsufficientStockException) {
    return "Insufficient stock available.";
  }

  return "Something went wrong. Please try again.";
}


// ============================================================================
// 109. NEVER SHOW RAW ERROR DIRECTLY
// ============================================================================
//
// BAD:
//
// SnackBar(
//   content: Text(error.toString()),
// )
//
// Because:
//
// error.toString()
//
// may contain internal implementation details.
//
// Better:
//
// Text(
//
//   userMessage(error),
//
// )
//
// ============================================================================
// 110. ERROR → PRESENTATION STATE
// ============================================================================
//
// Instead of directly controlling UI from repository:
//
// Repository
//     ↓
// Result
//     ↓
// Controller
//     ↓
// UI state
//     ↓
// UI
//
// ============================================================================
// 111. EXAMPLE UI STATE
// ============================================================================

sealed class ProductState {
  const ProductState();
}


// ============================================================================

class ProductLoading
    extends ProductState {
  const ProductLoading();
}


// ============================================================================

class ProductLoaded
    extends ProductState {
  final List<ProductModel>
      products;

  const ProductLoaded(
    this.products,
  );
}


// ============================================================================

class ProductError
    extends ProductState {
  final AppException error;

  const ProductError(
    this.error,
  );
}


// ============================================================================
// 112. STATE HANDLING
// ============================================================================

void handleProductState(
  ProductState state,
) {
  switch (state) {
    case ProductLoading():
      print(
        "Loading...",
      );

    case ProductLoaded(
        :final products,
      ):
      print(
        "Products: ${products.length}",
      );

    case ProductError(
        :final error,
      ):
      print(
        userMessage(error),
      );
  }
}


// ============================================================================
// 113. ERROR BOUNDARY
// ============================================================================
//
// An error boundary is a place where unexpected failures are captured so
// they don't crash the entire application without logging.
//
// In Flutter this can be implemented through framework/global error
// mechanisms and architecture-specific boundaries.
//
// ============================================================================
// 114. LOCAL VS GLOBAL ERROR HANDLING
// ============================================================================
//
// LOCAL:
//
// Known recoverable operation.
//
// Example:
//
// Product API request.
//
//
//
// GLOBAL:
//
// Unexpected uncaught error.
//
// Example:
//
// Unexpected framework/application bug.
//
// ============================================================================
// 115. DON'T DUPLICATE ERROR LOGIC
// ============================================================================
//
// BAD:
//
// Every screen has 100 lines of:
//
// if NetworkException
// if TimeoutException
// if ServerException
//
//
//
// Better:
//
// central error mapper.
//
// ============================================================================
// 116. ERROR MAPPER
// ============================================================================

class ErrorMessageMapper {
  const ErrorMessageMapper();

  String map(
    Object error,
  ) {
    return userMessage(
      error,
    );
  }
}


// ============================================================================
// 117. NETWORK LAYER
// ============================================================================
//
// A professional networking layer may:
//
//   • Send request
//   • Set timeout
//   • Parse response
//   • Map status codes
//   • Throw typed exceptions
//   • Preserve request context
//
// ============================================================================
// 118. REPOSITORY LAYER
// ============================================================================
//
// Repository:
//
//   • Converts data-source errors
//   • Returns domain-friendly failures/results
//   • Hides networking implementation
//
// ============================================================================
// 119. DOMAIN LAYER
// ============================================================================
//
// Domain:
//
//   • Applies business rules
//   • Doesn't depend on HTTP status codes
//
// ============================================================================
// 120. PRESENTATION LAYER
// ============================================================================
//
// Presentation:
//
//   • Converts state/errors into user-friendly UI
//   • Shows loading/error/success
//
// ============================================================================
// 121. COMPLETE ERROR FLOW
// ============================================================================
//
// API
//  ↓
// HTTP error
//  ↓
// Network exception
//  ↓
// Repository
//  ↓
// Domain failure
//  ↓
// Controller state
//  ↓
// UI error message
//
// ============================================================================
// 122. FULL ERP EXAMPLE
// ============================================================================

Future<
    Result<ProductModel>>
    createProduct(
  ProductModel product,
) async {
  try {
    if (product.name
        .trim()
        .isEmpty) {
      return const Failure(
        ValidationException(
          "Product name is required",
        ),
      );
    }

    if (product.price < 0) {
      return const Failure(
        ValidationException(
          "Product price cannot be negative",
        ),
      );
    }

    // Simulated API request.
    final created =
        await _createProductApi(
      product,
    );

    return Success(
      created,
    );
  } on TimeoutException {
    return const Failure(
      RequestTimeoutException(
        "Product creation timed out",
      ),
    );
  } on AppException catch (
    error,
  ) {
    return Failure(
      error,
    );
  } catch (
    error,
    stackTrace,
  ) {
    logError(
      error,
      stackTrace,
    );

    return const Failure(
      ServerException(
        500,
        "Unable to create product",
      ),
    );
  }
}


// ============================================================================
// 123. SIMULATED API
// ============================================================================

Future<ProductModel>
    _createProductApi(
  ProductModel product,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return product;
}


// ============================================================================
// 124. ERROR HANDLING RULE
// ============================================================================
//
// Do not turn every exception into:
//
// Exception("Something went wrong")
//
// because that destroys useful type information.
//
// ============================================================================
// 125. PRESERVE ERROR SEMANTICS
// ============================================================================
//
// BAD:
//
// catch (error) {
//   throw Exception(
//     "Failed",
//   );
// }
//
//
//
// Better:
//
// catch (error, stackTrace) {
//   logError(
//     error,
//     stackTrace,
//   );
//
//   rethrow;
// }
//
//
//
// Or transform intentionally:
//
// catch (error) {
//   throw NetworkException(
//     "...",
//   );
// }
//
// ============================================================================
// 126. WHEN TO TRANSFORM
// ============================================================================
//
// Transform when crossing an architectural boundary.
//
// Example:
//
// HTTP client exception
// ↓
// repository exception
// ↓
// domain failure
//
// ============================================================================
// 127. WHEN TO RETHROW
// ============================================================================
//
// Use rethrow when:
//
//   • You need to log
//   • You need cleanup
//   • You need to perform local side effects
//   • You don't want to change the error type
//
// ============================================================================
// 128. WHEN TO CATCH
// ============================================================================
//
// Catch when you can:
//
//   • Recover
//   • Retry
//   • Convert
//   • Return fallback
//   • Map to UI state
//   • Add meaningful context
//
// ============================================================================
// 129. WHEN NOT TO CATCH
// ============================================================================
//
// Don't catch merely because:
//
// "The compiler allows it."
//
// If you cannot meaningfully handle it,
// let it propagate to the appropriate boundary.
//
// ============================================================================
// 130. ERROR CONTEXT
// ============================================================================
//
// When transforming errors,
// preserve useful context.
//
// Example:
//
// Product P001 failed to load.
//
// Better than:
//
// Request failed.
//
// But don't expose sensitive internal information to users.
//
// ============================================================================
// 131. CUSTOM ERROR WITH CONTEXT
// ============================================================================

class ProductLoadException
    extends AppException {
  final String productId;

  const ProductLoadException({
    required this.productId,
    required String message,
  }) : super(message);
}


// ============================================================================
// 132. LOGGING CONTEXT
// ============================================================================

void logProductError(
  String productId,
  Object error,
  StackTrace stackTrace,
) {
  print(
    "Product ID: $productId",
  );

  print(
    "Error: $error",
  );

  print(
    "Stack: $stackTrace",
  );
}


// ============================================================================
// 133. ERROR HANDLING + SECURITY
// ============================================================================
//
// NEVER include sensitive secrets in exceptions.
//
// BAD:
//
// throw Exception(
//   "Token: $token",
// );
//
// BAD:
//
// throw Exception(
//   "Password: $password",
// );
//
// ============================================================================
// 134. API RESPONSE SECURITY
// ============================================================================
//
// Server should also avoid returning sensitive implementation details.
//
// Flutter should not trust server error strings blindly.
//
// Map known server codes to safe application failures.
//
// ============================================================================
// 135. ERROR CODE PATTERN
// ============================================================================

class ApiFailure
    extends AppException {
  final String code;

  const ApiFailure({
    required this.code,
    required String message,
  }) : super(message);
}


// ============================================================================
// Example:
//
// code = "PRODUCT_OUT_OF_STOCK"
//
// Client can map:
//
// PRODUCT_OUT_OF_STOCK
// → InsufficientStockException
//
// ============================================================================
// 136. ERROR CODES ARE MORE STABLE
// ============================================================================
//
// Server text may change:
//
// "Not enough inventory"
//
// vs:
//
// "Insufficient stock"
//
// But code:
//
// PRODUCT_OUT_OF_STOCK
//
// can remain stable.
//
// ============================================================================
// 137. RATE LIMIT
// ============================================================================

class RateLimitException
    extends AppException {
  final Duration? retryAfter;

  const RateLimitException({
    this.retryAfter,
  }) : super(
          "Too many requests",
        );
}


// ============================================================================
// 138. RETRY-AFTER
// ============================================================================
//
// If server provides retry-after information,
// respect it where appropriate.
//
// ============================================================================
// 139. CANCELLATION
// ============================================================================
//
// Not every failure should be treated as an error.
//
// Example:
//
// User leaves a search screen while request is in progress.
//
// The operation may simply no longer be needed.
//
// Proper cancellation support depends on the HTTP/client library and
// architecture.
//
// ============================================================================
// 140. TIMEOUT VS CANCELLATION
// ============================================================================
//
// Timeout:
//
// "The operation took too long."
//
// Cancellation:
//
// "We no longer need this operation."
//
// They are conceptually different.
//
// ============================================================================
// 141. STREAM ERRORS
// ============================================================================
//
// Streams can emit errors.
//
// ============================================================================

Stream<int>
    errorStream() async* {
  yield 1;
  yield 2;

  throw Exception(
    "Stream failed",
  );
}


// ============================================================================
// 142. STREAM CATCHERROR
// ============================================================================

void streamErrorExample() {
  errorStream().listen(
    (value) {
      print(value);
    },
    onError: (
      error,
      stackTrace,
    ) {
      print(error);
      print(stackTrace);
    },
  );
}


// ============================================================================
// 143. STREAM ASYNC* TRY/CATCH
// ============================================================================

Stream<int>
    safeStream() async* {
  try {
    yield 1;
    yield 2;

    throw Exception(
      "Failure",
    );
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);

    rethrow;
  }
}


// ============================================================================
// 144. FUTURE VS STREAM ERRORS
// ============================================================================
//
// Future:
//
// Eventually completes with:
//
//   • value
//   • error
//
// Stream:
//
// Can emit:
//
//   • many values
//   • errors
//   • done event
//
// ============================================================================
// 145. ASYNC ERROR PROPAGATION
// ============================================================================

Future<String>
    levelOne() async {
  throw Exception(
    "Failure",
  );
}


// ============================================================================

Future<String>
    levelTwo() async {
  return await levelOne();
}


// ============================================================================

Future<void>
    levelThree() async {
  try {
    final result =
        await levelTwo();

    print(result);
  } catch (
    error,
    stackTrace,
  ) {
    print(error);
    print(stackTrace);
  }
}


// ============================================================================
// 146. DON'T FORGET await
// ============================================================================
//
// Important:
//
// try {
//   someFuture();
// } catch (error) {
//   ...
// }
//
// may NOT catch an asynchronous error if you don't await the Future.
//
//
//
// Better:
//
// try {
//   await someFuture();
// } catch (error) {
//   ...
// }
//
// ============================================================================
// 147. VERY IMPORTANT ASYNC RULE
// ============================================================================
//
// If you want try/catch around a Future's failure:
//
//     await the Future inside try.
//
// ============================================================================
// 148. UNHANDLED FUTURE
// ============================================================================
//
// A Future that fails without being handled can result in an unhandled
// asynchronous error.
//
// Always understand who owns the Future and who handles its failure.
//
// ============================================================================
// 149. FIRE-AND-FORGET WARNING
// ============================================================================
//
// This:
//
// doSomethingAsync();
//
// without awaiting/handling it can be dangerous if it may fail.
//
// Consider:
//
// unawaited(
//
// )
//
// only when you intentionally don't need to await it,
// and make sure errors are handled appropriately.
//
// ============================================================================
// 150. ERROR HANDLING CHECKLIST
// ============================================================================
//
// For every async operation ask:
//
//   1. Can it fail?
//   2. Who catches the failure?
//   3. Is timeout configured?
//   4. Is retry appropriate?
//   5. Is cancellation possible?
//   6. Is the error logged?
//   7. Is sensitive information protected?
//   8. What should the UI show?
//
// ============================================================================
// 151. PRODUCTION ERROR ARCHITECTURE
// ============================================================================
//
// Recommended flow:
//
//             ┌───────────────────┐
//             │     Flutter UI    │
//             └─────────┬─────────┘
//                       │
//                       ▼
//             ┌───────────────────┐
//             │ Presentation     │
//             │ State / Result   │
//             └─────────┬─────────┘
//                       │
//                       ▼
//             ┌───────────────────┐
//             │ Domain / UseCase  │
//             └─────────┬─────────┘
//                       │
//                       ▼
//             ┌───────────────────┐
//             │ Repository        │
//             └─────────┬─────────┘
//                       │
//                       ▼
//             ┌───────────────────┐
//             │ API / DataSource  │
//             └─────────┬─────────┘
//                       │
//                       ▼
//                  Backend API
//
//
// Error flow:
//
// Backend
//   ↓
// HTTP/Data exception
//   ↓
// Repository mapping
//   ↓
// Domain failure
//   ↓
// State
//   ↓
// User-friendly message
//
// ============================================================================
// 152. COMPLETE MINI ARCHITECTURE
// ============================================================================

abstract interface class
    AuthRepository {
  Future<
      Result<String>>
      login({
    required String email,
    required String password,
  });
}


// ============================================================================

class AuthRepositoryImpl
    implements AuthRepository {
  @override
  Future<
      Result<String>>
      login({
    required String email,
    required String password,
  }) async {
    try {
      if (email.trim().isEmpty ||
          password.isEmpty) {
        return const Failure(
          ValidationException(
            "Email and password are required",
          ),
        );
      }

      // Simulated login.
      if (email !=
              "admin@example.com" ||
          password !=
              "123456") {
        return const Failure(
          InvalidCredentialsFailure(),
        );
      }

      return const Success(
        "access-token",
      );
    } catch (
      error,
      stackTrace,
    ) {
      logError(
        error,
        stackTrace,
      );

      return const Failure(
        NetworkException(
          "Login failed",
        ),
      );
    }
  }
}


// ============================================================================
// 153. LOGIN RESULT
// ============================================================================

Future<void>
    loginExample() async {
  final repository =
      AuthRepositoryImpl();

  final result =
      await repository.login(
    email:
        "admin@example.com",
    password: "123456",
  );

  switch (result) {
    case Success<String>(
        :final data,
      ):
      print(
        "Logged in: $data",
      );

    case Failure<String>(
        :final exception,
      ):
      print(
        userMessage(exception),
      );
  }
}


// ============================================================================
// 154. IMPORTANT ARCHITECTURAL PRINCIPLE
// ============================================================================
//
// Don't make UI responsible for:
//
//   • HTTP status codes
//   • JSON parsing
//   • SocketException
//   • database exceptions
//
// UI should receive meaningful application-level states.
//
// ============================================================================
// 155. ERROR HANDLING LAYERS
// ============================================================================
//
// DATA LAYER:
//
// Converts low-level technical errors.
//
// DOMAIN:
//
// Converts business meaning.
//
// PRESENTATION:
//
// Converts failures into user experience.
//
// GLOBAL:
//
// Captures unexpected errors.
//
// ============================================================================
// 156. ERROR HANDLING ANTI-PATTERNS
// ============================================================================
//
// ❌ Empty catch
//
// ❌ Catch everything and ignore
//
// ❌ Show raw stack trace to user
//
// ❌ Log passwords/tokens
//
// ❌ Retry validation errors
//
// ❌ Retry payment blindly
//
// ❌ Treat every error as network error
//
// ❌ Destroy useful error types
//
// ❌ Hide programming bugs
//
// ❌ Forget async error handling
//
// ❌ Forget timeouts
//
// ============================================================================
// 157. PROFESSIONAL PATTERNS
// ============================================================================
//
// ✓ Typed exceptions
//
// ✓ Typed failures
//
// ✓ Result pattern
//
// ✓ Centralized error mapping
//
// ✓ Stack trace preservation
//
// ✓ Structured logging
//
// ✓ Safe UI messages
//
// ✓ Retry only when appropriate
//
// ✓ Timeout
//
// ✓ Cancellation
//
// ✓ Idempotency for critical operations
//
// ✓ Global safety net
//
// ============================================================================
// 158. INTERVIEW QUESTIONS
// ============================================================================
//
// 1. What is the difference between Error and Exception?
//
// 2. What does throw do?
//
// 3. What is try/catch?
//
// 4. Why is stackTrace important?
//
// 5. What does finally do?
//
// 6. What is rethrow?
//
// 7. Why prefer rethrow over throw error when preserving the original
//    stack trace?
//
// 8. Can Dart throw arbitrary objects?
//
// 9. Why should production code use typed exceptions?
//
// 10. What is error propagation?
//
// 11. When should you catch an exception?
//
// 12. When should you let an exception propagate?
//
// 13. What is a custom exception?
//
// 14. What is the difference between exception and failure?
//
// 15. What is the Result pattern?
//
// 16. When should Result be preferred over exceptions?
//
// 17. How do async errors propagate?
//
// 18. Why must you await a Future inside try/catch?
//
// 19. How do Streams handle errors?
//
// 20. What is timeout?
//
// 21. Why is retry dangerous for payment APIs?
//
// 22. What is idempotency?
//
// 23. What is exponential backoff?
//
// 24. What is retry jitter?
//
// 25. Why should raw exceptions not be shown to users?
//
// 26. Why should passwords and tokens never be logged?
//
// 27. What is the difference between authentication and authorization?
//
// 28. What is a business-rule failure?
//
// 29. What is global error handling?
//
// 30. What is the role of a repository in error handling?
//
// ============================================================================
// 159. FINAL MASTER CHECKLIST
// ============================================================================
//
// BASIC
// [✓] Error
// [✓] Exception
// [✓] throw
// [✓] try
// [✓] catch
// [✓] finally
// [✓] stackTrace
// [✓] rethrow
//
// CUSTOM ERRORS
// [✓] Custom exception
// [✓] Exception hierarchy
// [✓] Business exceptions
// [✓] Validation exceptions
// [✓] Network exceptions
// [✓] Authentication failures
// [✓] Authorization failures
// [✓] Server failures
// [✓] Parsing failures
// [✓] Database failures
//
// ASYNC
// [✓] Future errors
// [✓] async/await errors
// [✓] Stream errors
// [✓] Timeout
// [✓] Retry
// [✓] Backoff
// [✓] Cancellation concept
//
// ARCHITECTURE
// [✓] Error propagation
// [✓] Error translation
// [✓] Repository error handling
// [✓] Domain failures
// [✓] Presentation state
// [✓] Global error safety net
//
// SECURITY
// [✓] Safe user messages
// [✓] No passwords in logs
// [✓] No tokens in logs
// [✓] No sensitive server details in UI
//
// PRODUCTION
// [✓] Logging
// [✓] Retry policy
// [✓] Idempotency concept
// [✓] Cache fallback
// [✓] Pagination
// [✓] Critical-operation safety
//
// ============================================================================
// 160. PHASE 23 GOLDEN RULES
// ============================================================================
//
// RULE 1:
// Never silently swallow an error.
//
// RULE 2:
// Catch an error only when you know what to do with it.
//
// RULE 3:
// Preserve the original stack trace when rethrowing.
//
// RULE 4:
// Use typed exceptions/failures instead of generic strings.
//
// RULE 5:
// Separate technical errors from business failures.
//
// RULE 6:
// Never expose internal error details directly to users.
//
// RULE 7:
// Never log passwords, tokens, OTPs, or secrets.
//
// RULE 8:
// Always understand who handles a Future's error.
//
// RULE 9:
// Use timeout for network operations.
//
// RULE 10:
// Retry only operations that are safe to retry.
//
// RULE 11:
// Critical operations such as payment/order creation require idempotency.
//
// RULE 12:
// Don't use a global error handler to hide bugs.
//
// RULE 13:
// Convert low-level errors at architectural boundaries.
//
// RULE 14:
// Let unexpected programming errors remain visible to developers.
//
// RULE 15:
// Make the UI display meaningful application-level error states.
//
// RULE 16:
// For an ERP:
//
//     HTTP Error
//         ↓
//     Data Exception
//         ↓
//     Domain Failure
//         ↓
//     Presentation State
//         ↓
//     User Message
//
// RULE 17:
// Every production async operation should have a clear answer to:
//
//     "What happens if this fails?"
//
// RULE 18:
// Every important network operation should have a clear answer to:
//
//     "What happens if this takes 30 seconds?"
//
// RULE 19:
// Every retryable operation should have a clear answer to:
//
//     "What happens if the first request actually succeeded?"
//
// RULE 20:
// The best error handling system doesn't just prevent crashes.
//
// It makes failures:
//
//     predictable
//     observable
//     secure
//     recoverable
//     understandable
//
// ============================================================================
// END OF PHASE 23
// ============================================================================
//
// NEXT:
//
// PHASE 24 — DART FUNCTIONAL PROGRAMMING & ADVANCED COLLECTIONS
//
// Topics:
//
//   • First-class functions
//   • Higher-order functions
//   • Closures
//   • Function composition
//   • Currying concepts
//   • tear-offs
//   • callable classes
//   • typedef
//   • advanced Iterable
//   • lazy evaluation
//   • custom Iterable
//   • sync*
//   • yield
//   • async*
//   • functional transformations
//   • predicates
//   • reducers
//   • pipelines
//   • collection utilities
//   • reusable functional utilities
//   • production Flutter use cases
//
// ============================================================================