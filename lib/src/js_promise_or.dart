import 'dart:async';
import 'dart:js_interop';


/// Analog of [FutureOr] for JS interop.
extension type JSPromiseOr<T extends JSAny?>._(JSAny _) implements JSAny {
  /// Create [JSPromiseOr] from Dart [FutureOr].
  static JSPromiseOr<T>? fromDart<T extends JSAny?>(FutureOr<T> futureOr) =>
    switch (futureOr) {
      final Future<T> future => future.toJS,
      // Always succeeds, because of JS type erasure.
      final T value => value,
    } as JSPromiseOr<T>?;
  
  /// A value of [T] if it's not a [JSPromise] otherwise a [Future] that either
  /// completes with the result of the resolved [JSPromise] or propagates
  /// the error that the [JSPromise] rejected with.
  FutureOr<T> get toDart => switch (this) {
    final JSPromise<T> promise when isA<JSPromise<T>>() => promise.toDart,
    // Always succeeds, because of JS type erasure.
    final T value => value,
    _ => throw StateError('Invalid state of JSPromiseOr: unexpected type: $runtimeType'),
  };
}

/// Conversions from [FutureOr] with JS interop type to [JSPromiseOr].
extension FutureOrToJSPromiseOr<T extends JSAny?> on FutureOr<T> {
  /// Convert value to [JSPromiseOr] if its not `null`, `null` otherwise.
  // Always nullable to support casting of null values
  JSPromiseOr<T>? get toJSPromiseOr =>
    switch (this) {
      final Future<T> future => future.toJS as JSPromiseOr<T>,
      // Always succeeds, because of JS type erasure.
      final T value => value as JSPromiseOr<T>?,
    };
}
