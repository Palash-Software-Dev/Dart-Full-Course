# 100+ Master-Level Dart & Flutter Interview Questions

A comprehensive, categorized guide to technical interview questions for Dart developers, ranging from fundamental language concepts to advanced async programming, memory management, and internal runtime mechanics.

---

## Table of Contents
1. [Basic Language Fundamentals (Questions 1–20)](#1-basic-language-fundamentals)
2. [Object-Oriented Programming & Type System (Questions 21–40)](#2-object-oriented-programming--type-system)
3. [Asynchronous Programming & Concurrency (Questions 41–60)](#3-asynchronous-programming--concurrency)
4. [Functional Programming & Collections (Questions 61–75)](#4-functional-programming--collections)
5. [Memory Management, Garbage Collection & Performance (Questions 76–88)](#5-memory-management-garbage-collection--performance)
6. [Advanced Topics, Metaprogramming & Internals (Questions 89–105)](#6-advanced-topics-metaprogramming--internals)

---

## 1. Basic Language Fundamentals

### Q1: What is Dart, and what are its key execution modes (JIT vs. AOT)?
**Answer:**  
Dart is a client-optimized, strongly-typed programming language developed by Google. It supports two primary execution modes:
- **JIT (Just-In-Time) Compilation:** Used during development (e.g., `flutter run`). Source code is compiled to machine code on the fly, enabling features like Hot Reload, fast iteration, and rich debugging.
- **AOT (Ahead-Of-Time) Compilation:** Used for release builds. Source code is compiled directly into native ARM/x86 machine code, resulting in fast startup times, consistent performance, and no runtime compilation overhead.

---

### Q2: Explain Sound Null Safety in Dart. How does it work under the hood?
**Answer:**  
Sound Null Safety ensures that non-nullable types can never contain a `null` value. It is "sound" because the type system guarantees this at compile-time. If a type is declared as `String`, it will never be `null` at runtime, enabling compiler optimizations (such as stripping redundant null checks in generated native machine code).

---

### Q3: What is the difference between `const` and `final` in Dart?
**Answer:**  
- **`final`:** Defines a single-assignment variable whose value can be determined at runtime (e.g., `final now = DateTime.now();`). Once set, it cannot be reassigned.
- **`const`:** Defines a compile-time constant (e.g., `const pi = 3.14159;`). The value must be fully known before the code executes. `const` objects are canonicalized in memory (only one instance is allocated for identical constant expressions).

---

### Q4: Explain dynamic typing vs. `Object?` vs. `var`.
**Answer:**  
- **`var`:** Type inference. The compiler infers the concrete type based on initial assignment. Static type safety is preserved.
- **`Object?`:** The root of the Dart type hierarchy. Any value can be assigned to `Object?`, but calling methods requires explicit dynamic type checks or casting.
- **`dynamic`:** Disables static type checking at compile-time. Method calls and member accesses are deferred to runtime, risking `NoSuchMethodError` exceptions.

---

### Q5: What is the difference between `late` variables and non-late nullable variables?
**Answer:**  
- **`late`:** Tells the compiler that a non-nullable variable will be initialized before its first read. If accessed before assignment, a runtime `LateInitializationError` is thrown. Deferred evaluation can also be achieved using `late final` fields.
- **Nullable (`Type?`):** Expresses that `null` is a valid, expected state. Requires null-aware operators (`?.`, `??`, `!`) or explicit null handling.

---

### Q6: What are cascade operators (`..` and `?..`), and how do they work?
**Answer:**  
Cascade notation (`..`) allows performing a sequence of operations on the same object target. It returns the original receiver instance rather than the return value of the invoked method/setter.
```dart
final builder = PathBuilder()
  ..moveTo(0, 0)
  ..lineTo(100, 100)
  ..close();