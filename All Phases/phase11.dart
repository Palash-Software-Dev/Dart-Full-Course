// ============================================================================
// DART MASTER ROADMAP
// PHASE 11 — FUNCTIONS, ASYNC PROGRAMMING & CONCURRENCY
// ============================================================================
//
// GOAL:
// ----------------------------------------------------------------------------
// This phase teaches you how Dart handles functions, asynchronous work,
// Futures, Streams, event loops, microtasks, concurrency and isolates.
//
// These are CRITICAL for becoming a professional Full-Stack Flutter
// Developer because Flutter applications constantly perform asynchronous
// operations:
//
//   • REST API calls
//   • MongoDB/Node.js backend communication
//   • Login / registration
//   • OTP verification
//   • File uploads
//   • Cloudinary uploads
//   • Database operations
//   • Pagination
//   • Search
//   • WebSockets
//   • Notifications
//   • Timers
//   • Real-time data
//   • Background processing
//   • Large JSON parsing
//
// ============================================================================
// PHASE 11 TOPICS
// ============================================================================
//
// FUNCTIONS
//
// 01. Function basics
// 02. Return types
// 03. Parameters
// 04. Optional positional parameters
// 05. Named parameters
// 06. Required named parameters
// 07. Default parameters
// 08. Positional + named parameters
// 09. Anonymous functions
// 10. Arrow functions
// 11. First-class functions
// 12. Functions as variables
// 13. Functions as parameters
// 14. Functions as return values
// 15. Higher-order functions
// 16. Closures
// 17. Lexical scope
// 18. Function typedef
// 19. Callback functions
// 20. Tear-offs
//
// ASYNCHRONOUS DART
//
// 21. Synchronous vs asynchronous
// 22. Future
// 23. Future<T>
// 24. Future.value
// 25. Future.delayed
// 26. async
// 27. await
// 28. Future chaining
// 29. Future.then
// 30. Future.catchError
// 31. Future.whenComplete
// 32. try/catch with async
// 33. finally with async
// 34. Future.wait
// 35. Future.any
// 36. Future.timeout
// 37. Future.error
// 38. Future.sync
//
// ERROR HANDLING
//
// 39. Async exceptions
// 40. Error propagation
// 41. Custom async exceptions
// 42. Result modeling
//
// EVENT LOOP
//
// 43. Dart event loop
// 44. Event queue
// 45. Microtask queue
// 46. scheduleMicrotask
// 47. Timer
// 48. Timer.periodic
// 49. Execution order
//
// STREAM
//
// 50. Stream basics
// 51. Stream<T>
// 52. Single-subscription stream
// 53. Broadcast stream
// 54. Stream.listen
// 55. onData
// 56. onError
// 57. onDone
// 58. StreamController
// 59. StreamController.broadcast
// 60. add
// 61. addError
// 62. close
// 63. async*
// 64. yield
// 65. yield*
// 66. Stream transformations
// 67. where
// 68. map
// 69. asyncMap
// 70. take
// 71. skip
// 72. distinct
// 73. debounce concept
//
// CONCURRENCY
//
// 74. Concurrency
// 75. Parallelism
// 76. Isolates
// 77. ReceivePort
// 78. SendPort
// 79. Isolate.spawn
// 80. Isolate.run
// 81. compute()
// 82. Message passing
// 83. Isolate limitations
//
// REAL FLUTTER
//
// 84. API repository
// 85. Loading state
// 86. Search debounce
// 87. Pagination
// 88. File upload
// 89. Parallel API requests
// 90. Real-time order tracking
// 91. WebSocket concept
// 92. Background heavy computation
//
// ============================================================================


// ============================================================================
// 01. FUNCTION BASICS
// ============================================================================
//
// A function is a reusable block of code.
//
// ============================================================================

void sayHello() {
  print("Hello Dart");
}


// ============================================================================
// Calling the function:
// ============================================================================

void functionBasicExample() {
  sayHello();
}


// ============================================================================
// 02. RETURN TYPES
// ============================================================================

int addNumbers(
  int a,
  int b,
) {
  return a + b;
}


// ============================================================================

String getGreeting(
  String name,
) {
  return "Hello $name";
}


// ============================================================================
// A function can return:
//
// int
// double
// String
// bool
// List<T>
// Map<K,V>
// Future<T>
// Stream<T>
// custom classes
// etc.
//
// ============================================================================


// ============================================================================
// 03. PARAMETERS
// ============================================================================

void introduce(
  String name,
  int age,
) {
  print(
    "Name: $name, Age: $age",
  );
}


// ============================================================================

void parameterExample() {
  introduce(
    "Palash",
    25,
  );
}


// ============================================================================
// 04. OPTIONAL POSITIONAL PARAMETERS
// ============================================================================
//
// [] means optional positional parameters.
//
// ============================================================================

void greetUser(
  String name, [
  String? message,
]) {
  print(
    "Hello $name",
  );

  if (message != null) {
    print(message);
  }
}


// ============================================================================

void optionalPositionalExample() {
  greetUser("Palash");

  greetUser(
    "Palash",
    "Welcome back!",
  );
}


// ============================================================================
// 05. NAMED PARAMETERS
// ============================================================================
//
// Named parameters improve readability.
//
// ============================================================================

void createUser({
  String? name,
  int? age,
}) {
  print(name);
  print(age);
}


// ============================================================================

void namedParameterExample() {
  createUser(
    name: "Palash",
    age: 25,
  );
}


// ============================================================================
// 06. REQUIRED NAMED PARAMETERS
// ============================================================================
//
// required means caller must provide the parameter.
//
// ============================================================================

void createRequiredUser({
  required String name,
  required int age,
}) {
  print(
    "$name - $age",
  );
}


// ============================================================================

void requiredParameterExample() {
  createRequiredUser(
    name: "Palash",
    age: 25,
  );
}


