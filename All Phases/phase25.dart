// ============================================================================
// DART MASTER ROADMAP
// PHASE 25 — CONCURRENCY, EVENT LOOP, FUTURES & ISOLATES
// ============================================================================
//
// GOAL
// ----------------------------------------------------------------------------
// This phase teaches you how Dart handles asynchronous work and concurrency.
//
// These concepts are extremely important for professional Flutter development.
//
// You will use them for:
//
//   • API requests
//   • Database operations
//   • File operations
//   • Image processing
//   • Large JSON parsing
//   • Background calculations
//   • Pagination
//   • Multiple API requests
//   • Real-time applications
//   • ERP dashboards
//   • Notifications
//   • Avoiding UI freezing
//   • Performance optimization
//
// IMPORTANT:
//
// Dart is NOT traditionally multi-threaded in the way Java/C++ applications
// commonly are.
//
// Dart uses:
//
//   • Event loop
//   • Futures
//   • async/await
//   • Streams
//   • Isolates
//
// Each isolate has its own memory and event loop.
//
// ============================================================================


// ============================================================================
// 01. SYNCHRONOUS CODE
// ----------------------------------------------------------------------------
// Synchronous code executes one operation after another.
//
// ============================================================================

void synchronousExample() {
  print("A");
  print("B");
  print("C");
}


// OUTPUT:
//
// A
// B
// C
//
// ============================================================================


// ============================================================================
// 02. ASYNCHRONOUS CODE
// ----------------------------------------------------------------------------
// Asynchronous work allows the program to continue while waiting for an
// operation to complete.
//
// Common examples:
//
//   • Network request
//   • Database query
//   • File read
//   • Timer
//
// ============================================================================

Future<void> asynchronousExample() async {
  print("A");

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  print("B");
}


// ============================================================================
// 03. FUTURE
// ----------------------------------------------------------------------------
// Future represents a value that will become available later.
//
// Example:
//
// Future<String>
//
// means:
//
// "A String will be available in the future."
//
// ============================================================================

Future<String> getUsername() async {
  return "Palash";
}


// ============================================================================
// 04. RECEIVING FUTURE
// ============================================================================

Future<void> futureExample() async {
  final username =
      await getUsername();

  print(username);
}


// ============================================================================
// 05. FUTURE VALUE
// ----------------------------------------------------------------------------
// A Future can complete with:
//
//   • Value
//   • Error
//
// ============================================================================


// ============================================================================
// 06. FUTURE.DELAYED
// ============================================================================

Future<String> delayedMessage() {
  return Future.delayed(
    const Duration(
      seconds: 2,
    ),
    () => "Completed",
  );
}


// ============================================================================
// 07. FUTURE WITH THEN
// ----------------------------------------------------------------------------
// `then()` executes when the Future completes.
//
// ============================================================================

void thenExample() {
  getUsername().then(
    (username) {
      print(username);
    },
  );
}


// ============================================================================
// 08. THEN CHAIN
// ============================================================================

Future<void> thenChainExample() {
  return getUsername()
      .then(
    (username) {
      return username
          .toUpperCase();
    },
  )
      .then(
    (result) {
      print(result);
    },
  );
}


// ============================================================================
// 09. ASYNC/AWAIT
// ----------------------------------------------------------------------------
// async/await is generally easier to read than long `.then()` chains.
//
// ============================================================================

Future<void> asyncAwaitExample() async {
  final username =
      await getUsername();

  final upper =
      username.toUpperCase();

  print(upper);
}


// ============================================================================
// 10. IMPORTANT ASYNC RULE
// ----------------------------------------------------------------------------
//
// `await` pauses the CURRENT async function.
//
// It does NOT freeze the entire Dart application.
//
// ============================================================================


// ============================================================================
// 11. ERROR HANDLING WITH TRY/CATCH
// ============================================================================

Future<String>
    riskyOperation() async {
  throw Exception(
    "Something went wrong",
  );
}


// ============================================================================

Future<void>
    asyncErrorExample() async {
  try {
    final result =
        await riskyOperation();

    print(result);
  } catch (error) {
    print(
      "Error: $error",
    );
  }
}


// ============================================================================
// 12. FINALLY
// ============================================================================

Future<void>
    finallyExample() async {
  try {
    await riskyOperation();
  } catch (error) {
    print(error);
  } finally {
    print(
      "Operation finished",
    );
  }
}


// ============================================================================
// 13. FUTURE.ERROR
// ============================================================================

Future<String>
    failedFuture() {
  return Future.error(
    Exception(
      "Failed",
    ),
  );
}


// ============================================================================
// 14. FUTURE.VALUE
// ============================================================================

Future<String>
    successfulFuture() {
  return Future.value(
    "Success",
  );
}


// ============================================================================
// 15. FUTURE COMPLETION
// ----------------------------------------------------------------------------
// Completer allows you to manually complete a Future.
//
// ============================================================================

Future<String>
    completerExample() {
  final completer =
      Completer<String>();

  Future.delayed(
    const Duration(
      seconds: 1,
    ),
    () {
      completer.complete(
        "Done",
      );
    },
  );

  return completer.future;
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// Completer should not be used everywhere.
//
// Prefer:
//
//   async/await
//
// whenever possible.
//
// Completer is useful when converting callback/event-based APIs into Future.
//
// ============================================================================


// ============================================================================
// 16. COMPLETER WITH ERROR
// ============================================================================

Future<String>
    completerErrorExample() {
  final completer =
      Completer<String>();

  Future.delayed(
    const Duration(
      seconds: 1,
    ),
    () {
      completer.completeError(
        Exception(
          "Failed",
        ),
      );
    },
  );

  return completer.future;
}


// ============================================================================
// 17. FUTURE.WAIT
// ----------------------------------------------------------------------------
// Executes multiple Futures and waits until all complete.
//
// ============================================================================

Future<void>
    futureWaitExample() async {
  final results =
      await Future.wait([
    getUsername(),
    getUsername(),
    getUsername(),
  ]);

  print(results);
}


// ============================================================================
// 18. WHY FUTURE.WAIT?
// ----------------------------------------------------------------------------
//
// Suppose you need:
//
//   • User profile
//   • Products
//   • Notifications
//
// These requests don't depend on each other.
//
// Instead of:
//
// profile
//   ↓
// products
//   ↓
// notifications
//
// you can run them concurrently:
//
// profile
// products
// notifications
//
//       ↓
//
// Future.wait()
//
// ============================================================================
// 19. SEQUENTIAL REQUESTS
// ============================================================================

Future<void>
    sequentialRequests() async {
  final user =
      await getUsername();

  final products =
      await loadProducts();

  final notifications =
      await loadNotifications();

  print(user);
  print(products);
  print(notifications);
}


// ============================================================================
// 20. CONCURRENT REQUESTS
// ============================================================================

Future<void>
    concurrentRequests() async {
  final results =
      await Future.wait([
    getUsername(),
    loadProducts(),
    loadNotifications(),
  ]);

  final user =
      results[0];

  final products =
      results[1];

  final notifications =
      results[2];

  print(user);
  print(products);
  print(notifications);
}


// ============================================================================
// IMPORTANT
// ----------------------------------------------------------------------------
// Concurrent requests can be significantly faster when operations are
// independent.
//
// ============================================================================


// ============================================================================
// 21. TYPED FUTURE.WAIT
// ----------------------------------------------------------------------------
// A mixed list may produce List<Object?>.
//
// For clean architecture, sometimes create typed Futures separately.
//
// ============================================================================

Future<void>
    typedConcurrentExample() async {
  final Future<String>
      userFuture =
      getUsername();

  final Future<List<String>>
      productsFuture =
      loadProducts();

  final Future<List<String>>
      notificationsFuture =
      loadNotifications();

  final user =
      await userFuture;

  final products =
      await productsFuture;

  final notifications =
      await notificationsFuture;

  print(user);
  print(products);
  print(notifications);
}


// ============================================================================
// 22. FUTURE.ANY
// ----------------------------------------------------------------------------
// Completes with the first Future that completes successfully.
//
// ============================================================================

Future<void>
    futureAnyExample() async {
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
        seconds: 1,
      ),
      () => "Server B",
    ),
  ]);

  print(result);
}


