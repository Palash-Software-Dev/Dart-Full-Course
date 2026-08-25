// ============================================================================
// DART MASTER ROADMAP
// PHASE 29 — ADVANCED ASYNCHRONOUS DART & CONCURRENCY
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// This phase teaches you how Dart handles asynchronous work internally and
// how to build professional, responsive Flutter applications.
//
// This is one of the MOST IMPORTANT phases for a Full-Stack Flutter
// Developer because you will constantly work with:
//
// • REST APIs
// • Database operations
// • Authentication
// • File uploads
// • Network requests
// • WebSockets
// • Streams
// • Background work
// • Notifications
// • Large data processing
// • Real-time ERP updates
//
// ============================================================================
// CONTENT
// ----------------------------------------------------------------------------
//
// 01. Synchronous vs asynchronous programming
// 02. Why asynchronous programming is necessary
// 03. Future
// 04. Future lifecycle
// 05. async
// 06. await
// 07. Future.value
// 08. Future.delayed
// 09. Future.error
// 10. Future.then
// 11. Future.catchError
// 12. Future.whenComplete
// 13. Future chaining
// 14. Error propagation
// 15. try/catch with async
// 16. finally with async
// 17. Sequential asynchronous operations
// 18. Parallel asynchronous operations
// 19. Future.wait
// 20. Future.any
// 21. Future.forEach
// 22. Future.wait error behavior
// 23. Event loop
// 24. Event queue
// 25. Microtask queue
// 26. Microtask scheduling
// 27. scheduleMicrotask
// 28. Execution order
// 29. Why async does not mean parallel
// 30. CPU-bound work
// 31. I/O-bound work
// 32. Stream
// 33. StreamController
// 34. single-subscription stream
// 35. broadcast stream
// 36. listen
// 37. StreamSubscription
// 38. pause
// 39. resume
// 40. cancel
// 41. onData
// 42. onError
// 43. onDone
// 44. stream transformations
// 45. map
// 46. where
// 47. take
// 48. skip
// 49. asyncMap
// 50. asyncExpand
// 51. expand
// 52. handleError
// 53. timeout
// 54. distinct
// 55. debounce concept
// 56. throttle concept
// 57. async*
// 58. yield
// 59. yield*
// 60. Stream.fromIterable
// 61. Stream.fromFuture
// 62. Stream.periodic
// 63. Stream.error
// 64. Stream.empty
// 65. Stream.value
// 66. stream errors
// 67. async stream errors
// 68. zones
// 69. Zone concept
// 70. Isolate
// 71. Isolate vs Future
// 72. SendPort
// 73. ReceivePort
// 74. isolate communication
// 75. compute-style workloads
// 76. concurrency vs parallelism
// 77. CPU-intensive Flutter work
// 78. real-world architecture
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
// Each statement waits for the previous statement.
//
// ============================================================================

void synchronousExample() {
  print("A");
  print("B");
  print("C");
}


// ============================================================================
// 02. THE PROBLEM WITH SYNCHRONOUS I/O
// ----------------------------------------------------------------------------
//
// Imagine:
//
// Request server
// ↓
// Wait 3 seconds
// ↓
// Continue
//
// If the application blocks during that time, the user experience becomes
// poor.
//
// Flutter applications must remain responsive.
//
// ============================================================================


// ============================================================================
// 03. ASYNCHRONOUS PROGRAMMING
// ----------------------------------------------------------------------------
//
// Asynchronous programming allows your program to start an operation and
// continue doing other work while waiting for the result.
//
// Common examples:
//
// • HTTP request
// • Database query
// • File operation
// • Timer
// • WebSocket
// • Firebase request
//
// ============================================================================


// ============================================================================
// 04. FUTURE
// ----------------------------------------------------------------------------
//
// Future<T> represents a value that will become available later.
//
// Example:
//
// Future<String>
//
// means:
//
// "A String will be available sometime in the future."
//
// ============================================================================


// ============================================================================
// 05. SIMPLE FUTURE
// ============================================================================

Future<String> getName() {
  return Future.value("Palash");
}


// ============================================================================
// 06. FUTURE.VALUE
// ----------------------------------------------------------------------------
//
// Future.value() creates an already-completed Future.
//
// ============================================================================

Future<int> getNumber() {
  return Future.value(100);
}


// ============================================================================
// 07. FUTURE.DELAYED
// ----------------------------------------------------------------------------
//
// Simulates an asynchronous operation.
//
// ============================================================================

Future<String> loadData() {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      return "Data loaded";
    },
  );
}


// ============================================================================
// 08. ASYNC
// ----------------------------------------------------------------------------
//
// async marks a function as asynchronous.
//
// An async function returns a Future.
//
// ============================================================================