// ============================================================================
// 07. DEFAULT PARAMETERS
// ============================================================================

void createAccount({
  String role = "user",
  bool active = true,
}) {
  print(role);
  print(active);
}


// ============================================================================

void defaultParameterExample() {
  createAccount();

  createAccount(
    role: "admin",
    active: false,
  );
}


// ============================================================================
// 08. POSITIONAL + NAMED PARAMETERS
// ============================================================================

void sendMessage(
  String receiver, {
  required String message,
  bool urgent = false,
}) {
  print(
    "To: $receiver",
  );

  print(
    "Message: $message",
  );

  print(
    "Urgent: $urgent",
  );
}


// ============================================================================
// 09. ANONYMOUS FUNCTIONS
// ============================================================================
//
// Anonymous function has no function name.
//
// ============================================================================

void anonymousFunctionExample() {
  final numbers = [
    1,
    2,
    3,
  ];

  numbers.forEach(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 10. ARROW FUNCTIONS
// ============================================================================
//
// Arrow syntax is useful for a single expression.
//
// ============================================================================

int square(
  int number,
) =>
    number * number;


// ============================================================================

void arrowFunctionExample() {
  print(square(5));
}


// ============================================================================
// This:
//
// int square(int number) {
//   return number * number;
// }
//
// can become:
//
// int square(int number) => number * number;
//
// ============================================================================


// ============================================================================
// 11. FIRST-CLASS FUNCTIONS
// ============================================================================
//
// Functions are objects in Dart.
//
// Therefore a function can:
//
//   • be assigned to a variable
//   • be passed as an argument
//   • be returned from another function
//
// ============================================================================

void firstClassFunctionExample() {
  final operation = addNumbers;

  print(
    operation(10, 20),
  );
}


// ============================================================================
// 12. FUNCTIONS AS VARIABLES
// ============================================================================

void functionVariableExample() {
  int Function(
    int,
    int,
  ) operation = addNumbers;

  print(
    operation(5, 10),
  );
}


// ============================================================================
// Another function:
//
// ============================================================================

int multiply(
  int a,
  int b,
) {
  return a * b;
}


// ============================================================================

void changeFunctionExample() {
  int Function(
    int,
    int,
  ) operation = addNumbers;

  print(
    operation(2, 3),
  );

  operation = multiply;

  print(
    operation(2, 3),
  );
}


// ============================================================================
// 13. FUNCTIONS AS PARAMETERS
// ============================================================================

int calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  return operation(
    a,
    b,
  );
}


// ============================================================================

void functionParameterExample() {
  print(
    calculate(
      10,
      5,
      addNumbers,
    ),
  );

  print(
    calculate(
      10,
      5,
      multiply,
    ),
  );
}


// ============================================================================
// 14. FUNCTIONS AS RETURN VALUES
// ============================================================================

int Function(int, int)
    getOperation(
  String operation,
) {
  if (operation == "add") {
    return addNumbers;
  }

  return multiply;
}


// ============================================================================

void functionReturnExample() {
  final operation =
      getOperation("add");

  print(
    operation(10, 20),
  );
}


// ============================================================================
// 15. HIGHER-ORDER FUNCTIONS
// ============================================================================
//
// A higher-order function either:
//
//   • accepts another function
//   • returns another function
//   • or both
//
// ============================================================================

List<int> transformNumbers(
  List<int> numbers,
  int Function(int) transformer,
) {
  return numbers
      .map(transformer)
      .toList();
}


// ============================================================================

void higherOrderExample() {
  final result =
      transformNumbers(
    [1, 2, 3, 4],
    (number) => number * 10,
  );

  print(result);
}


// ============================================================================
// 16. CLOSURES
// ============================================================================
//
// A closure is a function that remembers variables from its surrounding
// scope even after the outer function has finished.
//
// ============================================================================

Function createCounter() {
  int count = 0;

  return () {
    count++;

    return count;
  };
}


// ============================================================================

void closureExample() {
  final counter =
      createCounter();

  print(counter());
  print(counter());
  print(counter());
}


// RESULT:
//
// 1
// 2
// 3
//
// ============================================================================


// ============================================================================
// 17. LEXICAL SCOPE
// ============================================================================

void lexicalScopeExample() {
  final message =
      "Hello";

  void innerFunction() {
    print(message);
  }

  innerFunction();
}


// ============================================================================
// The inner function can access variables from its outer scope.
//
// ============================================================================


// ============================================================================
// 18. FUNCTION TYPEDEF
// ============================================================================

typedef MathOperation =
    int Function(
  int a,
  int b,
);


// ============================================================================

int calculateWithTypedef(
  int a,
  int b,
  MathOperation operation,
) {
  return operation(
    a,
    b,
  );
}


// ============================================================================

void typedefExample() {
  final result =
      calculateWithTypedef(
    10,
    20,
    addNumbers,
  );

  print(result);
}


// ============================================================================
// 19. CALLBACK FUNCTIONS
// ============================================================================
//
// A callback is a function passed to another function to be called later.
//
// ============================================================================

void performTask(
  void Function(String) onComplete,
) {
  print(
    "Performing task...",
  );

  onComplete(
    "Task completed",
  );
}


// ============================================================================

void callbackExample() {
  performTask(
    (message) {
      print(message);
    },
  );
}


// ============================================================================
// Flutter examples of callbacks:
//
// onPressed
// onTap
// onChanged
// onSubmitted
// onComplete
// onError
//
// ============================================================================


// ============================================================================
// 20. TEAR-OFFS
// ============================================================================
//
// Passing an existing function without calling it.
//
// Correct:
//
// addNumbers
//
// Incorrect:
//
// addNumbers()
//
// ============================================================================

void tearOffExample() {
  final operation =
      addNumbers;

  print(
    operation(10, 20),
  );
}


// ============================================================================
// 21. SYNCHRONOUS VS ASYNCHRONOUS
// ============================================================================
//
// SYNCHRONOUS:
//
// Code executes sequentially and waits for each operation.
//
//
//
// ASYNCHRONOUS:
//
// An operation can complete later without blocking the current flow.
//
// ============================================================================

void synchronousExample() {
  print("A");
  print("B");
  print("C");
}


// RESULT:
//
// A
// B
// C
//
// ============================================================================


// ============================================================================
// 22. FUTURE
// ============================================================================
//
// Future represents a value that will be available later.
//
// Common examples:
//
//   • HTTP request
//   • Database query
//   • File operation
//   • Timer
//
// ============================================================================

Future<String> fetchUserName() {
  return Future.value(
    "Palash",
  );
}


// ============================================================================
// 23. FUTURE<T>
// ============================================================================
//
// Future<String>
// Future<int>
// Future<UserModel>
// Future<List<ProductModel>>
//
// ============================================================================

Future<int> getUserAge() async {
  return 25;
}


// ============================================================================
// 24. FUTURE.VALUE
// ============================================================================

Future<String>
    futureValueExample() {
  return Future.value(
    "Hello",
  );
}


// ============================================================================
// 25. FUTURE.DELAYED
// ============================================================================

Future<String>
    delayedExample() {
  return Future.delayed(
    const Duration(
      seconds: 2,
    ),
    () => "Completed",
  );
}


// ============================================================================
// 26. ASYNC
// ============================================================================
//
// async allows a function to use await.
//
// An async function normally returns a Future.
//
// ============================================================================

Future<void>
    asyncExample() async {
  print("Start");

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  print("End");
}


// ============================================================================
// 27. AWAIT
// ============================================================================
//
// await pauses the current async function until the Future completes.
//
// It does NOT freeze the entire Flutter application.
//
// ============================================================================

Future<void>
    awaitExample() async {
  final name =
      await fetchUserName();

  print(name);
}


// ============================================================================
// 28. FUTURE CHAINING
// ============================================================================

Future<String>
    fetchData() async {
  return "data";
}


Future<String>
    processData() async {
  final data =
      await fetchData();

  return data.toUpperCase();
}


// ============================================================================
// 29. THEN
// ============================================================================

void thenExample() {
  fetchUserName().then(
    (name) {
      print(name);
    },
  );
}


// ============================================================================
// Modern Flutter code generally prefers:
//
// await
//
// because it is easier to read.
//
// ============================================================================


// ============================================================================
// 30. CATCHERROR
// ============================================================================

void catchErrorExample() {
  Future<String>.error(
    Exception("Something went wrong"),
  ).catchError(
    (error) {
      print(error);
      return "Fallback";
    },
  );
}


// ============================================================================
// 31. WHENCOMPLETE
// ============================================================================

void whenCompleteExample() {
  Future<String>.delayed(
    const Duration(
      seconds: 1,
    ),
    () => "Done",
  ).whenComplete(
    () {
      print(
        "Operation finished",
      );
    },
  );
}


// ============================================================================
// 32. TRY/CATCH WITH ASYNC
// ============================================================================

Future<void>
    asyncTryCatchExample() async {
  try {
    final result =
        await Future<String>.delayed(
      const Duration(
        seconds: 1,
      ),
      () => "Success",
    );

    print(result);
  } catch (error) {
    print(
      "Error: $error",
    );
  }
}


// ============================================================================
// 33. FINALLY WITH ASYNC
// ============================================================================

Future<void>
    asyncFinallyExample() async {
  try {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
  } catch (error) {
    print(error);
  } finally {
    print(
      "Always executed",
    );
  }
}


// ============================================================================
// 34. FUTURE.WAIT
// ============================================================================
//
// Executes multiple independent Futures concurrently.
//
// Extremely important for API calls.
//
// ============================================================================

Future<String> fetchProducts() async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  return "Products";
}


