// ============================================================================
// DART MASTER ROADMAP
// PHASE 19 — ASYNCHRONOUS DART DEEP DIVE
// ============================================================================
//
// GOAL:
// Learn Dart asynchronous programming deeply enough for professional
// Flutter + full-stack development.
//
// This phase is CRITICAL for Flutter because almost every real application
// performs asynchronous work:
//
//   • REST API calls
//   • Database queries
//   • Authentication
//   • File upload/download
//   • Image upload
//   • Cloudinary operations
//   • MongoDB/Node.js communication
//   • Local storage
//   • Firebase services
//   • Pagination
//   • Search
//   • Notifications
//   • Timers
//   • WebSockets
//   • Streams
//   • Background operations
//
// ============================================================================
// PHASE 19 TOPICS
// ============================================================================
//
// 01. Synchronous vs Asynchronous
// 02. Blocking vs Non-blocking
// 03. Future
// 04. Future states
// 05. async
// 06. await
// 07. Future.value
// 08. Future.delayed
// 09. then()
// 10. catchError()
// 11. whenComplete()
// 12. try/catch with async
// 13. Future<void>
// 14. Future<T>
// 15. Future<T?>
// 16. Future.wait()
// 17. Future.any()
// 18. Future timeout
// 19. Future chaining
// 20. Sequential async operations
// 21. Parallel async operations
// 22. Error handling
// 23. Stream
// 24. StreamController
// 25. async*
// 26. yield
// 27. yield*
// 28. Stream.listen()
// 29. StreamSubscription
// 30. cancel()
// 31. broadcast streams
// 32. single-subscription streams
// 33. stream errors
// 34. await for
// 35. stream transformations
// 36. map()
// 37. where()
// 38. asyncMap()
// 39. debounce concept
// 40. API request pattern
// 41. loading/error/success
// 42. pagination
// 43. search API
// 44. file upload
// 45. real ERP examples
//
// ============================================================================


// ============================================================================
// 01. SYNCHRONOUS PROGRAMMING
// ============================================================================
//
// Synchronous code executes one operation after another.
//
// Example:
//
// A
// ↓
// B
// ↓
// C
//
// ============================================================================

void synchronousExample() {
  print("Step 1");
  print("Step 2");
  print("Step 3");
}


// ============================================================================
// Output:
//
// Step 1
// Step 2
// Step 3
//
// ============================================================================


// ============================================================================
// 02. BLOCKING VS NON-BLOCKING
// ============================================================================
//
// Imagine an API request takes 3 seconds.
//
// If the application blocks while waiting:
//
// UI
// ↓
// API request
// ↓
// wait 3 seconds
// ↓
// continue
//
// This creates a bad user experience.
//
//
//
// Asynchronous programming allows the application to continue doing
// other work while waiting.
//
// ============================================================================


// ============================================================================
// 03. FUTURE
// ============================================================================
//
// Future<T> represents a value that will be available later.
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

Future<String> getUserName() {
  return Future.value(
    "Palash",
  );
}


// ============================================================================
// 04. FUTURE STATES
// ============================================================================
//
// A Future has three conceptual states:
//
// 1. Uncompleted
//
// 2. Completed with value
//
// 3. Completed with error
//
//
//
// Example:
//
// API request
//
//        Future
//          |
//    ----------------
//    |              |
// success         error
//    |              |
// data             exception
//
// ============================================================================


// ============================================================================
// 05. ASYNC
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
// Although we return String:
//
// return "Hello";
//
// The actual function type is:
//
// Future<String>
//
// ============================================================================


// ============================================================================
// 06. AWAIT
// ============================================================================
//
// await waits for a Future to complete.
//
// IMPORTANT:
//
// await can normally be used inside an async function.
//
// ============================================================================

Future<void> awaitExample() async {
  final name =
      await getUserName();

  print(name);
}


// ============================================================================
// Execution:
//
// getUserName()
//      ↓
// Future starts
//      ↓
// await
//      ↓
// Future completes
//      ↓
// name receives result
//
// ============================================================================


// ============================================================================
// 07. FUTURE.VALUE
// ============================================================================
//
// Creates an already completed Future.
//
// ============================================================================

