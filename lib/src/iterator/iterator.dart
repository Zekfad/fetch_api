import 'dart:core' as core;

import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'iterator_method.dart';
import 'iterator_result.dart';
import 'iterator_symbol_method.dart';


@JS('Symbol.iterator')
external final JSSymbol _symbolIterator;

/// JavaScript iterator.
extension type Iterator<T extends JSAny>._(JSObject _) implements JSObject {
  /// Create new JavaScript [Iterator] from Dart handlers.
  factory Iterator({
    required IteratorResult<T> Function([T? value]) next,
    IteratorResult<T> Function([T? value])? returnValue,
    IteratorResult<T> Function([JSAny? error])? throwValue,
  }) {
    final object = Iterator._new$1(next: IteratorMethod(next));
    if (returnValue != null)
      object._return = IteratorMethod(returnValue);
    if (throwValue != null)
      object._throw = IteratorMethod(throwValue);
    object._.setProperty(
      _symbolIterator,
      IteratorSymbolMethod(() => object),
    );
    return object;
  }

  /// Create new [Iterator] with only [next] assigned.
  external factory Iterator._new$1({
    required IteratorMethod<T, T> next,
  });

  /// Function that returns this iterator.
  /// Works via `Symbol.iterator` and provides compatibility with other
  /// JS constructs such as `for...of`.
  IteratorSymbolMethod<T> get symbolIterator =>
    (_.getProperty(_symbolIterator)! as IteratorSymbolMethod<T>).bind(_);

  /// A function that accepts zero or one argument and returns an object
  /// conforming to the [IteratorResult] interface.
  /// 
  /// If a non-object value gets returned (such as `false` or `undefined`)
  /// when a built-in language feature (such as `for...of`) is using
  /// the iterator, a `TypeError` (`"iterator.next() returned a non-object
  /// value"`) will be thrown.
  IteratorResult<T> Function([T? value]) get next => _next.bind(_).call;
  set next(IteratorResult<T> Function([T? value]) fn) =>
    _next = IteratorMethod<T, T>(fn);

  /// A function that accepts zero or one argument and returns an object
  /// conforming to the [IteratorResult] interface, typically with
  /// [IteratorResult.value] equal to the `value` passed in and
  /// [IteratorResult.done] equal to `true`. Calling this method tells
  /// the iterator that the caller does not intend to make any more [next] calls
  /// and can perform any cleanup actions.
  IteratorResult<T> Function([T? value])? get returnValue => _return?.bind(_).call;
  set returnValue(IteratorResult<T> Function([T? value])? fn) {
    if (fn == null)
      _.delete('return'.toJS);
    else
      _return = IteratorMethod<T, T>(fn);
  }

  /// A function that accepts zero or one argument and returns an object
  /// conforming to the IteratorResult interface, typically with
  /// [IteratorResult.done] equal to `true`.
  /// Calling this method tells the iterator that the caller detects an error
  /// condition, and exception is typically an `Error` instance.
  IteratorResult<T> Function([JSAny? value])? get throwValue => _throw?.bind(_).call;
  set throwValue(IteratorResult<T> Function([JSAny? value])? fn) {
    if (fn == null)
      _.delete('throw'.toJS);
    else
      _throw = IteratorMethod<T, JSAny>(fn);
  }

  @JS('next')
  external IteratorMethod<T, T> _next;

  @JS('return')
  external IteratorMethod<T, T>? _return;

  @JS('throw')
  external IteratorMethod<T, JSAny>? _throw;
}