Future<String> fetchCategories() async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  return "Categories";
}


Future<String> fetchBrands() async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  return "Brands";
}


// ============================================================================

Future<void>
    futureWaitExample() async {
  final results =
      await Future.wait([
    fetchProducts(),
    fetchCategories(),
    fetchBrands(),
  ]);

  print(results);
}


// ============================================================================
// IMPORTANT:
//
// Sequential:
//
// await fetchProducts();
// await fetchCategories();
// await fetchBrands();
//
// Approximately:
//
// 3 seconds
//
//
//
// Concurrent:
//
// await Future.wait([
//   fetchProducts(),
//   fetchCategories(),
//   fetchBrands(),
// ]);
//
// Approximately:
//
// 1 second
//
// assuming all take the same 1 second.
//
// ============================================================================


// ============================================================================
// 35. FUTURE.ANY
// ============================================================================
//
// Returns the first Future that completes successfully.
//
// ============================================================================

Future<void>
    futureAnyExample() async {
  final result =
      await Future.any([
    Future.delayed(
      const Duration(
        seconds: 3,
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
// 36. FUTURE.TIMEOUT
// ============================================================================

Future<void>
    timeoutExample() async {
  try {
    final result =
        await delayedExample()
            .timeout(
      const Duration(
        seconds: 1,
      ),
    );

    print(result);
  } catch (error) {
    print(
      "Request timed out",
    );
  }
}


// ============================================================================
// 37. FUTURE.ERROR
// ============================================================================

Future<String>
    errorFutureExample() {
  return Future.error(
    Exception(
      "API request failed",
    ),
  );
}


// ============================================================================
// 38. FUTURE.SYNC
// ============================================================================
//
// Future.sync converts synchronous execution into a Future while also
// correctly capturing synchronous errors.
//
// ============================================================================

Future<int>
    futureSyncExample() {
  return Future.sync(
    () {
      return 100;
    },
  );
}


// ============================================================================
// 39. ASYNC EXCEPTIONS
// ============================================================================

Future<void>
    asyncExceptionExample() async {
  try {
    throw Exception(
      "Network error",
    );
  } catch (error) {
    print(error);
  }
}


// ============================================================================
// 40. ERROR PROPAGATION
// ============================================================================

Future<String>
    repositoryLayer() async {
  throw Exception(
    "Database error",
  );
}


Future<String>
    serviceLayer() async {
  return await repositoryLayer();
}


Future<void>
    controllerLayer() async {
  try {
    final result =
        await serviceLayer();

    print(result);
  } catch (error) {
    print(
      "Controller received: $error",
    );
  }
}


// ============================================================================
// Architecture:
//
// UI
// ↓
// Controller
// ↓
// Service
// ↓
// Repository
// ↓
// API
//
// Error can propagate upward.
//
// ============================================================================


// ============================================================================
// 41. CUSTOM ASYNC EXCEPTION
// ============================================================================

class ApiException
    implements Exception {
  final String message;
  final int? statusCode;

  ApiException(
    this.message, {
    this.statusCode,
  });

  @override
  String toString() {
    return "ApiException: $message";
  }
}


// ============================================================================
// 42. RESULT MODELING
// ============================================================================
//
// Instead of throwing everywhere, some architectures model success/error
// explicitly.
//
// ============================================================================

sealed class AsyncResult<T> {}

class AsyncSuccess<T>
    extends AsyncResult<T> {
  final T data;

  AsyncSuccess(this.data);
}

class AsyncFailure<T>
    extends AsyncResult<T> {
  final String message;

  AsyncFailure(this.message);
}


// ============================================================================
// 43. DART EVENT LOOP
// ============================================================================
//
// Dart is single-threaded by default.
//
// It uses an event loop to process asynchronous work.
//
// Simplified:
//
//             ┌──────────────────┐
//             │   Dart Program   │
//             └────────┬─────────┘
//                      │
//                      ▼
//              ┌───────────────┐
//              │  Event Loop   │
//              └───────┬───────┘
//                      │
//          ┌───────────┴───────────┐
//          ▼                       ▼
//   Microtask Queue          Event Queue
//
// ============================================================================


// ============================================================================
// 44. EVENT QUEUE
// ============================================================================
//
// Handles events such as:
//
//   • Timer
//   • I/O
//   • external events
//
// ============================================================================


// ============================================================================
// 45. MICROTASK QUEUE
// ============================================================================
//
// Microtasks are processed before the next event queue event.
//
// ============================================================================


// ============================================================================
// 46. SCHEDULEMICROTASK
// ============================================================================

import 'dart:async';

void microtaskExample() {
  print("1");

  scheduleMicrotask(
    () {
      print("2");
    },
  );

  print("3");
}


// RESULT:
//
// 1
// 3
// 2
//
// ============================================================================


// ============================================================================
// 47. TIMER
// ============================================================================

void timerExample() {
  Timer(
    const Duration(
      seconds: 2,
    ),
    () {
      print(
        "Timer completed",
      );
    },
  );
}


// ============================================================================
// 48. TIMER.PERIODIC
// ============================================================================

void periodicTimerExample() {
  int count = 0;

  final timer =
      Timer.periodic(
    const Duration(
      seconds: 1,
    ),
    (timer) {
      count++;

      print(
        "Count: $count",
      );

      if (count >= 5) {
        timer.cancel();
      }
    },
  );
}


// ============================================================================
// 49. EXECUTION ORDER
// ============================================================================

void executionOrderExample() {
  print("A");

  Future.microtask(
    () => print("B"),
  );

  Future(
    () => print("C"),
  );

  print("D");
}


// Expected:
//
// A
// D
// B
// C
//
// Microtask runs before the normal event.
//
// ============================================================================
// 50. STREAM BASICS
// ============================================================================
//
// Stream represents multiple asynchronous values over time.
//
// Future:
//
//   one eventual value
//
// Stream:
//
//   many eventual values
//
// ============================================================================


// ============================================================================
// 51. STREAM<T>
// ============================================================================

Stream<int>
    numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    yield i;
  }
}


// ============================================================================
// 52. SINGLE-SUBSCRIPTION STREAM
// ============================================================================
//
// A normal stream is usually single-subscription.
//
// It is designed for one listener.
//
// ============================================================================

void singleSubscriptionExample() {
  numberStream().listen(
    (number) {
      print(number);
    },
  );
}


// ============================================================================
// 53. BROADCAST STREAM
// ============================================================================
//
// Multiple listeners can listen to a broadcast stream.
//
// ============================================================================

void broadcastStreamExample() {
  final controller =
      StreamController<int>.broadcast();

  controller.stream.listen(
    (value) {
      print(
        "Listener 1: $value",
      );
    },
  );

  controller.stream.listen(
    (value) {
      print(
        "Listener 2: $value",
      );
    },
  );

  controller.add(100);
  controller.add(200);

  controller.close();
}


// ============================================================================
// 54. STREAM.LISTEN
// ============================================================================

void streamListenExample() {
  numberStream().listen(
    (value) {
      print(
        "Received: $value",
      );
    },
  );
}


// ============================================================================
// 55. ONDATA
// ============================================================================

void streamOnDataExample() {
  numberStream().listen(
    null,
    onError: (error) {
      print(error);
    },
    onDone: () {
      print(
        "Stream completed",
      );
    },
  );
}


// ============================================================================
// 56. ONERROR
// ============================================================================

Stream<int>
    errorStream() async* {
  yield 1;

  throw Exception(
    "Stream error",
  );
}


// ============================================================================

void streamErrorExample() {
  errorStream().listen(
    (value) {
      print(value);
    },
    onError: (error) {
      print(
        "Error: $error",
      );
    },
  );
}


// ============================================================================
// 57. ONDONE
// ============================================================================

void streamDoneExample() {
  numberStream().listen(
    print,
    onDone: () {
      print(
        "All values received",
      );
    },
  );
}


// ============================================================================
// 58. STREAMCONTROLLER
// ============================================================================
//
// StreamController allows you to manually create and control streams.
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

    _controller.add(
      _count,
    );
  }

  Future<void> dispose() {
    return _controller.close();
  }
}


// ============================================================================
// 59. STREAMCONTROLLER.BROADCAST
// ============================================================================

class EventBus {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get events =>
      _controller.stream;

  void emit(String event) {
    _controller.add(event);
  }

  Future<void> dispose() {
    return _controller.close();
  }
}


// ============================================================================
// 60. ADD
// ============================================================================

void streamAddExample() {
  final controller =
      StreamController<String>();

  controller.stream.listen(
    print,
  );

  controller.add(
    "Login successful",
  );

  controller.add(
    "Profile loaded",
  );

  controller.close();
}


// ============================================================================
// 61. ADDERROR
// ============================================================================

void streamAddErrorExample() {
  final controller =
      StreamController<String>();

  controller.stream.listen(
    print,
    onError: (error) {
      print(
        "Error: $error",
      );
    },
  );

  controller.addError(
    Exception(
      "Something failed",
    ),
  );

  controller.close();
}


// ============================================================================
// 62. CLOSE
// ============================================================================
//
// Always close StreamController when it is no longer needed.
//
// This prevents resource leaks.
//
// ============================================================================


// ============================================================================
// 63. ASYNC*
// ============================================================================
//
// async* creates a Stream-producing function.
//
// ============================================================================

Stream<String>
    messageStream() async* {
  yield "Hello";

  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  yield "Welcome";

  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  yield "Dart";
}


// ============================================================================
// 64. YIELD
// ============================================================================
//
// yield emits one value into the stream.
//
// ============================================================================


// ============================================================================
// 65. YIELD*
// ============================================================================
//
// yield* forwards values from another stream.
//
// ============================================================================

Stream<int>
    firstNumbers() async* {
  yield 1;
  yield 2;
}


Stream<int>
    secondNumbers() async* {
  yield 3;
  yield 4;
}


Stream<int>
    combinedNumbers() async* {
  yield* firstNumbers();
  yield* secondNumbers();
}


// ============================================================================
// 66. STREAM TRANSFORMATIONS
// ============================================================================

void streamTransformationExample() {
  numberStream()
      .where(
        (number) =>
            number.isEven,
      )
      .map(
        (number) =>
            number * 10,
      )
      .listen(
        print,
      );
}


// ============================================================================
// 67. STREAM WHERE
// ============================================================================

Stream<int>
    evenStream(
  Stream<int> source,
) {
  return source.where(
    (number) => number.isEven,
  );
}


// ============================================================================
// 68. STREAM MAP
// ============================================================================

Stream<String>
    stringNumberStream(
  Stream<int> source,
) {
  return source.map(
    (number) => "Number: $number",
  );
}


// ============================================================================
// 69. ASYNCMAP
// ============================================================================
//
// asyncMap is useful when each stream value needs asynchronous processing.
//
// ============================================================================

Stream<String>
    asyncMapExample(
  Stream<int> source,
) {
  return source.asyncMap(
    (number) async {
      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );

      return "Processed $number";
    },
  );
}


