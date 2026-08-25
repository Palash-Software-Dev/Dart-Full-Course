// ============================================================================
// DART MASTER ROADMAP
// PHASE 32 — ASYNCHRONOUS PROGRAMMING MASTERY
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// In this phase you will learn how Dart handles asynchronous operations.
//
// This is CRITICAL for a Full-Stack Flutter Developer because almost every
// real Flutter application performs asynchronous work:
//
// • REST API calls
// • Login / registration
// • Database operations
// • File uploads
// • Image loading
// • Payment processing
// • Firebase operations
// • Local storage
// • WebSocket communication
// • Search requests
// • Pagination
// • Background processing
// • Notifications
// • ERP synchronization
//
// ============================================================================
// TOPICS
// ----------------------------------------------------------------------------
//
// 01. Synchronous vs asynchronous programming
// 02. Blocking vs non-blocking
// 03. Future
// 04. async
// 05. await
// 06. Future return types
// 07. Future.value
// 08. Future.delayed
// 09. Future.error
// 10. Future chaining
// 11. then()
// 12. catchError()
// 13. whenComplete()
// 14. try/catch/finally
// 15. Error propagation
// 16. Future.wait()
// 17. Future.any()
// 18. Future.forEach()
// 19. Parallel asynchronous operations
// 20. Sequential asynchronous operations
// 21. Timeout handling
// 22. Retry concepts
// 23. async*
// 24. yield
// 25. yield*
// 26. Stream
// 27. StreamController
// 28. Single-subscription streams
// 29. Broadcast streams
// 30. StreamSubscription
// 31. Stream cancellation
// 32. Stream transformations
// 33. map()
// 34. where()
// 35. asyncMap()
// 36. handleError()
// 37. debounce concepts
// 38. Event-driven programming
// 39. Event loop
// 40. Microtask queue
// 41. Event queue
// 42. Concurrency
// 43. Parallelism
// 44. Isolates
// 45. SendPort
// 46. ReceivePort
// 47. compute-style workloads
// 48. Async API architecture
// 49. Flutter async patterns
// 50. Production async architecture
//
// ============================================================================


// ============================================================================
// 01. SYNCHRONOUS PROGRAMMING
// ----------------------------------------------------------------------------
//
// Synchronous code executes one operation after another.
//
// Example:
//
// print("A");
// print("B");
// print("C");
//
// Output:
//
// A
// B
// C
//
// ============================================================================

void synchronousExample() {
  print("A");
  print("B");
  print("C");
}


// ============================================================================
// 02. ASYNCHRONOUS PROGRAMMING
// ----------------------------------------------------------------------------
//
// Asynchronous programming allows an operation to complete later while the
// program can continue doing other work.
//
// Typical examples:
//
// • Network requests
// • File operations
// • Timers
// • Database operations
//
// ============================================================================

Future<void> asyncExample() async {
  print("Start");

  await Future.delayed(
    const Duration(seconds: 1),
  );

  print("Finished");
}


// ============================================================================
// 03. BLOCKING VS NON-BLOCKING
// ----------------------------------------------------------------------------
//
// Blocking:
//
// The current execution cannot continue until the operation finishes.
//
// Non-blocking:
//
// The operation can complete later while other work continues.
//
// Flutter heavily relies on non-blocking asynchronous operations because
// blocking the main isolate can freeze the UI.
//
// ============================================================================


// ============================================================================
// 04. FUTURE
// ----------------------------------------------------------------------------
//
// Future<T> means:
//
// "A value of type T that will become available later."
//
// Examples:
//
// Future<String>
// Future<int>
// Future<User>
// Future<List<Product>>
// Future<void>
//
// ============================================================================

Future<String> getUserName() {
  return Future.value(
    "Palash",
  );
}


// ============================================================================
// 05. FUTURE<void>
// ----------------------------------------------------------------------------
//
// Used when an asynchronous function doesn't return a meaningful value.
//
// ============================================================================

Future<void> saveData() async {
  print(
    "Saving data...",
  );
}


// ============================================================================
// 06. FUTURE<int>
// ============================================================================

Future<int> calculateTotal() async {
  return 500;
}


// ============================================================================
// 07. ASYNC
// ----------------------------------------------------------------------------
//
// Adding async to a function allows you to use await inside it.
//
// ============================================================================

Future<String> loadData() async {
  return "Data loaded";
}


// ============================================================================
// 08. AWAIT
// ----------------------------------------------------------------------------
//
// await waits for a Future to complete.
//
// IMPORTANT:
//
// await does NOT block the entire application.
//
// It suspends the current asynchronous function until the Future completes.
//
// ============================================================================

Future<void> awaitExample() async {
  print("Before");

  final result = await getUserName();

  print(result);

  print("After");
}