Future<String> asyncName() async {
  return "Palash";
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
//
// This:
//
// Future<String> asyncName() async {
//
// }
//
// is equivalent in concept to returning a Future<String>.
//
// ============================================================================


// ============================================================================
// 09. AWAIT
// ----------------------------------------------------------------------------
//
// await waits for a Future's result inside an async function.
//
// ============================================================================

Future<void> awaitExample() async {
  final result =
      await loadData();

  print(result);
}


// ============================================================================
// 10. ASYNC + AWAIT
// ----------------------------------------------------------------------------
//
// This is the most common asynchronous style in Flutter.
//
// Example:
//
// final response = await api.getUsers();
//
// It makes asynchronous code look similar to synchronous code while still
// allowing the Dart event loop to continue handling other work.
//
// ============================================================================


// ============================================================================
// 11. IMPORTANT: AWAIT DOES NOT FREEZE THE WHOLE APP
// ----------------------------------------------------------------------------
//
// When an async function reaches:
//
// await someFuture();
//
// the function pauses until the Future completes.
//
// The Dart isolate/event loop can continue processing other asynchronous
// events.
//
// ============================================================================


// ============================================================================
// 12. FUTURE.THEN
// ----------------------------------------------------------------------------
//
// Future.then() runs code when the Future completes.
//
// ============================================================================

void thenExample() {
  loadData().then(
    (result) {
      print(result);
    },
  );
}


// ============================================================================
// 13. THEN CHAINING
// ============================================================================

Future<void> chainingExample() {
  return loadData()
      .then(
        (data) {
          print(data);

          return "Next step";
        },
      )
      .then(
        (value) {
          print(value);
        },
      );
}


// ============================================================================
// 14. ASYNC/AWAIT VS THEN
// ----------------------------------------------------------------------------
//
// THEN:
//
// loadData().then((data) {
//   print(data);
// });
//
// ASYNC/AWAIT:
//
// final data = await loadData();
// print(data);
//
// In modern Flutter applications, async/await is generally easier to read
// for multi-step asynchronous workflows.
//
// ============================================================================


// ============================================================================
// 15. FUTURE.ERROR
// ----------------------------------------------------------------------------

Future<String> failingFuture() {
  return Future.error(
    Exception(
      "Something went wrong",
    ),
  );
}


// ============================================================================
// 16. ERROR HANDLING WITH TRY/CATCH
// ============================================================================

Future<void> errorHandlingExample() async {
  try {
    final result =
        await failingFuture();

    print(result);
  } catch (error) {
    print(
      "Error: $error",
    );
  }
}


// ============================================================================
// 17. CATCH STACK TRACE
// ----------------------------------------------------------------------------
//
// Catching both error and stack trace is useful for debugging/logging.
//
// ============================================================================

Future<void> stackTraceExample() async {
  try {
    await failingFuture();
  } catch (
    error,
    stackTrace
  ) {
    print(error);
    print(stackTrace);
  }
}


// ============================================================================
// 18. FINALLY
// ----------------------------------------------------------------------------
//
// finally executes whether an operation succeeds or fails.
//
// Useful for:
//
// • Loading indicators
// • Closing resources
// • Cleanup
//
// ============================================================================

Future<void> finallyExample() async {
  try {
    await loadData();
  } catch (error) {
    print(error);
  } finally {
    print(
      "Operation finished",
    );
  }
}


// ============================================================================
// 19. CATCHERROR
// ----------------------------------------------------------------------------
//
// Future.catchError() can handle asynchronous errors.
//
// ============================================================================

void catchErrorExample() {
  failingFuture().catchError(
    (error) {
      print(
        "Caught: $error",
      );

      return "Fallback";
    },
  );
}


// ============================================================================
// 20. WHENCOMPLETE
// ----------------------------------------------------------------------------
//
// whenComplete() runs after completion regardless of success/failure.
//
// Concept:
//
// future.whenComplete(() {
//   print("Finished");
// });
//
// ============================================================================


// ============================================================================
// 21. SEQUENTIAL ASYNC OPERATIONS
// ----------------------------------------------------------------------------
//
// Suppose:
//
// 1. Login
// 2. Load profile
// 3. Load permissions
//
// These may depend on one another.
//
// ============================================================================

Future<void> sequentialExample() async {
  final login =
      await loginUser();

  final profile =
      await loadProfile(
    login,
  );

  final permissions =
      await loadPermissions(
    profile,
  );

  print(permissions);
}


// ============================================================================
// SUPPORTING FUNCTIONS
// ============================================================================

Future<String> loginUser() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "token";
}

Future<String> loadProfile(
  String token,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "profile";
}

Future<List<String>> loadPermissions(
  String profile,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return [
    "read",
    "write",
  ];
}


// ============================================================================
// 22. PARALLEL ASYNC OPERATIONS
// ----------------------------------------------------------------------------
//
// Suppose three API requests do NOT depend on each other:
//
// • Dashboard statistics
// • Notifications
// • User profile
//
// Running them sequentially is slower.
//
// Instead:
//
// final results = await Future.wait([...]);
//
// ============================================================================


// ============================================================================
// 23. FUTURE.WAIT
// ----------------------------------------------------------------------------

Future<void> parallelExample() async {
  final results =
      await Future.wait([
    loadDashboard(),
    loadNotifications(),
    loadUserProfile(),
  ]);

  print(results);
}


// ============================================================================
// SUPPORTING FUNCTIONS
// ============================================================================

Future<String> loadDashboard() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "Dashboard";
}

Future<String> loadNotifications() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "Notifications";
}

Future<String> loadUserProfile() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "Profile";
}


// ============================================================================
// 24. WHY FUTURE.WAIT?
// ----------------------------------------------------------------------------
//
// Sequential:
//
// A → wait
// B → wait
// C → wait
//
// Parallel:
//
// A ────────┐
// B ────────┼──→ all complete
// C ────────┘
//
// When operations are independent, Future.wait() can significantly reduce
// total waiting time.
//
// ============================================================================


// ============================================================================
// 25. FUTURE.WAIT RESULT TYPE
// ----------------------------------------------------------------------------
//
// If:
//
// Future.wait([
//   Future<int>,
//   Future<String>,
// ])
//
// The result is a List<Object?>.
//
// You can also use records or strongly typed wrappers when appropriate.
//
// ============================================================================


// ============================================================================
// 26. FUTURE.ANY
// ----------------------------------------------------------------------------
//
// Future.any() completes when the first Future completes successfully or
// otherwise according to the Future's completion behavior.
//
// Useful when:
//
// • Multiple servers can provide the same data
// • You want the fastest result
//
// ============================================================================

Future<void> anyExample() async {
  final result =
      await Future.any([
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () => "Server A",
    ),
    Future.delayed(
      const Duration(
        milliseconds: 200,
      ),
      () => "Server B",
    ),
  ]);

  print(result);
}


// ============================================================================
// 27. FUTURE.FOREACH
// ----------------------------------------------------------------------------
//
// Future.forEach() processes items asynchronously in sequence.
//
// Concept:
//
// await Future.forEach(
//   users,
//   (user) async {
//     await saveUser(user);
//   },
// );
//
// ============================================================================


// ============================================================================
// 28. IMPORTANT: SEQUENTIAL VS PARALLEL
// ----------------------------------------------------------------------------
//
// If operations depend on previous results:
//
// USE SEQUENTIAL:
//
// final a = await first();
// final b = await second(a);
//
// If operations are independent:
//
// USE PARALLEL:
//
// final results = await Future.wait([
//   first(),
//   second(),
// ]);
//
// This distinction is extremely important in real applications.
//
// ============================================================================


