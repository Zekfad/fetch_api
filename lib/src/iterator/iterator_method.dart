import 'dart:js_interop';

import 'iterator.dart';
import 'iterator_result.dart';


/// General interface for methods used in [Iterator].
/// 
/// Internal definition. It must be bound to parent iterator via [bind],
/// otherwise illegal invocation error happen.
extension type IteratorMethod<R extends JSAny, V extends JSAny>._(JSFunction _) implements JSFunction {
  /// Wrap Dart function to [IteratorMethod].
  factory IteratorMethod(IteratorResult<R> Function([V? value]) fn) =>
    fn.toJS as IteratorMethod<R, V>;

  /// Execute this method.
  IteratorResult<R> call([V? value]) => value == null
    ? _call$0(this)
    : _call$1(this, value);

  @JS('call')
  external IteratorResult<R> _call$0(JSObject context);

  @JS('call')
  external IteratorResult<R> _call$1(JSObject context, V value);

  /// Bind this function to given [context].
  @JS()
  external IteratorMethod<R, V> bind(JSObject context);
}