// ============================================================================
// 09. FUTURE.DELAYED
// ----------------------------------------------------------------------------
//
// Simulates an asynchronous operation.
//
// ============================================================================

Future<String> delayedData() {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      return "Data received";
    },
  );
}


// ============================================================================
// 10. ASYNC + AWAIT
// ----------------------------------------------------------------------------

Future<void> loginExample() async {
  print(
    "Logging in...",
  );

  final result = await delayedData();

  print(result);
}


// ============================================================================
// 11. FUTURE.VALUE
// ----------------------------------------------------------------------------
//
// Creates an already-completed Future.
//
// ============================================================================

Future<String> immediateFuture() {
  return Future.value(
    "Completed",
  );
}


// ============================================================================
// 12. FUTURE.ERROR
// ----------------------------------------------------------------------------
//
// Creates a Future that completes with an error.
//
// ============================================================================

Future<String> failedFuture() {
  return Future.error(
    Exception(
      "Something went wrong.",
    ),
  );
}


// ============================================================================
// 13. ERROR HANDLING WITH TRY/CATCH
// ----------------------------------------------------------------------------
//
// This is the preferred style when using async/await.
//
// ============================================================================

Future<void> safeRequest() async {
  try {
    final result = await failedFuture();

    print(result);
  } catch (error) {
    print(
      "Error: $error",
    );
  }
}


// ============================================================================
// 14. FINALLY
// ----------------------------------------------------------------------------
//
// finally executes whether the operation succeeds or fails.
//
// Common use:
//
// • Hide loading indicator
// • Close resources
// • Stop progress indicator
//
// ============================================================================

Future<void> requestWithFinally() async {
  print(
    "Loading...",
  );

  try {
    await delayedData();
  } catch (error) {
    print(error);
  } finally {
    print(
      "Loading finished.",
    );
  }
}


// ============================================================================
// 15. ERROR PROPAGATION
// ----------------------------------------------------------------------------
//
// An error can move upward through multiple async function calls.
//
// ============================================================================

Future<String> apiCall() async {
  throw Exception(
    "API failed",
  );
}

Future<String> repositoryCall() async {
  return await apiCall();
}

Future<String> useCaseCall() async {
  return await repositoryCall();
}


// ============================================================================
// If nobody handles the error:
//
// useCaseCall()
//
// the Future completes with an error.
//
// Therefore, errors should be handled at an appropriate boundary.
//
// ============================================================================


// ============================================================================
// 16. FUTURE CHAINING WITH then()
// ----------------------------------------------------------------------------
//
// Another way to work with Futures.
//
// ============================================================================

void futureThenExample() {
  getUserName()
      .then(
        (name) {
          print(name);
        },
      )
      .catchError(
        (error) {
          print(error);
        },
      );
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
//
// You should understand then(), but for normal application code:
//
// async/await
//
// is generally easier to read.
//
// ============================================================================


// ============================================================================
// 17. whenComplete()
// ----------------------------------------------------------------------------
//
// Runs after success or failure.
//
// ============================================================================

void whenCompleteExample() {
  delayedData()
      .then(
        (data) {
          print(data);
        },
      )
      .catchError(
        (error) {
          print(error);
        },
      )
      .whenComplete(
        () {
          print(
            "Operation completed.",
          );
        },
      );
}


// ============================================================================
// 18. SEQUENTIAL ASYNC OPERATIONS
// ----------------------------------------------------------------------------
//
// Sometimes operation B depends on operation A.
//
// Example:
//
// Login
// ↓
// Get user
// ↓
// Get permissions
//
// ============================================================================

Future<void> sequentialOperations() async {
  final name = await getUserName();

  print(name);

  final data = await delayedData();

  print(data);
}


// ============================================================================
// 19. PARALLEL ASYNC OPERATIONS
// ----------------------------------------------------------------------------
//
// Suppose these requests are independent:
//
// Get profile
// Get notifications
// Get settings
//
// Running them sequentially is slower.
//
// ============================================================================

Future<void> parallelOperations() async {
  final profileFuture = getUserName();

  final dataFuture = delayedData();

  final profile = await profileFuture;
  final data = await dataFuture;

  print(profile);
  print(data);
}


// ============================================================================
// 20. FUTURE.WAIT
// ----------------------------------------------------------------------------
//
// Future.wait() waits for multiple Futures.
//
// ============================================================================

Future<void> waitExample() async {
  final results = await Future.wait([
    getUserName(),
    delayedData(),
  ]);

  print(results);
}


// ============================================================================
// RESULT:
//
// [
//   "Palash",
//   "Data received"
// ]
//
// Future.wait is extremely useful for dashboard screens.
//
// Example:
//
// Future.wait([
//   loadSales(),
//   loadOrders(),
//   loadCustomers(),
//   loadInventory(),
// ]);
//
// ============================================================================


// ============================================================================
// 21. ERP DASHBOARD EXAMPLE
// ----------------------------------------------------------------------------

Future<String> loadSales() async {
  return "Sales loaded";
}

Future<String> loadOrders() async {
  return "Orders loaded";
}

Future<String> loadInventory() async {
  return "Inventory loaded";
}

Future<void> loadDashboard() async {
  final results = await Future.wait([
    loadSales(),
    loadOrders(),
    loadInventory(),
  ]);

  print(results);
}


// ============================================================================
// 22. FUTURE.ANY
// ----------------------------------------------------------------------------
//
// Future.any() completes when the first Future completes.
//
// ============================================================================

Future<void> anyExample() async {
  final result = await Future.any([
    Future.delayed(
      const Duration(seconds: 2),
      () => "Server A",
    ),
    Future.delayed(
      const Duration(seconds: 1),
      () => "Server B",
    ),
  ]);

  print(result);
}


// ============================================================================
// Output will normally be:
//
// Server B
//
// because Server B finishes first.
//
// ============================================================================


// ============================================================================
// 23. FUTURE.FOR-EACH CONCEPT
// ----------------------------------------------------------------------------
//
// When you need asynchronous processing for each item, be careful.
//
// Don't assume:
//
// list.forEach(
//   (item) async {
//     await something();
//   },
// );
//
// behaves like a sequential async loop.
//
// Better:
//
// for (final item in list) {
//   await something(item);
// }
//
// ============================================================================

Future<void> sequentialLoop() async {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  for (final product in products) {
    await Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
    );

    print(product);
  }
}