// ============================================================================
// 29. EVENT LOOP
// ----------------------------------------------------------------------------
//
// Dart normally executes Dart code in an isolate.
//
// The event loop processes asynchronous events.
//
// Concept:
//
// ┌─────────────────────┐
// │     Event Loop      │
// └──────────┬──────────┘
//            │
//            ▼
//      Process events
//            │
//            ▼
//      Execute callbacks
//            │
//            ▼
//      Repeat
//
// ============================================================================


// ============================================================================
// 30. EVENT QUEUE
// ----------------------------------------------------------------------------
//
// Asynchronous events can wait in an event queue.
//
// Examples:
//
// • Timer
// • I/O completion
// • User interaction
// • External events
//
// ============================================================================


// ============================================================================
// 31. MICROTASK QUEUE
// ----------------------------------------------------------------------------
//
// Dart also has a microtask queue.
//
// Microtasks are processed before the event queue gets another turn.
//
// ============================================================================


// ============================================================================
// 32. SCHEDULEMICROTASK
// ----------------------------------------------------------------------------

import 'dart:async';

void microtaskExample() {
  print("A");

  scheduleMicrotask(() {
    print("Microtask");
  });

  print("B");
}


// ============================================================================
// OUTPUT
// ----------------------------------------------------------------------------
//
// A
// B
// Microtask
//
// The synchronous code executes first.
//
// Then the microtask runs.
//
// ============================================================================


// ============================================================================
// 33. EVENT QUEUE EXAMPLE
// ----------------------------------------------------------------------------

void eventQueueExample() {
  print("A");

  Future.delayed(
    Duration.zero,
    () {
      print("Event");
    },
  );

  print("B");
}


// ============================================================================
// GENERAL EXECUTION IDEA
// ----------------------------------------------------------------------------
//
// Synchronous code
// ↓
// Microtasks
// ↓
// Event queue
//
// This is a simplified model, but very important for understanding Dart async
// behavior.
//
// ============================================================================


// ============================================================================
// 34. MICROTASK VS EVENT QUEUE
// ----------------------------------------------------------------------------
//
// Microtask:
//
// scheduleMicrotask(...)
//
// Event:
//
// Timer
// Future.delayed(...)
// I/O completion
//
// Too many microtasks can delay event processing.
//
// ============================================================================


// ============================================================================
// 35. DON'T ABUSE MICROTASKS
// ----------------------------------------------------------------------------
//
// Never continuously schedule microtasks in a way that prevents the event
// queue from getting work done.
//
// This can create starvation.
//
// ============================================================================


// ============================================================================
// 36. ASYNC DOES NOT MEAN PARALLEL
// ----------------------------------------------------------------------------
//
// VERY IMPORTANT:
//
// Asynchronous:
//
// "I don't have to block while waiting."
//
// Parallel:
//
// "Multiple computations execute at the same time."
//
// They are not the same thing.
//
// ============================================================================


// ============================================================================
// 37. I/O-BOUND WORK
// ----------------------------------------------------------------------------
//
// Examples:
//
// • HTTP request
// • Database query
// • File read
//
// These spend time waiting for external systems.
//
// Async programming is ideal here.
//
// ============================================================================


// ============================================================================
// 38. CPU-BOUND WORK
// ----------------------------------------------------------------------------
//
// Examples:
//
// • Large JSON parsing
// • Image processing
// • Encryption
// • Complex calculations
// • Huge data transformations
//
// These consume CPU time.
//
// Simply using async/await does NOT move CPU work to another thread/isolate.
//
// ============================================================================


// ============================================================================
// 39. STREAM
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
// Future:
//
// -----> VALUE
//
// Stream:
//
// -----> VALUE
// -----> VALUE
// -----> VALUE
// -----> DONE
//
// ============================================================================


// ============================================================================
// 40. SIMPLE STREAM
// ============================================================================

Stream<int> simpleStream() async* {
  yield 1;
  yield 2;
  yield 3;
}


// ============================================================================
// 41. LISTEN
// ----------------------------------------------------------------------------

void listenExample() {
  simpleStream().listen(
    (value) {
      print(
        "Value: $value",
      );
    },
    onDone: () {
      print(
        "Stream completed",
      );
    },
  );
}


// ============================================================================
// 42. STREAMCONTROLLER
// ----------------------------------------------------------------------------
//
// StreamController allows you to manually add values to a stream.
//
// ============================================================================

final StreamController<int>
    controller =
    StreamController<int>();


// ============================================================================
// 43. ADD VALUES
// ============================================================================

void addToStream() {
  controller.add(10);
  controller.add(20);
  controller.add(30);
}


// ============================================================================
// 44. CLOSE STREAM
// ----------------------------------------------------------------------------

void closeStream() {
  controller.close();
}


// ============================================================================
// 45. STREAM SUBSCRIPTION
// ----------------------------------------------------------------------------
//
// listen() returns a StreamSubscription.
//
// ============================================================================

late StreamSubscription<int>
    subscription;

void subscribe() {
  subscription =
      simpleStream().listen(
    (value) {
      print(value);
    },
  );
}


// ============================================================================
// 46. PAUSE
// ----------------------------------------------------------------------------

void pauseStream() {
  subscription.pause();
}


// ============================================================================
// 47. RESUME
// ----------------------------------------------------------------------------

void resumeStream() {
  subscription.resume();
}


// ============================================================================
// 48. CANCEL
// ----------------------------------------------------------------------------

Future<void> cancelStream() {
  return subscription.cancel();
}


// ============================================================================
// 49. WHY CANCEL STREAMS?
// ----------------------------------------------------------------------------
//
// Important for Flutter:
//
// A screen can disappear while a stream is still active.
//
// If you don't clean it up correctly, you can cause:
//
// • Memory leaks
// • Unnecessary work
// • Unexpected callbacks
//
// ============================================================================


// ============================================================================
// 50. SINGLE-SUBSCRIPTION STREAM
// ----------------------------------------------------------------------------
//
// A normal stream is usually single-subscription.
//
// Only one listener is allowed.
//
// ============================================================================


