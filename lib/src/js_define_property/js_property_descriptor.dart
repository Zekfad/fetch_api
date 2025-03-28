import 'dart:js_interop';

import 'js_accessor_descriptor.dart';
import 'js_data_descriptor.dart';


/// Property descriptors present in objects come in two main flavors:
/// data descriptors and accessor descriptors.
/// A data descriptor is a property with a value that may or
/// may not be writable. An accessor descriptor is a property described by
/// a getter-setter pair of functions.
/// A descriptor must be one of these two flavors; it cannot be both.
/// Use [JSDataDescriptor] and [JSAccessorDescriptor] constructors to create
/// new descriptor.
extension type const JSPropertyDescriptor<T extends JSObject>._(JSObject _) implements JSObject {
  /// When this is set to `false`:
  /// * The type of this property cannot be changed between data property
  ///   and accessor property.
  /// * The property may not be deleted.
  /// * Other attributes of this property's descriptor cannot be changed
  ///   (however, if it's a data descriptor with `writable: true`,
  ///   the value can be changed, and `writable` can be changed to false).
  @JS()
  external final bool configurable; // Defaults to false.

  /// `true` if and only if this property shows up during enumeration
  /// of the properties on the corresponding object.
  @JS()
  external final bool enumerable; // Defaults to false.
}