// ============================================================================
// 24. PARALLEL LOOP
// ----------------------------------------------------------------------------
//
// If operations are independent:
//
// ============================================================================

Future<void> parallelLoop() async {
  final products = [
    "Phone",
    "Laptop",
    "Tablet",
  ];

  await Future.wait(
    products.map(
      (product) async {
        await Future.delayed(
          const Duration(
            milliseconds: 200,
          ),
        );

        print(product);
      },
    ),
  );
}


// ============================================================================
// 25. SEQUENTIAL VS PARALLEL
// ----------------------------------------------------------------------------
//
// Sequential:
//
// A → B → C
//
// Parallel:
//
// A
// B
// C
// ↓
// wait for all
//
// Use parallel execution only when operations don't depend on each other.
//
// ============================================================================


// ============================================================================
// 26. TIMEOUT
// ----------------------------------------------------------------------------
//
// Network requests shouldn't wait forever.
//
// ============================================================================

Future<void> timeoutExample() async {
  try {
    final result =
        await delayedData().timeout(
      const Duration(
        seconds: 1,
      ),
    );

    print(result);
  } on TimeoutException {
    print(
      "Request timed out.",
    );
  }
}


// ============================================================================
// NOTE:
// ----------------------------------------------------------------------------
//
// This example requires:
//
// import 'dart:async';
//
// ============================================================================


// ============================================================================
// 27. RETRY CONCEPT
// ----------------------------------------------------------------------------
//
// Network requests can temporarily fail.
//
// A retry mechanism can try again.
//
// Example strategy:
//
// Attempt 1
// ↓
// wait
// ↓
// Attempt 2
// ↓
// wait
// ↓
// Attempt 3
//
// ============================================================================

Future<String> retryExample() async {
  int attempts = 0;

  while (attempts < 3) {
    attempts++;

    try {
      return await delayedData();
    } catch (error) {
      if (attempts == 3) {
        rethrow;
      }
    }
  }

  throw Exception(
    "Request failed.",
  );
}


// ============================================================================
// IMPORTANT RETRY RULES
// ----------------------------------------------------------------------------
//
// Don't blindly retry every error.
//
// Usually retry:
//
// • Timeout
// • Temporary network failure
// • Server 5xx errors
//
// Usually don't retry:
//
// • Wrong password
// • Invalid input
// • Unauthorized request
// • Validation error
//
// ============================================================================


// ============================================================================
// 28. ASYNC*
// ----------------------------------------------------------------------------
//
// async* creates a Stream.
//
// ============================================================================

Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    );

    yield i;
  }
}


// ============================================================================
// 29. YIELD
// ----------------------------------------------------------------------------
//
// yield sends one value to the Stream.
//
// ============================================================================


// ============================================================================
// 30. YIELD*
// ----------------------------------------------------------------------------
//
// yield* forwards all values from another Stream.
//
// ============================================================================

Stream<int> firstStream() async* {
  yield 1;
  yield 2;
}

Stream<int> secondStream() async* {
  yield 3;
  yield 4;
}

Stream<int> combinedStream() async* {
  yield* firstStream();
  yield* secondStream();
}