// ============================================================================
// USE CASE
// ----------------------------------------------------------------------------
//
// Multiple servers:
//
// Server A
// Server B
// Server C
//
// Use whichever responds first.
//
// ============================================================================


// ============================================================================
// 23. FUTURE.TIMEOUT
// ----------------------------------------------------------------------------
// Prevent an operation from waiting forever.
//
// ============================================================================

Future<void>
    timeoutExample() async {
  try {
    final result =
        await delayedMessage()
            .timeout(
      const Duration(
        seconds: 1,
      ),
    );

    print(result);
  } catch (error) {
    print(
      "Operation timed out",
    );
  }
}


// ============================================================================
// 24. TIMEOUT WITH FALLBACK
// ============================================================================

Future<String>
    timeoutFallback() async {
  return delayedMessage()
      .timeout(
    const Duration(
      seconds: 1,
    ),
    onTimeout: () {
      return "Fallback";
    },
  );
}


// ============================================================================
// 25. FUTURE.DELAYED VS TIMER
// ----------------------------------------------------------------------------
// Future.delayed:
//
//   Used to create a Future that completes later.
//
// Timer:
//
//   Used to schedule callbacks.
//
// ============================================================================

void timerExample() {
  Timer(
    const Duration(
      seconds: 1,
    ),
    () {
      print(
        "Timer completed",
      );
    },
  );
}


// ============================================================================
// 26. PERIODIC TIMER
// ============================================================================

void periodicTimerExample() {
  final timer =
      Timer.periodic(
    const Duration(
      seconds: 1,
    ),
    (timer) {
      print(
        timer.tick,
      );

      if (timer.tick >= 5) {
        timer.cancel();
      }
    },
  );
}


// ============================================================================
// 27. CANCEL TIMER
// ----------------------------------------------------------------------------
// Always cancel timers when they are no longer needed.
//
// Especially important in Flutter:
//
//   • State lifecycle
//   • Screens
//   • Controllers
//   • Services
//
// ============================================================================


// ============================================================================
// 28. EVENT LOOP
// ----------------------------------------------------------------------------
// Dart executes asynchronous work using an event loop.
//
// Conceptually:
//
// ┌─────────────────────────┐
// │       Event Loop        │
// └────────────┬────────────┘
//              │
//      ┌───────┴────────┐
//      │                │
// Microtask Queue   Event Queue
//
// ============================================================================


// ============================================================================
// 29. EVENT QUEUE
// ----------------------------------------------------------------------------
// Event queue contains asynchronous events such as:
//
//   • Timer callbacks
//   • I/O completion
//   • User events
//   • External events
//
// ============================================================================


// ============================================================================
// 30. MICROTASK QUEUE
// ----------------------------------------------------------------------------
// Microtasks have higher priority than normal event queue events.
//
// ============================================================================


// ============================================================================
// 31. SCHEDULEMICROTASK
// ============================================================================

void microtaskExample() {
  print("A");

  scheduleMicrotask(
    () {
      print("Microtask");
    },
  );

  print("B");
}


// OUTPUT:
//
// A
// B
// Microtask
//
// ============================================================================


// ============================================================================
// 32. FUTURE.MICROTASK
// ============================================================================

void futureMicrotaskExample() {
  print("A");

  Future.microtask(
    () {
      print("Microtask");
    },
  );

  print("B");
}


// ============================================================================
// 33. EVENT QUEUE EXAMPLE
// ============================================================================

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
// 34. MICROTASK VS EVENT
// ----------------------------------------------------------------------------
//
// Conceptually:
//
// Current synchronous code
//        ↓
// Microtask queue
//        ↓
// Event queue
//
// ============================================================================


// ============================================================================
// 35. EVENT LOOP IMPORTANT RULE
// ----------------------------------------------------------------------------
// A huge amount of synchronous CPU work blocks the isolate's event loop.
//
// This can cause Flutter UI jank.
//
// ============================================================================


// ============================================================================
// 36. CPU-BOUND WORK
// ----------------------------------------------------------------------------
// CPU-heavy operations include:
//
//   • Large JSON parsing
//   • Image processing
//   • Encryption
//   • Compression
//   • Complex mathematical calculations
//   • Large data transformations
//
// ============================================================================


// ============================================================================
// 37. I/O-BOUND VS CPU-BOUND
// ----------------------------------------------------------------------------
//
// I/O-bound:
//
//   Waiting for something external.
//
// Examples:
//
//   API
//   Database
//   File
//
// Usually async/await is enough.
//
//
//
// CPU-bound:
//
//   Requires significant computation.
//
// Examples:
//
//   Huge JSON parsing
//   Image processing
//   Large calculations
//
// Consider an isolate.
//
// ============================================================================


// ============================================================================
// 38. ISOLATE
// ----------------------------------------------------------------------------
// An isolate is an independent Dart execution context.
//
// Each isolate has:
//
//   • Its own memory
//   • Its own event loop
//   • Its own execution state
//
// Isolates do NOT directly share mutable memory.
//
// ============================================================================


// ============================================================================
// 39. MAIN ISOLATE
// ----------------------------------------------------------------------------
// Flutter UI normally runs on the main isolate.
//
// If you block it with heavy synchronous computation:
//
// UI can freeze.
//
// ============================================================================


// ============================================================================
// 40. WHY ISOLATES?
// ----------------------------------------------------------------------------
// Move CPU-heavy work away from the main isolate.
//
// Example:
//
// Main isolate
//      │
//      │ send data
//      ↓
// Worker isolate
//      │
//      │ process
//      ↓
// Main isolate
//
// ============================================================================


