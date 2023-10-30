import 'dart:collection';
import 'dart:core';
import 'dart:core' as core;
import 'iterator.dart' as js;


/// Function that processes JS dynamic value into target class [T].
/// It is needed when JS value isn't exact type of [T], e.g. JS lists are
/// always dynamic.
typedef IteratorValueCaster<T> = T? Function(dynamic value);

/// Wrapper on top of [js.Iterator], implementing [Iterable] and [Iterator] APIs.
class IteratorWrapper<T> extends IterableBase<T> implements core.Iterator<T> {
  IteratorWrapper(this._iterator, [IteratorValueCaster<T>? valueCaster])
    : valueCaster = valueCaster ?? _valueCasterAs;

  /// Default value caster via `as`.
  static T? _valueCasterAs<T>(dynamic value) => value as T?; 

  /// Target [js.Iterator].
  final js.Iterator<T> _iterator;

  /// Function that processes JS dynamic value into target class [T].
  /// It is needed when JS value isn't exact type of [T], e.g. JS lists are
  /// always dynamic.
  final IteratorValueCaster<T> valueCaster;

  /// Current value buffer.
  T? _current;

  @override
  T get current => _current!;
  
  @override
  bool moveNext() {
    final next = _iterator.next();
    _current = valueCaster(next.value);
    return !(next.done ?? false);
  }

  @override
  Iterator<T> get iterator => this;
}