// ============================================================================
// 31. STREAM
// ----------------------------------------------------------------------------
//
// Future:
//
// One eventual result.
//
// Stream:
//
// Multiple values over time.
//
// Think:
//
// Future:
//
// Login result.
//
// Stream:
//
// Chat messages.
//
// ============================================================================


// ============================================================================
// 32. STREAM EXAMPLE
// ----------------------------------------------------------------------------

Stream<String> messageStream() async* {
  yield "Hello";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "How are you?";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Goodbye";
}


// ============================================================================
// 33. LISTEN TO STREAM
// ----------------------------------------------------------------------------

void listenToStream() {
  messageStream().listen(
    (message) {
      print(
        "Received: $message",
      );
    },
  );
}


// ============================================================================
// 34. STREAMCONTROLLER
// ----------------------------------------------------------------------------
//
// StreamController lets you manually add events to a Stream.
//
// ============================================================================

class EventManager {
  final StreamController<String>
      _controller =
      StreamController<String>();

  Stream<String> get events =>
      _controller.stream;

  void emit(
    String event,
  ) {
    _controller.add(
      event,
    );
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// 35. STREAMCONTROLLER USAGE
// ----------------------------------------------------------------------------

void eventManagerExample() {
  final manager = EventManager();

  manager.events.listen(
    (event) {
      print(
        "Event: $event",
      );
    },
  );

  manager.emit(
    "Order Created",
  );

  manager.emit(
    "Payment Completed",
  );
}


// ============================================================================
// 36. SINGLE-SUBSCRIPTION STREAM
// ----------------------------------------------------------------------------
//
// A normal StreamController creates a single-subscription stream.
//
// Usually only one listener is allowed.
//
// ============================================================================


// ============================================================================
// 37. BROADCAST STREAM
// ----------------------------------------------------------------------------
//
// Multiple listeners can listen to a broadcast stream.
//
// ============================================================================

class BroadcastEventManager {
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
// 38. WHEN TO USE BROADCAST
// ----------------------------------------------------------------------------
//
// Useful when multiple parts of an application need the same events.
//
// Example:
//
// User logout event.
//
// Possible listeners:
//
// • Navigation
// • Cache manager
// • Notification system
// • Analytics
//
// ============================================================================


// ============================================================================
// 39. STREAMSUBSCRIPTION
// ----------------------------------------------------------------------------
//
// listen() returns a StreamSubscription.
//
// ============================================================================

void subscriptionExample() {
  final subscription =
      numberStream().listen(
    (number) {
      print(number);
    },
  );

  print(subscription);
}


// ============================================================================
// 40. CANCEL STREAM
// ----------------------------------------------------------------------------
//
// Very important for resources and lifecycle management.
//
// ============================================================================

Future<void> cancelStreamExample() async {
  final subscription =
      numberStream().listen(
    (number) {
      print(number);
    },
  );

  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  await subscription.cancel();
}


// ============================================================================
// 41. STREAM MAP
// ----------------------------------------------------------------------------
//
// Transform each event.
//
// ============================================================================

Stream<String> mappedStream() {
  return numberStream().map(
    (number) => "Number: $number",
  );
}


// ============================================================================
// 42. STREAM WHERE
// ----------------------------------------------------------------------------
//
// Filter events.
//
// ============================================================================

Stream<int> evenNumbers() {
  return numberStream().where(
    (number) => number.isEven,
  );
}


// ============================================================================
// 43. STREAM ASYNC MAP
// ----------------------------------------------------------------------------
//
// asyncMap allows asynchronous processing of each event.
//
// ============================================================================

Stream<String> asyncMappedStream() {
  return numberStream().asyncMap(
    (number) async {
      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );

      return "Processed: $number";
    },
  );
}


// ============================================================================
// 44. STREAM HANDLE ERROR
// ----------------------------------------------------------------------------

Stream<int> errorStream() async* {
  yield 1;

  throw Exception(
    "Stream failed.",
  );
}

void handleStreamError() {
  errorStream().listen(
    (value) {
      print(value);
    },
    onError: (error) {
      print(
        "Stream error: $error",
      );
    },
  );
}


// ============================================================================
// 45. STREAM ERROR WITH TRY/CATCH
// ----------------------------------------------------------------------------
//
// You can also consume a stream using await for.
//
// ============================================================================

Future<void> awaitForExample() async {
  try {
    await for (final number
        in numberStream()) {
      print(number);
    }
  } catch (error) {
    print(error);
  }
}


// ============================================================================
// 46. AWAIT FOR
// ----------------------------------------------------------------------------
//
// await for reads stream events sequentially.
//
// Very useful when consuming streams in async functions.
//
// ============================================================================


// ============================================================================
// 47. DEBOUNCE CONCEPT
// ----------------------------------------------------------------------------
//
// Search box example:
//
// User types:
//
// P
// Pr
// Pro
// Prod
// Produ
// Product
//
// You DON'T want to call the API six times.
//
// Instead:
//
// Wait until the user stops typing for ~300-500ms.
//
// This is called:
//
// DEBOUNCING
//
// ============================================================================


// ============================================================================
// 48. SEARCH DEBOUNCE CONCEPT
// ----------------------------------------------------------------------------
//
// Flutter implementation is often done with:
//
// • Timer
// • Stream transformations
// • State-management libraries
//
// Basic Dart concept:
//
// ============================================================================

void debounceConcept() {
  Timer? timer;

  void search(
    String query,
  ) {
    timer?.cancel();

    timer = Timer(
      const Duration(
        milliseconds: 400,
      ),
      () {
        print(
          "API search: $query",
        );
      },
    );
  }

  search("P");
  search("Pr");
  search("Pro");
  search("Product");
}


// ============================================================================
// IMPORTANT:
// ----------------------------------------------------------------------------
//
// This requires:
//
// import 'dart:async';
//
// ============================================================================


// ============================================================================
// 49. EVENT-DRIVEN PROGRAMMING
// ----------------------------------------------------------------------------
//
// Many applications react to events:
//
// Button clicked
// User logged in
// Order created
// Payment completed
// WebSocket message received
// Internet connection changed
//
// This is event-driven programming.
//
// ============================================================================


// ============================================================================
// 50. EVENT LOOP
// ----------------------------------------------------------------------------
//
// Dart executes code using an event loop.
//
// Conceptually:
//
// ┌─────────────────────────────┐
// │       Dart Isolate          │
// │                             │
// │  Call Stack                 │
// │       ↓                     │
// │  Microtask Queue            │
// │       ↓                     │
// │  Event Queue                │
// │       ↓                     │
// │  Repeat                     │
// └─────────────────────────────┘
//
// Understanding this helps explain async behavior.
//
// ============================================================================


// ============================================================================
// 51. MICROtask QUEUE
// ----------------------------------------------------------------------------
//
// Microtasks are higher-priority asynchronous tasks.
//
// scheduleMicrotask() can add a task to the microtask queue.
//
// ============================================================================

void microtaskExample() {
  scheduleMicrotask(
    () {
      print(
        "Microtask",
      );
    },
  );

  print(
    "Normal code",
  );
}


// ============================================================================
// 52. EVENT QUEUE
// ----------------------------------------------------------------------------
//
// Timers and many external events are handled through the event queue.
//
// ============================================================================

void eventQueueExample() {
  Future.delayed(
    Duration.zero,
    () {
      print(
        "Event queue task",
      );
    },
  );

  print(
    "Normal code",
  );
}


// ============================================================================
// 53. IMPORTANT ASYNC ORDER
// ----------------------------------------------------------------------------
//
// Understanding this is important.
//
// Example:
//
// print("A");
//
// scheduleMicrotask(() {
//   print("B");
// });
//
// Future(() {
//   print("C");
// });
//
// print("D");
//
// Typical conceptual output:
//
// A
// D
// B
// C
//
// Why?
//
// Synchronous code runs first.
// Microtasks are processed before normal event-queue tasks.
//
// ============================================================================


// ============================================================================
// 54. CONCURRENCY
// ----------------------------------------------------------------------------
//
// Concurrency means multiple tasks can make progress during overlapping
// periods.
//
// Dart async programming provides concurrency without requiring multiple
// threads for normal asynchronous I/O.
//
// ============================================================================


// ============================================================================
// 55. PARALLELISM
// ----------------------------------------------------------------------------
//
// Parallelism means multiple computations execute simultaneously.
//
// CPU-heavy tasks may need separate isolates.
//
// ============================================================================


// ============================================================================
// 56. CONCURRENCY VS PARALLELISM
// ----------------------------------------------------------------------------
//
// Concurrency:
//
// "Several tasks are being managed."
//
// Parallelism:
//
// "Several computations are actually executing at the same time."
//
// This distinction is very important.
//
// ============================================================================


// ============================================================================
// 57. WHY NOT DO HEAVY WORK ON THE MAIN ISOLATE?
// ----------------------------------------------------------------------------
//
// Flutter's UI runs on the main isolate.
//
// If you perform expensive CPU work there:
//
// • UI freezes
// • Animations stutter
// • Buttons stop responding
// • Frame rendering becomes slow
//
// Examples:
//
// • Huge JSON parsing
// • Image processing
// • Large encryption calculations
// • Complex mathematical calculations
//
// ============================================================================


// ============================================================================
// 58. ISOLATES
// ----------------------------------------------------------------------------
//
// An isolate has its own memory and execution context.
//
// Isolates communicate by sending messages.
//
// Unlike normal threads, isolates don't directly share mutable memory.
//
// ============================================================================


// ============================================================================
// 59. SENDPORT / RECEIVEPORT
// ----------------------------------------------------------------------------
//
// SendPort:
//
// Sends messages.
//
// ReceivePort:
//
// Receives messages.
//
// ============================================================================

import 'dart:isolate';


// ============================================================================
// 60. SIMPLE ISOLATE EXAMPLE
// ============================================================================

void heavyCalculation(
  SendPort sendPort,
) {
  int result = 0;

  for (int i = 0; i < 1000000; i++) {
    result += i;
  }

  sendPort.send(
    result,
  );
}


// ============================================================================
// 61. START ISOLATE
// ============================================================================

Future<void> isolateExample() async {
  final receivePort =
      ReceivePort();

  await Isolate.spawn(
    heavyCalculation,
    receivePort.sendPort,
  );

  final result =
      await receivePort.first;

  print(
    "Result: $result",
  );

  receivePort.close();
}


// ============================================================================
// 62. ISOLATE COMMUNICATION
// ----------------------------------------------------------------------------
//
// Main isolate:
//
// SendPort
//      ↓
//      message
//      ↓
// Worker isolate
//
// Worker isolate:
//
// result
//      ↓
// SendPort
//      ↓
// Main isolate
//
// ============================================================================


// ============================================================================
// 63. IMPORTANT ISOLATE RULE
// ----------------------------------------------------------------------------
//
// Don't use isolates just because they exist.
//
// Use them for expensive CPU-bound operations.
//
// Normal API request:
//
// Future + async/await
//
// Heavy CPU calculation:
//
// Isolate
//
// ============================================================================


// ============================================================================
// 64. FLUTTER ASYNC API FLOW
// ----------------------------------------------------------------------------
//
// Flutter:
//
// Button
// ↓
// Controller
// ↓
// UseCase
// ↓
// Repository
// ↓
// API
// ↓
// Future<Response>
// ↓
// Parse DTO
// ↓
// Domain model
// ↓
// State update
// ↓
// UI rebuild
//
// ============================================================================


// ============================================================================
// 65. API EXAMPLE
// ----------------------------------------------------------------------------

class ApiClient {
  Future<Map<String, dynamic>> getUser() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    return {
      "id": "U001",
      "name": "Palash",
    };
  }
}


// ============================================================================
// 66. DTO
// ============================================================================

class UserDto {
  final String id;
  final String name;

