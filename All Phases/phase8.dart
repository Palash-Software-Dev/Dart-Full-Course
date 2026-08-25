// ============================================================================
// DART MASTER ROADMAP
// PHASE 8 — ASYNCHRONOUS DART
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// Master asynchronous programming in Dart for real-world Flutter development.
//
// Async programming is one of the MOST IMPORTANT Dart topics for a
// Full-Stack Flutter Developer.
//
// You will use async programming for:
//
//   • REST API calls
//   • HTTP requests
//   • MongoDB/Node.js API communication
//   • Database operations
//   • Authentication
//   • Login/Register
//   • OTP verification
//   • File upload
//   • Image upload
//   • Cloudinary
//   • Payment processing
//   • Notifications
//   • Loading states
//   • Background operations
//   • Real-time data
//   • WebSockets
//   • Streams
//   • Search suggestions
//   • Pagination
//   • Infinite scrolling
//   • State management
//
// ============================================================================
//
// PHASE 8 TOPICS
// ============================================================================
//
// FUTURE
//
// 01. Synchronous vs asynchronous code
// 02. Blocking vs non-blocking
// 03. Future
// 04. Future<T>
// 05. Future<void>
// 06. Future.value()
// 07. Future.delayed()
// 08. async
// 09. await
// 10. async + await
// 11. then()
// 12. catchError()
// 13. whenComplete()
//
// ERROR HANDLING
//
// 14. Async try/catch
// 15. finally
// 16. Error propagation
// 17. Rethrowing errors
// 18. Custom async exceptions
// 19. Error handling strategy
//
// MULTIPLE FUTURES
//
// 20. Future.wait()
// 21. Future.any()
// 22. Sequential Futures
// 23. Parallel Futures
// 24. Independent API requests
// 25. Dependent API requests
//
// ADVANCED FUTURE
//
// 26. timeout()
// 27. Future error
// 28. FutureOr
// 29. Completer
// 30. Future chaining
// 31. Future cancellation concept
//
// STREAM
//
// 32. Stream
// 33. Single-subscription Stream
// 34. Broadcast Stream
// 35. StreamController
// 36. StreamSubscription
// 37. listen()
// 38. onData
// 39. onError
// 40. onDone
// 41. cancel()
// 42. pause()
// 43. resume()
//
// STREAM GENERATORS
//
// 44. async*
// 45. yield
// 46. yield*
// 47. await for
//
// STREAM TRANSFORMATION
//
// 48. map()
// 49. where()
// 50. expand()
// 51. asyncMap()
// 52. asyncExpand()
// 53. handleError()
// 54. timeout()
//
// REAL FLUTTER APPLICATION
//
// 55. API loading state
// 56. API success state
// 57. API error state
// 58. Login API
// 59. Product API
// 60. Pagination API
// 61. Search API
// 62. File upload
// 63. Multiple API requests
// 64. Real-time updates
// 65. Debounced search
// 66. Stream-based architecture
//
// ============================================================================


// ============================================================================
// 01. SYNCHRONOUS CODE
// ============================================================================
//
// Synchronous code executes one operation after another.
//
// Example:
//
//   print A
//   print B
//   print C
//
// Output:
//
//   A
//   B
//   C
//
// ============================================================================

void synchronousExample() {
  print("A");
  print("B");
  print("C");
}


// ============================================================================
// 02. ASYNCHRONOUS CODE
// ============================================================================
//
// Asynchronous code allows an operation to complete later.
//
// Example:
//
//   Start request
//   Do other work
//   Request completes
//
// This is essential because Flutter must keep the UI responsive.
//
// ============================================================================

void asynchronousConceptExample() {
  print("Start");

  Future.delayed(
    const Duration(seconds: 2),
    () {
      print("After 2 seconds");
    },
  );

  print("End");
}


// ============================================================================
// OUTPUT:
//
// Start
// End
// After 2 seconds
//
// The delayed operation does not block the rest of the program.
//
// ============================================================================


// ============================================================================
// 03. FUTURE
// ============================================================================
//
// Future represents a value that will be available later.
//
// Think:
//
//   Future<String>
//
// means:
//
//   "A String that will arrive in the future."
//
// ============================================================================

Future<String> getUserName() {
  return Future.value("Palash");
}


// ============================================================================
// 04. FUTURE<T>
// ============================================================================
//
// Future can contain any type.
//
// ============================================================================

Future<int> getAge() {
  return Future.value(25);
}

Future<double> getBalance() {
  return Future.value(5000.0);
}

Future<bool> checkLogin() {
  return Future.value(true);
}


// ============================================================================
// 05. FUTURE<void>
// ============================================================================
//
// Used when asynchronous operation doesn't return a value.
//
// Common examples:
//
//   • Delete API
//   • Update API
//   • Logout
//   • Upload operation
//
// ============================================================================

Future<void> logoutUser() async {
  print("Logging out...");
}


// ============================================================================
// 06. FUTURE.VALUE
// ============================================================================

Future<String> futureValueExample() {
  return Future.value("Hello Dart");
}


// ============================================================================
// 07. FUTURE.DELAYED
// ============================================================================
//
// Simulates an operation that finishes later.
//
// Useful for learning and testing.
//
// ============================================================================

Future<String> delayedExample() {
  return Future.delayed(
    const Duration(seconds: 2),
    () => "Completed",
  );
}


// ============================================================================
// 08. ASYNC
// ============================================================================
//
// async tells Dart that a function performs asynchronous work.
//
// An async function normally returns a Future.
//
// ============================================================================

Future<String> asyncExample() async {
  return "Hello";
}


// ============================================================================
// Even though:
//
//   return "Hello";
//
// The actual return type is:
//
//   Future<String>
//
// because the function is async.
//
// ============================================================================


// ============================================================================
// 09. AWAIT
// ============================================================================
//
// await waits for a Future to complete.
//
// It can only be used inside an async function.
//
// ============================================================================

Future<void> awaitExample() async {
  final name = await getUserName();

  print(name);
}


// ============================================================================
// 10. ASYNC + AWAIT
// ============================================================================
//
// This is the MOST IMPORTANT pattern for Flutter API development.
//
// ============================================================================

Future<String> fetchUser() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return "Palash";
}

Future<void> asyncAwaitExample() async {
  print("Request started");

  final user = await fetchUser();

  print("User: $user");

  print("Request completed");
}


// ============================================================================
// FLOW:
//
// asyncAwaitExample()
//        ↓
// fetchUser()
//        ↓
// await
//        ↓
// Future completes
//        ↓
// user received
//
// ============================================================================


