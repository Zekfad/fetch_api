import 'dart:collection';
import 'dart:core';
import 'dart:core' as core;
import 'iterator.dart' as js;


/// Wrapper on top of JS iterator, providing [Iterable] and [Iterator] APIs.
class IteratorWrapper<T> extends IterableBase<T> implements core.Iterator<T> {
  IteratorWrapper(this._iterator);

  final js.Iterator<T> _iterator;

  T? _current;

  @override
  T get current => _current!;
  
  @override
  bool moveNext() {
    final next = _iterator.next();
    _current = next.value;
    return !(next.done ?? false);
  }

  @override
  Iterator<T> get iterator => this;
}