// ============================================================================
// 51. BROADCAST STREAM
// ----------------------------------------------------------------------------
//
// Broadcast streams can have multiple listeners.
//
// Example:
//
// final controller =
//     StreamController<int>.broadcast();
//
// ============================================================================

final broadcastController =
    StreamController<int>.broadcast();


// ============================================================================
// 52. BROADCAST USE CASES
// ----------------------------------------------------------------------------
//
// Useful for:
//
// • Application-wide events
// • WebSocket events
// • Authentication state notifications
// • Event buses
//
// Use carefully because global event systems can make architecture difficult
// to understand.
//
// ============================================================================


// ============================================================================
// 53. ONDATA
// ----------------------------------------------------------------------------
//
// onData receives stream values.
//
// ============================================================================


// ============================================================================
// 54. ONERROR
// ----------------------------------------------------------------------------
//
// onError handles stream errors.
//
// ============================================================================


// ============================================================================
// 55. ONDONE
// ----------------------------------------------------------------------------
//
// onDone executes when stream finishes.
//
// ============================================================================


// ============================================================================
// 56. STREAM TRANSFORMATION — MAP
// ----------------------------------------------------------------------------

Stream<int> mappedStream() {
  return simpleStream().map(
    (value) => value * 10,
  );
}


// ============================================================================
// OUTPUT:
//
// 10
// 20
// 30
//
// ============================================================================


// ============================================================================
// 57. WHERE
// ----------------------------------------------------------------------------

Stream<int> filteredStream() {
  return simpleStream().where(
    (value) => value.isEven,
  );
}


// ============================================================================
// 58. TAKE
// ----------------------------------------------------------------------------
//
// Takes only the first N values.
//
// ============================================================================

Stream<int> firstTwo() {
  return simpleStream().take(2);
}


// ============================================================================
// 59. SKIP
// ----------------------------------------------------------------------------

Stream<int> skipFirst() {
  return simpleStream().skip(1);
}


// ============================================================================
// 60. EXPAND
// ----------------------------------------------------------------------------
//
// Converts each item into multiple items.
//
// ============================================================================

Stream<int> expandedStream() {
  return simpleStream().expand(
    (value) => [
      value,
      value * 10,
    ],
  );
}


// ============================================================================
// 61. ASYNCMAP
// ----------------------------------------------------------------------------
//
// asyncMap allows asynchronous transformation of each stream event.
//
// ============================================================================

Stream<String> asyncMappedStream() {
  return simpleStream().asyncMap(
    (value) async {
      await Future.delayed(
        const Duration(
          milliseconds: 10,
        ),
      );

      return "Value: $value";
    },
  );
}


// ============================================================================
// 62. ASYNCEXPAND
// ----------------------------------------------------------------------------
//
// Allows each event to produce a Stream asynchronously.
//
// ============================================================================


// ============================================================================
// 63. HANDLEERROR
// ----------------------------------------------------------------------------
//
// Streams can transform/handle errors using handleError.
//
// Concept:
//
// stream.handleError(
//   (error) {
//     print(error);
//   },
// );
//
// ============================================================================


// ============================================================================
// 64. TIMEOUT
// ----------------------------------------------------------------------------
//
// Prevent a stream from waiting forever.
//
// Concept:
//
// stream.timeout(
//   Duration(seconds: 5),
// );
//
// ============================================================================


// ============================================================================
// 65. DISTINCT
// ----------------------------------------------------------------------------
//
// Removes consecutive duplicate values.
//
// Example:
//
// 1
// 1
// 2
// 2
// 3
//
// distinct:
//
// 1
// 2
// 3
//
// ============================================================================


// ============================================================================
// 66. STREAM.FROMITERABLE
// ----------------------------------------------------------------------------

Stream<int> iterableStream() {
  return Stream.fromIterable([
    1,
    2,
    3,
    4,
  ]);
}


// ============================================================================
// 67. STREAM.FROMFUTURE
// ----------------------------------------------------------------------------
//
// Converts a Future result into a Stream with one value.
//
// ============================================================================

Stream<String> futureStream() {
  return Stream.fromFuture(
    Future.value("Hello"),
  );
}


// ============================================================================
// 68. STREAM.PERIODIC
// ----------------------------------------------------------------------------
//
// Emits values periodically.
//
// ============================================================================

Stream<int> periodicStream() {
  return Stream.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );
}


// ============================================================================
// 69. STREAM.VALUE
// ----------------------------------------------------------------------------

Stream<String> singleValueStream() {
  return Stream.value(
    "Hello",
  );
}


// ============================================================================
// 70. STREAM.EMPTY
// ----------------------------------------------------------------------------

Stream<String> emptyStream() {
  return Stream.empty();
}


// ============================================================================
// 71. STREAM.ERROR
// ----------------------------------------------------------------------------

Stream<String> errorStream() {
  return Stream.error(
    Exception(
      "Stream error",
    ),
  );
}


// ============================================================================
// 72. ASYNC* GENERATOR
// ----------------------------------------------------------------------------
//
// async* creates an asynchronous generator.
//
// It can yield multiple values over time.
//
// ============================================================================

Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
    );

    yield i;
  }
}


// ============================================================================
// 73. YIELD
// ----------------------------------------------------------------------------
//
// yield emits one value from an async* generator.
//
// ============================================================================


// ============================================================================
// 74. YIELD*
// ----------------------------------------------------------------------------
//
// yield* forwards all values from another Stream.
//
// ============================================================================

Stream<int> combinedStream() async* {
  yield* simpleStream();

  yield* Stream.fromIterable([
    4,
    5,
    6,
  ]);
}


// ============================================================================
// 75. REAL-TIME DATA
// ----------------------------------------------------------------------------
//
// Streams are perfect for:
//
// WebSocket
// ↓
// Event 1
// Event 2
// Event 3
// Event 4
//
// Flutter UI can listen and update.
//
// ============================================================================


