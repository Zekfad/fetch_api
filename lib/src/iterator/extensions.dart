import 'dart:collection';
import 'dart:core';
import 'dart:core' as core;
import 'dart:js_interop';

import 'iterator.dart' as js;
import 'iterator_result.dart' as js;
import 'iterator_wrapper.dart';


/// [js.Iterator] <-> [core.Iterator]
extension JSIteratorToCoreIterator<T extends JSAny> on js.Iterator<T> {
  /// Create Dart [core.Iterator] from JS [js.Iterator].
  core.Iterator<T> get toDart => IteratorWrapper(this);
}

/// [core.Iterator] <-> [js.Iterator]
extension CoreIteratorToJSIterator<T extends JSAny> on core.Iterator<T> {
  /// Create JS [js.Iterator] from Dart [core.Iterator].
  js.Iterator get toJS =>
    js.Iterator<T>(
      next: ([value]) {
        if (!moveNext())
          return js.IteratorResult(done: true);
        return js.IteratorResult(value: current);
      },
    );
}

/// [js.Iterator] <-> [core.Iterable]
extension JSIteratorToCoreIterable<T extends JSAny> on js.Iterator<T> {
  /// Create Dart [core.Iterable] from JS [js.Iterator] using [IterableBase].
  core.Iterable<T> get toDartIterable => IteratorWrapper(this);
}

/// [core.Iterable] <-> [js.Iterator]
extension CoreIterableToJSIterator<T extends JSAny> on core.Iterable<T> {
  /// Create JS [js.Iterator] from Dart [core.Iterator].
  js.Iterator get toJSIterator => iterator.toJS;
}
