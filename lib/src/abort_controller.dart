import 'dart:js_interop';

import 'abort_signal.dart';


/// The [AbortController] interface represents a controller object that allows
/// you to abort one or more Web requests as and when desired.
/// 
/// You can create a new [AbortController] object using
/// the [AbortController.new] constructor.
@JS()
extension type AbortController<T extends JSAny>._(JSObject _) implements JSObject {
  /// Creates a new [AbortController] object instance.
  @JS('AbortController')
  external factory AbortController();

  /// Returns an [AbortSignal] object instance, which can be used
  /// to communicate with, or to abort, an asynchronous operation.
  @JS()
  external final AbortSignal<T> signal;

  /// Aborts an asynchronous operation before it has completed.
  /// This is able to abort fetch requests, consumption of any response bodies,
  /// and streams.
  @JS()
  external void abort([T? reason]);
}
