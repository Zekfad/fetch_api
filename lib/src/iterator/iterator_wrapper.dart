import 'dart:collection';
import 'dart:core';
import 'dart:js_interop';

import 'iterator.dart' as js;


/// Wrapper for [js.Iterator], implementing [Iterable] and [Iterator] APIs.
/// 
/// Such iterator can only be used once.
class IteratorWrapper<T extends JSAny> extends IterableBase<T> implements Iterator<T> {
  /// Create new [IteratorWrapper].
  IteratorWrapper(this._iterator);
 
  /// Target [js.Iterator].
  final js.Iterator<T> _iterator;

  /// Current value buffer.
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
