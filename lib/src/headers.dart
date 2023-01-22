import '_js.dart';
import 'iterator.dart' as js;
import 'iterator_wrapper.dart';


@JS()
@staticInterop
class Headers {
  /// Creates empty [Headers].
  factory Headers() => Headers._();

  /// Creates [Headers] from [Map].
  factory Headers.fromMap(Map<String, String> init) =>
    Headers._init(init.toJsObject());

  /// Creates [Headers] from array of 2 items arrays. 
  factory Headers.fromArray(List<List<String>> init) {
    final _init = JsArray<JsArray<dynamic>>();
    for (final header in init) {
      if (header.length != 2)
        throw Exception('Bad argument');

      _init.add(header.toJsArray());
    }
    return Headers._init(_init);
  }

  /// Creates a new [Headers] object.
  @JS('Headers')
  external factory Headers._();

  /// Creates a new [Headers] object.
  @JS('Headers')
  external factory Headers._init(dynamic init);
}

extension HeadersExtension on Headers {
  /// Appends a new value onto an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  external void append(String name, String value);

  /// Deletes a header from a [Headers] object.
  external void delete(String name);

  /// Returns an `iterator` allowing to go through all key/value pairs contained
  /// in this object.
  @JS('entries')
  external js.Iterator<List<String>> _entries();

  // forEach()

  /// Returns a [String] sequence of all the values of a header within
  /// a [Headers] object with a given name.
  external String? get(String name);

  /// Returns a [bool] stating whether a [Headers] object contains
  /// a certain header.
  external bool has(String name);

  /// Returns an `iterator` allowing you to go through all keys of the key/value
  /// pairs contained in this object.
  @JS('keys')
  external js.Iterator<String> _keys();

  /// Sets a new value for an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  external void set(String name, String value);

  /// Returns an `iterator` allowing you to go through all values of
  /// the key/value pairs contained in this object.
  @JS('values')
  external js.Iterator<String> _values();

  /// Returns an [IteratorWrapper] allowing to go through all key/value pairs
  /// contained in this object.
  IteratorWrapper<List<String>> entries() => IteratorWrapper(_entries());

  /// Returns an [IteratorWrapper] allowing you to go through all keys of the
  /// key/value pairs contained in this object.
  IteratorWrapper<String> keys() => IteratorWrapper(_keys());

  /// Returns an [IteratorWrapper] allowing you to go through all values of
  /// the key/value pairs contained in this object.
  IteratorWrapper<String> values() => IteratorWrapper(_values());
}
