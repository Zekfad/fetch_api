import '_js.dart';
import 'abort_controller.dart';


/// The [AbortSignal] interface represents a signal object that allows you
/// to communicate with a DOM request (such as a fetch request) and abort it
/// if required via an [AbortController] object.
@JS()
@staticInterop
class AbortSignal {
  /// Returns an [AbortSignal] instance that will automatically abort
  /// after a specified [time].
  factory AbortSignal.timeout(Duration time)
    => AbortSignal._timeout(time.inMilliseconds);

  /// Returns an [AbortSignal] instance that is already set as aborted.
  external static AbortSignal abort([dynamic reason]);

  /// Returns an [AbortSignal] instance that will automatically abort
  /// after a specified [time] in milliseconds.
  @JS('timeout')
  external static AbortSignal _timeout(int time);
}


extension AbortSignalInstanceMembers on AbortSignal {
  /// A [bool] that indicates whether the request(s) the signal is
  /// communicating with is/are aborted (`true`) or not (`false`).
  external final bool aborted;

  /// A JavaScript value providing the abort reason, once the signal has aborted.
  external final dynamic reason;

  /// Throws the signal's abort [reason] if the signal has been aborted;
  /// otherwise it does nothing.
  external void throwIfAborted();
}
