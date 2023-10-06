import '_js.dart';
import 'iterator_result.dart';


/// The iterator protocol defines a standard way to produce a sequence of values
/// (either finite or infinite), and potentially a return value when all values
/// have been generated.
/// 
/// All iterator protocol methods (`next()`, `return()`, and `throw()`) are
/// expected to return an object implementing the [IteratorResult] interface.
@JS()
@staticInterop
class Iterator<T> {
}

extension IteratorInstanceMembers<T> on Iterator<T> {
  /// A function that accepts zero or one argument and returns an object
  /// conforming to the [IteratorResult] interface.
  /// 
  /// If a non-object value gets returned (such as `false` or `undefined`)
  /// when a built-in language feature (such as `for...of`) is using
  /// the iterator, a `TypeError` (`"iterator.next() returned a non-object
  /// value"`) will be thrown.
  external IteratorResult<T> next();
}