// ============================================================================
// 11. THEN()
// ============================================================================
//
// then() runs when a Future completes successfully.
//
// ============================================================================

void thenExample() {
  getUserName().then(
    (name) {
      print(name);
    },
  );
}


// ============================================================================
// 12. FUTURE CHAINING WITH THEN
// ============================================================================

Future<int> getUserId() {
  return Future.value(101);
}

Future<String> getUserById(int id) {
  return Future.value(
    "User ID: $id",
  );
}

void thenChainingExample() {
  getUserId()
      .then(
        (id) => getUserById(id),
      )
      .then(
        (user) => print(user),
      );
}


// ============================================================================
// 13. CATCHERROR
// ============================================================================
//
// Handles errors in Future chains.
//
// ============================================================================

Future<String> failingRequest() {
  return Future.error(
    Exception("Network error"),
  );
}

void catchErrorExample() {
  failingRequest().then(
    (value) {
      print(value);
    },
  ).catchError(
    (error) {
      print("Error: $error");
    },
  );
}


// ============================================================================
// 14. WHEN COMPLETE
// ============================================================================
//
// Runs whether the Future succeeds or fails.
//
// Similar to finally.
//
// ============================================================================

void whenCompleteExample() {
  getUserName()
      .then(
        (name) => print(name),
      )
      .catchError(
        (error) => print(error),
      )
      .whenComplete(
        () => print("Request finished"),
      );
}


// ============================================================================
// 15. TRY/CATCH WITH ASYNC
// ============================================================================
//
// This is usually cleaner than then()/catchError() for application code.
//
// ============================================================================

Future<void> tryCatchExample() async {
  try {
    final name = await getUserName();

    print(name);
  } catch (error) {
    print("Error: $error");
  }
}


// ============================================================================
// 16. FINALLY
// ============================================================================
//
// finally executes whether operation succeeds or fails.
//
// ============================================================================

Future<void> finallyExample() async {
  try {
    await failingRequest();
  } catch (error) {
    print("Error: $error");
  } finally {
    print("Cleanup completed");
  }
}


// ============================================================================
// REAL FLUTTER USE:
//
// loading = true
//
// try {
//   await API
// } catch (...) {
//   show error
// } finally {
//   loading = false
// }
//
// ============================================================================


// ============================================================================
// 17. ERROR PROPAGATION
// ============================================================================
//
// If a lower-level function throws an error and doesn't handle it,
// the error can propagate upward.
//
// ============================================================================

Future<String> repositoryRequest() async {
  throw Exception(
    "Server unavailable",
  );
}

Future<String> serviceRequest() async {
  return await repositoryRequest();
}

Future<void> controllerRequest() async {
  try {
    final result = await serviceRequest();

    print(result);
  } catch (error) {
    print("Handled at controller level");
    print(error);
  }
}


// ============================================================================
// ARCHITECTURE:
//
// UI
//  ↓
// Controller
//  ↓
// Service
//  ↓
// Repository
//  ↓
// API
//
// Error can propagate upward.
//
// ============================================================================


// ============================================================================
// 18. RETHROW
// ============================================================================
//
// rethrow sends the same error upward while preserving useful stack
// information.
//
// ============================================================================

Future<void> rethrowExample() async {
  try {
    await repositoryRequest();
  } catch (error) {
    print("Logging error...");
    rethrow;
  }
}


// ============================================================================
// 19. CUSTOM ASYNC EXCEPTION
// ============================================================================

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return "ApiException: $message"
        "${statusCode == null ? "" : " ($statusCode)"}";
  }
}


// ============================================================================
// Example:
//
// ============================================================================

Future<String> apiRequest() async {
  throw const ApiException(
    message: "Unauthorized",
    statusCode: 401,
  );
}


// ============================================================================
// 20. FUTURE.WAIT
// ============================================================================
//
// Executes multiple independent Futures together and waits for all.
//
// Extremely useful for dashboards.
//
// Example:
//
//   Load:
//      • User
//      • Orders
//      • Sales
//      • Inventory
//
// ============================================================================

Future<String> fetchProfile() async {
  await Future.delayed(
    const Duration(milliseconds: 500),
  );

  return "Profile";
}

Future<String> fetchOrders() async {
  await Future.delayed(
    const Duration(milliseconds: 700),
  );

  return "Orders";
}

Future<String> fetchInventory() async {
  await Future.delayed(
    const Duration(milliseconds: 600),
  );

  return "Inventory";
}

Future<void> futureWaitExample() async {
  final results = await Future.wait([
    fetchProfile(),
    fetchOrders(),
    fetchInventory(),
  ]);

  print(results);
}


// ============================================================================
// WHY FUTURE.WAIT?
// ----------------------------------------------------------------------------
//
// Sequential:
//
//   profile → 500ms
//   orders  → 700ms
//   inventory → 600ms
//
// Total ≈ 1800ms
//
// Parallel:
//
//   all start together
//
// Total ≈ 700ms
//
// This can significantly improve dashboard performance.
//
// ============================================================================


// ============================================================================
// 21. FUTURE.ANY
// ============================================================================
//
// Returns the first Future that completes successfully.
//
// ============================================================================

Future<String> serverA() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return "Server A";
}

Future<String> serverB() async {
  await Future.delayed(
    const Duration(seconds: 1),
  );

  return "Server B";
}

Future<void> futureAnyExample() async {
  final result = await Future.any([
    serverA(),
    serverB(),
  ]);

  print(result);
}


// ============================================================================
// Result:
//
// Server B
//
// because B completes first.
//
// ============================================================================


// ============================================================================
// 22. SEQUENTIAL FUTURES
// ============================================================================
//
// Sometimes the second operation depends on the first.
//
// Example:
//
//   Login
//      ↓
//   Get token
//      ↓
//   Get profile
//
// ============================================================================

Future<String> login() async {
  return "TOKEN_123";
}

Future<String> getProfileWithToken(
  String token,
) async {
  return "Profile for $token";
}

Future<void> sequentialExample() async {
  final token = await login();

  final profile =
      await getProfileWithToken(token);

  print(profile);
}


// ============================================================================
// 23. PARALLEL FUTURES
// ============================================================================
//
// If operations don't depend on each other:
//
// ============================================================================

Future<void> parallelExample() async {
  final results = await Future.wait([
    fetchProfile(),
    fetchOrders(),
    fetchInventory(),
  ]);

  print(results);
}