  UserDto({
    required this.id,
    required this.name,
  });

  factory UserDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserDto(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}


// ============================================================================
// 67. REPOSITORY
// ============================================================================

abstract interface class UserRepositoryAsync {
  Future<UserDto> getUser();
}


class UserRepositoryImplAsync
    implements UserRepositoryAsync {
  final ApiClient apiClient;

  UserRepositoryImplAsync({
    required this.apiClient,
  });

  @override
  Future<UserDto> getUser() async {
    final json =
        await apiClient.getUser();

    return UserDto.fromJson(
      json,
    );
  }
}


// ============================================================================
// 68. USE CASE
// ============================================================================

class GetUserUseCase {
  final UserRepositoryAsync repository;

  GetUserUseCase({
    required this.repository,
  });

  Future<UserDto> execute() {
    return repository.getUser();
  }
}


// ============================================================================
// 69. CONTROLLER CONCEPT
// ----------------------------------------------------------------------------
//
// A Flutter controller might do:
//
// loading = true
//
// try:
//
//   user = await useCase.execute();
//
//   state = success
//
// catch:
//
//   state = error
//
// finally:
//
//   loading = false
//
// ============================================================================


// ============================================================================
// 70. PROFESSIONAL ERROR MODEL
// ----------------------------------------------------------------------------
//
// Avoid showing raw technical errors directly to users.
//
// Instead:
//
// NetworkException
// UnauthorizedException
// ValidationException
// ServerException
// TimeoutException
//
// Then map them to user-friendly messages.
//
// ============================================================================


// ============================================================================
// 71. ASYNC STATE
// ----------------------------------------------------------------------------
//
// A screen commonly has states:
//
// Initial
// Loading
// Success
// Empty
// Error
//
// Example:
//
// enum RequestStatus {
//   initial,
//   loading,
//   success,
//   empty,
//   error,
// }
//
// ============================================================================

enum RequestStatus {
  initial,
  loading,
  success,
  empty,
  error,
}


// ============================================================================
// 72. ASYNC RESULT MODEL
// ----------------------------------------------------------------------------
//
// A useful architecture is to represent:
//
// Success<T>
// Failure
//
// instead of throwing everywhere.
//
// ============================================================================

sealed class Result<T> {
  const Result();
}

class Success<T>
    extends Result<T> {
  final T data;

  const Success(
    this.data,
  );
}

class Failure<T>
    extends Result<T> {
  final String message;

  const Failure(
    this.message,
  );
}


// ============================================================================
// 73. USING RESULT
// ============================================================================

Future<Result<String>> safeApi() async {
  try {
    final data =
        await delayedData();

    return Success(
      data,
    );
  } catch (error) {
    return Failure(
      error.toString(),
    );
  }
}


// ============================================================================
// 74. ASYNC PAGINATION
// ----------------------------------------------------------------------------
//
// Large ERP lists should NOT load everything at once.
//
// Example:
//
// Page 1
// ↓
// User scrolls
// ↓
// Page 2
// ↓
// User scrolls
// ↓
// Page 3
//
// ============================================================================

class PaginationController {
  int page = 1;

