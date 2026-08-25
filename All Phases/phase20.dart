// ============================================================================
// DART MASTER ROADMAP
// PHASE 20 — CONCURRENCY, EVENT LOOP, ISOLATES & PERFORMANCE
// ============================================================================
//
// GOAL:
// --------------------------------------------------------------------------
// In Phase 19 you learned:
//
//   Future
//   async
//   await
//   Stream
//   StreamController
//   Future.wait()
//   asynchronous API operations
//
// Now we go deeper.
//
// This phase explains WHAT ACTUALLY HAPPENS inside Dart when asynchronous
// code runs and how to perform CPU-heavy work without freezing a Flutter UI.
//
// This is especially important for professional Flutter development.
//
// You will use these concepts when dealing with:
//
//   • Large JSON responses
//   • Image processing
//   • Large file processing
//   • Encryption / hashing
//   • CSV processing
//   • Large reports
//   • PDF generation
//   • Data transformation
//   • Large ERP datasets
//   • Background processing
//   • Performance optimization
//
// ============================================================================
// IMPORTANT TERMINOLOGY
// ============================================================================
//
// EVENT LOOP
// MICROtask QUEUE
// EVENT QUEUE
// FUTURE
// STREAM
// ISOLATE
// PORT
// CONCURRENCY
// PARALLELISM
// CPU-BOUND WORK
// I/O-BOUND WORK
//
// ============================================================================


// ============================================================================
// 01. CONCURRENCY VS PARALLELISM
// ============================================================================
//
// These two concepts are related but NOT the same.
//
// CONCURRENCY:
//
// Multiple tasks make progress during overlapping periods.
//
// Example:
//
// Task A starts
// Task A waits for API
// Task B runs
// Task B waits
// Task A continues
//
//
//
// PARALLELISM:
//
// Multiple tasks are literally executing at the same time on different
// CPU cores.
//
//
//
// Simple mental model:
//
// CONCURRENCY
//
// Worker:
//   A → wait → B → wait → A
//
//
//
// PARALLELISM
//
// CPU 1:
//   A A A A
//
// CPU 2:
//   B B B B
//
// ============================================================================


// ============================================================================
// 02. I/O-BOUND VS CPU-BOUND WORK
// ============================================================================
//
// I/O-BOUND:
//
// The program spends time WAITING for something external.
//
// Examples:
//
//   • HTTP request
//   • Database query
//   • File read
//   • Network download
//   • Cloudinary upload
//
// Futures + async/await are usually appropriate.
//
//
//
// CPU-BOUND:
//
// The CPU itself must perform a lot of computation.
//
// Examples:
//
//   • huge JSON transformation
//   • image processing
//   • encryption
//   • compression
//   • large sorting operation
//   • mathematical calculations
//   • generating huge reports
//
// An isolate can be useful.
//
// ============================================================================


// ============================================================================
// 03. THE DART EVENT LOOP
// ============================================================================
//
// Dart applications use an event loop to process asynchronous work.
//
// A simplified mental model:
//
//
//                  ┌──────────────────┐
//                  │    Dart Code     │
//                  └────────┬─────────┘
//                           │
//                           ▼
//                  ┌──────────────────┐
//                  │   Event Loop     │
//                  └───────┬──────────┘
//                          │
//              ┌───────────┴───────────┐
//              ▼                       ▼
//       Microtask Queue          Event Queue
//
//
// The actual runtime has more details, but this model is essential for
// understanding asynchronous Dart.
//
// ============================================================================


// ============================================================================
// 04. MICROTASK QUEUE
// ============================================================================
//
// Microtasks are higher-priority asynchronous callbacks.
//
// Commonly created through:
//
//   scheduleMicrotask()
//   Future.microtask()
//
// ============================================================================

import 'dart:async';


// ============================================================================

void microtaskExample() {
  print("A");

  scheduleMicrotask(() {
    print("Microtask");
  });

  print("B");
}


// ============================================================================
// Output:
//
// A
// B
// Microtask
//
// The current synchronous code finishes first.
//
// ============================================================================


// ============================================================================
// 05. FUTURE.MICROTASK
// ============================================================================

void futureMicrotaskExample() {
  print("Start");

  Future.microtask(() {
    print("Microtask");
  });

  print("End");
}


// ============================================================================
// Output:
//
// Start
// End
// Microtask
//
// ============================================================================


// ============================================================================
// 06. EVENT QUEUE
// ============================================================================
//
// Events such as timers and many asynchronous operations are processed
// through the event loop.
//
// ============================================================================

void eventQueueExample() {
  print("Start");

  Future.delayed(
    Duration.zero,
    () {
      print("Event");
    },
  );

  print("End");
}


// ============================================================================
// Output:
//
// Start
// End
// Event
//
// ============================================================================


// ============================================================================
// 07. MICROtask VS EVENT
// ============================================================================
//
// A simplified demonstration:
//
// ============================================================================

void microtaskVsEventExample() {
  print("1");

  scheduleMicrotask(() {
    print("2 - microtask");
  });

  Future.delayed(
    Duration.zero,
    () {
      print("3 - event");
    },
  );

  print("4");
}


// ============================================================================
// Typical output:
//
// 1
// 4
// 2 - microtask
// 3 - event
//
// ============================================================================
//
// IMPORTANT:
//
// Don't memorize the event loop as merely:
//
// "Future = event queue"
//
// Dart's asynchronous behavior is more nuanced.
//
// For professional development, understand the concept:
//
// synchronous work
//      ↓
// microtasks
//      ↓
// events
//
// ============================================================================


