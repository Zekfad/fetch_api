import '_js.dart';
import 'iterator_result.dart';


@JS()
@anonymous
class Iterator<T> {
  /// A function that accepts zero or one argument and returns an object
  /// conforming to the [IteratorResult] interface.
  /// 
  /// If a non-object value gets returned (such as false or undefined)
  /// when a built-in language feature (such as for...of) is using the iterator,
  /// a TypeError ("iterator.next() returned a non-object value") will be thrown.
  external IteratorResult<T> next();
}
