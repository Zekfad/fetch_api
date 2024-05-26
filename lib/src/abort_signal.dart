import 'dart:js_interop';

import 'package:web/web.dart' show DOMException;
import 'abort_controller.dart';


/// The [AbortSignal] interface represents a signal object that allows you
/// to communicate with an asynchronous operation (such as a fetch request)
/// and abort it if required via an [AbortController] object.
@JS()
extension type AbortSignal<T extends JSAny>._(JSObject _) implements JSObject {
  /// The [AbortSignal.abort] static method returns an [AbortSignal] that is
  /// already set as aborted (and which does not trigger an `abort` event).
  static AbortSignal<T> abort<T extends JSAny>([T? reason]) =>
    _abort<T>(reason);

  /// The [AbortSignal.any] static method takes an [iterable] of abort signals
  /// and returns an [AbortSignal].
  /// The returned abort signal is aborted when any of the input iterable
  /// abort signals are aborted.
  /// The abort reason will be set to the reason of the first signal
  /// that is aborted. If any of the given abort signals are already aborted
  /// then so will be the returned [AbortSignal].
  static AbortSignal<T> any<T extends JSAny>(List<AbortSignal<T>> iterable) =>
    _any<T>(iterable.toJS);


  /// The [AbortSignal.timeout] static method returns an [AbortSignal]
  /// that will automatically abort after a specified [time].
  /// 
  /// The signal aborts with a `TimeoutError` [DOMException] on timeout,
  /// or with `AbortError` [DOMException] due to pressing a browser
  /// stop button (or some other inbuilt "stop" operation).
  static AbortSignal<DOMException> timeout(Duration time) =>
    _timeout(time.inMilliseconds);

  @JS('abort')
  external static AbortSignal<T> _abort<T extends JSAny>([T? reason]);

  @JS('any')
  external static AbortSignal<T> _any<T extends JSAny>(JSArray<AbortSignal<T>> iterable);

  @JS('timeout')
  external static AbortSignal<DOMException> _timeout(int time);

  /// The [throwIfAborted] method throws the signal's abort [reason]
  /// if the signal has been aborted; otherwise it does nothing.
  @JS()
  external void throwIfAborted();

  /// The [aborted] read-only property returns a value that indicates whether
  /// the asynchronous operations the signal is communicating with are aborted
  /// (`true`) or not (`false`).
  @JS()
  external bool get aborted;

  /// The [reason] read-only property returns a JavaScript value that indicates
  /// the abort reason.
  /// 
  /// The property is `undefined` when the signal has not been aborted.
  /// It can be set to a specific value when the signal is aborted,
  /// using [AbortController.abort] or [AbortSignal.abort].
  /// If not explicitly set in those methods, it defaults to `AbortError`
  /// [DOMException].
  @JS()
  external T? get reason;
}