Future<String> futureValueExample() {
  return Future.value(
    "Success",
  );
}


// ============================================================================
// 08. FUTURE.DELAYED
// ============================================================================
//
// Useful for learning asynchronous behavior,
// timers, retry logic, testing, etc.
//
// ============================================================================

Future<String> delayedExample() {
  return Future.delayed(
    const Duration(
      seconds: 2,
    ),
    () => "Completed",
  );
}


// ============================================================================
// Example:
//
// Future<void> main() async {
//
//   print("Start");
//
//   final result =
//       await delayedExample();
//
//   print(result);
//
//   print("End");
// }
//
//
//
// Output:
//
// Start
// ... 2 seconds ...
// Completed
// End
//
// ============================================================================


// ============================================================================
// 09. THEN()
// ============================================================================
//
// Instead of await:
//
// future.then()
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
// 10. CATCHERROR()
// ============================================================================
//
// Handles Future errors.
//
// ============================================================================

void catchErrorExample() {
  Future<String>.error(
    Exception(
      "Something went wrong",
    ),
  ).catchError(
    (error) {
      print(
        "Error: $error",
      );

      return "Fallback";
    },
  );
}


// ============================================================================
// IMPORTANT:
//
// In modern Flutter application code,
// try/catch + async/await is generally easier to read.
//
// ============================================================================


// ============================================================================
// 11. WHENCOMPLETE()
// ============================================================================
//
// Runs whether the Future succeeds or fails.
//
// Similar conceptual purpose to:
//
// finally
//
// ============================================================================

void whenCompleteExample() {
  delayedExample()
      .then(
        (value) {
          print(value);
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
            "Operation finished",
          );
        },
      );
}


// ============================================================================
// 12. TRY/CATCH WITH ASYNC
// ============================================================================
//
// This is one of the most important patterns in Flutter.
//
// ============================================================================

Future<void>
    tryCatchExample() async {
  try {
    final result =
        await delayedExample();

    print(result);
  } catch (error) {
    print(
      "Error: $error",
    );
  }
}


// ============================================================================
// Better version:
//
// ============================================================================

Future<void>
    productionAsyncExample() async {
  try {
    final result =
        await delayedExample();

    print(result);
  } on Exception catch (
    error,
  ) {
    print(
      "Exception: $error",
    );
  } catch (error) {
    print(
      "Unknown error: $error",
    );
  } finally {
    print(
      "Request finished",
    );
  }
}


// ============================================================================
// 13. FUTURE<void>
// ============================================================================
//
// Used when an asynchronous function doesn't return useful data.
//
// Example:
//
// deleteUser()
//
// ============================================================================

Future<void> deleteUser(
  String id,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  print(
    "User $id deleted",
  );
}


// ============================================================================
// 14. FUTURE<T>
// ============================================================================
//
// T represents the returned type.
//
// ============================================================================

Future<int> getPrice() async {
  return 50000;
}


Future<ProductItem>
    getProduct() async {
  return ProductItem(
    name: "Laptop",
    price: 100000,
  );
}


// ============================================================================
// 15. FUTURE<T?>
// ============================================================================
//
// Means:
//
// Future of nullable T.
//
// ============================================================================

Future<ProductItem?>
    findProduct(
  String id,
) async {
  if (id.isEmpty) {
    return null;
  }

  return ProductItem(
    name: "Laptop",
    price: 100000,
  );
}


// ============================================================================
// Usage:
//
// ============================================================================

Future<void>
    nullableFutureExample() async {
  final product =
      await findProduct(
    "P001",
  );

  if (product == null) {
    print(
      "Product not found",
    );
    return;
  }

  print(
    product.name,
  );
}


// ============================================================================
// 16. FUTURE.WAIT()
// ============================================================================
//
// Executes multiple Futures and waits for all of them.
//
// Extremely useful in Flutter.
//
// Example:
//
// Dashboard requires:
//
//   • user
//   • products
//   • orders
//   • notifications
//
// Instead of:
//
// user → wait
// products → wait
// orders → wait
//
// You can execute independent requests together.
//
// ============================================================================

Future<void>
    futureWaitExample() async {
  final results =
      await Future.wait([
    getUserName(),
    getPrice(),
  ]);

  print(results);
}