// ============================================================================
// 76. SEARCH STREAM
// ----------------------------------------------------------------------------
//
// Search box example:
//
// User types:
//
// "p"
// "ph"
// "pho"
// "phon"
// "phone"
//
// You don't necessarily want to send an API request for every keystroke.
//
// You need:
//
// DEBOUNCE
//
// ============================================================================


// ============================================================================
// 77. DEBOUNCE CONCEPT
// ----------------------------------------------------------------------------
//
// User types:
//
// p
// ↓
// wait
// ph
// ↓
// wait
// pho
// ↓
// wait
// phone
// ↓
// no more typing
// ↓
// API request
//
// Debounce waits until events stop arriving for a specified period.
//
// ============================================================================


// ============================================================================
// 78. THROTTLE CONCEPT
// ----------------------------------------------------------------------------
//
// Throttle limits how frequently an operation can execute.
//
// Example:
//
// At most one operation every 500ms.
//
// Useful for:
//
// • Scroll events
// • Location updates
// • High-frequency events
//
// ============================================================================


// ============================================================================
// 79. ZONE
// ----------------------------------------------------------------------------
//
// A Zone provides an execution context for asynchronous operations.
//
// Zones can intercept certain operations such as:
//
// • Errors
// • Timers
// • Print/output
//
// They are an advanced Dart feature.
//
// ============================================================================


// ============================================================================
// 80. ZONE CONCEPT
// ----------------------------------------------------------------------------
//
// Think:
//
// Zone
//  ↓
// Context around asynchronous execution
//
// It can be useful for advanced logging/error handling.
//
// ============================================================================


// ============================================================================
// 81. RUNZONEGUARDED
// ----------------------------------------------------------------------------
//
// runZonedGuarded() can catch uncaught asynchronous errors in a zone.
//
// Concept:
//
// runZonedGuarded(
//   () {
//     // application code
//   },
//   (error, stackTrace) {
//     // global error handling
//   },
// );
//
// ============================================================================


// ============================================================================
// 82. WHY ZONES MATTER IN FLUTTER
// ----------------------------------------------------------------------------
//
// Flutter applications can use error handling mechanisms around application
// execution.
//
// However, do not use zones as a replacement for proper error handling.
//
// ============================================================================


// ============================================================================
// 83. ISOLATE
// ----------------------------------------------------------------------------
//
// An Isolate is Dart's unit of independent execution.
//
// Each isolate has its own:
//
// • Memory
// • Event loop
// • Call stack
//
// Isolates do NOT directly share mutable memory.
//
// ============================================================================


// ============================================================================
// 84. IMPORTANT DIFFERENCE
// ----------------------------------------------------------------------------
//
// Future:
//
// Asynchronous task within an isolate.
//
// Isolate:
//
// Separate execution context.
//
// Therefore:
//
// await
//
// does NOT automatically create another isolate.
//
// ============================================================================


// ============================================================================
// 85. WHY ISOLATES?
// ----------------------------------------------------------------------------
//
// Use isolates for CPU-heavy work that would otherwise block the main
// isolate.
//
// Example:
//
// HUGE JSON parsing
// IMAGE PROCESSING
// LARGE DATA CALCULATION
//
// ============================================================================


// ============================================================================
// 86. SENDPORT
// ----------------------------------------------------------------------------
//
// SendPort sends messages to another isolate.
//
// ============================================================================


// ============================================================================
// 87. RECEIVEPORT
// ----------------------------------------------------------------------------
//
// ReceivePort receives messages from another isolate.
//
// ============================================================================


// ============================================================================
// 88. ISOLATE COMMUNICATION
// ----------------------------------------------------------------------------
//
// Main isolate
//
//      SendPort
//          │
//          ▼
//   Worker Isolate
//          │
//          ▼
//    ReceivePort
//
// Communication happens through messages.
//
// ============================================================================


// ============================================================================
// 89. SIMPLE ISOLATE EXAMPLE
// ----------------------------------------------------------------------------

import 'dart:isolate';

Future<void> isolateExample() async {
  final receivePort =
      ReceivePort();

  await Isolate.spawn(
    worker,
    receivePort.sendPort,
  );

  final result =
      await receivePort.first;

  print(result);
}


// ============================================================================
// 90. WORKER FUNCTION
// ============================================================================

void worker(
  SendPort sendPort,
) {
  final result =
      10 * 10;

  sendPort.send(result);
}


// ============================================================================
// 91. ISOLATE FLOW
// ----------------------------------------------------------------------------
//
// Main:
//
// ReceivePort
// ↓
// spawn(worker)
//
// Worker:
//
// calculation
// ↓
// sendPort.send(result)
//
// Main:
//
// receive result
//
// ============================================================================


// ============================================================================
// 92. ISOLATE MEMORY
// ----------------------------------------------------------------------------
//
// Main isolate memory:
//
// [A][B][C]
//
// Worker isolate memory:
//
// [X][Y][Z]
//
// They do not simply share the same mutable objects.
//
// ============================================================================


// ============================================================================
// 93. MESSAGE PASSING
// ----------------------------------------------------------------------------
//
// Instead of shared mutable memory:
//
// Isolate A
//    │
//    │ message
//    ▼
// Isolate B
//
// This makes concurrency safer but requires explicit communication.
//
// ============================================================================


// ============================================================================
// 94. CONCURRENCY
// ----------------------------------------------------------------------------
//
// Concurrency means multiple tasks can make progress over time.
//
// Example:
//
// Download file
// Process user interaction
// Update UI
//
// ============================================================================


// ============================================================================
// 95. PARALLELISM
// ----------------------------------------------------------------------------
//
// Parallelism means multiple computations execute simultaneously, typically
// on different CPU cores.
//
// Isolates are Dart's mechanism for parallel CPU execution.
//
// ============================================================================


// ============================================================================
// 96. CONCURRENCY VS PARALLELISM
// ----------------------------------------------------------------------------
//
// CONCURRENCY:
//
// Managing multiple tasks.
//
// PARALLELISM:
//
// Executing multiple computations at the same time.
//
// A program can be concurrent without being parallel.
//
// ============================================================================