// ============================================================================
// 24. DEPENDENT API REQUESTS
// ============================================================================
//
// Real application example:
//
//   Login
//     ↓
//   Token
//     ↓
//   Profile
//     ↓
//   Company
//     ↓
//   Branches
//
// ============================================================================

Future<String> getCompany(
  String token,
) async {
  return "Company";
}

Future<List<String>> getBranches(
  String company,
) async {
  return [
    "Main Branch",
    "Dhaka Branch",
  ];
}

Future<void> dependentApiExample() async {
  final token = await login();

  final company =
      await getCompany(token);

  final branches =
      await getBranches(company);

  print(branches);
}


// ============================================================================
// 25. INDEPENDENT API REQUESTS
// ============================================================================
//
// Example:
//
// Dashboard:
//
//   total users
//   total sales
//   total orders
//   low stock
//
// These can often be fetched in parallel.
//
// ============================================================================


// ============================================================================
// 26. TIMEOUT
// ============================================================================
//
// Prevent an operation from waiting forever.
//
// ============================================================================

Future<String> slowRequest() async {
  await Future.delayed(
    const Duration(seconds: 5),
  );

  return "Done";
}

Future<void> timeoutExample() async {
  try {
    final result = await slowRequest().timeout(
      const Duration(seconds: 2),
    );

    print(result);
  } catch (error) {
    print("Request timed out");
  }
}


// ============================================================================
// 27. TIMEOUT WITH FALLBACK
// ============================================================================

Future<void> timeoutFallbackExample() async {
  final result = await slowRequest().timeout(
    const Duration(seconds: 2),
    onTimeout: () => "Fallback data",
  );

  print(result);
}


// ============================================================================
// 28. FUTUREOR
// ============================================================================
//
// FutureOr<T> means:
//
//   T
//   OR
//   Future<T>
//
// ============================================================================

FutureOr<String> getName(
  bool asyncMode,
) {
  if (asyncMode) {
    return Future.value("Palash");
  }

  return "Palash";
}


// ============================================================================
// 29. COMPLETER
// ============================================================================
//
// Completer allows you to manually complete a Future.
//
// Usually used in advanced APIs and integrations.
//
// ============================================================================

import 'dart:async';

Future<String> completerExample() {
  final completer =
      Completer<String>();

  Future.delayed(
    const Duration(seconds: 1),
    () {
      completer.complete("Completed");
    },
  );

  return completer.future;
}


// ============================================================================
// Completer can also complete with error:
//
// ============================================================================

Future<String> completerErrorExample() {
  final completer =
      Completer<String>();

  Future.delayed(
    const Duration(seconds: 1),
    () {
      completer.completeError(
        Exception("Something went wrong"),
      );
    },
  );

  return completer.future;
}


// ============================================================================
// IMPORTANT:
//
// Don't use Completer when async/await or a normal Future is enough.
//
// Use it when an external callback/event needs to complete a Future.
//
// ============================================================================


// ============================================================================
// 30. FUTURE CHAINING
// ============================================================================

Future<String> stepOne() async {
  return "Step 1";
}

Future<String> stepTwo(
  String previous,
) async {
  return "$previous → Step 2";
}

Future<String> stepThree(
  String previous,
) async {
  return "$previous → Step 3";
}

Future<void> futureChainExample() async {
  final result = await stepThree(
    await stepTwo(
      await stepOne(),
    ),
  );

  print(result);
}


// ============================================================================
// Cleaner version:
//
// ============================================================================

Future<void> readableFutureChainExample() async {
  final first = await stepOne();
  final second = await stepTwo(first);
  final third = await stepThree(second);

  print(third);
}


// ============================================================================
// 31. FUTURE CANCELLATION CONCEPT
// ============================================================================
//
// Dart Future itself doesn't provide general-purpose cancellation.
//
// For cancellable operations, the API/library often needs its own
// cancellation mechanism.
//
// Streams have StreamSubscription.cancel().
//
// This distinction is important.
//
// ============================================================================


// ============================================================================
// 32. STREAM
// ============================================================================
//
// Future:
//
//   One result.
//
// Stream:
//
//   Multiple results over time.
//
// Example:
//
// Future:
//
//   API response
//
// Stream:
//
//   Chat messages
//   Location updates
//   WebSocket events
//   Search suggestions
//   Sensor data
//   Real-time notifications
//
// ============================================================================


// ============================================================================
// 33. SINGLE-SUBSCRIPTION STREAM
// ============================================================================
//
// Default StreamController creates a single-subscription stream.
//
// Usually only one listener is allowed.
//
// ============================================================================

void singleSubscriptionStreamExample() {
  final controller =
      StreamController<int>();

  controller.stream.listen(
    (value) {
      print("Received: $value");
    },
  );

  controller.add(10);
  controller.add(20);
  controller.add(30);

  controller.close();
}


// ============================================================================
// 34. BROADCAST STREAM
// ============================================================================
//
// Multiple listeners can listen to a broadcast stream.
//
// Useful for:
//
//   • App-wide events
//   • Notifications
//   • Authentication state
//   • Event buses
//
// ============================================================================

void broadcastStreamExample() {
  final controller =
      StreamController<int>.broadcast();

  controller.stream.listen(
    (value) {
      print("Listener 1: $value");
    },
  );

  controller.stream.listen(
    (value) {
      print("Listener 2: $value");
    },
  );

  controller.add(100);

  controller.close();
}


// ============================================================================
// 35. STREAMCONTROLLER
// ============================================================================
//
// StreamController allows you to manually push events into a stream.
//
// ============================================================================

void streamControllerExample() {
  final controller =
      StreamController<String>();

  controller.stream.listen(
    (message) {
      print("Message: $message");
    },
  );

  controller.add("Hello");
  controller.add("Welcome");
  controller.add("Flutter");

  controller.close();
}


// ============================================================================
// 36. STREAMSUBSCRIPTION
// ============================================================================

void subscriptionExample() {
  final controller =
      StreamController<int>();

  final subscription =
      controller.stream.listen(
    (value) {
      print(value);
    },
  );

  controller.add(1);
  controller.add(2);

  subscription.cancel();

  controller.close();
}


// ============================================================================
// 37. LISTEN
// ============================================================================
//
// listen() starts listening to a Stream.
//
// ============================================================================

void listenExample() {
  final controller =
      StreamController<String>();

  controller.stream.listen(
    (value) {
      print("Data: $value");
    },
    onDone: () {
      print("Stream completed");
    },
  );

  controller.add("A");
  controller.add("B");

  controller.close();
}


// ============================================================================
// 38. ON DATA
// ============================================================================

