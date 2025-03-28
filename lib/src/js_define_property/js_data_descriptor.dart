import 'dart:js_interop';

import 'js_property_descriptor.dart';


/// A data descriptor includes key and value pairs that contain a property's
/// value, regardless of whether that value is writable, configurable,
/// or enumerable.
extension type const JSDataDescriptor<T extends JSObject, R extends JSAny?>._(JSPropertyDescriptor<T> _) implements JSPropertyDescriptor<T> {
  /// Create new JavaScript property data descriptor.
  factory JSDataDescriptor({
    bool configurable = false,
    bool enumerable = false,
    bool writable = false,
    R? value,
  }) => JSDataDescriptor<T, R>._new(
    configurable: configurable,
    enumerable: enumerable,
    writable: writable,
    value: value,
  );

  @JS('')
  external factory JSDataDescriptor._new({
    bool configurable,
    bool enumerable,
    bool writable,
    R? value,
  });

  /// `true` if the value associated with the property may be changed with
  /// an assignment operator.
  @JS()
  external final bool writable; // Defaults to false.

  /// The value associated with the property. Can be any valid JavaScript value
  /// (number, object, function, etc.).
  @JS()
  external final R? value; // Defaults to undefined.
}