// ============================================================================
// 97. FLUTTER MAIN ISOLATE
// ----------------------------------------------------------------------------
//
// Flutter UI work normally happens on the main isolate.
//
// If you execute a huge CPU-heavy loop there:
//
// UI can become:
//
// ❌ Janky
// ❌ Slow
// ❌ Unresponsive
//
// ============================================================================


// ============================================================================
// 98. BAD CPU WORK
// ----------------------------------------------------------------------------

void badHeavyWork() {
  var total = 0;

  for (
    int i = 0;
    i < 100000000;
    i++
  ) {
    total += i;
  }

  print(total);
}


// ============================================================================
// 99. WHY BAD?
// ----------------------------------------------------------------------------
//
// If heavy computation executes on the UI isolate:
//
// Frame processing can be delayed.
//
// Flutter tries to maintain smooth rendering.
//
// Therefore heavy synchronous computation should be moved away from the
// main isolate when appropriate.
//
// ============================================================================


// ============================================================================
// 100. ISOLATE FOR HEAVY WORK
// ----------------------------------------------------------------------------
//
// Concept:
//
// final result =
//     await Isolate.run(
//   () => heavyCalculation(),
// );
//
// Modern Dart provides convenient isolate APIs for this pattern.
//
// ============================================================================


// ============================================================================
// 101. ISOLATE.RUN CONCEPT
// ----------------------------------------------------------------------------
//
// Isolate.run() is useful when you want to execute a computation in another
// isolate and get its result.
//
// Example:
//
// Future<int> calculate() {
//   return Isolate.run(
//     () {
//       return heavyCalculation();
//     },
//   );
// }
//
// ============================================================================


// ============================================================================
// 102. IMPORTANT
// ----------------------------------------------------------------------------
//
// Don't move every Future to an isolate.
//
// Network request:
//
// Future + async/await
//
// CPU-heavy computation:
//
// Consider isolate.
//
// ============================================================================


// ============================================================================
// 103. NETWORK REQUEST
// ----------------------------------------------------------------------------
//
// Example architecture:
//
// Flutter UI
//     ↓
// Controller
//     ↓
// Repository
//     ↓
// HTTP Future
//     ↓
// Server
//
// No isolate is normally required just because the request is asynchronous.
//
// ============================================================================


// ============================================================================
// 104. LARGE JSON PROCESSING
// ----------------------------------------------------------------------------
//
// Example:
//
// Server returns:
//
// 50 MB JSON
//
// Parsing it can consume significant CPU.
//
// Depending on the workload, moving parsing/processing to another isolate
// may improve UI responsiveness.
//
// ============================================================================


// ============================================================================
// 105. REAL-TIME ERP EXAMPLE
// ----------------------------------------------------------------------------
//
// Warehouse stock updates:
//
// WebSocket
//    ↓
// Stream
//    ↓
// Repository
//    ↓
// State management
//    ↓
// Flutter UI
//
// This is a perfect real-world Stream use case.
//
// ============================================================================


// ============================================================================
// 106. REAL-TIME ORDER EXAMPLE
// ----------------------------------------------------------------------------
//
// New order
//    ↓
// Server
//    ↓
// WebSocket
//    ↓
// Stream
//    ↓
// OrderRepository
//    ↓
// OrderController
//    ↓
// UI updates
//
// ============================================================================


// ============================================================================
// 107. API PARALLEL REQUEST EXAMPLE
// ----------------------------------------------------------------------------
//
// Dashboard:
//
// Sales
// Inventory
// Orders
// Customers
// Notifications
//
// If independent:
//
// Future.wait()
//
// ============================================================================

Future<List<Object>> dashboardRequests() async {
  return Future.wait([
    loadDashboard(),
    loadNotifications(),
    loadUserProfile(),
  ]);
}


// ============================================================================
// 108. API SEQUENTIAL REQUEST EXAMPLE
// ----------------------------------------------------------------------------
//
// Authentication:
//
// Login
// ↓
// Get token
// ↓
// Load profile
// ↓
// Load permissions
//
// These may need to be sequential.
//
// ============================================================================


// ============================================================================
// 109. STREAM + ERP INVENTORY
// ----------------------------------------------------------------------------

Stream<int> inventoryUpdates() async* {
  for (int stock = 100;
      stock >= 95;
      stock--) {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    yield stock;
  }
}


// ============================================================================
// 110. LISTEN TO INVENTORY
// ----------------------------------------------------------------------------

void listenInventory() {
  inventoryUpdates().listen(
    (stock) {
      print(
        "Current stock: $stock",
      );
    },
  );
}


// ============================================================================
// 111. STREAM CANCELLATION IN FLUTTER
// ----------------------------------------------------------------------------
//
// Typical concept:
//
// StreamSubscription? subscription;
//
// subscription = stream.listen(...);
//
// When the widget/controller is disposed:
//
// await subscription?.cancel();
//
// This prevents unnecessary work.
//
// ============================================================================


// ============================================================================
// 112. ASYNC ERROR ARCHITECTURE
// ----------------------------------------------------------------------------
//
// API call
//   ↓
// try
//   ↓
// success
//
// OR
//
// exception
//   ↓
// catch
//   ↓
// map to application error
//   ↓
// UI state = error
//
// ============================================================================


// ============================================================================
// 113. DON'T MIX UI AND LOW-LEVEL ASYNC LOGIC
// ----------------------------------------------------------------------------
//
// Avoid giant code like:
//
// button → HTTP → JSON parsing → database → state → UI
//
// inside one function.
//
// Instead:
//
// UI
// ↓
// Controller
// ↓
// Service
// ↓
// Repository
// ↓
// Data source
//
// ============================================================================


// ============================================================================
// 114. ASYNC FUNCTION DESIGN
// ----------------------------------------------------------------------------
//
// Good:
//
// Future<User> getUser(String id)
//
// Less clear:
//
// Future<dynamic> getSomething(...)
//
// Strong return types make asynchronous code safer.
//
// ============================================================================


// ============================================================================
// 115. NEVER BLOCK WITH SLEEP
// ----------------------------------------------------------------------------
//
// Dart does not have a normal blocking sleep intended for Flutter UI work.
//
// Don't attempt to create artificial blocking delays.
//
// Use:
//
// await Future.delayed(...)
//
// when you actually need asynchronous delay.
//
// ============================================================================


