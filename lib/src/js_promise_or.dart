import 'dart:async';
import 'dart:js_interop';


extension type JSPromiseOr<T extends JSAny?>._(JSAny _) implements JSAny {
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

extension FutureOrToJSPromiseOr<T extends JSAny?> on FutureOr<T> {
  JSPromiseOr<T>? get toJSPromiseOr =>
    switch (this) {
      final Future<T> future => future.toJS as JSPromiseOr<T>,
      // Always succeeds, because of JS type erasure.
      final T value => value as JSPromiseOr<T>?,
    };
}
