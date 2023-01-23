import '_js.dart';


/// In practice, neither property is strictly required; if an object without
/// either property is returned, it's effectively equivalent to
/// `{ done: false, value: undefined }`.
/// 
/// If an iterator returns a result with `done: true`, any subsequent calls
/// to `next()` are expected to return `done: true` as well, although
/// this is not enforced on the language level.
@JS()
@anonymous
class IteratorResult<T> {
  factory IteratorResult({
    bool done = false,
    T? value,
  }) => IteratorResult._(
    done: done,
    value: value,
  );

  external factory IteratorResult._({
    bool? done,
    T? value,
  });

  /// A boolean that's `false` if the iterator was able to produce
  /// the next value in the sequence. (This is equivalent to not specifying
  /// the done property altogether.)
  /// 
  /// Has the value `true` if the iterator has completed its sequence.
  /// In this case, value optionally specifies the return value of the iterator.
  external bool? done;

  /// Any JavaScript value returned by the iterator.
  /// Can be omitted when [done] is `true`.
  external dynamic value;
}
