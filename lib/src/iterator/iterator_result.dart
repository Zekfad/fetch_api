import 'dart:js_interop';

import 'iterator.dart';


/// Interface that implements all [Iterator] results.
/// 
/// In practice, neither property is strictly required; if an object without
/// either property is returned, it's effectively equivalent to
/// `{ done: false, value: undefined }`.
/// 
/// If an iterator returns a result with `done: true`, any subsequent calls
/// to `next()` are expected to return `done: true` as well, although
/// this is not enforced on the language level.
extension type IteratorResult<T extends JSAny>._(JSObject _) implements JSObject {
  /// Create new [IteratorResult].
  factory IteratorResult({
    bool done = false,
    T? value,
  }) => value == null
    ? IteratorResult._new$1(
      done: done,
    )
    : IteratorResult._new$2(
      done: done,
      value: value,
    );

  /// Creates object that assigns [done] and leaves [value] `undefined`.
  @JS('')
  external factory IteratorResult._new$1({
    bool? done,
  });

  /// Creates object that assigns both [done] and [value].
  @JS('')
  external factory IteratorResult._new$2({
    bool? done,
    T value,
  });

  /// A boolean that's `false` if the iterator was able to produce
  /// the next value in the sequence. (This is equivalent to not specifying
  /// the done property altogether.)
  /// 
  /// Has the value `true` if the iterator has completed its sequence.
  /// In this case, value optionally specifies the return value of the iterator.
  @JS()
  external bool? done;

  /// Any JavaScript value returned by the iterator.
  /// Can be omitted when [done] is `true`.
  @JS()
  external T? value;
}