// ============================================================================
// 41. ISOLATE.RUN
// ----------------------------------------------------------------------------
// Modern Dart provides Isolate.run() for running a computation in another
// isolate.
//
// ============================================================================

Future<int>
    isolateRunExample() async {
  return Isolate.run(
    () {
      return 10 * 20;
    },
  );
}


// ============================================================================
// 42. USING ISOLATE.RUN
// ============================================================================

Future<void>
    runIsolateExample() async {
  final result =
      await Isolate.run(
    () {
      int total = 0;

      for (
        int i = 0;
        i < 1000000;
        i++
      ) {
        total += i;
      }

      return total;
    },
  );

  print(result);
}


// ============================================================================
// 43. IMPORTANT
// ----------------------------------------------------------------------------
// Isolate.run() is asynchronous from the caller's perspective.
//
// It returns:
//
// Future<T>
//
// ============================================================================


// ============================================================================
// 44. PASSING DATA TO ISOLATE
// ============================================================================

Future<int>
    calculateSum(
  List<int> numbers,
) async {
  return Isolate.run(
    () {
      return numbers.fold(
        0,
        (
          sum,
          number,
        ) =>
            sum + number,
      );
    },
  );
}


// ============================================================================
// 45. ISOLATE DATA MODEL
// ----------------------------------------------------------------------------
//
// Main isolate:
//
// List<int>
//
//        ↓
//
// Isolate.run()
//
//        ↓
//
// Worker isolate:
//
// Calculate
//
//        ↓
//
// Return:
//
// int
//
// ============================================================================


// ============================================================================
// 46. IMPORTANT ISOLATE RULE
// ----------------------------------------------------------------------------
// Don't think of an isolate as:
//
// "another thread with shared variables."
//
// Think:
//
// "another independent Dart world that communicates by messages/results."
//
// ============================================================================


// ============================================================================
// 47. SENDPORT / RECEIVEPORT
// ----------------------------------------------------------------------------
// Lower-level isolate communication uses:
//
//   SendPort
//   ReceivePort
//
// ============================================================================


// ============================================================================
// 48. RECEIVEPORT
// ============================================================================

void receivePortExample() {
  final receivePort =
      ReceivePort();

  receivePort.listen(
    (message) {
      print(
        "Received: $message",
      );
    },
  );

  receivePort.sendPort
      .send(
    "Hello",
  );

  receivePort.close();
}


// ============================================================================
// 49. SENDPORT
// ----------------------------------------------------------------------------
// SendPort sends messages.
//
// ReceivePort receives messages.
//
// ============================================================================


// ============================================================================
// 50. SPAWN AN ISOLATE
// ----------------------------------------------------------------------------
// Low-level isolate creation:
//
// Isolate.spawn()
//
// ============================================================================

void isolateEntryPoint(
  SendPort sendPort,
) {
  sendPort.send(
    "Hello from isolate",
  );
}


// ============================================================================
// 51. START ISOLATE
// ============================================================================

Future<void>
    spawnExample() async {
  final receivePort =
      ReceivePort();

  await Isolate.spawn(
    isolateEntryPoint,
    receivePort.sendPort,
  );

  final message =
      await receivePort.first;

  print(message);

  receivePort.close();
}


// ============================================================================
// 52. ISOLATE LIFECYCLE
// ----------------------------------------------------------------------------
//
// Main isolate:
//
// create ReceivePort
//       ↓
// spawn isolate
//       ↓
// send SendPort
//       ↓
// worker executes
//       ↓
// worker sends result
//       ↓
// main receives
//       ↓
// close resources
//
// ============================================================================


// ============================================================================
// 53. ISOLATE COMMUNICATION
// ----------------------------------------------------------------------------
//
// Communication happens through messages.
//
// You don't normally do:
//
// sharedVariable++
//
// across isolates.
//
// ============================================================================


// ============================================================================
// 54. IMMUTABLE / SENDABLE DATA
// ----------------------------------------------------------------------------
// Data passed between isolates must be transferable according to Dart's
// isolate messaging rules.
//
// Simple values are straightforward:
//
//   • int
//   • double
//   • String
//   • bool
//   • List
//   • Map
//
// But arbitrary objects/resources have restrictions.
//
// ============================================================================


// ============================================================================
// 55. DON'T PASS UI OBJECTS TO WORKER ISOLATES
// ----------------------------------------------------------------------------
//
// Never try to send:
//
//   • BuildContext
//   • Widget instances
//   • State objects
//   • Controllers tied to UI
//
// into a worker isolate.
//
// ============================================================================


// ============================================================================
// 56. ISOLATE.RUН FOR JSON
// ----------------------------------------------------------------------------
// Large JSON can be expensive to parse.
//
// Conceptually:
//
// API response
//      ↓
// isolate
//      ↓
// jsonDecode
//      ↓
// model conversion
//      ↓
// result
//
// ============================================================================

Future<List<dynamic>>
    parseLargeJson(
  String jsonString,
) async {
  return Isolate.run(
    () {
      return jsonDecode(
        jsonString,
      ) as List<dynamic>;
    },
  );
}


// ============================================================================
// 57. JSON MODEL PARSING IN ISOLATE
// ============================================================================

Future<List<ProductModel>>
    parseProductsInIsolate(
  String jsonString,
) async {
  return Isolate.run(
    () {
      final decoded =
          jsonDecode(
        jsonString,
      ) as List;

      return decoded
          .map(
            (item) =>
                ProductModel
                    .fromJson(
              item
                  as Map<
                      String,
                      dynamic>,
            ),
          )
          .toList();
    },
  );
}


// ============================================================================
// 58. WHEN NOT TO USE ISOLATE
// ----------------------------------------------------------------------------
// Don't use isolates for every API call.
//
// Example:
//
// final data = await api.getProducts();
//
// This is I/O-bound.
//
// Async/await is normally enough.
//
// ============================================================================
// 59. WHEN TO USE ISOLATE
// ----------------------------------------------------------------------------
// Consider isolate when:
//
//   • CPU work is expensive
//   • Work takes enough time to impact responsiveness
//   • Large data transformation is required
//   • Image/data processing is heavy
//
// ============================================================================
// 60. FLUTTER UI JANK
// ----------------------------------------------------------------------------
//
// If main isolate spends too much time doing:
//
// for (...) {
//   hugeCalculation();
// }
//
// Flutter cannot process frames smoothly.
//
// Result:
//
//   • Dropped frames
//   • Lag
//   • Frozen UI
//
// ============================================================================
// 61. BAD EXAMPLE
// ============================================================================

void badHeavyWork() {
  int result = 0;

  for (
    int i = 0;
    i < 100000000;
    i++
  ) {
    result += i;
  }

  print(result);
}


// ============================================================================
// 62. BETTER
// ============================================================================