// ============================================================================
// 70. TAKE
// ============================================================================

void streamTakeExample() {
  numberStream()
      .take(3)
      .listen(
        print,
      );
}


// ============================================================================
// 71. SKIP
// ============================================================================

void streamSkipExample() {
  numberStream()
      .skip(2)
      .listen(
        print,
      );
}


// ============================================================================
// 72. DISTINCT
// ============================================================================

void streamDistinctExample() {
  final stream =
      Stream.fromIterable([
    1,
    1,
    2,
    2,
    3,
    3,
  ]);

  stream.distinct().listen(
    print,
  );
}


// ============================================================================
// 73. DEBOUNCE CONCEPT
// ============================================================================
//
// Dart's core Stream API doesn't provide a direct debounce operator.
//
// In Flutter, debounce is commonly implemented using:
//
//   • Timer
//   • StreamTransformer
//   • RxDart
//
// Example use:
//
// User types:
//
// "i"
// "ip"
// "iph"
// "ipho"
// "iphone"
//
// Instead of calling API 6 times,
// wait until typing stops for ~300ms,
// then perform ONE search request.
//
// ============================================================================

class SearchDebouncer {
  Timer? _timer;

  void run(
    Duration delay,
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
// 74. CONCURRENCY
// ============================================================================
//
// Concurrency means managing multiple tasks during overlapping periods.
//
// Example:
//
// API request A
// API request B
// API request C
//
// can be in progress at the same time.
//
// ============================================================================


// ============================================================================
// 75. PARALLELISM
// ============================================================================
//
// Parallelism means tasks actually execute simultaneously on multiple
// CPU cores.
//
// Dart normally runs application code on one isolate.
//
// Isolates provide separate execution contexts.
//
// ============================================================================


// ============================================================================
// 76. ISOLATES
// ============================================================================
//
// An isolate has its own:
//
//   • memory
//   • event loop
//   • execution context
//
// Isolates do not normally share mutable memory.
//
// They communicate through messages.
//
// ============================================================================


// ============================================================================
// 77. RECEIVEPORT
// ============================================================================

import 'dart:isolate';


// ============================================================================
// 78. SENDPORT
// ============================================================================
//
// SendPort sends messages.
//
// ReceivePort receives messages.
//
// ============================================================================


// ============================================================================
// 79. ISOLATE.SPAWN
// ============================================================================

void isolateWorker(
  SendPort sendPort,
) {
  int total = 0;

  for (int i = 0;
      i < 1000000;
      i++) {
    total += i;
  }

  sendPort.send(total);
}


// ============================================================================

Future<void>
    isolateSpawnExample() async {
  final receivePort =
      ReceivePort();

  await Isolate.spawn(
    isolateWorker,
    receivePort.sendPort,
  );

  final result =
      await receivePort.first;

  print(result);

  receivePort.close();
}


// ============================================================================
// IMPORTANT:
//
// Heavy work should not block Flutter's UI isolate.
//
// Examples:
//
//   • huge JSON parsing
//   • image processing
//   • encryption
//   • compression
//   • large calculations
//
// ============================================================================


// ============================================================================
// 80. ISOLATE.RUN
// ============================================================================
//
// Modern Dart provides Isolate.run for running a computation in another
// isolate and returning its result.
//
// ============================================================================

Future<int>
    isolateRunExample() {
  return Isolate.run(
    () {
      int total = 0;

      for (int i = 0;
          i < 1000000;
          i++) {
        total += i;
      }

      return total;
    },
  );
}


// ============================================================================
// 81. COMPUTE()
// ============================================================================
//
// Flutter provides compute() for moving a computation to another isolate.
//
// IMPORTANT:
//
// compute() belongs to Flutter, not core Dart.
//
// Therefore it is not used in this pure Dart file.
//
// Typical Flutter code:
//
// compute(parseLargeJson, rawJson);
//
// ============================================================================


// ============================================================================
// 82. MESSAGE PASSING
// ============================================================================
//
// Isolates communicate by sending messages.
//
// They don't directly access each other's variables.
//
// ============================================================================


// ============================================================================
// 83. ISOLATE LIMITATIONS
// ============================================================================
//
// Important:
//
// An isolate has separate memory.
//
// You cannot safely assume a normal object can be shared directly.
//
// Communication happens through messages.
//
// This makes isolates powerful but different from normal async Futures.
//
// ============================================================================


// ============================================================================
// 84. API REPOSITORY
// ============================================================================
//
// Professional Flutter architecture:
//
// UI
// ↓
// Controller / ViewModel
// ↓
// Service
// ↓
// Repository
// ↓
// API Client
//
// ============================================================================

class ProductApiClient {
  Future<List<ProductModel>>
      fetchProducts() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    return const [
      ProductModel(
        id: "P001",
        name: "Phone",
        price: 100000,
      ),
    ];
  }
}


// ============================================================================

class ProductRepository11 {
  final ProductApiClient apiClient;

