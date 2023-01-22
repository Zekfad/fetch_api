import '_js.dart';
import 'abort_signal.dart';


@JS()
@staticInterop
class AbortController {
  /// Creates a new [AbortController] object instance.
  external factory AbortController();
}

extension AbortControllerExtension on AbortController {
  /// Returns an `AbortSignal` object instance, which can be used to
  /// communicate with, or to abort, a DOM request.
  external final AbortSignal signal;

  /// Aborts a DOM request before it has completed. This is able to abort
  /// fetch requests, consumption of any response bodies, and streams.
  external void abort([dynamic reason]);
}