Future<void>
    betterHeavyWork() async {
  final result =
      await Isolate.run(
    () {
      int total = 0;

      for (
        int i = 0;
        i < 100000000;
        i++
      ) {
        total += i;
      }

      return total;
    },
  );

  print(result);
}


// ============================================================================
// 63. CONCURRENCY VS PARALLELISM
// ----------------------------------------------------------------------------
//
// Concurrency:
//
// Multiple tasks are in progress during overlapping time.
//
//
//
// Parallelism:
//
// Multiple tasks actually execute at the same time on different execution
// resources.
//
//
//
// In Dart:
//
// async/Futures → concurrency
//
// multiple isolates → actual parallel execution across isolates
//
// ============================================================================
// 64. IMPORTANT
// ----------------------------------------------------------------------------
// `Future` does NOT automatically mean CPU work runs on another thread.
//
// Example:
//
// Future.value(
//   heavyCalculation(),
// )
//
// is NOT a solution for moving the heavy calculation away from the current
// isolate.
//
// The heavy calculation happens before Future.value receives its result.
//
// ============================================================================
// 65. WRONG APPROACH
// ============================================================================

Future<int>
    wrongHeavyCalculation() {
  final result =
      expensiveCalculation();

  return Future.value(
    result,
  );
}


// ============================================================================
// 66. CORRECT APPROACH
// ============================================================================

Future<int>
    correctHeavyCalculation() {
  return Isolate.run(
    expensiveCalculation,
  );
}


// ============================================================================
// 67. EXPENSIVE CALCULATION
// ============================================================================

int expensiveCalculation() {
  int total = 0;

  for (
    int i = 0;
    i < 10000000;
    i++
  ) {
    total += i;
  }

  return total;
}


// ============================================================================
// 68. PARALLEL INDEPENDENT TASKS
// ----------------------------------------------------------------------------
// You can start independent Futures before awaiting them.
//
// ============================================================================

Future<void>
    parallelApiExample() async {
  final products =
      loadProducts();

  final users =
      loadUsers();

  final orders =
      loadOrders();

  final results =
      await Future.wait([
    products,
    users,
    orders,
  ]);

  print(results);
}


// ============================================================================
// 69. SEQUENTIAL VS CONCURRENT
// ----------------------------------------------------------------------------
//
// Sequential:
//
// A → wait → B → wait → C
//
// Concurrent:
//
// A ────────┐
// B ────────┼──→ complete
// C ────────┘
//
// ============================================================================
// 70. DEPENDENT TASKS
// ----------------------------------------------------------------------------
// If B depends on A:
//
// A → B → C
//
// You must await sequentially.
//
// ============================================================================

Future<void>
    dependentTasks() async {
  final user =
      await getUser();

  final orders =
      await getOrdersForUser(
    user,
  );

  print(orders);
}


// ============================================================================
// 71. INDEPENDENT TASKS
// ----------------------------------------------------------------------------
// If A, B and C don't depend on each other:
//
// Future.wait()
//
// ============================================================================


// ============================================================================
// 72. ASYNC INITIALIZATION
// ----------------------------------------------------------------------------
// Flutter services often need multiple async operations.
//
// ============================================================================

Future<void>
    initializeApplication() async {
  final results =
      await Future.wait([
    initializeDatabase(),
    initializeCache(),
    loadConfiguration(),
  ]);

  print(results);
}


// ============================================================================
// 73. ERROR IN FUTURE.WAIT
// ----------------------------------------------------------------------------
// If one Future fails, Future.wait normally completes with an error.
//
// Handle it appropriately.
//
// ============================================================================

Future<void>
    safeFutureWait() async {
  try {
    final results =
        await Future.wait([
      loadProducts(),
      loadUsers(),
      loadOrders(),
    ]);

    print(results);
  } catch (error) {
    print(
      "Initialization failed: $error",
    );
  }
}


// ============================================================================
// 74. FUTURE.WAIT EAGER ERROR
// ----------------------------------------------------------------------------
// If one Future fails, you should not assume the other operations were
// necessarily cancelled.
//
// This is important for resource management.
//
// ============================================================================
// 75. RETRY
// ----------------------------------------------------------------------------
// Network operations often need retry logic.
//
// ============================================================================

Future<T> retry<T>(
  Future<T> Function() operation, {
  int attempts = 3,
}) async {
  Object? lastError;

  for (
    int i = 0;
    i < attempts;
    i++
  ) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;
    }
  }

  throw lastError ??
      Exception(
        "Operation failed",
      );
}


// ============================================================================
// 76. RETRY WITH DELAY
// ============================================================================

Future<T> retryWithDelay<T>(
  Future<T> Function() operation, {
  int attempts = 3,
  Duration delay =
      const Duration(
    seconds: 1,
  ),
}) async {
  Object? lastError;

  for (
    int i = 0;
    i < attempts;
    i++
  ) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;

      if (i < attempts - 1) {
        await Future.delayed(
          delay,
        );
      }
    }
  }

  throw lastError ??
      Exception(
        "Operation failed",
      );
}


// ============================================================================
// 77. EXPONENTIAL BACKOFF
// ----------------------------------------------------------------------------
// Production network systems often increase retry delay:
//
// Attempt 1 → 1 second
// Attempt 2 → 2 seconds
// Attempt 3 → 4 seconds
//
// ============================================================================

Future<T>
    retryWithBackoff<T>(
  Future<T> Function()
      operation, {
  int attempts = 3,
}) async {
  Object? lastError;

  for (
    int i = 0;
    i < attempts;
    i++
  ) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;

      if (i <
          attempts - 1) {
        final delay =
            Duration(
          seconds: 1 << i,
        );

        await Future.delayed(
          delay,
        );
      }
    }
  }

  throw lastError ??
      Exception(
        "Operation failed",
      );
}


// ============================================================================
// 78. DEBOUNCE CONCEPT
// ----------------------------------------------------------------------------
// Debouncing is extremely useful for Flutter search.
//
// User types:
//
// P
// Pa
// Pal
// Pala
// Palas
// Palash
//
// Instead of making an API request for every keystroke,
// wait until typing pauses.
//
// ============================================================================
// 79. SIMPLE DEBOUNCER
// ============================================================================

class Debouncer {
  final Duration delay;

  Timer? _timer;

  Debouncer({
    required this.delay,
  });