  ProductRepository11(
    this.apiClient,
  );

  Future<List<ProductModel>>
      getProducts() {
    return apiClient
        .fetchProducts();
  }
}


// ============================================================================
// 85. LOADING STATE
// ============================================================================

sealed class ProductLoadingState {}

class ProductIdle
    extends ProductLoadingState {}

class ProductLoading
    extends ProductLoadingState {}

class ProductLoaded
    extends ProductLoadingState {
  final List<ProductModel> products;

  ProductLoaded(
    this.products,
  );
}

class ProductLoadError
    extends ProductLoadingState {
  final String message;

  ProductLoadError(
    this.message,
  );
}


// ============================================================================
// 86. SEARCH DEBOUNCE
// ============================================================================

class ProductSearchController {
  Timer? _timer;

  void search(
    String query,
    void Function(String) onSearch,
  ) {
    _timer?.cancel();

    _timer = Timer(
      const Duration(
        milliseconds: 300,
      ),
      () {
        onSearch(query);
      },
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}


// ============================================================================
// 87. PAGINATION
// ============================================================================

class PaginationController {
  int currentPage = 1;

  bool isLoading = false;

  Future<List<ProductModel>>
      loadNextPage(
    ProductRepository11 repository,
  ) async {
    if (isLoading) {
      return [];
    }

    isLoading = true;

    try {
      final products =
          await repository.getProducts();

      currentPage++;

      return products;
    } finally {
      isLoading = false;
    }
  }
}


// ============================================================================
// 88. FILE UPLOAD CONCEPT
// ============================================================================
//
// File upload is asynchronous:
//
// File
// ↓
// bytes
// ↓
// multipart request
// ↓
// Cloudinary
// ↓
// URL
//
// ============================================================================

Future<String>
    uploadImageMock(
  String filePath,
) async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  return "https://example.com/image.jpg";
}


// ============================================================================
// 89. PARALLEL API REQUESTS
// ============================================================================

Future<void>
    loadDashboard() async {
  final results =
      await Future.wait([
    fetchProducts(),
    fetchCategories(),
    fetchBrands(),
  ]);

  final products =
      results[0];

  final categories =
      results[1];

  final brands =
      results[2];

  print(products);
  print(categories);
  print(brands);
}


// ============================================================================
// Better type-safe version:
//
// ============================================================================

Future<void>
    loadDashboardTypeSafe() async {
  final productsFuture =
      fetchProducts();

  final categoriesFuture =
      fetchCategories();

  final brandsFuture =
      fetchBrands();

  final products =
      await productsFuture;

  final categories =
      await categoriesFuture;

  final brands =
      await brandsFuture;

  print(products);
  print(categories);
  print(brands);
}


// ============================================================================
// NOTE:
//
// Starting Futures before awaiting them allows independent work to overlap.
//
// ============================================================================


// ============================================================================
// 90. REAL-TIME ORDER TRACKING
// ============================================================================
//
// A real application may receive:
//
// ORDER_CREATED
// ORDER_CONFIRMED
// ORDER_PACKED
// ORDER_SHIPPED
// ORDER_DELIVERED
//
// through:
//
//   • WebSocket
//   • Server-Sent Events
//   • Firebase
//   • other real-time systems
//
// Stream is a natural Dart abstraction for this.
//
// ============================================================================

Stream<String>
    orderStatusStream() async* {
  yield "Order Created";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Order Confirmed";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Order Shipped";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Order Delivered";
}


// ============================================================================
// 91. WEBSOCKET CONCEPT
// ============================================================================
//
// WebSocket provides a persistent connection:
//
// Client ←→ Server
//
// Unlike normal HTTP:
//
// Client → Request
// Server → Response
// Connection ends
//
// WebSocket:
//
// Client ←→ persistent connection ←→ Server
//
// Useful for:
//
//   • live order tracking
//   • chat
//   • notifications
//   • real-time dashboards
//   • stock updates
//
// ============================================================================


// ============================================================================
// 92. BACKGROUND HEAVY COMPUTATION
// ============================================================================

Future<int>
    calculateLargeValue() {
  return Isolate.run(
    () {
      int result = 0;

      for (int i = 0;
          i < 5000000;
          i++) {
        result += i;
      }

      return result;
    },
  );
}


// ============================================================================
// ⭐ IMPORTANT DIFFERENCE
// ============================================================================
//
// Future
//   = asynchronous result
//
// Stream
//   = multiple asynchronous values
//
// Timer
//   = execute after a duration
//
// Microtask
//   = high-priority queued async work
//
// Isolate
//   = separate execution/memory context
//
// Future.wait
//   = wait for multiple Futures
//
// Future.any
//   = first successful Future
//
// async/await
//   = readable asynchronous control flow
//
// ============================================================================


// ============================================================================
// ⭐ API REQUEST FLOW
// ============================================================================
//
// Flutter UI
//     ↓
// onPressed()
//     ↓
// Controller
//     ↓
// await repository.login()
//     ↓
// HTTP request
//     ↓
// Node.js / Express
//     ↓
// MongoDB
//     ↓
// Response
//     ↓
// Future<UserModel>
//     ↓
// Controller
//     ↓
// State
//     ↓
// UI
//
// ============================================================================


// ============================================================================
// ⭐ LOGIN EXAMPLE
// ============================================================================

class LoginResponse {
  final String token;
  final String userId;