  bool isLoading = false;
  bool hasMore = true;

  Future<void> loadNextPage() async {
    if (isLoading || !hasMore) {
      return;
    }

    isLoading = true;

    try {
      print(
        "Loading page $page",
      );

      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
      );

      page++;
    } finally {
      isLoading = false;
    }
  }
}


// ============================================================================
// 75. ASYNC SEARCH ARCHITECTURE
// ----------------------------------------------------------------------------
//
// Search:
//
// User types
// ↓
// debounce
// ↓
// cancel previous request if necessary
// ↓
// API request
// ↓
// update results
//
// ============================================================================


// ============================================================================
// 76. RACE CONDITION
// ----------------------------------------------------------------------------
//
// Example:
//
// User searches:
//
// "phone"
//
// then immediately:
//
// "laptop"
//
// Suppose "laptop" response arrives first,
// but "phone" response arrives later.
//
// If you blindly update the UI:
//
// OLD response can overwrite NEW response.
//
// This is a race condition.
//
// ============================================================================


// ============================================================================
// 77. SOLVING SEARCH RACE CONDITIONS
// ----------------------------------------------------------------------------
//
// Common strategies:
//
// • Request ID
// • Cancellation
// • Debounce
// • Ignore outdated responses
//
// ============================================================================

class SearchController {
  int _requestId = 0;

