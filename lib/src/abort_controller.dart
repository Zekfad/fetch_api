import '_js.dart';
import 'abort_signal.dart';


/// The [AbortController] interface represents a controller object that allows
/// you to abort one or more Web requests as and when desired.
/// 
/// You can create a new [AbortController] object using the `AbortController()`
/// constructor. Communicating with a DOM request is done using an [AbortSignal]
/// object.
@JS()
@staticInterop
class AbortController {
  /// Creates a new [AbortController] object instance.
  external factory AbortController();
}

extension AbortControllerInstanceMembers on AbortController {
  /// Returns an [AbortSignal] object instance, which can be used to
  /// communicate with, or to abort, a DOM request.
  external final AbortSignal signal;

  /// Aborts a DOM request before it has completed. This is able to abort
  /// fetch requests, consumption of any response bodies, and streams.
  external void abort([dynamic reason]);
}