  const LoginResponse({
    required this.token,
    required this.userId,
  });
}


class AuthRepository {
  Future<LoginResponse>
      login(
    String email,
    String password,
  ) async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    if (email.isEmpty ||
        password.isEmpty) {
      throw ApiException(
        "Email and password are required",
        statusCode: 400,
      );
    }

    return const LoginResponse(
      token: "jwt-token",
      userId: "U001",
    );
  }
}


// ============================================================================

class AuthController {
  final AuthRepository repository;

  AuthController(
    this.repository,
  );

  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      final response =
          await repository.login(
        email,
        password,
      );

      print(
        "Logged in: ${response.userId}",
      );
    } on ApiException catch (error) {
      print(
        "API Error: ${error.message}",
      );
    } catch (error) {
      print(
        "Unknown error: $error",
      );
    }
  }
}


// ============================================================================
// ⭐ OTP COUNTDOWN EXAMPLE
// ============================================================================

class OtpTimer {
  Timer? _timer;

  int remainingSeconds = 60;

  void start(
    void Function(int) onTick,
  ) {
    _timer?.cancel();

    remainingSeconds = 60;

    _timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        remainingSeconds--;

        onTick(
          remainingSeconds,
        );

        if (remainingSeconds <= 0) {
          timer.cancel();
        }
      },
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}