void onDataExample() {
  final controller =
      StreamController<int>();

  controller.stream.listen(
    (value) {
      print("Received: $value");
    },
  );

  controller.add(10);
  controller.close();
}


// ============================================================================
// 39. ON ERROR
// ============================================================================

void onErrorExample() {
  final controller =
      StreamController<int>();

  controller.stream.listen(
    (value) {
      print(value);
    },
    onError: (error) {
      print("Stream error: $error");
    },
  );

  controller.addError(
    Exception("Something went wrong"),
  );

  controller.close();
}


// ============================================================================
// 40. ON DONE
// ============================================================================

void onDoneExample() {
  final controller =
      StreamController<int>();

  controller.stream.listen(
    (value) {
      print(value);
    },
    onDone: () {
      print("No more events");
    },
  );

  controller.add(1);
  controller.add(2);

  controller.close();
}


// ============================================================================
// 41. CANCEL
// ============================================================================

Future<void> cancelSubscriptionExample() async {
  final controller =
      StreamController<int>();

  final subscription =
      controller.stream.listen(
    (value) {
      print(value);
    },
  );

  controller.add(1);
  controller.add(2);

  await subscription.cancel();

  await controller.close();
}


// ============================================================================
// 42. PAUSE
// ============================================================================

Future<void> pauseExample() async {
  final controller =
      StreamController<int>();

  final subscription =
      controller.stream.listen(
    (value) {
      print(value);
    },
  );

  controller.add(1);

  subscription.pause();

  controller.add(2);
  controller.add(3);

  subscription.resume();

  await controller.close();
}


// ============================================================================
// 43. RESUME
// ============================================================================
//
// resume() continues a paused subscription.
//
// ============================================================================


// ============================================================================
// 44. ASYNC*
// ============================================================================
//
// async* creates an asynchronous generator.
//
// It returns a Stream.
//
// ============================================================================

Stream<int> countNumbers() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    yield i;
  }
}


// ============================================================================
// 45. YIELD
// ============================================================================
//
// yield sends one value into the Stream.
//
// ============================================================================

Stream<String> messages() async* {
  yield "Hello";

  await Future.delayed(
    const Duration(seconds: 1),
  );

  yield "Welcome";

  await Future.delayed(
    const Duration(seconds: 1),
  );

  yield "Flutter";
}


// ============================================================================
// 46. LISTEN TO GENERATED STREAM
// ============================================================================

void generatedStreamExample() {
  countNumbers().listen(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 47. YIELD*
// ============================================================================
//
// yield* forwards all events from another Stream.
//
// ============================================================================

Stream<int> firstNumbers() async* {
  yield 1;
  yield 2;
}

Stream<int> secondNumbers() async* {
  yield 3;
  yield 4;
}

Stream<int> allNumbers() async* {
  yield* firstNumbers();
  yield* secondNumbers();
}


// ============================================================================
// 48. AWAIT FOR
// ============================================================================
//
// await for reads values from a Stream one by one.
//
// ============================================================================

Future<void> awaitForExample() async {
  await for (final number in countNumbers()) {
    print("Number: $number");
  }
}


// ============================================================================
// 49. STREAM MAP
// ============================================================================

Stream<int> doubledStream(
  Stream<int> numbers,
) {
  return numbers.map(
    (number) => number * 2,
  );
}


// ============================================================================
// 50. STREAM WHERE
// ============================================================================

Stream<int> evenStream(
  Stream<int> numbers,
) {
  return numbers.where(
    (number) => number.isEven,
  );
}


// ============================================================================
// 51. STREAM EXPAND
// ============================================================================

Stream<int> expandedStream(
  Stream<List<int>> source,
) {
  return source.expand(
    (numbers) => numbers,
  );
}


// ============================================================================
// 52. ASYNCMAP
// ============================================================================
//
// asyncMap is useful when every incoming event needs an asynchronous
// operation.
//
// Example:
//
//   Search term
//      ↓
//   API request
//      ↓
//   Search result
//
// ============================================================================

Stream<String> asyncSearchStream(
  Stream<String> queries,
) {
  return queries.asyncMap(
    (query) async {
      await Future.delayed(
        const Duration(milliseconds: 300),
      );

      return "Result for $query";
    },
  );
}


// ============================================================================
// 53. HANDLEERROR
// ============================================================================

Stream<int> errorHandlingStream() {
  return Stream<int>.fromIterable([
    1,
    2,
    3,
  ]).handleError(
    (error) {
      print("Handled: $error");
    },
  );
}


// ============================================================================
// 54. STREAM TIMEOUT
// ============================================================================

Stream<int> timeoutStream(
  Stream<int> source,
) {
  return source.timeout(
    const Duration(seconds: 5),
  );
}


// ============================================================================
// 55. API LOADING STATE
// ============================================================================
//
// In Flutter, API calls commonly have three states:
//
//   Loading
//   Success
//   Error
//
// ============================================================================

enum ApiStatus {
  initial,
  loading,
  success,
  error,
}


// ============================================================================
// 56. API STATE MODEL
// ============================================================================

class ApiState<T> {
  final ApiStatus status;
  final T? data;
  final String? error;

  const ApiState({
    required this.status,
    this.data,
    this.error,
  });

  const ApiState.initial()
      : status = ApiStatus.initial,
        data = null,
        error = null;

  const ApiState.loading()
      : status = ApiStatus.loading,
        data = null,
        error = null;

  const ApiState.success(T value)
      : status = ApiStatus.success,
        data = value,
        error = null;

  const ApiState.error(String message)
      : status = ApiStatus.error,
        data = null,
        error = message;
}


// ============================================================================
// 57. GENERIC API SERVICE
// ============================================================================

class ApiService {
  Future<List<String>> getProducts() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [
      "Phone",
      "Laptop",
      "Watch",
    ];
  }
}


// ============================================================================
// 58. LOGIN API EXAMPLE
// ============================================================================

class AuthService {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (email.isEmpty ||
        password.isEmpty) {
      throw const ApiException(
        message: "Email and password required",
      );
    }

    return "JWT_TOKEN";
  }
}


// ============================================================================
// 59. LOGIN CONTROLLER EXAMPLE
// ============================================================================

class AuthController {
  final AuthService service;

  AuthController(this.service);

  ApiState<String> state =
      const ApiState.initial();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const ApiState.loading();

    try {
      final token = await service.login(
        email: email,
        password: password,
      );

      state = ApiState.success(token);
    } catch (error) {
      state = ApiState.error(
        error.toString(),
      );
    }
  }
}


// ============================================================================
// 60. PRODUCT API
// ============================================================================

