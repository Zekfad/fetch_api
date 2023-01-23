import '../_js.dart';
import '../iterator.dart' as js;
import '../iterator_wrapper.dart';
import '../response.dart';

part 'headers.compatibility_layer.dart';


/// The [Headers] interface of the Fetch API allows you to perform various
/// actions on HTTP request and response headers. These actions include
/// retrieving, setting, adding to, and removing headers from the list of
/// the request's headers.
/// 
/// A [Headers] object has an associated header list, which is initially empty
/// and consists of zero or more name and value pairs. You can add to this using
/// methods like `append()`. In all methods of this interface, header names are
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
/// You can retrieve a [Headers] object via the `Request.headers` and
/// [ResponseInstanceMembers.headers] properties, and create
/// a new [Headers] object using the `Headers()` constructor.
@JS()
@staticInterop
class Headers {
  /// Creates a new [Headers] object.
  @JS('Headers')
  external factory Headers();

  /// Creates a new [Headers] object.
  @JS('Headers')
  external factory Headers._init(dynamic init);

  /// Warning: available only with Dart 3.0 or higher.
  /// Creates [Headers] from [Map].
  factory Headers.fromMap(Map<String, String> init) =>
    Headers._init(init.toJsObject());

  /// Warning: available only with Dart 3.0 or higher.
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
}

extension HeadersInstanceMembers on Headers {
  /// Appends a new value onto an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  external void append(String name, String value);

  /// Deletes a header from a [Headers] object.
  external void delete(String name);

  /// Returns an [js.Iterator] allowing to go through all key/value pairs
  /// contained in this object.
  @JS('entries')
  external js.Iterator<List<String>> _entries();

  // forEach()

  /// Returns a [String] sequence of all the values of a header within
  /// a [Headers] object with a given name.
  external String? get(String name);

  /// Returns a [bool] stating whether a [Headers] object contains
  /// a certain header.
  external bool has(String name);

  /// Returns an [js.Iterator] allowing you to go through all keys of
  /// the key/value pairs contained in this object.
  @JS('keys')
  external js.Iterator<String> _keys();

  /// Sets a new value for an existing header inside a [Headers] object,
  /// or adds the header if it does not already exist.
  external void set(String name, String value);

  /// Returns an [js.Iterator] allowing you to go through all values of
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
