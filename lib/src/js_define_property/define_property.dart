import 'dart:js_interop';

import 'js_property_descriptor.dart';
import 'js_string_or_js_symbol.dart';

/// The `Object.defineProperty()` static method defines a new property directly
/// on an object, or modifies an existing property on an object, and returns
/// the object.
@JS('Object.defineProperty')
external T defineProperty<T extends JSObject>(
  T object,
  JSStringOrJSSymbol property,
  JSPropertyDescriptor<T> descriptor,
);