// ============================================================================
// 08. WHY THIS MATTERS IN FLUTTER
// ============================================================================
//
// Flutter UI rendering needs the main isolate to remain responsive.
//
// If you execute expensive CPU work directly on the main isolate:
//
//
// Flutter UI
//     ↓
// Heavy computation
//     ↓
// Frame rendering delayed
//     ↓
// JANK
//
//
//
// Example:
//
// A user opens an ERP report containing 500,000 records.
//
// If you perform huge processing directly on the UI isolate,
// the interface may become unresponsive.
//
// ============================================================================


// ============================================================================
// 09. WHAT IS AN ISOLATE?
// ============================================================================
//
// An isolate is an independent Dart execution environment.
//
// Each isolate has its own:
//
//   • memory
//   • event loop
//   • execution state
//
// Isolates do NOT normally share mutable memory.
//
//
//
// Mental model:
//
//
// MAIN ISOLATE
//
//   UI
//   Flutter widgets
//   event loop
//
//
//              ↕ messages
//
//
// BACKGROUND ISOLATE
//
//   heavy computation
//   separate memory
//   separate event loop
//
// ============================================================================


// ============================================================================
// 10. WHY ISOLATES ARE DIFFERENT FROM THREADS
// ============================================================================
//
// Traditional threads commonly share memory.
//
// Dart isolates generally communicate by sending messages.
//
//
//
// Instead of:
//
// Shared memory
//      ↓
// Thread A
// Thread B
//
//
//
// Dart:
//
// Isolate A
//     ↓
// message
//     ↓
// Isolate B
//
// ============================================================================


// ============================================================================
// 11. SENDPORT
// ============================================================================
//
// SendPort is used to send messages to another isolate.
//
// ============================================================================


// ============================================================================
// 12. RECEIVEPORT
// ============================================================================
//
// ReceivePort receives messages.
//
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
}


// ============================================================================
// IMPORTANT:
//
// A ReceivePort itself is a communication endpoint.
//
// An isolate can send messages to it using a SendPort.
//
// ============================================================================


// ============================================================================
// 13. ISOLATE.SPAWN
// ============================================================================
//
// Isolate.spawn() creates a new isolate.
//
// ============================================================================

import 'dart:isolate';


// ============================================================================

void worker(
  SendPort sendPort,
) {
  sendPort.send(
    "Hello from background isolate",
  );
}


// ============================================================================

Future<void>
    isolateSpawnExample() async {
  final receivePort =
      ReceivePort();

  await Isolate.spawn(
    worker,
    receivePort.sendPort,
  );

  final message =
      await receivePort.first;

  print(message);

  receivePort.close();
}


// ============================================================================
// FLOW:
//
// MAIN ISOLATE
//
// ReceivePort
//     ↓
// SendPort
//     ↓
// Isolate.spawn()
//     ↓
//
// BACKGROUND ISOLATE
//
// worker()
//     ↓
// sendPort.send()
//     ↓
//
// MAIN ISOLATE
//
// receivePort
//
// ============================================================================


// ============================================================================
// 14. ISOLATE ENTRY FUNCTION
// ============================================================================
//
// The function passed to Isolate.spawn() must be suitable as an isolate
// entry point.
//
// Keep the entry function simple and independent.
//
// ============================================================================

void backgroundWorker(
  SendPort sendPort,
) {
  final result =
      100 + 200;

  sendPort.send(result);
}


// ============================================================================
// 15. SEND SIMPLE DATA
// ============================================================================
//
// Messages can contain many transferable Dart values.
//
// For learning purposes, start with:
//
//   • int
//   • double
//   • String
//   • bool
//   • List
//   • Map
//   • SendPort
//
// Avoid thinking of isolates as shared-memory objects.
//
// ============================================================================


// ============================================================================
// 16. TWO-WAY COMMUNICATION
// ============================================================================
//
// Main isolate:
//
// sends request
//
// Background isolate:
//
// processes request
//
// Background isolate:
//
// sends result
//
// ============================================================================

void twoWayWorker(
  SendPort mainSendPort,
) {
  final workerReceivePort =
      ReceivePort();

  mainSendPort.send(
    workerReceivePort.sendPort,
  );

  workerReceivePort.listen(
    (message) {
      if (message is int) {
        final result =
            message * 2;

        mainSendPort.send(
          result,
        );
      }
    },
  );
}


// ============================================================================
// 17. START TWO-WAY ISOLATE
// ============================================================================

Future<void>
    twoWayIsolateExample() async {
  final mainReceivePort =
      ReceivePort();

  await Isolate.spawn(
    twoWayWorker,
    mainReceivePort.sendPort,
  );

  final workerSendPort =
      await mainReceivePort.first
          as SendPort;

  final resultPort =
      ReceivePort();

  // In a production communication
  // protocol, you would send both:
  //
  //   resultPort.sendPort
  //   and the actual data.
  //
  // This example demonstrates
  // the communication concept.

  workerSendPort.send(
    50,
  );

  print(resultPort);
}


// ============================================================================
// NOTE:
//
// The example above is intentionally demonstrating the concept rather than
// building a complete reusable isolate protocol.
//
// Later you will learn a cleaner pattern.
//
// ============================================================================