  Future<void> search(
    String query,
  ) async {
    final currentRequest =
        ++_requestId;

    await Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    );

    if (currentRequest !=
        _requestId) {
      return;
    }

    print(
      "Apply result for: $query",
    );
  }
}


// ============================================================================
// 78. RESOURCE CLEANUP
// ----------------------------------------------------------------------------
//
// Async resources must often be disposed.
//
// Examples:
//
// • StreamSubscription
// • StreamController
// • Timer
// • WebSocket
// • AnimationController
//
// Flutter widgets commonly dispose these resources.
//
// ============================================================================


// ============================================================================
// 79. TIMER CLEANUP
// ----------------------------------------------------------------------------

void timerCleanupExample() {
  Timer? timer;

  timer = Timer(
    const Duration(
      seconds: 5,
    ),
    () {
      print(
        "Timer finished.",
      );
    },
  );

  // In a real StatefulWidget:
  //
  // timer?.cancel();
  //
  // inside dispose().
}


// ============================================================================
// 80. ASYNC API BEST PRACTICES
// ----------------------------------------------------------------------------
//
// ALWAYS:
//
// ✓ Use async/await for readable asynchronous code.
// ✓ Handle expected errors.
// ✓ Add timeouts to network requests.
// ✓ Cancel subscriptions when appropriate.
// ✓ Dispose resources.
// ✓ Avoid unnecessary sequential requests.
// ✓ Use Future.wait for independent requests.
// ✓ Use pagination for large datasets.
// ✓ Debounce search.
// ✓ Prevent duplicate requests.
// ✓ Protect against race conditions.
// ✓ Keep business logic outside UI.
// ✓ Keep API logic inside data layer.
//
// ============================================================================


// ============================================================================
// 81. DON'T DO THIS
// ----------------------------------------------------------------------------
//
// BAD:
//
// onPressed: () async {
//   final response = await api.get(...);
//   // 200 lines of business logic...
// }
//
// Better:
//
// onPressed: controller.createOrder;
//
// ============================================================================


// ============================================================================
// 82. ASYNC ARCHITECTURE FOR YOUR ERP
// ----------------------------------------------------------------------------
//
// Example:
//
// Create Purchase Order:
//
// UI
// ↓
// Controller
// ↓
// CreatePurchaseOrderUseCase
// ↓
// PurchaseOrderRepository
// ↓
// RemoteDataSource
// ↓
// Node.js API
// ↓
// MongoDB
//
// Every layer can be asynchronous.
//
// ============================================================================


