import 'dart:js_interop';

import 'iterator.dart';


/// Interface for [Iterator]'s `Symbol.iterator` method.
/// 
/// Should be bound via [bind] to parent [Iterator].
extension type IteratorSymbolMethod<T extends JSAny>._(JSFunction _) implements JSFunction {
  /// Create new iterator symbol method from Dart function.
  factory IteratorSymbolMethod(Iterator<T> Function() fn) =>
    fn.toJS as IteratorSymbolMethod<T>;

  /// Return this iterator.
  Iterator<T> call() => _call$0(this);

  @JS('call')
  external Iterator<T> _call$0(JSObject context);

  /// Bind this function to given [context].
  @JS()
  external IteratorSymbolMethod<T> bind(JSObject context);
}