// ============================================================================
// 18. ISOLATE LIFECYCLE
// ============================================================================
//
// Typical lifecycle:
//
// create
//   ↓
// initialize
//   ↓
// receive work
//   ↓
// process
//   ↓
// send result
//   ↓
// close / terminate
//
// ============================================================================


// ============================================================================
// 19. ISOLATE TERMINATION
// ============================================================================

Future<void>
    terminateIsolateExample() async {
  final receivePort =
      ReceivePort();

  final isolate =
      await Isolate.spawn(
    worker,
    receivePort.sendPort,
  );

  await receivePort.first;

  receivePort.close();

  isolate.kill(
    priority:
        Isolate.immediate,
  );
}


// ============================================================================
// IMPORTANT:
//
// In real applications, don't kill an isolate randomly while it is
// processing important work.
//
// Proper lifecycle management matters.
//
// ============================================================================


// ============================================================================
// 20. CPU-HEAVY EXAMPLE
// ============================================================================
//
// Suppose you need to calculate something expensive.
//
// ============================================================================

int heavyCalculation(
  int limit,
) {
  var result = 0;

  for (
    int i = 0;
    i < limit;
    i++
  ) {
    result += i;
  }

  return result;
}


// ============================================================================
// For a small limit, this is fine.
//
// For extremely expensive operations, consider moving the work away from
// the UI isolate.
//
// ============================================================================


// ============================================================================
// 21. MAIN ISOLATE HEAVY WORK
// ============================================================================
//
// This executes on the current isolate:
//
// ============================================================================

void mainIsolateHeavyWork() {
  final result =
      heavyCalculation(
    1000000,
  );

  print(result);
}


// ============================================================================
// 22. BACKGROUND HEAVY WORK
// ============================================================================
//
// Concept:
//
// Main isolate
//      |
//      | send data
//      ▼
// Background isolate
//      |
//      | calculate
//      ▼
// result
//      |
//      ▼
// Main isolate
//
// ============================================================================


// ============================================================================
// 23. JSON PARSING AS CPU WORK
// ============================================================================
//
// API response:
//
// JSON
//   ↓
// decode
//   ↓
// Map<String, dynamic>
//   ↓
// Model objects
//
// For normal responses, standard async API handling is usually enough.
//
// For very large JSON payloads, parsing/transformation can become expensive.
//
// ============================================================================

import 'dart:convert';


// ============================================================================

List<Map<String, dynamic>>
    parseJsonList(
  String jsonString,
) {
  final decoded =
      jsonDecode(jsonString);

  return List<Map<String, dynamic>>
      .from(
    decoded as List,
  );
}


// ============================================================================
// IMPORTANT:
//
// "async" itself does NOT automatically move CPU work to another isolate.
//
// This is a critical concept.
//
// ============================================================================


// ============================================================================
// 24. ASYNC DOES NOT MEAN BACKGROUND THREAD
// ============================================================================
//
// This is one of the biggest misunderstandings.
//
// WRONG:
//
// async
// = background thread
//
//
//
// CORRECT:
//
// async/await helps manage asynchronous operations.
//
// CPU-heavy synchronous work can still block the current isolate.
//
// ============================================================================


// ============================================================================
// 25. FUTURE.DELAYED DOES NOT MAKE CPU WORK BACKGROUND
// ============================================================================

Future<void>
    misleadingExample() async {
  await Future.delayed(
    Duration.zero,
  );

  // This still runs on the current isolate.
  heavyCalculation(
    100000000,
  );
}


// ============================================================================
// VERY IMPORTANT:
//
// Future.delayed() is NOT an isolate.
//
// ============================================================================


// ============================================================================
// 26. I/O WORK VS CPU WORK
// ============================================================================
//
// API:
//
// final response = await http.get(...);
//
// This is asynchronous I/O.
//
//
//
// CPU:
//
// final result = heavyCalculation(...);
//
// This consumes CPU on the current isolate.
//
//
//
// Therefore:
//
// API waiting
// → Future/async/await
//
// Heavy computation
// → potentially Isolate
//
// ============================================================================


// ============================================================================
// 27. FLUTTER FRAME PERFORMANCE
// ============================================================================
//
// Flutter aims to render frames smoothly.
//
// A long-running synchronous operation on the UI isolate can prevent timely
// frame processing.
//
//
//
// Bad:
//
// button pressed
//    ↓
// huge loop
//    ↓
// UI freezes
//
//
//
// Better:
//
// button pressed
//    ↓
// start background computation
//    ↓
// UI remains responsive
//    ↓
// receive result
//
// ============================================================================


// ============================================================================
// 28. UI JANK
// ============================================================================
//
// JANK means visible stuttering or dropped frames.
//
// Common causes:
//
//   • heavy computation
//   • huge synchronous JSON processing
//   • expensive build operations
//   • unnecessary rebuilds
//   • large image processing
//   • inefficient list processing
//
//
//
// Important:
//
// Not every performance problem requires an isolate.
//
// First identify the bottleneck.
//
// ============================================================================


// ============================================================================
// 29. compute-STYLE PATTERN
// ============================================================================
//
// Flutter ecosystem provides helper approaches for running expensive
// computation in another isolate.
//
// Depending on Flutter/Dart version and API being used, you may encounter
// helpers such as:
//
//   compute()
//
// The conceptual pattern is:
//
// compute(function, input)
//       ↓
// background execution
//       ↓
// result
//
// ============================================================================
//
// Example:
//
// import 'package:flutter/foundation.dart';
//
// int calculate(int value) {
//   return value * value;
// }
//
// Future<void> example() async {
//   final result = await compute(
//     calculate,
//     100,
//   );
//
//   print(result);
// }
//
// ============================================================================
//
// IMPORTANT:
//
// The exact availability/behavior of helper APIs can vary by Flutter/Dart
// version. Always check the version-specific Flutter documentation when
// implementing production code.
//
// ============================================================================