// ============================================================================
// 83. ERP DASHBOARD
// ----------------------------------------------------------------------------
//
// Dashboard can load:
//
// Sales
// Orders
// Inventory
// Customers
// Revenue
//
// independently:
//
// Future.wait([
//   sales,
//   orders,
//   inventory,
//   customers,
//   revenue,
// ]);
//
// This can significantly reduce total waiting time.
//
// ============================================================================


// ============================================================================
// 84. WEB SOCKET CONCEPT
// ----------------------------------------------------------------------------
//
// HTTP:
//
// Request → Response
//
// WebSocket:
//
// Connection
// ↓
// messages
// ↕
// messages
// ↕
// messages
//
// Useful for:
//
// • Live order status
// • Chat
// • Notifications
// • Real-time inventory
// • Admin dashboard updates
//
// Dart can consume WebSocket data as a Stream.
//
// ============================================================================


// ============================================================================
// 85. ASYNC LEARNING CHECKLIST
// ----------------------------------------------------------------------------
//
// You should be comfortable with:
//
// [ ] Future
// [ ] async
// [ ] await
// [ ] Future.delayed
// [ ] Future.value
// [ ] Future.error
// [ ] try/catch
// [ ] finally
// [ ] then
// [ ] catchError
// [ ] whenComplete
// [ ] Future.wait
// [ ] Future.any
// [ ] Sequential execution
// [ ] Parallel execution
// [ ] Timeout
// [ ] Retry
// [ ] Stream
// [ ] async*
// [ ] yield
// [ ] yield*
// [ ] StreamController
// [ ] Broadcast stream
// [ ] StreamSubscription
// [ ] Cancellation
// [ ] Stream map
// [ ] Stream where
// [ ] asyncMap
// [ ] await for
// [ ] Debounce
// [ ] Event loop
// [ ] Microtask queue
// [ ] Event queue
// [ ] Concurrency
// [ ] Parallelism
// [ ] Isolates
// [ ] SendPort
// [ ] ReceivePort
// [ ] API async architecture
// [ ] Pagination
// [ ] Race conditions
// [ ] Resource cleanup
//
// ============================================================================
// 86. PRACTICE PROJECT
// ----------------------------------------------------------------------------
//
// Build a complete:
//
// "Dart Async API Simulator"
//
// Requirements:
//
// 1. Login API
// 2. User API
// 3. Product API
// 4. Order API
// 5. Dashboard API
// 6. Error handling
// 7. Timeout
// 8. Retry
// 9. Parallel dashboard loading
// 10. Search debounce
// 11. Pagination
// 12. Stream notifications
// 13. Cancel subscriptions
// 14. Simulate network failures
//
// ============================================================================


// ============================================================================
// 87. FINAL MENTAL MODEL
// ----------------------------------------------------------------------------
//
// FUTURE
// ↓
// One result later
//
// STREAM
// ↓
// Many results over time
//
// ASYNC/AWAIT
// ↓
// Readable asynchronous code
//
// FUTURE.WAIT
// ↓
// Run independent tasks together
//
// TIMEOUT
// ↓
// Don't wait forever
//
// RETRY
// ↓
// Recover from temporary failures
//
// STREAMCONTROLLER
// ↓
// Produce events manually
//
// DEBOUNCE
// ↓
// Prevent unnecessary rapid requests
//
// ISOLATE
// ↓
// Heavy CPU work away from UI isolate
//
// ============================================================================
// 88. FULL-STACK FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
// Dart
// ↓
// Async/Await
// ↓
// HTTP Client
// ↓
// REST API
// ↓
// Node.js / Express
// ↓
// MongoDB
//
// Example:
//
// Flutter button
// ↓
// await login()
// ↓
// POST /api/auth/login
// ↓
// Node.js
// ↓
// MongoDB
// ↓
// JSON response
// ↓
// Dart DTO
// ↓
// Domain model
// ↓
// State
// ↓
// UI
//
// THIS IS ONE OF THE MOST IMPORTANT FLOWS FOR A FULL-STACK FLUTTER
// DEVELOPER TO MASTER.
//
// ============================================================================
// PHASE 32 COMPLETE
// ============================================================================
//
// NEXT:
//
// PHASE 33 — DART COLLECTIONS + ADVANCED DATA MANIPULATION
//
// Topics will include:
//
// • List mastery
// • Set mastery
// • Map mastery
// • Iterable
// • Collection methods
// • map()
// • where()
// • reduce()
// • fold()
// • expand()
// • any()
// • every()
// • firstWhere()
// • singleWhere()
// • groupBy concepts
// • sorting
// • custom comparators
// • collection transformations
// • nested collections
// • JSON-like structures
// • immutable collection concepts
// • efficient collection handling
// • ERP data manipulation
// • API response processing
// • pagination data merging
// • search/filter/sort architecture
//
// ============================================================================
// END OF PHASE 32
// ============================================================================