// ============================================================================
// IMPORTANT:
//
// Future.wait returns:
//
// List<dynamic>
//
// if the Futures have different types.
//
// For production code,
// sometimes separate variables are clearer.
//
// ============================================================================


// ============================================================================
// 17. FUTURE.ANY()
// ============================================================================
//
// Completes when the first Future completes.
//
// ============================================================================

Future<void>
    futureAnyExample() async {
  final result =
      await Future.any([
    Future.delayed(
      const Duration(
        seconds: 2,
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
// Result:
//
// Server B
//
// because Server B completed first.
//
// ============================================================================


// ============================================================================
// 18. FUTURE TIMEOUT
// ============================================================================
//
// Prevents an operation from waiting forever.
//
// Very important for API requests.
//
// ============================================================================

Future<String>
    timeoutExample() async {
  return Future.delayed(
    const Duration(
      seconds: 5,
    ),
    () => "Success",
  ).timeout(
    const Duration(
      seconds: 2,
    ),
  );
}


// ============================================================================
// This will throw TimeoutException
// because the operation takes 5 seconds
// but timeout is 2 seconds.
//
// ============================================================================
// With fallback:
//
// ============================================================================

Future<String>
    timeoutWithFallback() async {
  return Future.delayed(
    const Duration(
      seconds: 5,
    ),
    () => "Success",
  ).timeout(
    const Duration(
      seconds: 2,
    ),
    onTimeout: () =>
        "Request timed out",
  );
}


// ============================================================================
// 19. FUTURE CHAINING
// ============================================================================
//
// You can perform asynchronous operations sequentially.
//
// ============================================================================

Future<String>
    getUserId() async {
  return "U001";
}


Future<String>
    getUserOrders(
  String userId,
) async {
  return "Orders for $userId";
}


// ============================================================================

Future<void>
    futureChainingExample() async {
  final userId =
      await getUserId();

  final orders =
      await getUserOrders(
    userId,
  );

  print(orders);
}


// ============================================================================
// Flow:
//
// getUserId()
//     ↓
// userId
//     ↓
// getUserOrders(userId)
//     ↓
// orders
//
// ============================================================================


// ============================================================================
// 20. SEQUENTIAL ASYNC OPERATIONS
// ============================================================================
//
// Use sequential execution when the second operation depends on the first.
//
// Example:
//
// login
// ↓
// get profile
// ↓
// get permissions
//
// ============================================================================

Future<void>
    sequentialExample() async {
  final user =
      await loginUser();

  final profile =
      await getProfile(
    user.id,
  );

  final permissions =
      await getPermissions(
    user.id,
  );

  print(profile);
  print(permissions);
}


// ============================================================================
// 21. PARALLEL ASYNC OPERATIONS
// ============================================================================
//
// Use parallel execution when operations are independent.
//
// Example:
//
// Dashboard:
//
// user
// products
// orders
//
// They don't depend on each other.
//
// ============================================================================

Future<void>
    parallelExample() async {
  final results =
      await Future.wait([
    getUserName(),
    getPrice(),
  ]);

  print(results);
}


// ============================================================================
// Rule:
//
// DEPENDENCY
//     ↓
// sequential
//
// NO DEPENDENCY
//     ↓
// parallel
//
// ============================================================================


// ============================================================================
// 22. ERROR HANDLING
// ============================================================================
//
// Real applications need different error categories:
//
//   • Network error
//   • Server error
//   • Authentication error
//   • Validation error
//   • Timeout
//   • Parsing error
//   • Unknown error
//
// ============================================================================

Future<void>
    errorHandlingExample() async {
  try {
    final product =
        await getProduct();

    print(product);
  } on FormatException catch (
    error
  ) {
    print(
      "Parsing error: $error",
    );
  } on TimeoutException catch (
    error
  ) {
    print(
      "Timeout: $error",
    );
  } catch (error) {
    print(
      "Unknown error: $error",
    );
  }
}


// ============================================================================
// 23. STREAM
// ============================================================================
//
// Future:
//
// returns ONE future result.
//
// Stream:
//
// can return MULTIPLE values over time.
//
//
//
// Future:
//
// request
//    ↓
// one result
//
//
//
// Stream:
//
// event
// ↓
// event
// ↓
// event
// ↓
// event
//
// ============================================================================

Stream<int> numberStream() async* {
  for (
    int i = 1;
    i <= 5;
    i++
  ) {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    yield i;
  }
}


// ============================================================================
// 24. STREAMCONTROLLER
// ============================================================================
//
// StreamController lets you manually push events.
//
// ============================================================================

import 'dart:async';


// ============================================================================

class CounterStream {
  final StreamController<int>
      _controller =
      StreamController<int>();

  int _counter = 0;

  Stream<int> get stream =>
      _controller.stream;

  void increment() {
    _counter++;

    _controller.add(
      _counter,
    );
  }

  void dispose() {
    _controller.close();
  }
}


// ============================================================================
// IMPORTANT:
//
// Always close controllers when they are no longer needed.
//
// Otherwise you can create memory/resource leaks.
//
// ============================================================================


// ============================================================================
// 25. ASYNC*
// ============================================================================
//
// async* creates a Stream.
//
// async creates a Future.
//
//
//
// async:
//
// Future<T>
//
// async*:
//
// Stream<T>
//
// ============================================================================

Stream<String>
    messageStream() async* {
  yield "Hello";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Welcome";

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  yield "Goodbye";
}


// ============================================================================
// 26. YIELD
// ============================================================================
//
// yield emits one value into a Stream.
//
// ============================================================================

Stream<int>
    simpleStream() async* {
  yield 10;
  yield 20;
  yield 30;
}


// ============================================================================
// 27. YIELD*
// ============================================================================
//
// yield* forwards another Stream.
//
// ============================================================================

Stream<int>
    combinedStream() async* {
  yield 1;
  yield 2;

  yield* anotherStream();

  yield 5;
}


Stream<int>
    anotherStream() async* {
  yield 3;
  yield 4;
}


// ============================================================================
// Result:
//
// 1
// 2
// 3
// 4
// 5
//
// ============================================================================
// 28. STREAM.LISTEN()
// ============================================================================

void listenExample() {
  final subscription =
      numberStream().listen(
    (number) {
      print(
        "Received: $number",
      );
    },
  );

  // subscription can later
  // be paused, resumed or cancelled.
  print(subscription);
}


// ============================================================================
// 29. STREAMSUBSCRIPTION
// ============================================================================
//
// Stream.listen() returns StreamSubscription.
//
// It allows control over the stream.
//
// ============================================================================

void subscriptionExample() {
  final subscription =
      numberStream().listen(
    (value) {
      print(value);
    },
  );

  subscription.pause();

  subscription.resume();

  subscription.cancel();
}


// ============================================================================
// IMPORTANT:
//
// In Flutter:
//
// StreamSubscription should often be cancelled
// inside dispose() when manually subscribing.
//
// ============================================================================


// ============================================================================
// 30. CANCEL()
// ============================================================================

Future<void>
    cancelStreamExample() async {
  final subscription =
      numberStream().listen(
    print,
  );

  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  await subscription.cancel();
}


// ============================================================================
// 31. BROADCAST STREAM
// ============================================================================
//
// A broadcast stream can have multiple listeners.
//
// Useful for:
//
//   • events
//   • authentication state
//   • app-wide notifications
//   • real-time updates
//
// ============================================================================

class EventBus {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get stream =>
      _controller.stream;

  void emit(String event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}


// ============================================================================
// 32. SINGLE-SUBSCRIPTION STREAM
// ============================================================================
//
// Default streams are generally single-subscription streams.
//
// One listener is allowed.
//
// ============================================================================

Stream<int>
    singleSubscriptionStream() async* {
  yield 1;
  yield 2;
  yield 3;
}


// ============================================================================
// 33. STREAM ERRORS
// ============================================================================

Stream<int>
    errorStream() async* {
  yield 1;
  yield 2;

  throw Exception(
    "Something went wrong",
  );
}


// ============================================================================

void streamErrorHandlingExample() {
  errorStream().listen(
    (value) {
      print(
        "Value: $value",
      );
    },
    onError: (error) {
      print(
        "Stream error: $error",
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
// 34. AWAIT FOR
// ============================================================================
//
// await for listens to a Stream and receives values one by one.
//
// ============================================================================

Future<void>
    awaitForExample() async {
  await for (
    final number
    in numberStream()
  ) {
    print(number);
  }
}


// ============================================================================
// Difference:
//
// await:
//
// Future
//
// await for:
//
// Stream
//
// ============================================================================


// ============================================================================
// 35. STREAM TRANSFORMATIONS
// ============================================================================
//
// Streams can be transformed similarly to Iterable.
//
// ============================================================================

Stream<int>
    transformedStream() {
  return numberStream()
      .where(
        (number) =>
            number.isEven,
      )
      .map(
        (number) =>
            number * 10,
      );
}


// ============================================================================
// 36. STREAM MAP
// ============================================================================

Stream<String>
    mappedStream() {
  return numberStream()
      .map(
        (number) =>
            "Number: $number",
      );
}


// ============================================================================
// 37. STREAM WHERE
// ============================================================================

Stream<int>
    filteredStream() {
  return numberStream()
      .where(
        (number) =>
            number.isEven,
      );
}


// ============================================================================
// 38. ASYNCMAP
// ============================================================================
//
// asyncMap allows each stream event to trigger
// asynchronous processing.
//
// Very useful for:
//
//   • search
//   • database queries
//   • API calls
//   • validation
//
// ============================================================================

Stream<String>
    asyncMapExample() {
  return numberStream()
      .asyncMap(
        (number) async {
          await Future.delayed(
            const Duration(
              milliseconds: 200,
            ),
          );

          return "Processed $number";
        },
      );
}


// ============================================================================
// 39. DEBOUNCE CONCEPT
// ============================================================================
//
// Search box:
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
// Without debounce:
//
// 6 API requests.
//
//
//
// With debounce:
//
// wait until user stops typing.
//
// Then:
//
// 1 API request.
//
// ============================================================================
//
// Concept:
//
// Input event
//      ↓
// wait
//      ↓
// new input?
//      ↓
// reset timer
//      ↓
// no new input
//      ↓
// API request
//
// ============================================================================


// ============================================================================
// SIMPLE DEBOUNCE CONCEPT
// ============================================================================

Timer? _searchTimer;

void debounceSearch(
  String query,
) {
  _searchTimer?.cancel();

  _searchTimer = Timer(
    const Duration(
      milliseconds: 500,
    ),
    () {
      performSearch(query);
    },
  );
}


void performSearch(
  String query,
) {
  print(
    "Searching: $query",
  );
}


// ============================================================================
// 40. API REQUEST PATTERN
// ============================================================================
//
// A professional API function usually:
//
//   1. starts request
//   2. waits
//   3. parses response
//   4. handles errors
//   5. returns typed data
//
// ============================================================================

Future<ProductItem>
    fetchProduct() async {
  try {
    // Simulate API delay.
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    return ProductItem(
      name: "Laptop",
      price: 100000,
    );
  } catch (error) {
    rethrow;
  }
}


// ============================================================================
// 41. LOADING / ERROR / SUCCESS
// ============================================================================
//
// A Flutter API screen commonly has three major states:
//
// LOADING
// ERROR
// SUCCESS
//
//
//
// Initial
//   ↓
// Loading
//   ↓
// ----------------
// |              |
// Success       Error
//
// ============================================================================

enum RequestStatus {
  idle,
  loading,
  success,
  error,
}


// ============================================================================
// State model:
//
// ============================================================================

class RequestState<T> {
  final RequestStatus status;
  final T? data;
  final String? error;

  const RequestState({
    required this.status,
    this.data,
    this.error,
  });
}


// ============================================================================
// 42. PAGINATION
// ============================================================================
//
// Pagination means loading data in chunks.
//
// Example:
//
// Page 1 → 20 products
// Page 2 → next 20
// Page 3 → next 20
//
// ============================================================================

Future<List<ProductItem>>
    fetchProductsPage(
  int page,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  return List.generate(
    10,
    (index) {
      final number =
          ((page - 1) * 10) +
              index +
              1;

      return ProductItem(
        name: "Product $number",
        price: number * 1000,
      );
    },
  );
}


// ============================================================================
// Pagination loop:
//
// ============================================================================

Future<void>
    paginationExample() async {
  final allProducts =
      <ProductItem>[];

  for (
    int page = 1;
    page <= 3;
    page++
  ) {
    final products =
        await fetchProductsPage(
      page,
    );

    allProducts.addAll(
      products,
    );
  }

  print(
    "Total: ${allProducts.length}",
  );
}


// ============================================================================
// 43. SEARCH API
// ============================================================================

Future<List<ProductItem>>
    searchProductApi(
  String query,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 500,
    ),
  );

  final products = [
    ProductItem(
      name: "iPhone",
      price: 120000,
    ),
    ProductItem(
      name: "Samsung Phone",
      price: 90000,
    ),
    ProductItem(
      name: "Laptop",
      price: 100000,
    ),
  ];

  return products
      .where(
        (product) =>
            product.name
                .toLowerCase()
                .contains(
                  query
                      .toLowerCase(),
                ),
      )
      .toList();
}


// ============================================================================
// 44. FILE UPLOAD CONCEPT
// ============================================================================
//
// Real Flutter:
//
// File
//   ↓
// Multipart request
//   ↓
// Server
//   ↓
// Cloudinary
//   ↓
// URL
//   ↓
// Database
//
// Dart asynchronous programming is required at almost every stage.
//
// ============================================================================

Future<String>
    uploadFile() async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  return "https://example.com/image.jpg";
}


// ============================================================================
// 45. REAL ERP DASHBOARD
// ============================================================================
//
// Dashboard may need:
//
//   • Sales
//   • Orders
//   • Products
//   • Customers
//   • Low stock
//
// These requests can often run in parallel.
//
// ============================================================================

Future<String>
    fetchSales() async {
  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  return "Sales data";
}


Future<String>
    fetchOrders() async {
  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  return "Orders data";
}


Future<String>
    fetchLowStock() async {
  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  return "Low stock data";
}


// ============================================================================

Future<void>
    loadDashboard() async {
  final results =
      await Future.wait([
    fetchSales(),
    fetchOrders(),
    fetchLowStock(),
  ]);

  final sales =
      results[0];

  final orders =
      results[1];

  final lowStock =
      results[2];

  print(sales);
  print(orders);
  print(lowStock);
}


// ============================================================================
// ⭐ STREAM-BASED ERP EXAMPLE
// ============================================================================
//
// Imagine live order updates:
//
// Order #1001
// Order #1002
// Order #1003
// Order #1004
//
// A Stream is appropriate when data keeps arriving.
//
// ============================================================================

Stream<String>
    orderUpdates() async* {
  for (
    int i = 1;
    i <= 5;
    i++
  ) {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    yield "New Order #$i";
  }
}


// ============================================================================
// Listen:
//
// ============================================================================

Future<void>
    listenToOrders() async {
  await for (
    final order
    in orderUpdates()
  ) {
    print(order);
  }
}


// ============================================================================
// ⭐ FUTURE VS STREAM
// ============================================================================
//
// FUTURE:
//
// One eventual result.
//
// Examples:
//
//   login
//   fetch profile
//   fetch product
//   create order
//   delete user
//
//
//
// STREAM:
//
// Multiple values over time.
//
// Examples:
//
//   live orders
//   chat messages
//   WebSocket data
//   location updates
//   realtime notifications
//
// ============================================================================
// ⭐ ASYNC/AWAIT RULES
// ============================================================================
//
// RULE 1:
//
// async function normally returns Future.
//
//
//
// RULE 2:
//
// await waits for a Future.
//
//
//
// RULE 3:
//
// await normally belongs inside async function.
//
//
//
// RULE 4:
//
// Independent Futures can often use Future.wait().
//
//
//
// RULE 5:
//
// Dependent Futures should usually execute sequentially.
//
//
//
// RULE 6:
//
// Always handle errors in production asynchronous code.
//
//
//
// RULE 7:
//
// Stream subscriptions should be managed carefully.
//
//
//
// RULE 8:
//
// Close manually-created StreamControllers.
//
// ============================================================================
// ⭐ COMMON MISTAKES
// ============================================================================
//
// ❌ Mistake 1:
//
// Forgetting await.
//
//
//
// ❌ Mistake 2:
//
// Using await sequentially when requests are independent.
//
//
//
// ❌ Mistake 3:
//
// Not handling exceptions.
//
//
//
// ❌ Mistake 4:
//
// Forgetting timeout for important network operations.
//
//
//
// ❌ Mistake 5:
//
// Forgetting to cancel StreamSubscription.
//
//
//
// ❌ Mistake 6:
//
// Forgetting StreamController.close().
//
//
//
// ❌ Mistake 7:
//
// Creating multiple API requests for every search keystroke.
//
//
//
// ❌ Mistake 8:
//
// Updating UI after a widget has already been disposed.
//
//
//
// ❌ Mistake 9:
//
// Mixing Future and Stream concepts.
//
//
//
// ❌ Mistake 10:
//
// Using dynamic everywhere instead of typed Future<T>.
//
// ============================================================================
// ⭐ FLUTTER CONNECTION
// ============================================================================
//
// In Flutter you will eventually use:
//
// FutureBuilder<T>
//
// StreamBuilder<T>
//
// initState()
//
// dispose()
//
// ChangeNotifier
//
// Riverpod
//
// Bloc/Cubit
//
// Repository
//
// Service
//
// API Client
//
//
//
// Example:
//
// UI
//  ↓
// Controller / Provider / Bloc
//  ↓
// Repository
//  ↓
// API Service
//  ↓
// HTTP
//  ↓
// Node.js / Express
//
// ============================================================================
// ⭐ FULL-STACK FLUTTER FLOW
// ============================================================================
//
// Flutter
//    ↓
// Dart Future
//    ↓
// HTTP request
//    ↓
// Node.js
//    ↓
// Express
//    ↓
// MongoDB
//    ↓
// Response
//    ↓
// Dart Future
//    ↓
// JSON
//    ↓
// Model
//    ↓
// Flutter UI
//
// ============================================================================
// ⭐ MASTER CHECKLIST
// ============================================================================
//
// [ ] synchronous vs asynchronous
// [ ] blocking vs non-blocking
// [ ] Future
// [ ] Future<T>
// [ ] Future<T?>
// [ ] async
// [ ] await
// [ ] Future.value
// [ ] Future.delayed
// [ ] then
// [ ] catchError
// [ ] whenComplete
// [ ] try/catch/finally
// [ ] Future.wait
// [ ] Future.any
// [ ] timeout
// [ ] sequential requests
// [ ] parallel requests
// [ ] Stream
// [ ] async*
// [ ] yield
// [ ] yield*
// [ ] StreamController
// [ ] StreamSubscription
// [ ] listen
// [ ] cancel
// [ ] broadcast stream
// [ ] stream errors
// [ ] await for
// [ ] stream map
// [ ] stream where
// [ ] asyncMap
// [ ] debounce
// [ ] API request
// [ ] loading state
// [ ] error state
// [ ] success state
// [ ] pagination
// [ ] search
// [ ] file upload concept
// [ ] realtime ERP data
//
// ============================================================================
// ⭐ FINAL UNDERSTANDING
// ============================================================================
//
// You should now understand:
//
// Future
// = one result later.
//
// Stream
// = many results over time.
//
// async
// = function performs asynchronous work.
//
// await
// = wait for a Future inside async code.
//
// Future.wait()
// = run independent Futures together and wait for all.
//
// async*
// = create a Stream asynchronously.
//
// yield
// = emit a value into a Stream.
//
// StreamController
// = manually control/emits Stream events.
//
// ============================================================================
// END OF PHASE 19
// ============================================================================
//
// NEXT:
//
// PHASE 20 — DART CONCURRENCY, ISOLATES & EVENT LOOP
//
// Topics:
//
//   • Event loop
//   • Microtask queue
//   • Event queue
//   • Isolates
//   • compute-style background work
//   • Isolate.spawn
//   • SendPort
//   • ReceivePort
//   • Isolate communication
//   • CPU-heavy work
//   • JSON parsing
//   • Large file processing
//   • Background tasks
//   • Concurrency vs parallelism
//   • Flutter performance
//   • avoiding UI jank
//   • real-world Flutter examples
//
// ============================================================================