// ============================================================================
// 30. TOP-LEVEL FUNCTION PATTERN
// ============================================================================
//
// Isolate-friendly worker functions are often designed as top-level
// functions.
//
// ============================================================================

int squareNumber(
  int value,
) {
  return value * value;
}


// ============================================================================
// 31. LARGE DATA PROCESSING
// ============================================================================
//
// Imagine an ERP report:
//
// 500,000 sales records.
//
// Processing:
//
//   • filtering
//   • grouping
//   • totals
//   • sorting
//   • calculations
//
// can become expensive.
//
//
//
// Better architecture:
//
// API
// ↓
// retrieve data
// ↓
// determine whether heavy transformation is needed
// ↓
// background isolate if necessary
// ↓
// result
// ↓
// UI
//
// ============================================================================


// ============================================================================
// 32. IMAGE PROCESSING
// ============================================================================
//
// Example operations:
//
//   • resize
//   • compress
//   • crop
//   • transform
//
// These can be CPU-heavy.
//
//
//
// Typical flow:
//
// Flutter
// ↓
// select image
// ↓
// background processing
// ↓
// compressed bytes/file
// ↓
// upload
// ↓
// Cloudinary
//
// ============================================================================


// ============================================================================
// 33. ENCRYPTION / HASHING
// ============================================================================
//
// Heavy cryptographic operations can potentially be CPU-intensive.
//
// Example:
//
// password hashing
// large file hashing
// encryption
//
// Important:
//
// Authentication/security logic should normally be designed carefully on
// the server as well.
//
// Never assume client-side hashing alone makes authentication secure.
//
// ============================================================================


// ============================================================================
// 34. LARGE FILE PROCESSING
// ============================================================================
//
// Example:
//
// CSV:
//
// 1 million rows
//
// Processing pipeline:
//
// file
// ↓
// read
// ↓
// parse
// ↓
// validate
// ↓
// transform
// ↓
// upload/store
//
// Streaming is often better than loading everything into memory at once.
//
// ============================================================================


// ============================================================================
// 35. STREAMING LARGE DATA
// ============================================================================
//
// Instead of:
//
// load 1,000,000 records
// ↓
// process all
//
// You can conceptually:
//
// record
// ↓
// process
// ↓
// record
// ↓
// process
//
// This reduces memory pressure.
//
// ============================================================================


// ============================================================================
// 36. CONCURRENCY LIMITS
// ============================================================================
//
// BAD:
//
// for every product:
//     send API request immediately
//
// If you have 10,000 products:
//
// 10,000 simultaneous requests
//
// This can overload:
//
//   • client
//   • network
//   • server
//   • database
//
//
//
// Better:
//
// process in controlled batches.
//
// ============================================================================
// 37. BATCH PROCESSING
// ============================================================================

Future<void>
    processInBatches<T>(
  List<T> items,
  int batchSize,
  Future<void> Function(
    List<T> batch,
  ) processBatch,
) async {
  if (batchSize <= 0) {
    throw ArgumentError(
      "batchSize must be greater than 0",
    );
  }

  for (
    int start = 0;
    start < items.length;
    start += batchSize
  ) {
    final end =
        (start + batchSize)
            .clamp(
              0,
              items.length,
            );

    final batch =
        items.sublist(
      start,
      end,
    );

    await processBatch(
      batch,
    );
  }
}


// ============================================================================
// Example:
//
// ============================================================================

Future<void>
    batchExample() async {
  final products =
      List.generate(
    100,
    (index) => index,
  );

  await processInBatches(
    products,
    10,
    (batch) async {
      print(
        "Processing ${batch.length} items",
      );

      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );
    },
  );
}


// ============================================================================
// 38. CONCURRENT BATCH PROCESSING
// ============================================================================
//
// Sometimes you want several requests to run concurrently, but not all
// 10,000 at once.
//
// Example:
//
// 10 items
// ↓
// Future.wait
// ↓
// next 10
// ↓
// Future.wait
//
// ============================================================================

Future<void>
    concurrentBatchExample() async {
  final ids =
      List.generate(
    30,
    (index) => index + 1,
  );

  const batchSize = 5;

  for (
    int start = 0;
    start < ids.length;
    start += batchSize
  ) {
    final end =
        (start + batchSize)
            .clamp(
              0,
              ids.length,
            );

    final batch =
        ids.sublist(
      start,
      end,
    );

    await Future.wait(
      batch.map(
        processId,
      ),
    );
  }
}


Future<void> processId(
  int id,
) async {
  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  print(
    "Processed $id",
  );
}


// ============================================================================
// 39. RESOURCE MANAGEMENT
// ============================================================================
//
// Async resources may need cleanup:
//
//   • StreamSubscription
//   • StreamController
//   • timers
//   • sockets
//   • database connections
//   • file handles
//
//
//
// General rule:
//
// create
// ↓
// use
// ↓
// dispose / close / cancel
//
// ============================================================================


// ============================================================================
// 40. TIMER CLEANUP
// ============================================================================