// ============================================================================
// ⭐ API RETRY EXAMPLE
// ============================================================================

Future<T> retry<T>(
  Future<T> Function() operation, {
  int maxAttempts = 3,
}) async {
  Object? lastError;

  for (
    int attempt = 1;
    attempt <= maxAttempts;
    attempt++
  ) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;

      if (attempt == maxAttempts) {
        rethrow;
      }

      await Future.delayed(
        Duration(
          seconds: attempt,
        ),
      );
    }
  }

  throw lastError!;
}


// ============================================================================
// USAGE:
//
// ============================================================================

Future<void>
    retryExample() async {
  final result =
      await retry(
    () async {
      return await fetchUserName();
    },
    maxAttempts: 3,
  );

  print(result);
}


// ============================================================================
// ⭐ CONCURRENT IMAGE UPLOAD CONCEPT
// ============================================================================

Future<List<String>>
    uploadImages(
  List<String> paths,
) async {
  return Future.wait(
    paths.map(
      uploadImageMock,
    ),
  );
}


// ============================================================================
// ⭐ STREAM-BASED SEARCH CONCEPT
// ============================================================================

Stream<String>
    searchQueries() async* {
  yield "i";

  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  yield "ip";

  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  yield "iphone";
}


// ============================================================================
// ⭐ FINAL MASTER EXAMPLE
// ============================================================================
//
// This example combines:
//
//   • Future
//   • async/await
//   • repository
//   • error handling
//   • generic state
//   • collections
//
// ============================================================================

sealed class DashboardState {}

class DashboardInitial
    extends DashboardState {}

class DashboardLoading
    extends DashboardState {}

class DashboardSuccess
    extends DashboardState {
  final List<ProductModel> products;

  DashboardSuccess(
    this.products,
  );
}

class DashboardError
    extends DashboardState {
  final String message;

  DashboardError(
    this.message,
  );
}


// ============================================================================

class DashboardRepository {
  Future<List<ProductModel>>
      fetchProducts() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    return const [
      ProductModel(
        id: "P001",
        name: "iPhone",
        price: 120000,
      ),
      ProductModel(
        id: "P002",
        name: "Samsung",
        price: 90000,
      ),
    ];
  }
}


// ============================================================================

class DashboardController {
  final DashboardRepository
      repository;

  DashboardController(
    this.repository,
  );

  DashboardState state =
      DashboardInitial();

  Future<void> load() async {
    state =
        DashboardLoading();

    try {
      final products =
          await repository
              .fetchProducts();

      state =
          DashboardSuccess(
        products,
      );
    } catch (error) {
      state =
          DashboardError(
        error.toString(),
      );
    }
  }
}


