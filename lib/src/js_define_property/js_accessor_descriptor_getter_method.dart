import 'dart:js_interop';
import 'js_accessor_descriptor.dart';


/// Interface for [JSAccessorDescriptor.get] method.
extension type JSAccessorDescriptorGetterMethod<T extends JSObject, R extends JSAny?>._(JSFunction _) implements JSFunction {
  /// Create new accessor descriptor get method from Dart function.
  factory JSAccessorDescriptorGetterMethod(R? Function(T context) fn) =>
    fn.toJSCaptureThis as JSAccessorDescriptorGetterMethod<T, R>;

  /// Return result of calling this getter.
  @JS()
  external R call(T context);
}