Timer? timer;

void startTimer() {
  timer = Timer.periodic(
    const Duration(
      seconds: 1,
    ),
    (timer) {
      print(
        "Tick: ${timer.tick}",
      );
    },
  );
}


void stopTimer() {
  timer?.cancel();
  timer = null;
}


// ============================================================================
// In Flutter:
//
// start in appropriate lifecycle
//
// cancel in:
//
// dispose()
//
// ============================================================================


// ============================================================================
// 41. STREAM CONTROLLER CLEANUP
// ============================================================================

class EventManager {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get stream =>
      _controller.stream;

  void emit(
    String event,
  ) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// 42. AVOID UNNECESSARY ASYNC
// ============================================================================
//
// You don't need async everywhere.
//
// Bad:
//
// Future<int> add(
//   int a,
//   int b,
// ) async {
//   return a + b;
// }
//
//
//
// If there is no asynchronous work,
// just return int.
//
// Better:
//
// int add(
//   int a,
//   int b,
// ) {
//   return a + b;
// }
//
// ============================================================================


// ============================================================================
// 43. DON'T BLOCK WITH SYNCHRONOUS WORK
// ============================================================================
//
// Bad conceptual pattern:
//
// Future<void> loadData() async {
//
//   await fetchData();
//
//   hugeCalculation();
//
//   updateUI();
// }
//
//
//
// If hugeCalculation() is extremely expensive,
// it can still block the isolate.
//
// ============================================================================


// ============================================================================
// 44. REAL ERP EXAMPLE — REPORT GENERATION
// ============================================================================
//
// Imagine:
//
// Sales = 500,000 records
//
// Need:
//
//   • total sales
//   • total profit
//   • top products
//   • category grouping
//   • monthly report
//
//
//
// Architecture:
//
// API
// ↓
// fetch report data
// ↓
// if processing is lightweight:
//    current isolate
//
// if CPU-heavy:
//    background isolate
//
// ↓
// report result
// ↓
// Flutter UI
//
// ============================================================================


// ============================================================================
// 45. REAL ERP EXAMPLE — LIVE ORDERS
// ============================================================================
//
// WebSocket / realtime server
// ↓
// Stream
// ↓
// Order event
// ↓
// Update state
// ↓
// UI
//
//
//
// This is a Stream problem,
// not a Future problem.
//
// ============================================================================


// ============================================================================
// 46. REAL ERP EXAMPLE — LOGIN
// ============================================================================
//
// User enters:
//
// email
// password
//
// ↓
//
// Future
//
// ↓
//
// POST /login
//
// ↓
//
// server validates
//
// ↓
//
// JWT
//
// ↓
//
// Future completes
//
// ↓
//
// store token
//
// ↓
//
// fetch profile
//
//
//
// Login is usually a Future-based operation.
//
// ============================================================================


// ============================================================================
// 47. REAL ERP EXAMPLE — DASHBOARD
// ============================================================================
//
// Dashboard:
//
// sales
// orders
// products
// customers
// low stock
//
// If independent:
//
// Future.wait()
//
//
//
// If one depends on another:
//
// sequential await
//
// ============================================================================


// ============================================================================
// 48. REAL ERP EXAMPLE — SEARCH
// ============================================================================
//
// TextField
// ↓
// user types
// ↓
// debounce
// ↓
// API request
// ↓
// Future<List<Product>>
// ↓
// update state
//
// ============================================================================


// ============================================================================
// 49. REAL ERP EXAMPLE — FILE UPLOAD
// ============================================================================
//
// File picker
// ↓
// File
// ↓
// optional compression
// ↓
// multipart request
// ↓
// Node.js / Express
// ↓
// Cloudinary
// ↓
// URL
// ↓
// database
//
//
//
// Async I/O handles network/file operations.
//
// Heavy compression can potentially use background computation.
//
// ============================================================================


// ============================================================================
// 50. EVENT LOOP MENTAL MODEL
// ============================================================================
//
// Learn this mental model:
//
//
//
// CURRENT SYNCHRONOUS CODE
//          ↓
//      MICROtasks
//          ↓
//        EVENTS
//          ↓
//      MORE EVENTS
//
//
//
// During an async wait:
//
// Dart does NOT simply "freeze everything".
//
// The isolate can continue processing other asynchronous events.
//
// ============================================================================


// ============================================================================
// 51. IMPORTANT EXAMPLE
// ============================================================================

Future<void>
    eventLoopExample() async {
  print("A");

  Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
    () {
      print("Timer");
    },
  );

  print("B");

  await Future.delayed(
    const Duration(
      milliseconds: 50,
    ),
  );

  print("C");
}


// ============================================================================
// Expected conceptual flow:
//
// A
// B
// C
// Timer
//
// Because the 50ms await completes before the 100ms timer.
//
// ============================================================================


// ============================================================================
// 52. ASYNC DOES NOT GUARANTEE ORDER OF INDEPENDENT TASKS
// ============================================================================

Future<void>
    orderExample() async {
  Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
    () => print("A"),
  );

  Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
    () => print("B"),
  );

  print("C");
}


// ============================================================================
// Possible output:
//
// C
// B
// A
//
// ============================================================================
//
// If you need a guaranteed order:
//
// await.
//
// ============================================================================


// ============================================================================
// 53. GUARANTEED SEQUENCE
// ============================================================================

Future<void>
    guaranteedOrderExample() async {
  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  print("A");

  await Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
  );

  print("B");

  print("C");
}