class ProductApi {
  Future<List<ProductJsonModel>>
      getProducts() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return const [
      ProductJsonModel(
        id: "P001",
        name: "Phone",
        price: 100000,
      ),
      ProductJsonModel(
        id: "P002",
        name: "Laptop",
        price: 150000,
      ),
    ];
  }
}


// ============================================================================
// 61. PAGINATION API
// ============================================================================

class PaginationApi {
  Future<List<String>> getProducts({
    required int page,
    required int limit,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return List.generate(
      limit,
      (index) =>
          "Product ${(page - 1) * limit + index + 1}",
    );
  }
}


// ============================================================================
// 62. FILE UPLOAD CONCEPT
// ============================================================================
//
// File upload is asynchronous.
//
// Typical flow:
//
//   Pick file
//      ↓
//   Read file
//      ↓
//   Upload to server/Cloudinary
//      ↓
//   Receive URL
//      ↓
//   Save URL
//
// ============================================================================

Future<String> uploadFile(
  String filePath,
) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return "https://server.com/image.jpg";
}


// ============================================================================
// 63. MULTIPLE API REQUESTS
// ============================================================================

Future<void> dashboardExample() async {
  try {
    final results = await Future.wait([
      fetchProfile(),
      fetchOrders(),
      fetchInventory(),
    ]);

    print("Dashboard loaded");
    print(results);
  } catch (error) {
    print("Dashboard error: $error");
  }
}


// ============================================================================
// 64. REAL-TIME STREAM
// ============================================================================
//
// Example: notifications.
//
// ============================================================================

class NotificationService {
  final _controller =
      StreamController<String>.broadcast();

  Stream<String> get notifications =>
      _controller.stream;