  void run(
    void Function() action,
  ) {
    _timer?.cancel();

    _timer = Timer(
      delay,
      action,
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}


// ============================================================================
// 80. DEBOUNCE USAGE
// ============================================================================

void debounceExample() {
  final debouncer =
      Debouncer(
    delay: const Duration(
      milliseconds: 500,
    ),
  );

  debouncer.run(
    () {
      print(
        "Search API",
      );
    },
  );
}


// ============================================================================
// 81. THROTTLE CONCEPT
// ----------------------------------------------------------------------------
// Debounce:
//
// "Wait until events stop."
//
// Throttle:
//
// "Allow execution at most once during a period."
//
// Useful for:
//
//   • Scroll events
//   • Location updates
//   • Rapid button events
//
// ============================================================================
// 82. SIMPLE THROTTLER
// ============================================================================

class Throttler {
  final Duration interval;

  bool _ready = true;

  Throttler({
    required this.interval,
  });

  void run(
    void Function() action,
  ) {
    if (!_ready) {
      return;
    }

    _ready = false;

    action();

    Timer(
      interval,
      () {
        _ready = true;
      },
    );
  }
}


// ============================================================================
// 83. DEBOUNCE VS THROTTLE
// ----------------------------------------------------------------------------
//
// Search:
//
// debounce
//
// Scroll:
//
// throttle
//
// ============================================================================
// 84. ASYNC QUEUE CONCEPT
// ----------------------------------------------------------------------------
// Sometimes operations must execute one after another.
//
// Example:
//
// Upload:
//
// file 1
// ↓
// file 2
// ↓
// file 3
//
// ============================================================================
// 85. SIMPLE SEQUENTIAL PROCESSING
// ============================================================================

Future<void>
    processSequentially(
  List<String> items,
  Future<void> Function(
    String,
  ) processor,
) async {
  for (final item in items) {
    await processor(item);
  }
}


// ============================================================================
// 86. CONCURRENT PROCESSING
// ----------------------------------------------------------------------------
// If operations are independent:
//
// ============================================================================

Future<void>
    processConcurrently(
  List<String> items,
  Future<void> Function(
    String,
  ) processor,
) async {
  await Future.wait(
    items.map(
      processor,
    ),
  );
}


// ============================================================================
// 87. IMPORTANT
// ----------------------------------------------------------------------------
// Don't blindly use concurrent processing.
//
// 10,000 simultaneous API calls can overload:
//
//   • Client
//   • Server
//   • Database
//   • Network
//
// Use batching/limits when appropriate.
//
// ============================================================================
// 88. CONCURRENCY LIMIT CONCEPT
// ----------------------------------------------------------------------------
// Production applications may limit the number of concurrent tasks.
//
// Example:
//
// maximum 5 uploads at a time.
//
// ============================================================================
// 89. SIMPLE BATCHED PROCESSING
// ============================================================================

Future<void>
    processInBatches(
  List<String> items,
  int batchSize,
  Future<void> Function(
    String,
  ) processor,
) async {
  for (
    int i = 0;
    i < items.length;
    i += batchSize
  ) {
    final batch =
        items
            .skip(i)
            .take(batchSize);

    await Future.wait(
      batch.map(
        processor,
      ),
    );
  }
}


// ============================================================================
// 90. BATCH PROCESSING USE CASES
// ----------------------------------------------------------------------------
//
// Useful for:
//
//   • Product image uploads
//   • Bulk API operations
//   • ERP imports
//   • CSV processing
//   • Notifications
//   • Large synchronization jobs
//
// ============================================================================
// 91. ASYNC GENERATOR
// ----------------------------------------------------------------------------
// async* + yield.
//
// ============================================================================

Stream<int>
    countAsync(
  int max,
) async* {
  for (
    int i = 1;
    i <= max;
    i++
  ) {
    await Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
    );

    yield i;
  }
}


// ============================================================================
// 92. LISTEN TO ASYNC GENERATOR
// ============================================================================

Future<void>
    asyncGeneratorListen() async {
  await for (
    final number
    in countAsync(5)
  ) {
    print(number);
  }
}


// ============================================================================
// 93. STREAM MAP
// ============================================================================

Stream<String>
    uppercaseStream(
  Stream<String>
      source,
) {
  return source.map(
    (value) =>
        value.toUpperCase(),
  );
}


// ============================================================================
// 94. STREAM WHERE
// ============================================================================

Stream<int>
    evenStream(
  Stream<int> source,
) {
  return source.where(
    (value) =>
        value.isEven,
  );
}


// ============================================================================
// 95. STREAM ASYNCMAP
// ============================================================================

Stream<String>
    asyncTransformStream(
  Stream<String> source,
) {
  return source.asyncMap(
    (value) async {
      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );

      return value.toUpperCase();
    },
  );
}


// ============================================================================
// 96. STREAM ERROR HANDLING
// ============================================================================

Future<void>
    streamErrorExample(
  Stream<int> stream,
) async {
  try {
    await for (
      final value
      in stream
    ) {
      print(value);
    }
  } catch (error) {
    print(
      "Stream error: $error",
    );
  }
}


// ============================================================================
// 97. STREAM CANCELLATION
// ----------------------------------------------------------------------------
// In Flutter, subscriptions should often be cancelled.
//
// ============================================================================

class StreamManager {
  StreamSubscription<int>?
      subscription;

  void start(
    Stream<int> stream,
  ) {
    subscription =
        stream.listen(
      (value) {
        print(value);
      },
    );
  }

  Future<void> dispose() async {
    await subscription
        ?.cancel();
  }
}


// ============================================================================
// 98. RESOURCE CLEANUP
// ----------------------------------------------------------------------------
//
// Always consider cleanup for:
//
//   • Timer
//   • StreamSubscription
//   • ReceivePort
//   • Isolate
//   • Controllers
//   • Sockets
//
// ============================================================================
// 99. ISOLATE WITH CLASS METHOD
// ----------------------------------------------------------------------------
// Functions passed to isolates should be designed carefully.
//
// Keep worker functions independent from UI state.
//
// ============================================================================

class HeavyCalculator {
  static int calculate(
    int maximum,
  ) {
    int result = 0;

    for (
      int i = 0;
      i < maximum;
      i++
    ) {
      result += i;
    }

    return result;
  }
}


// ============================================================================
// 100. RUN CLASS CALCULATION
// ============================================================================

Future<int>
    runHeavyCalculation(
  int maximum,
) {
  return Isolate.run(
    () => HeavyCalculator
        .calculate(
      maximum,
    ),
  );
}


// ============================================================================
// 101. ISOLATE + MODEL DATA
// ----------------------------------------------------------------------------
// For large ERP datasets:
//
// API
// ↓
// raw JSON
// ↓
// isolate
// ↓
// decode
// ↓
// model conversion
// ↓
// return models
//
// ============================================================================
// 102. API REPOSITORY PATTERN
// ============================================================================

abstract class ProductRepository {
  Future<List<ProductModel>>
      getProducts();
}


// ============================================================================
// 103. SERVICE
// ============================================================================

class ProductService {
  final ProductRepository
      repository;

  const ProductService(
    this.repository,
  );

  Future<List<ProductModel>>
      loadProducts() async {
    return repository
        .getProducts();
  }
}


// ============================================================================
// 104. CONCURRENT DASHBOARD
// ----------------------------------------------------------------------------
// An ERP dashboard may require:
//
//   • Sales
//   • Orders
//   • Inventory
//   • Customers
//
// ============================================================================

class DashboardData {
  final double sales;
  final int orders;
  final int inventory;
  final int customers;