// ============================================================================
// 116. FUTURE.DELAYED IS NOT BACKGROUND THREADING
// ----------------------------------------------------------------------------
//
// Very important.
//
// Future.delayed()
//
// does NOT mean:
//
// "Run this on another CPU thread."
//
// It schedules future work.
//
// ============================================================================


// ============================================================================
// 117. TIMER
// ----------------------------------------------------------------------------
//
// Dart also provides Timer.
//
// Example:
//
// final timer = Timer(
//   const Duration(seconds: 2),
//   () {
//     print("Done");
//   },
// );
//
// ============================================================================


// ============================================================================
// 118. PERIODIC TIMER
// ----------------------------------------------------------------------------
//
// Timer.periodic() repeatedly executes a callback.
//
// Example:
//
// final timer = Timer.periodic(
//   const Duration(seconds: 1),
//   (timer) {
//     print(timer.tick);
//   },
// );
//
// Stop:
//
// timer.cancel();
//
// ============================================================================


// ============================================================================
// 119. TIMER VS STREAM.PERIODIC
// ----------------------------------------------------------------------------
//
// Timer:
//
// Callback-based.
//
// Stream.periodic:
//
// Stream-based.
//
// Choose according to architecture.
//
// ============================================================================


// ============================================================================
// 120. BACKPRESSURE CONCEPT
// ----------------------------------------------------------------------------
//
// Imagine a producer creates events faster than a consumer can process them.
//
// Producer:
// 1000 events/sec
//
// Consumer:
// 100 events/sec
//
// Now you have a pressure problem.
//
// Stream architecture may need:
//
// • Buffering
// • Throttling
// • Debouncing
// • Dropping events
// • Batching
//
// ============================================================================


// ============================================================================
// 121. BATCHING
// ----------------------------------------------------------------------------
//
// Instead of processing:
//
// Event 1
// Event 2
// Event 3
// Event 4
//
// individually:
//
// [1,2,3,4]
//
// process them together.
//
// Useful for:
//
// • Analytics
// • Database writes
// • Bulk API requests
// • Large event systems
//
// ============================================================================


// ============================================================================
// 122. REAL-TIME SEARCH ARCHITECTURE
// ----------------------------------------------------------------------------
//
// TextField
//   ↓
// Stream<String>
//   ↓
// debounce
//   ↓
// distinct
//   ↓
// API request
//   ↓
// results
//
// This pattern is extremely common in Flutter.
//
// ============================================================================


// ============================================================================
// 123. REAL-TIME CHAT ARCHITECTURE
// ----------------------------------------------------------------------------
//
// WebSocket
//   ↓
// Stream<Message>
//   ↓
// Repository
//   ↓
// State manager
//   ↓
// UI
//
// ============================================================================


// ============================================================================
// 124. FILE UPLOAD ARCHITECTURE
// ----------------------------------------------------------------------------
//
// File
// ↓
// asynchronous upload
// ↓
// progress stream
// ↓
// UI progress indicator
//
// Example:
//
// 0%
// 10%
// 20%
// ...
// 100%
//
// Streams are useful for progress events.
//
// ============================================================================


// ============================================================================
// 125. PAGINATION
// ----------------------------------------------------------------------------
//
// API:
//
// page 1
// page 2
// page 3
//
// Asynchronous requests can be coordinated with Future.
//
// Infinite scrolling can combine:
//
// Scroll events
// +
// async API requests
// +
// state updates
//
// ============================================================================


// ============================================================================
// 126. CONCURRENCY CONTROL
// ----------------------------------------------------------------------------
//
// Don't accidentally send:
//
// 20 identical API requests
//
// because a user tapped repeatedly.
//
// You may need:
//
// • Request cancellation
// • Request deduplication
// • Locking
// • State checks
// • Debouncing
//
// ============================================================================


// ============================================================================
// 127. RACE CONDITION
// ----------------------------------------------------------------------------
//
// Example:
//
// Request A starts.
// Request B starts.
//
// B finishes first.
// UI shows B.
//
// Then A finishes.
//
// UI accidentally shows old A data.
//
// This is a race condition.
//
// ============================================================================


// ============================================================================
// 128. SOLVING RACE CONDITIONS
// ----------------------------------------------------------------------------
//
// Possible strategies:
//
// • Request IDs
// • Cancellation
// • Latest-request-wins
// • Sequence numbers
// • State validation
//
// ============================================================================


// ============================================================================
// 129. REQUEST ID CONCEPT
// ----------------------------------------------------------------------------

int requestId = 0;

Future<void> search(
  String query,
) async {
  final currentId =
      ++requestId;

  final result =
      await fakeSearch(query);

  if (currentId != requestId) {
    return;
  }

  print(result);
}


// ============================================================================
// SUPPORTING FUNCTION
// ============================================================================

Future<String> fakeSearch(
  String query,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "Results for $query";
}


// ============================================================================
// 130. IMPORTANT LESSON
// ----------------------------------------------------------------------------
//
// Async programming is not just:
//
// async
// await
//
// Professional async programming requires understanding:
//
// • Ordering
// • Errors
// • Cancellation
// • Streams
// • Race conditions
// • Concurrency
// • CPU vs I/O
// • Resource cleanup
//
// ============================================================================