  void sendNotification(
    String message,
  ) {
    _controller.add(message);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// Usage:
//
// ============================================================================

void notificationExample() {
  final service =
      NotificationService();

  final subscription =
      service.notifications.listen(
    (message) {
      print("Notification: $message");
    },
  );

  service.sendNotification(
    "New order received",
  );

  service.sendNotification(
    "Payment received",
  );

  subscription.cancel();

  service.dispose();
}


// ============================================================================
// 65. DEBOUNCED SEARCH CONCEPT
// ============================================================================
//
// When user types:
//
//   p
//   ph
//   pho
//   phon
//   phone
//
// We don't want to send 5 API requests immediately.
//
// Instead:
//
//   Wait 300-500ms after the user stops typing.
//
// This is called debouncing.
//
// ============================================================================

class SearchService {
  Timer? _timer;

  void search(
    String query,
    Future<void> Function(String) request,
  ) {
    _timer?.cancel();

    _timer = Timer(
      const Duration(milliseconds: 400),
      () {
        request(query);
      },
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}


// ============================================================================
// IMPORTANT:
//
// Timer belongs to dart:async.
//
// ============================================================================


// ============================================================================
// 66. ASYNC SEARCH CONCEPT
// ============================================================================

Future<List<String>> searchProducts(
  String query,
) async {
  await Future.delayed(
    const Duration(milliseconds: 500),
  );

  if (query.isEmpty) {
    return [];
  }

  return [
    "$query Phone",
    "$query Laptop",
    "$query Watch",
  ];
}


// ============================================================================
// 67. STREAM-BASED SEARCH
// ============================================================================

Stream<String> searchQueries() async* {
  yield "p";

  await Future.delayed(
    const Duration(milliseconds: 200),
  );

  yield "ph";

  await Future.delayed(
    const Duration(milliseconds: 200),
  );

  yield "pho";
}


// ============================================================================
// 68. SEARCH STREAM → API
// ============================================================================

Stream<List<String>> searchResults(
  Stream<String> queries,
) {
  return queries.asyncMap(
    searchProducts,
  );
}


// ============================================================================
// 69. STREAM TRANSFORMATION PIPELINE
// ============================================================================

Stream<String> processedStream(
  Stream<String> source,
) {
  return source
      .where(
        (value) => value.isNotEmpty,
      )
      .map(
        (value) => value.trim().toLowerCase(),
      );
}


// ============================================================================
// 70. STREAM GENERATOR WITH API
// ============================================================================

Stream<String> loadPages() async* {
  for (int page = 1; page <= 3; page++) {
    final products =
        await PaginationApi().getProducts(
      page: page,
      limit: 5,
    );

    yield* Stream.fromIterable(
      products,
    );
  }
}


// ============================================================================
// 71. AWAIT FOR PAGINATION
// ============================================================================

Future<void> consumePages() async {
  await for (final product in loadPages()) {
    print(product);
  }
}


// ============================================================================
// 72. STREAM CONTROLLER RESOURCE MANAGEMENT
// ============================================================================
//
// Always close StreamController when no longer needed.
//
// Otherwise you can create memory/resource leaks.
//
// ============================================================================

class CounterStream {
  final StreamController<int>
      _controller =
      StreamController<int>();

  int _count = 0;

  Stream<int> get stream =>
      _controller.stream;

  void increment() {
    _count++;
    _controller.add(_count);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// 73. BROADCAST EVENT BUS
// ============================================================================

class AppEventBus {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get events =>
      _controller.stream;

  void emit(String event) {
    _controller.add(event);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// 74. EVENT BUS USAGE
// ============================================================================

void eventBusExample() {
  final bus = AppEventBus();

  final subscription =
      bus.events.listen(
    (event) {
      print("Event: $event");
    },
  );

  bus.emit("logout");
  bus.emit("orderCreated");

  subscription.cancel();

  bus.dispose();
}


// ============================================================================
// 75. FUTURE + STREAM DIFFERENCE
// ============================================================================
//
// Future:
//
//   One asynchronous result.
//
// Example:
//
//   Future<User>
//
// Stream:
//
//   Multiple asynchronous results.
//
// Example:
//
//   Stream<User>
//
// Think:
//
//   Future = one delivery
//
//   Stream = continuous delivery
//
// ============================================================================


// ============================================================================
// 76. FUTURE VS STREAM EXAMPLE
// ============================================================================

Future<String> oneMessage() async {
  return "Hello";
}

Stream<String> manyMessages() async* {
  yield "Hello";
  yield "How are you?";
  yield "Welcome";
}


// ============================================================================
// 77. STREAM ERROR
// ============================================================================

Stream<int> streamWithError() async* {
  yield 1;
  yield 2;

  throw Exception(
    "Something went wrong",
  );
}


// ============================================================================
// 78. HANDLE STREAM ERROR
// ============================================================================

void handleStreamErrorExample() {
  streamWithError().listen(
    (value) {
      print(value);
    },
    onError: (error) {
      print("Error: $error");
    },
    onDone: () {
      print("Stream finished");
    },
  );
}


// ============================================================================
// 79. ASYNC FUNCTION ERROR
// ============================================================================

Future<int> divide(
  int a,
  int b,
) async {
  if (b == 0) {
    throw ArgumentError(
      "Cannot divide by zero",
    );
  }

  return a ~/ b;
}


// ============================================================================
// 80. HANDLE ASYNC ERROR
// ============================================================================

Future<void> divideExample() async {
  try {
    final result =
        await divide(10, 0);

    print(result);
  } on ArgumentError catch (error) {
    print(
      "Invalid argument: $error",
    );
  } catch (error) {
    print(
      "Unknown error: $error",
    );
  }
}


// ============================================================================
// 81. MULTIPLE CATCH TYPES
// ============================================================================

Future<void> multipleCatchExample() async {
  try {
    await apiRequest();
  } on ApiException catch (error) {
    print(
      "API error: ${error.message}",
    );
  } catch (error) {
    print(
      "Unexpected error: $error",
    );
  }
}


// ============================================================================
// 82. ASYNC INITIALIZATION
// ============================================================================
//
// Sometimes a class needs asynchronous initialization.
//
// ============================================================================

class AppRepository {
  String? token;

  Future<void> initialize() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    token = "TOKEN";
  }
}


// ============================================================================
// 83. ASYNC FACTORY
// ============================================================================
//
// A factory constructor itself cannot be async.
//
// Instead use a static async method or separate initializer.
//
// ============================================================================

class UserRepository {
  final String token;

  UserRepository._(
    this.token,
  );

  static Future<UserRepository>
      create() async {
    final token =
        await Future.value("TOKEN");

    return UserRepository._(
      token,
    );
  }
}


// ============================================================================
// 84. ASYNC METHOD IN MODEL/REPOSITORY
// ============================================================================

class ProductRepository {
  Future<List<ProductJsonModel>>
      fetchProducts() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return const [
      ProductJsonModel(
        id: "P001",
        name: "Phone",
        price: 100000,
      ),
    ];
  }
}


// ============================================================================
// 85. REPOSITORY → SERVICE → CONTROLLER
// ============================================================================
//
// This architecture is extremely important for large Flutter projects.
//
// UI
//  ↓
// Controller
//  ↓
// Service
//  ↓
// Repository
//  ↓
// API
//
// ============================================================================

class ProductService {
  final ProductRepository repository;

  ProductService(this.repository);

  Future<List<ProductJsonModel>>
      getProducts() {
    return repository.fetchProducts();
  }
}

class ProductController {
  final ProductService service;

  ProductController(this.service);

  Future<void> loadProducts() async {
    try {
      final products =
          await service.getProducts();

      print(products);
    } catch (error) {
      print(
        "Failed to load products: $error",
      );
    }
  }
}


// ============================================================================
// 86. PARALLEL DASHBOARD REPOSITORY
// ============================================================================

class DashboardRepository {
  Future<String> getUsers() async {
    return "100 users";
  }

  Future<String> getOrders() async {
    return "50 orders";
  }

  Future<String> getRevenue() async {
    return "500000 BDT";
  }

  Future<List<String>> loadDashboard() {
    return Future.wait([
      getUsers(),
      getOrders(),
      getRevenue(),
    ]);
  }
}


// ============================================================================
// 87. API RETRY CONCEPT
// ============================================================================
//
// Real APIs can temporarily fail.
//
// Retry can be useful for transient failures.
//
// ============================================================================

Future<T> retry<T>(
  Future<T> Function() operation, {
  int attempts = 3,
}) async {
  Object? lastError;

  for (int i = 0; i < attempts; i++) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;
    }
  }

  throw lastError ?? Exception(
    "Operation failed",
  );
}


// ============================================================================
// 88. RETRY USAGE
// ============================================================================

Future<void> retryExample() async {
  try {
    final result = await retry(
      () => fetchUser(),
      attempts: 3,
    );

    print(result);
  } catch (error) {
    print(error);
  }
}


// ============================================================================
// 89. RETRY WITH DELAY
// ============================================================================

Future<T> retryWithDelay<T>(
  Future<T> Function() operation, {
  int attempts = 3,
  Duration delay =
      const Duration(seconds: 1),
}) async {
  Object? lastError;

  for (int i = 0; i < attempts; i++) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;

      if (i < attempts - 1) {
        await Future.delayed(delay);
      }
    }
  }

  throw lastError ?? Exception(
    "Operation failed",
  );
}


// ============================================================================
// 90. CONCURRENT TASKS
// ============================================================================
//
// Future.wait() is useful when tasks are independent.
//
// ============================================================================

Future<void> concurrentTasksExample() async {
  final futures = [
    Future.delayed(
      const Duration(seconds: 1),
      () => "Task 1",
    ),
    Future.delayed(
      const Duration(seconds: 2),
      () => "Task 2",
    ),
    Future.delayed(
      const Duration(seconds: 1),
      () => "Task 3",
    ),
  ];

  final results =
      await Future.wait(futures);

  print(results);
}


// ============================================================================
// 91. SEQUENTIAL TASKS
// ============================================================================
//
// Don't use Future.wait() when one operation depends on another.
//
// ============================================================================

Future<void> sequentialTasksExample() async {
  final first =
      await Future.value("First");

  final second =
      await Future.value("$first → Second");

  final third =
      await Future.value("$second → Third");

  print(third);
}


// ============================================================================
// 92. ISOLATE CONCEPT
// ============================================================================
//
// Dart uses isolates for CPU-intensive parallel work.
//
// Important distinction:
//
// async/await
//   → handles waiting/non-blocking asynchronous operations.
//
// isolate
//   → handles CPU-heavy work independently.
//
// Examples of CPU-heavy work:
//
//   • Large JSON parsing
//   • Image processing
//   • Encryption
//   • Large calculations
//
// Do NOT use an isolate simply because an operation is asynchronous.
//
// ============================================================================


// ============================================================================
// 93. EVENT LOOP CONCEPT
// ============================================================================
//
// Dart uses an event loop to process asynchronous events.
//
// Conceptually:
//
//   Call Stack
//       ↓
//   Event Queue
//       ↓
//   Microtask Queue
//
// This is an advanced topic that becomes important when debugging
// asynchronous execution order.
//
// ============================================================================


// ============================================================================
// 94. MICROTASK CONCEPT
// ============================================================================
//
// Dart also has a microtask queue.
//
// scheduleMicrotask() schedules work for the microtask queue.
//
// ============================================================================

void microtaskExample() {
  scheduleMicrotask(
    () {
      print("Microtask");
    },
  );

  print("Normal code");
}


// ============================================================================
// 95. FUTURE MICROTASK
// ============================================================================

void futureMicrotaskExample() {
  Future.microtask(
    () {
      print("Future microtask");
    },
  );

  print("Normal code");
}


// ============================================================================
// 96. DO NOT BLOCK THE UI
// ============================================================================
//
// Avoid heavy synchronous work inside Flutter UI callbacks.
//
// Bad:
//
//   for (veryLargeData) {
//      hugeCalculation();
//   }
//
// This can freeze the UI.
//
// For CPU-heavy work, consider isolates.
//
// ============================================================================


// ============================================================================
// 97. REAL FLUTTER API PATTERN
// ============================================================================
//
// Generic pattern:
//
// Future<void> loadProducts() async {
//
//   state = Loading;
//
//   try {
//
//      final products =
//          await repository.getProducts();
//
//      state = Success(products);
//
//   } catch (error) {
//
//      state = Error(error);
//
//   }
//
// }
//
// ============================================================================


// ============================================================================
// 98. COMPLETE ASYNC REPOSITORY EXAMPLE
// ============================================================================

class ProductRepositoryExample {
  Future<List<ProductJsonModel>>
      getProducts() async {
    try {
      await Future.delayed(
        const Duration(seconds: 1),
      );

      return const [
        ProductJsonModel(
          id: "P001",
          name: "Phone",
          price: 100000,
        ),
        ProductJsonModel(
          id: "P002",
          name: "Laptop",
          price: 150000,
        ),
      ];
    } catch (error) {
      rethrow;
    }
  }
}


// ============================================================================
// 99. COMPLETE ASYNC CONTROLLER
// ============================================================================

class ProductControllerExample {
  final ProductRepositoryExample repository;

  ProductControllerExample(
    this.repository,
  );

  ApiState<List<ProductJsonModel>> state =
      const ApiState.initial();

  Future<void> loadProducts() async {
    state = const ApiState.loading();

    try {
      final products =
          await repository.getProducts();

      state =
          ApiState.success(products);
    } catch (error) {
      state = ApiState.error(
        error.toString(),
      );
    }
  }
}


// ============================================================================
// 100. COMPLETE DASHBOARD FLOW
// ============================================================================
//
// This resembles real ERP/SaaS development.
//
// ============================================================================

class DashboardRepositoryExample {
  Future<int> getUsers() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return 100;
  }

  Future<int> getOrders() async {
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    return 50;
  }

  Future<double> getRevenue() async {
    await Future.delayed(
      const Duration(milliseconds: 600),
    );

    return 500000;
  }

  Future<Map<String, dynamic>>
      loadDashboard() async {
    final results = await Future.wait([
      getUsers(),
      getOrders(),
      getRevenue(),
    ]);

    return {
      "users": results[0],
      "orders": results[1],
      "revenue": results[2],
    };
  }
}


// ============================================================================
// 101. STREAM-BASED ORDER EVENTS
// ============================================================================

class OrderEventService {
  final StreamController<Order>
      _controller =
      StreamController<Order>.broadcast();