// ============================================================================
// Output:
//
// A
// B
// C
//
// ============================================================================


// ============================================================================
// 54. PARALLEL EXECUTION
// ============================================================================

Future<void>
    parallelExecutionExample() async {
  final futureA =
      Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
    () => "A",
  );

  final futureB =
      Future.delayed(
    const Duration(
      milliseconds: 100,
    ),
    () => "B",
  );

  final results =
      await Future.wait([
    futureA,
    futureB,
  ]);

  print(results);
}


// ============================================================================
// Result:
//
// [A, B]
//
// Important:
//
// The result list follows the Future input order,
// not necessarily completion order.
//
// ============================================================================


// ============================================================================
// 55. UNHANDLED FUTURE ERRORS
// ============================================================================
//
// Always think about where Future errors go.
//
// Bad:
//
// Future<void> save() async {
//   throw Exception("Failed");
// }
//
// if nobody awaits/handles it,
// the error may become unhandled.
//
//
//
// Better:
//
// try {
//   await save();
// } catch (error) {
//   ...
// }
//
// ============================================================================


// ============================================================================
// 56. RETHROW
// ============================================================================
//
// Sometimes a lower layer should log/clean up and then pass the same error
// upward.
//
// ============================================================================

Future<void>
    rethrowExample() async {
  try {
    await fetchProduct();
  } catch (error) {
    print(
      "Logging error: $error",
    );

    rethrow;
  }
}


// ============================================================================
// IMPORTANT:
//
// rethrow preserves the original error propagation better than creating a
// completely new error unnecessarily.
//
// ============================================================================


// ============================================================================
// 57. CUSTOM ASYNC EXCEPTION
// ============================================================================

class NetworkException
    implements Exception {
  final String message;

  const NetworkException(
    this.message,
  );

  @override
  String toString() {
    return "NetworkException: $message";
  }
}


// ============================================================================
// 58. RETRY PATTERN
// ============================================================================
//
// Network requests can sometimes fail temporarily.
//
// A retry mechanism can be useful.
//
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
          milliseconds:
              300 * attempt,
        ),
      );
    }
  }

  throw lastError ??
      Exception(
        "Operation failed",
      );
}


// ============================================================================
// Example:
//
// ============================================================================

Future<String>
    unstableRequest() async {
  return "Success";
}


Future<void>
    retryExample() async {
  final result =
      await retry(
    unstableRequest,
    maxAttempts: 3,
  );

  print(result);
}


// ============================================================================
// 59. EXPONENTIAL BACKOFF CONCEPT
// ============================================================================
//
// Instead of:
//
// 300ms
// 600ms
// 900ms
//
// You can use:
//
// 300ms
// 600ms
// 1200ms
// 2400ms
//
// This is called exponential backoff.
//
//
//
// Useful for:
//
//   • network retry
//   • APIs
//   • distributed systems
//
// ============================================================================


// ============================================================================
// 60. TIMEOUT + RETRY
// ============================================================================
//
// Production networking can combine:
//
// request
// ↓
// timeout
// ↓
// retry
// ↓
// final failure
//
// ============================================================================

Future<T> requestWithTimeout<T>(
  Future<T> Function() operation,
) async {
  return operation().timeout(
    const Duration(
      seconds: 10,
    ),
  );
}


// ============================================================================
// 61. BACKGROUND PROCESSING DECISION
// ============================================================================
//
// Before creating an isolate, ask:
//
//
//
// Q1:
// Is this I/O?
//
// YES
// → Future/async/await is usually enough.
//
//
//
// Q2:
// Is this CPU-heavy?
//
// YES
// → consider isolate/background processing.
//
//
//
// Q3:
// Is the data huge?
//
// YES
// → consider streaming/chunking/background processing.
//
//
//
// Q4:
// Is the operation frequent?
//
// YES
// → optimize before adding complexity.
//
// ============================================================================
// 62. PERFORMANCE RULE
// ============================================================================
//
// NEVER use an isolate just because:
//
// "Isolate is faster."
//
// That's not always true.
//
// Isolate communication itself has overhead.
//
// Use isolates when the CPU work justifies the overhead.
//
// ============================================================================


// ============================================================================
// 63. UI PERFORMANCE RULE
// ============================================================================
//
// Keep the UI isolate responsive.
//
// Avoid:
//
//   • huge synchronous loops
//   • unnecessary rebuilds
//   • huge transformations during build()
//   • large synchronous parsing
//   • expensive work in button callbacks
//
//
//
// Better:
//
// UI
// ↓
// trigger operation
// ↓
// async/background work
// ↓
// update state
//
// ============================================================================


// ============================================================================
// 64. MEMORY CONSIDERATION
// ============================================================================
//
// Large collections consume memory.
//
// Bad:
//
// final millionItems =
//     loadEverything();
//
//
//
// Better approaches may include:
//
//   • pagination
//   • streaming
//   • server-side filtering
//   • server-side sorting
//   • chunking
//
//
//
// For ERP applications:
//
// DON'T download 500,000 products just to display 20.
//
// Use server-side pagination.
//
// ============================================================================


// ============================================================================
// 65. SERVER-SIDE PAGINATION
// ============================================================================
//
// Flutter:
//
// GET /products?page=1&limit=20
//
// Node.js:
//
// query database
// ↓
// return 20 products
//
// Flutter:
//
// display 20
//
//
//
// This is much better than:
//
// GET /all-products
//
// for huge datasets.
//
// ============================================================================