// ============================================================================
// 131. PHASE 29 PRACTICE TASKS
// ----------------------------------------------------------------------------
//
// TASK 1
// -------
// Create:
//
// Future<String> fetchUser()
//
// Simulate a 2-second API request.
//
//
//
// TASK 2
// -------
// Create three independent async functions:
//
// fetchProducts()
// fetchOrders()
// fetchNotifications()
//
// Execute them using:
//
// Future.wait()
//
//
//
// TASK 3
// -------
// Create:
//
// Stream<int> counterStream()
//
// Emit:
//
// 1
// 2
// 3
// 4
// 5
//
// with 1-second intervals.
//
//
//
// TASK 4
// -------
// Listen to the stream and print every value.
//
//
//
// TASK 5
// -------
// Create a StreamController.
//
// Add:
//
// 10
// 20
// 30
//
// Then close it.
//
//
//
// TASK 6
// -------
// Create a broadcast StreamController.
//
// Add two listeners.
//
// Verify that both receive events.
//
//
//
// TASK 7
// -------
// Create an async* function that emits products one at a time.
//
//
//
// TASK 8
// -------
// Practice:
//
// map()
// where()
// take()
// skip()
// distinct()
//
// on streams.
//
//
//
// TASK 9
// -------
// Create a CPU-heavy calculation.
//
// Run it using:
//
// Isolate.run()
//
//
//
// TASK 10
// -------
// Build a simulated ERP dashboard:
//
// Sales
// Inventory
// Orders
// Notifications
//
// Load independent data concurrently.
//
//
//
// TASK 11
// -------
// Build an inventory Stream:
//
// 100
// 99
// 98
// ...
//
// Listen to updates.
//
//
//
// TASK 12
// -------
// Simulate a search box stream and implement the concept of debounce.
//
//
//
// TASK 13
// -------
// Create two competing API requests.
//
// Demonstrate a race condition.
//
// Then solve it using a request ID.
//
// ============================================================================


// ============================================================================
// 132. PHASE 29 INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 01. What is a Future?
//
// 02. What does async do?
//
// 03. What does await do?
//
// 04. Does await create a new thread?
//
// 05. What is the difference between Future and Stream?
//
// 06. What is Future.wait()?
//
// 07. What is Future.any()?
//
// 08. What is Future.forEach()?
//
// 09. How do you handle async errors?
//
// 10. What is the event loop?
//
// 11. What is the event queue?
//
// 12. What is the microtask queue?
//
// 13. What does scheduleMicrotask() do?
//
// 14. Why can too many microtasks be dangerous?
//
// 15. What is async*?
//
// 16. What does yield do?
//
// 17. What does yield* do?
//
// 18. What is StreamController?
//
// 19. Single-subscription vs broadcast stream?
//
// 20. What is StreamSubscription?
//
// 21. How do you cancel a stream subscription?
//
// 22. What is asyncMap()?
//
// 23. What is debounce?
//
// 24. What is throttle?
//
// 25. What is backpressure?
//
// 26. What is a Zone?
//
// 27. What is an Isolate?
//
// 28. Future vs Isolate?
//
// 29. SendPort vs ReceivePort?
//
// 30. What is message passing?
//
// 31. Concurrency vs parallelism?
//
// 32. CPU-bound vs I/O-bound work?
//
// 33. Why can heavy CPU work make Flutter UI janky?
//
// 34. When should you use an isolate?
//
// 35. Does Future.delayed() run work on another thread?
//
// 36. What is a race condition?
//
// 37. How can race conditions occur in API requests?
//
// 38. How can you implement latest-request-wins?
//
// 39. Why should StreamSubscription be cancelled?
//
// 40. How would you design a real-time ERP inventory stream?
//
// ============================================================================
// 133. PHASE 29 GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// Future = one eventual result.
//
// RULE 2:
// Stream = multiple asynchronous values over time.
//
// RULE 3:
// async/await improves readability; it does not automatically create
// parallel execution.
//
// RULE 4:
// Independent Futures can often be executed concurrently using Future.wait.
//
// RULE 5:
// Dependent operations should generally be awaited sequentially.
//
// RULE 6:
// Future.delayed() is not a background thread.
//
// RULE 7:
// Async I/O and CPU-heavy computation are different problems.
//
// RULE 8:
// Use Streams for continuous/event-based data.
//
// RULE 9:
// Always think about stream lifecycle and cancellation.
//
// RULE 10:
// Broadcast streams allow multiple listeners.
//
// RULE 11:
// Don't create global streams unnecessarily.
//
// RULE 12:
// Use debounce for rapidly changing input.
//
// RULE 13:
// Use throttle when you need to limit event frequency.
//
// RULE 14:
// Understand race conditions before building search, pagination, and
// real-time features.
//
// RULE 15:
// Use isolates for appropriate CPU-heavy workloads.
//
// RULE 16:
// Isolates communicate through messages rather than shared mutable memory.
//
// RULE 17:
// Don't use isolates just because code is asynchronous.
//
// RULE 18:
// Handle errors intentionally.
//
// RULE 19:
// Clean up timers, streams and subscriptions.
//
// RULE 20:
// For a professional Flutter developer, asynchronous programming is not an
// optional topic—it is a core skill.
//
// ============================================================================
// 134. FULL-STACK FLUTTER CONNECTION
// ----------------------------------------------------------------------------
//
//                    FLUTTER UI
//                        │
//                        ▼
//                  STATE / CONTROLLER
//                        │
//                        ▼
//                  ASYNC SERVICE
//                        │
//                        ▼
//                  REPOSITORY
//                        │
//              ┌─────────┴─────────┐
//              ▼                   ▼
//             REST              WebSocket
//              │                   │
//            Future              Stream
//              │                   │
//              └─────────┬─────────┘
//                        ▼
//                      SERVER
//                        │
//                        ▼
//                    DATABASE
//
// This architecture is directly relevant to your future full-stack Flutter
// applications and your ERP/SaaS system.
//
// ============================================================================
// PHASE 29 COMPLETE
// ============================================================================
//
// NEXT:
// ----------------------------------------------------------------------------
// PHASE 30 — ADVANCED DART TYPE SYSTEM & LANGUAGE FEATURES
//
// Topics will include:
//
// • Object
// • dynamic
// • Never
// • Null
// • Type
// • Type promotion
// • Type tests
// • Generic constraints
// • Generic methods
// • Covariance
// • Contravariance concepts
// • Inference
// • typedef
// • Function types
// • Records
// • Patterns
// • Destructuring
// • Pattern matching
// • switch expressions
// • Sealed classes
// • Exhaustiveness
// • Extension methods
// • Extension types
// • Mixins advanced usage
// • Interfaces
// • Abstract interfaces
// • Class modifiers
// • final class
// • base class
// • interface class
// • sealed class
// • mixin class
// • API design
//
// ============================================================================
// END OF PHASE 29
// ============================================================================