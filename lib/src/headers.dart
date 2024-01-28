import 'dart:js_interop';

import 'js_iterator.dart';
import 'request.dart';
import 'response.dart';


/// The [Headers] interface of the Fetch API allows you to perform various
/// actions on HTTP request and response headers. These actions include
/// retrieving, setting, adding to, and removing headers from the list of
/// the request's headers.
/// 
/// A [Headers] object has an associated header list, which is initially empty
/// and consists of zero or more name and value pairs. You can add to this using
/// methods like [append]. In all methods of this interface, header names are
/// matched by case-insensitive byte sequence.
/// 
/// For security reasons, some headers can only be controlled by the user agent.
/// These headers include the forbidden header names and forbidden response
/// header names.
/// 
/// A [Headers] object also has an associated guard, which takes
/// a value of `immutable`, `request`, `request-no-cors`, `response`, or `none`.
/// This affects whether the `set()`, `delete()`, and `append()` methods will
/// mutate the header.
/// 
/// You can retrieve a [Headers] object via the [Request.headers] and
/// [Response.headers] properties, and create a new [Headers] object using
/// the [Headers.new] constructor.
extension type Headers._(JSObject _) implements JSObject {
  /// Creates a new [Headers] object.
  @JS()
  external factory Headers([Headers? init]);

  /// Creates a new [Headers] object.
  /// 
  /// In TS [init] would be `Headers | Array<[string,string]> | {[name:string]:string}`
  /// 
  /// [init] is an object containing any HTTP headers that you want to
  /// pre-populate your [Headers] object with. This can be a simple object
  /// literal with [String] values, an array of name-value pairs, where each
  /// pair is a 2-element string array; or an existing [Headers] object.
  /// In the last case, the new [Headers] object copies its data from
  /// the existing [Headers] object.
  @JS('Headers')
  external factory Headers._new([JSObject? init]);

  /// Creates [Headers] from [Map].
  factory Headers.fromMap(Map<String, String> init) =>
    Headers._new(init.jsify()! as JSObject);

  /// Creates [Headers] from an array of key-value pairs. 
  factory Headers.fromArray(List<(String, String)> init) =>
    Headers._new(
      init.map(
        (element) => [ element.$1.toJS, element.$2.toJS, ].toJS,
      ).toList().toJS,
    );

  /// Appends a new value onto an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  @JS()
  external void append(String name, String value);

  /// Deletes a header from a [Headers] object.
  @JS()
  external void delete(String name);

  /// Returns an [JSIterator] allowing to go through all key/value pairs
  /// contained in this object.
  @JS('entries')
  external JSIterator<JSArray<JSString>> _entries();

  // forEach()

  /// Returns a [String] sequence of all the values of a header within
  /// a [Headers] object with a given name.
  external String? get(String name);

  // getSetCookie()

  /// Returns a [bool] stating whether a [Headers] object contains
  /// a certain header.
  external bool has(String name);

  /// Returns an [JSIterator] allowing you to go through all keys of
  /// the key/value pairs contained in this object.
  @JS('keys')
  external JSIterator<JSString> _keys();

  /// Sets a new value for an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  external void set(String name, String value);

  /// Returns an [JSIterator] allowing you to go through all values of
  /// the key/value pairs contained in this object.
  @JS('values')
  external JSIterator<JSString> _values();

  /// Returns an [Iterable] allowing to go through all key/value pairs
  /// contained in this object.
  Iterable<(String, String)> entries() => _entries().toDartIterable.map(
    (element) {
      final [ key, value, ] = element.toDart;
      return (key.toDart, value.toDart);
    }
  );

  /// Returns an [Iterable] allowing you to go through all keys of the
  /// key/value pairs contained in this object.
  Iterable<String> keys() => _keys().toDartIterable.map(
    (element) => element.toDart,
  );

  /// Returns an [Iterable] allowing you to go through all values of
  /// the key/value pairs contained in this object.
  Iterable<String> values() => _values().toDartIterable.map(
    (element) => element.toDart,
  );
}