// ============================================================================
// 66. SERVER-SIDE SEARCH
// ============================================================================
//
// Instead of:
//
// download 100,000 products
// ↓
// search locally
//
// Prefer:
//
// GET /products?search=laptop
//
// Server:
//
// MongoDB query
//
// ↓
//
// return matching products.
//
// ============================================================================


// ============================================================================
// 67. SERVER-SIDE SORTING
// ============================================================================
//
// Example:
//
// GET /products?sort=price&order=asc
//
// This avoids unnecessarily transferring huge datasets.
//
// ============================================================================


// ============================================================================
// 68. EVENT LOOP + FLUTTER ARCHITECTURE
// ============================================================================
//
// UI Isolate
//
//   Flutter widgets
//        ↓
//   state management
//        ↓
//   controller
//        ↓
//   repository
//        ↓
//   API
//
//
//
// Heavy CPU work:
//
// UI Isolate
//      ↓
// Background Isolate
//      ↓
// result
//      ↓
// UI
//
// ============================================================================


// ============================================================================
// 69. PRACTICAL ARCHITECTURE
// ============================================================================
//
// For your full-stack Flutter ERP:
//
//
//
// PRESENTATION
//
// Flutter UI
//
//       ↓
//
// STATE MANAGEMENT
//
// Riverpod / Bloc / Cubit / ChangeNotifier
//
//       ↓
//
// DOMAIN / APPLICATION
//
// business logic
//
//       ↓
//
// REPOSITORY
//
// ProductRepository
// OrderRepository
// UserRepository
//
//       ↓
//
// DATA
//
// API Client
//
//       ↓
//
// Node.js / Express
//
//       ↓
//
// MongoDB
//
//
//
// Background computation can sit beside the data/business layer:
//
// CPU-heavy task
//       ↓
// Isolate
//       ↓
// result
//
// ============================================================================
// 70. MASTER EXAMPLE — ERP DASHBOARD
// ============================================================================

class DashboardData {
  final String sales;
  final String orders;
  final String lowStock;

  const DashboardData({
    required this.sales,
    required this.orders,
    required this.lowStock,
  });
}


// ============================================================================

Future<DashboardData>
    loadDashboardData() async {
  final results =
      await Future.wait([
    fetchSales(),
    fetchOrders(),
    fetchLowStock(),
  ]);

  return DashboardData(
    sales:
        results[0],
    orders:
        results[1],
    lowStock:
        results[2],
  );
}


// ============================================================================
// This demonstrates:
//
// independent requests
//      ↓
// Future.wait()
//      ↓
// one typed dashboard result
//
// ============================================================================


// ============================================================================
// 71. MASTER EXAMPLE — SEARCH
// ============================================================================

class SearchService {
  Timer? _timer;