  const DashboardData({
    required this.sales,
    required this.orders,
    required this.inventory,
    required this.customers,
  });
}


// ============================================================================

Future<DashboardData>
    loadDashboard() async {
  final results =
      await Future.wait([
    loadSales(),
    loadOrderCount(),
    loadInventoryCount(),
    loadCustomerCount(),
  ]);

  return DashboardData(
    sales:
        results[0] as double,
    orders:
        results[1] as int,
    inventory:
        results[2] as int,
    customers:
        results[3] as int,
  );
}


// ============================================================================
// 105. IMPORTANT ARCHITECTURE RULE
// ----------------------------------------------------------------------------
// Don't put all async logic inside Widgets.
//
// Better:
//
// UI
// ↓
// Controller / ViewModel / Bloc / Cubit
// ↓
// Repository
// ↓
// API / Database
//
// ============================================================================
// 106. ASYNC STATE
// ----------------------------------------------------------------------------
//
// Common UI states:
//
//   initial
//   loading
//   success
//   empty
//   error
//
// ============================================================================
// 107. BASIC ASYNC STATE
// ============================================================================

enum LoadStatus {
  initial,
  loading,
  success,
  empty,
  error,
}


// ============================================================================
// 108. RACE CONDITION CONCEPT
// ----------------------------------------------------------------------------
// Suppose user searches:
//
// "phone"
//
// then immediately:
//
// "laptop"
//
// Request 1:
// phone
//
// Request 2:
// laptop
//
// If phone response arrives AFTER laptop response,
// old data could overwrite new data.
//
// This is a race condition.
//
// ============================================================================
// 109. SEARCH REQUEST ID
// ----------------------------------------------------------------------------
// A simple approach is to track request versions.
//
// ============================================================================

class SearchController {
  int _requestId = 0;

  Future<void> search(
    String query,
  ) async {
    final request =
        ++_requestId;

    final result =
        await fakeSearch(query);

    if (request !=
        _requestId) {
      return;
    }

    print(
      "Use result: $result",
    );
  }
}


// ============================================================================
// 110. WHY REQUEST VERSIONING?
// ----------------------------------------------------------------------------
// Only the newest request updates the UI.
//
// This is extremely useful for:
//
//   • Search
//   • Filters
//   • Autocomplete
//   • Pagination
//
// ============================================================================
// 111. ASYNC VOID WARNING
// ----------------------------------------------------------------------------
// Avoid async void except for callbacks where required.
//
// Prefer:
//
// Future<void>
//
// ============================================================================
// BAD:
//
// async void load() {}
//
// BETTER:
//
// Future<void> load() async {}
//
// ============================================================================
// 112. WHY?
// ----------------------------------------------------------------------------
// Future<void> lets callers:
//
//   • await it
//   • catch errors
//   • coordinate work
//
// ============================================================================
// 113. UNHANDLED FUTURE
// ----------------------------------------------------------------------------
// If you start a Future without handling it:
//
// ============================================================================

void unhandledFutureExample() {
  riskyOperation();
}


// ============================================================================
// This may lead to unhandled errors.
//
// Better:
//
// ============================================================================

void handledFutureExample() {
  riskyOperation().catchError(
    (error) {
      print(error);
    },
  );
}


// ============================================================================
// 114. FIRE-AND-FORGET
// ----------------------------------------------------------------------------
// Sometimes an operation intentionally doesn't need to be awaited.
//
// But errors still need appropriate handling.
//
// ============================================================================

void fireAndForget() {
  saveAnalytics().catchError(
    (error) {
      print(
        "Analytics failed: $error",
      );
    },
  );
}


// ============================================================================
// 115. ASYNC INITIALIZATION PATTERN
// ============================================================================

class AppService {
  bool initialized = false;

  Future<void>
      initialize() async {
    await Future.wait([
      initializeDatabase(),
      initializeCache(),
    ]);

    initialized = true;
  }
}


// ============================================================================
// 116. CANCELLATION CONCEPT
// ----------------------------------------------------------------------------
// Dart Futures don't generally provide universal built-in cancellation.
//
// Cancellation is commonly handled using:
//
//   • Timer cancellation
//   • StreamSubscription.cancel()
//   • Abort/cancel APIs from networking libraries
//   • Request IDs
//   • Lifecycle checks
//
// ============================================================================
// 117. FLUTTER LIFECYCLE
// ----------------------------------------------------------------------------
//
// A widget can disappear while an async operation is still running.
//
// Example:
//
// Screen
// ↓
// API request
// ↓
// User leaves screen
// ↓
// API completes
//
// Don't blindly update disposed UI state.
//
// ============================================================================
// 118. MOUNTED CHECK
// ----------------------------------------------------------------------------
// In StatefulWidget:
//
// if (!mounted) return;
//
// before updating State after an async gap when appropriate.
//
// ============================================================================
// 119. ASYNC GAP
// ----------------------------------------------------------------------------
// An async gap is the time between:
//
// await
//
// and the continuation.
//
// Widget lifecycle may change during that period.
//
// ============================================================================
// 120. EVENT LOOP + FLUTTER
// ----------------------------------------------------------------------------
//
// Flutter frame processing depends on the main isolate remaining responsive.
//
// Avoid huge synchronous loops in:
//
//   • build()
//   • event handlers
//   • callbacks
//   • controller methods
//
// ============================================================================
// 121. BAD FLUTTER PATTERN
// ----------------------------------------------------------------------------
//
// onPressed:
//
// for 100 million iterations
//
// This can freeze the UI.
//
// ============================================================================
// 122. BETTER FLUTTER PATTERN
// ----------------------------------------------------------------------------
//
// Move genuinely CPU-heavy work to an isolate.
//
// ============================================================================
// 123. DON'T OVERUSE ISOLATES
// ----------------------------------------------------------------------------
//
// Isolate creation and data transfer have overhead.
//
// For tiny calculations:
//
// int result = a + b;
//
// don't use an isolate.
//
// ============================================================================
// 124. RULE OF THUMB
// ----------------------------------------------------------------------------
//
// Small CPU work:
//
// normal synchronous code
//
// I/O work:
//
// async/await
//
// Heavy CPU work:
//
// isolate
//
// Multiple independent I/O operations:
//
// Future.wait
//
// Continuous events:
//
// Stream
//
// ============================================================================
// 125. COMPLETE DECISION TREE
// ----------------------------------------------------------------------------
//
// Need network/database/file operation?
//
//        ↓
//
//     Future
//
//        ↓
//
// Need multiple independent operations?
//
//        ↓
//
//   Future.wait()
//
//        ↓
//
// Need continuous values?
//
//        ↓
//
//     Stream
//
//        ↓
//
// Heavy CPU calculation?
//
//        ↓
//
//    Isolate
//
// ============================================================================
// 126. ADVANCED ERP EXAMPLE
// ----------------------------------------------------------------------------
//
// Import 100,000 products:
//
// Step 1:
// Read file asynchronously.
//
// Step 2:
// Parse huge JSON/CSV in isolate.
//
// Step 3:
// Validate products.
//
// Step 4:
// Split into batches.
//
// Step 5:
// Upload batches with controlled concurrency.
//
// Step 6:
// Report progress through Stream.
//
// ============================================================================
// 127. IMPORT PIPELINE
// ============================================================================

