import 'dart:js_interop';

import 'js_accessor_descriptor_getter_method.dart';
import 'js_accessor_descriptor_setter_method.dart';
import 'js_property_descriptor.dart';


/// Accessor descriptors contain functions that execute when a property
/// is set, changed, or accessed.
extension type JSAccessorDescriptor<T extends JSObject, R extends JSAny?>._(JSPropertyDescriptor _) implements JSPropertyDescriptor<T> {
  /// Create new JavaScript property accessor descriptor.
  factory JSAccessorDescriptor({
    bool configurable = false,
    bool enumerable = false,
    R Function(T context)? get,
    Null Function(T context, JSAny? value)? set,
  }) {
    final descriptor = JSAccessorDescriptor<T, R>._new(
      configurable: configurable,
      enumerable: enumerable,
    );
    if (get != null)
      descriptor.get = JSAccessorDescriptorGetterMethod<T, R>(get);
    if (set != null)
      descriptor.set = JSAccessorDescriptorSetterMethod<T>(set);
    return descriptor;
  }

  @JS('')
  external factory JSAccessorDescriptor._new({
    bool configurable,
    bool enumerable,
    JSAccessorDescriptorGetterMethod<T, R>? get,
    JSAccessorDescriptorSetterMethod<T>? set,
  });

  /// A function which serves as a getter for the property, or `undefined` if
  /// there is no getter. When the property is accessed, this function
  /// is called without arguments and with `this` set to the object through
  /// which the property is accessed (this may not be the object on which
  /// the property is defined due to inheritance). The return value
  /// will be used as the value of the property.
  @JS()
  external JSAccessorDescriptorGetterMethod<T, R>? get; // Defaults to undefined.

  /// A function which serves as a setter for the property, or `undefined` if
  /// there is no setter. When the property is assigned, this function
  /// is called with one argument (the value being assigned to the property)
  /// and with this set to the object through which the property is assigned.
  @JS()
  external JSAccessorDescriptorSetterMethod<T>? set; // Defaults to undefined.
}