  void search(
    String query,
    Future<void> Function(
      String query,
    ) onSearch,
  ) {
    _timer?.cancel();

    _timer = Timer(
      const Duration(
        milliseconds: 500,
      ),
      () async {
        await onSearch(query);
      },
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}


// ============================================================================
// This demonstrates the concept of:
//
// debounce
// +
// asynchronous search
// +
// resource cleanup
//
// ============================================================================


// ============================================================================
// 72. MASTER EXAMPLE — STREAM ORDERS
// ============================================================================

class OrderService {
  final StreamController<String>
      _controller =
      StreamController<String>.broadcast();

  Stream<String> get orderStream =>
      _controller.stream;

  void newOrder(
    String orderId,
  ) {
    if (!_controller.isClosed) {
      _controller.add(
        orderId,
      );
    }
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}


// ============================================================================
// This is conceptually useful for:
//
// real-time order notifications.
//
// ============================================================================


// ============================================================================
// 73. MASTER EXAMPLE — GENERIC BACKGROUND RESULT
// ============================================================================
//
// Generic result wrapper:
//
// ============================================================================

class Result<T> {
  final T? data;
  final Object? error;
  final bool isSuccess;

  const Result.success(
    T value,
  )   : data = value,
        error = null,
        isSuccess = true;

  const Result.failure(
    Object exception,
  )   : data = null,
        error = exception,
        isSuccess = false;
}


// ============================================================================
// Example:
//
// ============================================================================

Future<Result<T>>
    safeRequest<T>(
  Future<T> Function()
      operation,
) async {
  try {
    final result =
        await operation();

    return Result.success(
      result,
    );
  } catch (error) {
    return Result.failure(
      error,
    );
  }
}


// ============================================================================
// 74. WHEN TO USE FUTURE
// ============================================================================
//
// Use Future when you expect:
//
//   ONE result.
//
// Examples:
//
//   login
//   fetchUser
//   fetchProduct
//   createOrder
//   updateProduct
//   deleteUser
//   uploadImage
//   saveData
//
// ============================================================================
// 75. WHEN TO USE STREAM
// ============================================================================
//
// Use Stream when values arrive:
//
//   MULTIPLE TIMES.
//
// Examples:
//
//   chat
//   WebSocket
//   realtime orders
//   live notifications
//   location
//   sensor data
//   database changes
//
// ============================================================================
// 76. WHEN TO USE ISOLATE
// ============================================================================
//
// Consider isolate when:
//
//   • CPU work is expensive
//   • UI responsiveness is affected
//   • processing is large
//   • computation can be isolated
//
// Examples:
//
//   • huge JSON parsing
//   • image processing
//   • compression
//   • encryption
//   • large report generation
//   • massive data transformation
//
// ============================================================================
// 77. WHEN NOT TO USE ISOLATE
// ============================================================================
//
// Don't create an isolate for:
//
//   • simple calculations
//   • normal API calls
//   • normal database requests
//   • small JSON
//   • tiny list transformations
//
// Complexity has a cost.
//
// ============================================================================
// 78. MOST IMPORTANT CONCEPT
// ============================================================================
//
// Remember:
//
//
// Future
// = one eventual result
//
// Stream
// = multiple results over time
//
// async/await
// = convenient asynchronous control flow
//
// Event loop
// = processes asynchronous events
//
// Isolate
// = separate Dart execution environment
//
// Future.wait()
// = coordinate independent Futures
//
// ============================================================================
// 79. PHASE 20 MASTER CHECKLIST
// ============================================================================
//
// EVENT SYSTEM
//
// [ ] Event loop
// [ ] Microtask queue
// [ ] Event queue
// [ ] synchronous execution
//
// CONCURRENCY
//
// [ ] concurrency
// [ ] parallelism
// [ ] I/O-bound work
// [ ] CPU-bound work
//
// ISOLATES
//
// [ ] isolate
// [ ] Isolate.spawn
// [ ] SendPort
// [ ] ReceivePort
// [ ] isolate communication
// [ ] isolate lifecycle
// [ ] isolate termination
//
// PERFORMANCE
//
// [ ] UI jank
// [ ] frame performance
// [ ] CPU-heavy work
// [ ] memory usage
// [ ] large data processing
// [ ] batching
// [ ] streaming
//
// ASYNC
//
// [ ] Future
// [ ] Stream
// [ ] Future.wait
// [ ] timeout
// [ ] retry
// [ ] exponential backoff
// [ ] debounce
// [ ] error propagation
// [ ] rethrow
//
// FLUTTER
//
// [ ] UI isolate
// [ ] background computation
// [ ] compute-style processing
// [ ] lifecycle cleanup
// [ ] repository architecture
// [ ] pagination
// [ ] search
// [ ] realtime data
//
// ============================================================================
// 80. INTERVIEW QUESTIONS YOU SHOULD NOW BE ABLE TO ANSWER
// ============================================================================
//
// Q1:
// What is the Dart event loop?
//
// Q2:
// What is the difference between a microtask and an event?
//
// Q3:
// Does async automatically create a background thread?
//
// Q4:
// What is the difference between Future and Stream?
//
// Q5:
// What is an isolate?
//
// Q6:
// How does an isolate communicate with another isolate?
//
// Q7:
// What are SendPort and ReceivePort?
//
// Q8:
// When should you use an isolate?
//
// Q9:
// Why shouldn't every asynchronous operation use an isolate?
//
// Q10:
// What is CPU-bound work?
//
// Q11:
// What is I/O-bound work?
//
// Q12:
// Why can large JSON processing cause Flutter UI jank?
//
// Q13:
// Why is Future.wait() useful?
//
// Q14:
// What is the difference between concurrency and parallelism?
//
// Q15:
// What is a StreamSubscription?
//
// Q16:
// Why should StreamSubscription be cancelled?
//
// Q17:
// Why should StreamController be closed?
//
// Q18:
// What is debounce?
//
// Q19:
// Why should huge ERP datasets use pagination?
//
// Q20:
// Why should search often happen server-side?
//
// ============================================================================
// 81. FINAL PRACTICAL RULES FOR YOUR FLUTTER CAREER
// ============================================================================
//
// RULE 1:
//
// API waiting ≠ isolate requirement.
//
//
//
// RULE 2:
//
// async/await does not automatically make CPU work run in the background.
//
//
//
// RULE 3:
//
// CPU-heavy work can require an isolate.
//
//
//
// RULE 4:
//
// Don't download huge datasets unnecessarily.
//
//
//
// RULE 5:
//
// Use pagination for large ERP lists.
//
//
//
// RULE 6:
//
// Use server-side search for large datasets.
//
//
//
// RULE 7:
//
// Use Future.wait() for independent requests.
//
//
//
// RULE 8:
//
// Use sequential await when one request depends on another.
//
//
//
// RULE 9:
//
// Use Stream for continuous data.
//
//
//
// RULE 10:
//
// Clean up timers, subscriptions and controllers.
//
//
//
// RULE 11:
//
// Don't optimize before measuring the actual bottleneck.
//
//
//
// RULE 12:
//
// Keep the Flutter UI isolate responsive.
//
// ============================================================================
// END OF PHASE 20
// ============================================================================
//
// NEXT:
//
// PHASE 21 — DART METAPROGRAMMING, CALLABLE OBJECTS, FUNCTION TYPES,
// TYPE SYSTEM DEEP DIVE & ADVANCED LANGUAGE FEATURES
//
// Topics will include:
//
//   • Function types
//   • typedef
//   • callable classes
//   • Function tear-offs
//   • method tear-offs
//   • generic function types
//   • covariant
//   • variance concepts
//   • type promotion
//   • pattern matching
//   • destructuring
//   • guards
//   • exhaustive switch
//   • sealed classes
//   • final classes
//   • base classes
//   • interface classes
//   • mixins
//   • extension methods
//   • extension types
//   • advanced records
//   • modern Dart architecture
//
// ============================================================================
// END