Stream<int> importProducts(
  List<ProductModel> products,
) async* {
  const batchSize = 100;

  for (
    int i = 0;
    i < products.length;
    i += batchSize
  ) {
    final batch =
        products
            .skip(i)
            .take(batchSize)
            .toList();

    await uploadProductBatch(
      batch,
    );

    final progress =
        ((i + batch.length) *
                100) ~/
            products.length;

    yield progress;
  }
}


// ============================================================================
// 128. LISTEN TO PROGRESS
// ============================================================================

Future<void>
    importExample(
  List<ProductModel> products,
) async {
  await for (
    final progress
    in importProducts(
      products,
    )
  ) {
    print(
      "Progress: $progress%",
    );
  }
}


// ============================================================================
// 129. WHY STREAM HERE?
// ----------------------------------------------------------------------------
// Because progress is not one value.
//
// It is a sequence:
//
// 10%
// 20%
// 30%
// ...
// 100%
//
// Stream is a natural representation.
//
// ============================================================================
// 130. FUTURE VS STREAM
// ----------------------------------------------------------------------------
//
// Future:
//
// one eventual result.
//
// Stream:
//
// multiple results over time.
//
// ============================================================================
// 131. FUTURE EXAMPLE
// ----------------------------------------------------------------------------
//
// Future<Product>
//
// One product.
//
//
//
// Stream<Product>
//
// Many products arriving over time.
//
// ============================================================================
// 132. REAL-TIME ERP
// ----------------------------------------------------------------------------
// Stream can represent:
//
//   • Order updates
//   • Inventory changes
//   • Notification events
//   • Chat messages
//   • Delivery tracking
//   • Dashboard live metrics
//
// ============================================================================
// 133. STREAM CONTROLLER CONCEPT
// ----------------------------------------------------------------------------
// Don't create a StreamController without managing its lifecycle.
//
// ============================================================================
// 134. STREAM CONTROLLER
// ============================================================================

class EventService {
  final controller =
      StreamController<String>();

  Stream<String>
      get events =>
          controller.stream;

  void emit(
    String event,
  ) {
    controller.add(event);
  }

  Future<void> dispose() async {
    await controller.close();
  }
}


// ============================================================================
// 135. BROADCAST STREAM
// ----------------------------------------------------------------------------
// A normal StreamController is commonly single-subscription.
//
// Broadcast streams allow multiple listeners.
//
// ============================================================================

class BroadcastEventService {
  final controller =
      StreamController<String>
          .broadcast();

  Stream<String>
      get events =>
          controller.stream;

  void emit(
    String event,
  ) {
    controller.add(event);
  }

  Future<void> dispose() async {
    await controller.close();
  }
}


// ============================================================================
// 136. STREAM CONTROLLER WARNING
// ----------------------------------------------------------------------------
// Always close controllers when the owner is destroyed.
//
// ============================================================================
// 137. ISOLATE VS STREAM
// ----------------------------------------------------------------------------
//
// Isolate:
//
// execution/concurrency boundary.
//
// Stream:
//
// sequence of asynchronous values.
//
// They solve different problems.
//
// ============================================================================
// 138. ISOLATE + STREAM
// ----------------------------------------------------------------------------
// They can be combined.
//
// Worker isolate:
//
// process data
//
// ↓
//
// send progress messages
//
// ↓
//
// main isolate receives
//
// ↓
//
// StreamController emits progress
//
// ============================================================================
// 139. PERFORMANCE PRINCIPLE
// ----------------------------------------------------------------------------
//
// First optimize architecture:
//
//   • Avoid unnecessary work
//   • Avoid unnecessary rebuilds
//   • Use pagination
//   • Use caching
//   • Process data efficiently
//
// Then consider isolates for genuinely CPU-heavy tasks.
//
// ============================================================================
// 140. PHASE 25 INTERVIEW QUESTIONS
// ----------------------------------------------------------------------------
//
// 1. What is a Future?
//
// 2. What is async/await?
//
// 3. Does await block the whole Flutter application?
//
// 4. What is the Dart event loop?
//
// 5. What is the event queue?
//
// 6. What is the microtask queue?
//
// 7. What is scheduleMicrotask()?
//
// 8. What is the difference between Future and Stream?
//
// 9. What is Future.wait()?
//
// 10. What is Future.any()?
//
// 11. What is Future.timeout()?
//
// 12. What is Completer?
//
// 13. When should Completer be used?
//
// 14. What is an isolate?
//
// 15. Why does Dart use isolates?
//
// 16. Do isolates share mutable memory?
//
// 17. What is Isolate.run()?
//
// 18. What are SendPort and ReceivePort?
//
// 19. What is Isolate.spawn()?
//
// 20. What is the difference between concurrency and parallelism?
//
// 21. Does Future automatically create a new thread?
//
// 22. Why doesn't Future.value() solve CPU-heavy work?
//
// 23. When should you use an isolate?
//
// 24. What causes Flutter UI jank?
//
// 25. What is Future.wait() useful for?
//
// 26. What is the difference between sequential and concurrent Futures?
//
// 27. What is debounce?
//
// 28. What is throttle?
//
// 29. What is a race condition?
//
// 30. How can request IDs prevent stale search results?
//
// 31. Why should async void generally be avoided?
//
// 32. What is an async gap?
//
// 33. Why should timers be cancelled?
//
// 34. Why should StreamSubscriptions be cancelled?
//
// 35. What is async*?
//
// 36. What is yield?
//
// 37. What is yield*?
//
// 38. What is asyncMap()?
//
// 39. What is the difference between I/O-bound and CPU-bound work?
//
// 40. How would you design a large ERP data import pipeline?
//
// ============================================================================
// 141. PHASE 25 MASTER CHECKLIST
// ----------------------------------------------------------------------------
//
// FUTURES
// [✓] Future
// [✓] Future.value
// [✓] Future.error
// [✓] Future.delayed
// [✓] then
// [✓] async
// [✓] await
// [✓] try/catch
// [✓] finally
// [✓] Completer
// [✓] Future.wait
// [✓] Future.any
// [✓] timeout
//
// EVENT LOOP
// [✓] Event loop
// [✓] Event queue
// [✓] Microtask queue
// [✓] scheduleMicrotask
// [✓] Future.microtask
//
// CONCURRENCY
// [✓] Sequential operations
// [✓] Concurrent operations
// [✓] Independent tasks
// [✓] Dependent tasks
// [✓] Retry
// [✓] Backoff
// [✓] Batch processing
// [✓] Concurrency limits
//
// ISOLATES
// [✓] Isolate concept
// [✓] Main isolate
// [✓] Isolate.run
// [✓] Isolate.spawn
// [✓] SendPort
// [✓] ReceivePort
// [✓] Message passing
// [✓] Isolate lifecycle
// [✓] CPU-heavy processing
// [✓] Large JSON processing
//
// STREAMS
// [✓] Stream
// [✓] async*
// [✓] yield
// [✓] yield*
// [✓] map
// [✓] where
// [✓] asyncMap
// [✓] StreamController
// [✓] Broadcast stream
// [✓] StreamSubscription
//
// FLUTTER
// [✓] UI jank
// [✓] async gap
// [✓] mounted
// [✓] debounce
// [✓] throttle
// [✓] race condition
// [✓] API concurrency
// [✓] ERP import pipeline
//
// ============================================================================
// 142. PHASE 25 GOLDEN RULES
// ----------------------------------------------------------------------------
//
// RULE 1:
// Future represents one eventual result.
//
// RULE 2:
// Stream represents multiple asynchronous values.
//
// RULE 3:
// async/await does not automatically move CPU work to another isolate.
//
// RULE 4:
// Future does not automatically mean "new thread".
//
// RULE 5:
// Use Future.wait() for independent asynchronous operations.
//
// RULE 6:
// Use sequential await when later work depends on earlier work.
//
// RULE 7:
// Use timeout for operations that shouldn't wait indefinitely.
//
// RULE 8:
// Use retry carefully for transient failures.
//
// RULE 9:
// Use exponential backoff for repeated network retries.
//
// RULE 10:
// Use debounce for search/autocomplete.
//
// RULE 11:
// Use throttle for high-frequency events.
//
// RULE 12:
// A race condition can cause stale data to overwrite newer data.
//
// RULE 13:
// CPU-heavy work can block the main isolate.
//
// RULE 14:
// Heavy CPU work can be moved to an isolate.
//
// RULE 15:
// Isolates do not directly share mutable memory.
//
// RULE 16:
// SendPort sends messages.
//
// RULE 17:
// ReceivePort receives messages.
//
// RULE 18:
// Don't pass UI objects to worker isolates.
//
// RULE 19:
// Don't use isolates for tiny calculations unnecessarily.
//
// RULE 20:
// Always clean up timers, subscriptions, ports and controllers.
//
// RULE 21:
// Avoid async void except where a callback API requires it.
//
// RULE 22:
// After an async gap, consider whether the owner is still valid.
//
// RULE 23:
// In Flutter, heavy synchronous work can cause dropped frames.
//
// RULE 24:
// Use Stream when values arrive continuously over time.
//
// RULE 25:
// Use isolates when CPU-heavy work genuinely requires background execution.
//
// ============================================================================
// PHASE 25 COMPLETE
// ============================================================================
//
// NEXT:
//
// PHASE 26 — DART GENERICS, TYPE SYSTEM & ADVANCED TYPE DESIGN
//
// You will learn:
//
//   • Generic classes
//   • Generic methods
//   • Generic constraints
//   • Type bounds
//   • Covariance
//   • Contravariance concepts
//   • Type inference
//   • dynamic
//   • Object
//   • Object?
//   • Never
//   • Null
//   • Type promotion
//   • Type tests
//   • Pattern-based type handling
//   • Generic repositories
//   • Generic API responses
//   • Result<T>
//   • Pagination<T>
//   • ApiResponse<T>
//   • Generic services
//   • Generic caching
//   • Generic Flutter components
//
// This phase will be especially important for building reusable,
// production-level Flutter + Node.js/ERP architecture.
// ============================================================================