// ============================================================================
// ⭐ PHASE 11 MASTER CHECKLIST
// ============================================================================
//
// FUNCTIONS
//
// [ ] Function basics
// [ ] Return types
// [ ] Parameters
// [ ] Optional positional
// [ ] Named parameters
// [ ] Required named
// [ ] Default parameters
// [ ] Anonymous functions
// [ ] Arrow functions
// [ ] First-class functions
// [ ] Function variables
// [ ] Function parameters
// [ ] Function return values
// [ ] Higher-order functions
// [ ] Closures
// [ ] Lexical scope
// [ ] typedef
// [ ] callbacks
// [ ] tear-offs
//
// FUTURE
//
// [ ] Future
// [ ] Future<T>
// [ ] Future.value
// [ ] Future.delayed
// [ ] async
// [ ] await
// [ ] then
// [ ] catchError
// [ ] whenComplete
// [ ] try/catch
// [ ] finally
// [ ] Future.wait
// [ ] Future.any
// [ ] Future.timeout
// [ ] Future.error
// [ ] Future.sync
//
// ERROR HANDLING
//
// [ ] async exceptions
// [ ] error propagation
// [ ] custom exceptions
// [ ] result modeling
//
// EVENT LOOP
//
// [ ] event loop
// [ ] event queue
// [ ] microtask queue
// [ ] scheduleMicrotask
// [ ] Timer
// [ ] Timer.periodic
// [ ] execution order
//
// STREAM
//
// [ ] Stream
// [ ] Stream<T>
// [ ] single subscription
// [ ] broadcast
// [ ] listen
// [ ] onData
// [ ] onError
// [ ] onDone
// [ ] StreamController
// [ ] broadcast controller
// [ ] add
// [ ] addError
// [ ] close
// [ ] async*
// [ ] yield
// [ ] yield*
// [ ] where
// [ ] map
// [ ] asyncMap
// [ ] take
// [ ] skip
// [ ] distinct
// [ ] debounce
//
// CONCURRENCY
//
// [ ] concurrency
// [ ] parallelism
// [ ] isolate
// [ ] ReceivePort
// [ ] SendPort
// [ ] Isolate.spawn
// [ ] Isolate.run
// [ ] compute concept
// [ ] message passing
//
// FLUTTER APPLICATION
//
// [ ] API repository
// [ ] loading state
// [ ] search debounce
// [ ] pagination
// [ ] file upload
// [ ] parallel requests
// [ ] real-time stream
// [ ] WebSocket concept
// [ ] background computation
// [ ] retry mechanism
// [ ] OTP timer
//
// ============================================================================
// ⭐ MOST IMPORTANT TOPICS
// ============================================================================
//
// If you want to become a professional Flutter developer, MASTER these:
//
// 1. async / await
//
// 2. Future<T>
//
// 3. try / catch / finally
//
// 4. Future.wait()
//
// 5. Stream<T>
//
// 6. StreamController
//
// 7. async* / yield
//
// 8. Stream transformations
//
// 9. Timer
//
// 10. Debouncing
//
// 11. Callbacks
//
// 12. Higher-order functions
//
// 13. Closures
//
// 14. Event loop
//
// 15. Microtask vs event queue
//
// 16. Isolates
//
// 17. Error propagation
//
// 18. Repository + async architecture
//
// 19. API loading/error/success states
//
// 20. Concurrent API requests
//
// ============================================================================
// ⭐ FULL-STACK FLUTTER CONNECTION
// ============================================================================
//
// Node.js / Express
//       ↓
// REST API
//       ↓
// HTTP Client
//       ↓
// Future<Response>
//       ↓
// await
//       ↓
// JSON
//       ↓
// Model
//       ↓
// Repository
//       ↓
// Service
//       ↓
// Controller
//       ↓
// State
//       ↓
// Flutter UI
//
// ============================================================================
// ⭐ PHASE 11 MEMORY MAP
// ============================================================================
//
// Function
//   = reusable behavior
//
// Callback
//   = function passed to another function
//
// Closure
//   = function remembering outer variables
//
// Future
//   = one value later
//
// Stream
//   = many values over time
//
// async
//   = asynchronous function
//
// await
//   = wait for Future inside async function
//
// Future.wait
//   = wait for multiple Futures
//
// Timer
//   = execute later/repeatedly
//
// Event Loop
//   = manages asynchronous execution
//
// Microtask
//   = high-priority queued task
//
// Isolate
//   = separate execution context
//
// ============================================================================
// ⭐ FINAL ARCHITECTURE
// ============================================================================
//
//                   FLUTTER
//                      │
//                      ▼
//                    UI
//                      │
//                      ▼
//                 Controller
//                      │
//                      ▼
//                   Service
//                      │
//                      ▼
//                 Repository
//                      │
//                      ▼
//                  API Client
//                      │
//                      ▼
//                 HTTP Future
//                      │
//                      ▼
//                Node.js API
//                      │
//                      ▼
//                  MongoDB
//
//              Real-time events
//                      │
//                      ▼
//                   Stream
//
//              Heavy computation
//                      │
//                      ▼
//                   Isolate
//
// ============================================================================
// END OF PHASE 11
// ============================================================================
//
// NEXT:
//
// PHASE 12 — DART OOP MASTERCLASS
//
// Topics will include:
//
//   • Class design
//   • Constructors deep dive
//   • Named constructors
//   • Factory constructors
//   • Redirecting constructors
//   • Inheritance
//   • Abstract classes
//   • Interfaces
//   • Mixins
//   • Multiple mixins
//   • Extension methods
//   • Polymorphism
//   • Encapsulation
//   • Composition
//   • Dependency injection
//   • SOLID principles
//   • Design patterns
//   • Model architecture
//   • Repository architecture
//   • Service architecture
//   • Flutter architecture examples
//
// ============================================================================