  Stream<Order> get orders =>
      _controller.stream;

  void emitOrder(Order order) {
    _controller.add(order);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// 102. LISTEN FOR NEW ORDERS
// ============================================================================

void orderEventExample() {
  final service =
      OrderEventService();

  final subscription =
      service.orders.listen(
    (order) {
      print(
        "New order: ${order.id}",
      );
    },
  );

  service.emitOrder(
    const Order(
      id: "ORD-001",
      status: OrderStatus.pending,
      total: 5000,
    ),
  );

  subscription.cancel();

  service.dispose();
}


// ============================================================================
// 103. STREAM GENERATOR FOR STOCK
// ============================================================================

Stream<int> stockUpdates() async* {
  int stock = 100;

  while (stock > 0) {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    stock -= 10;

    yield stock;
  }
}


// ============================================================================
// 104. STOCK MONITOR
// ============================================================================

Future<void> monitorStock() async {
  await for (final stock in stockUpdates()) {
    print("Current stock: $stock");

    if (stock <= 20) {
      print("LOW STOCK");
    }
  }
}


// ============================================================================
// 105. ASYNC STREAM PIPELINE
// ============================================================================

Stream<int> lowStockUpdates(
  Stream<int> source,
) {
  return source.where(
    (stock) => stock <= 20,
  );
}


// ============================================================================
// 106. FUTURE ERROR + TIMEOUT + RETRY
// ============================================================================
//
// Real production request concept:
//
//   Retry
//      ↓
//   Timeout
//      ↓
//   Error handling
//
// ============================================================================

Future<T> productionRequest<T>(
  Future<T> Function() operation,
) async {
  try {
    return await retryWithDelay(
      () => operation().timeout(
        const Duration(seconds: 10),
      ),
      attempts: 3,
      delay: const Duration(seconds: 1),
    );
  } catch (error) {
    throw ApiException(
      message: error.toString(),
    );
  }
}


// ============================================================================
// 107. COMPLETE REQUEST USAGE
// ============================================================================

Future<void> productionRequestExample()
    async {
  try {
    final result =
        await productionRequest(
      () => fetchUser(),
    );

    print(result);
  } on ApiException catch (error) {
    print(
      "Request failed: ${error.message}",
    );
  }
}


// ============================================================================
// 108. ASYNC STATE FLOW
// ============================================================================
//
// INITIAL
//   ↓
// LOADING
//   ↓
// ┌───────────────┐
// ↓               ↓
// SUCCESS        ERROR
//
// This pattern will be used heavily in Flutter state management.
//
// ============================================================================


// ============================================================================
// 109. IMPORTANT ASYNC RULES
// ============================================================================
//
// RULE 1:
//
// Don't use async unnecessarily.
//
//
//
// RULE 2:
//
// Don't forget await when you need the actual result.
//
//
//
// RULE 3:
//
// Use try/catch around awaited operations that may fail.
//
//
//
// RULE 4:
//
// Use Future.wait() for independent operations.
//
//
//
// RULE 5:
//
// Don't use Future.wait() for dependent operations.
//
//
//
// RULE 6:
//
// Always clean up StreamController and subscriptions.
//
//
//
// RULE 7:
//
// Future = one result.
//
// Stream = multiple results.
//
//
//
// RULE 8:
//
// Use timeout for network operations where appropriate.
//
//
//
// RULE 9:
//
// Don't block Flutter's UI thread with heavy synchronous work.
//
//
//
// RULE 10:
//
// Don't use Completer when a normal Future is simpler.
//
// ============================================================================


// ============================================================================
// 110. MOST IMPORTANT FUTURE METHODS
// ============================================================================
//
//   Future.value()
//   Future.delayed()
//   Future.wait()
//   Future.any()
//   timeout()
//   then()
//   catchError()
//   whenComplete()
//
// ============================================================================


// ============================================================================
// 111. MOST IMPORTANT ASYNC KEYWORDS
// ============================================================================
//
//   async
//   await
//   async*
//   yield
//   yield*
//   await for
//   rethrow
//
// ============================================================================


// ============================================================================
// 112. MOST IMPORTANT STREAM CONCEPTS
// ============================================================================
//
//   Stream
//   StreamController
//   StreamSubscription
//   listen()
//   onError
//   onDone
//   cancel()
//   pause()
//   resume()
//   broadcast
//
// ============================================================================


// ============================================================================
// 113. FULL-STACK FLUTTER CONNECTION
// ============================================================================
//
// Your future Flutter architecture will frequently look like:
//
//
// Flutter UI
//     ↓
// Controller / State Management
//     ↓
// Service
//     ↓
// Repository
//     ↓
// HTTP Client
//     ↓
// Node.js / Express API
//     ↓
// MongoDB
//
//
// Request:
//
//   await repository.getProducts();
//
// Response:
//
//   Future<List<Product>>
//
//
//
// Real-time:
//
//   Stream<Order>
//
//
//
// Multiple dashboard APIs:
//
//   Future.wait([...])
//
//
//
// Search:
//
//   debounce
//      ↓
//   API
//      ↓
//   Future<List<Product>>
//
//
//
// Notifications:
//
//   Stream<Notification>
//
// ============================================================================


// ============================================================================
// 114. PHASE 8 MASTER CHECKLIST
// ============================================================================
//
// FUTURE
//
// [ ] Synchronous vs asynchronous
// [ ] Future
// [ ] Future<T>
// [ ] Future<void>
// [ ] Future.value()
// [ ] Future.delayed()
// [ ] async
// [ ] await
// [ ] then()
// [ ] catchError()
// [ ] whenComplete()
//
// ERROR HANDLING
//
// [ ] try/catch
// [ ] finally
// [ ] on Exception
// [ ] rethrow
// [ ] Custom exceptions
// [ ] Error propagation
//
// MULTIPLE FUTURES
//
// [ ] Future.wait()
// [ ] Future.any()
// [ ] Sequential requests
// [ ] Parallel requests
// [ ] Dependent requests
// [ ] Independent requests
//
// ADVANCED FUTURE
//
// [ ] timeout()
// [ ] FutureOr
// [ ] Completer
// [ ] Future chaining
// [ ] Cancellation concept
// [ ] Retry
//
// STREAM
//
// [ ] Stream
// [ ] Single-subscription
// [ ] Broadcast
// [ ] StreamController
// [ ] StreamSubscription
// [ ] listen()
// [ ] onError
// [ ] onDone
// [ ] cancel()
// [ ] pause()
// [ ] resume()
//
// STREAM GENERATORS
//
// [ ] async*
// [ ] yield
// [ ] yield*
// [ ] await for
//
// STREAM TRANSFORMATION
//
// [ ] map()
// [ ] where()
// [ ] expand()
// [ ] asyncMap()
// [ ] handleError()
// [ ] timeout()
//
// REAL APPLICATION
//
// [ ] Loading state
// [ ] Success state
// [ ] Error state
// [ ] API request
// [ ] Login
// [ ] Product API
// [ ] Pagination
// [ ] File upload
// [ ] Dashboard
// [ ] Notifications
// [ ] Search
// [ ] Debouncing
// [ ] Real-time events
// [ ] Repository/service/controller flow
//
// ADVANCED
//
// [ ] Event loop
// [ ] Microtask
// [ ] Isolate concept
//
// ============================================================================
//
// ⭐ THE MOST IMPORTANT THINGS TO MASTER BEFORE MOVING ON
// ============================================================================
//
// 1. Future
//
//    Future<User>
//
// 2. async/await
//
//    final user = await repository.getUser();
//
// 3. Error handling
//
//    try {
//      ...
//    } catch (error) {
//      ...
//    }
//
// 4. Parallel requests
//
//    await Future.wait([...]);
//
// 5. Stream
//
//    Stream<Order>
//
// 6. StreamController
//
//    controller.add(event);
//
// 7. StreamSubscription
//
//    final subscription = stream.listen(...);
//
// 8. async*
//
//    Stream<int> generate() async* { ... }
//
// 9. yield
//
//    yield value;
//
// 10. await for
//
//     await for (final item in stream) { ... }
//
// ============================================================================
//
// ⭐ THE MOST IMPORTANT REAL-WORLD PATTERN
//
// Future<List<Product>> getProducts() async {
//   try {
//     final response = await api.get("/products");
//
//     return response.data
//         .map(Product.fromJson)
//         .toList();
//
//   } catch (error) {
//     rethrow;
//   }
// }
//
// This single pattern combines:
//
//   Future
//   async
//   await
//   error handling
//   API communication
//   List
//   map()
//   JSON/model transformation
//
// ============================================================================
//
// ⭐ PHASE 8 FINAL CONCEPT
//
// Future = "I will give you ONE result later."
//
// Stream = "I will give you MANY results over time."
//
// async/await = "Write asynchronous code in a readable way."
//
// Future.wait() = "Run independent asynchronous operations together."
//
// StreamController = "Push events into a stream."
//
// async* + yield = "Generate asynchronous events."
//
// ============================================================================
//
// NEXT:
//
// PHASE 9 — DART OBJECT-ORIENTED PROGRAMMING (OOP) DEEP DIVE
//
// It will cover:
//
//   • Class
//   • Object
//   • Constructor
//   • Named constructor
//   • Factory constructor
//   • Private members
//   • Encapsulation
//   • Getter
//   • Setter
//   • Inheritance
//   • super
//   • Method overriding
//   • Abstract class
//   • Interface
//   • implements
//   • extends
//   • mixins
//   • with
//   • Polymorphism
//   • Composition
//   • Dependency injection concepts
//   • SOLID-oriented Dart design
//   • Real Flutter architecture examples
//
// ============================================================================
//
// END OF PHASE 8
// ============================================================================