// ============================================================================
// REQUIRED IMPORTS FOR THIS PHASE
// ============================================================================
//
// Put these imports at the top of a real Dart file:
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:isolate';
//
// The examples above assume those libraries are available.
//
// ============================================================================


// ============================================================================
// SUPPORTING EXAMPLE TYPES
// ----------------------------------------------------------------------------
// These are included so the examples above are understandable.
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
      id: json['id'] as String,
      name: json['name'] as String,
      price:
          (json['price'] as num)
              .toDouble(),
    );
  }

  @override
  String toString() {
    return "$name - $price";
  }
}


// ============================================================================

class Order {
  final String id;
  final String status;
  final double total;

  const Order({
    required this.id,
    required this.status,
    required this.total,
  });
}


// ============================================================================
// RESULT TYPES
// ============================================================================

sealed class Result<T> {
  const Result();
}


// ============================================================================

class Success<T>
    extends Result<T> {
  final T data;

  const Success(
    this.data,
  );
}


// ============================================================================

class Failure<T>
    extends Result<T> {
  final AppException
      exception;

  const Failure(
    this.exception,
  );
}


// ============================================================================

class AppException
    implements Exception {
  final String message;

  const AppException(
    this.message,
  );

  @override
  String toString() =>
      message;
}


// ============================================================================
// SUPPORTING ASYNC FUNCTIONS
// ============================================================================

Future<List<String>>
    loadProducts() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return [
    "Phone",
    "Laptop",
    "Mouse",
  ];
}


// ============================================================================

Future<List<String>>
    loadUsers() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return [
    "Palash",
    "Rahim",
  ];
}


// ============================================================================

Future<List<String>>
    loadOrders() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return [
    "Order 1",
    "Order 2",
  ];
}


// ============================================================================

Future<String>
    getUser() async {
  return "user-1";
}


// ============================================================================

Future<List<Order>>
    getOrdersForUser(
  String user,
) async {
  return [
    const Order(
      id: "order-1",
      status: "completed",
      total: 5000,
    ),
  ];
}


// ============================================================================

Future<double>
    loadSales() async {
  return 100000;
}


// ============================================================================

Future<int>
    loadOrderCount() async {
  return 100;
}


// ============================================================================

Future<int>
    loadInventoryCount() async {
  return 500;
}


// ============================================================================

Future<int>
    loadCustomerCount() async {
  return 250;
}


// ============================================================================

Future<void>
    initializeDatabase() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );
}


// ============================================================================

Future<void>
    initializeCache() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );
}


// ============================================================================

Future<String>
    loadConfiguration() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return "production";
}


// ============================================================================

Future<void>
    saveAnalytics() async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );
}


// ============================================================================

Future<String>
    fakeSearch(
  String query,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  return query;
}


// ============================================================================

Future<void>
    uploadProductBatch(
  List<ProductModel>
      products,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );
}


// ============================================================================
// END OF PHASE 25
// ============================================================================
//
// At this point you should be comfortable with:
//
//     Future
//       ↓
//     async/await
//       ↓
//     Event Loop
//       ↓
//     Future.wait
//       ↓
//     Stream
//       ↓
//     Isolate
//       ↓
//     Flutter performance
//
// These concepts form the foundation for professional asynchronous Flutter
// applications and large-scale ERP systems.
// ============================================================================