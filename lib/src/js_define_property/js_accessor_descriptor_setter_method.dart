import 'dart:js_interop';
import 'js_accessor_descriptor.dart';


/// Interface for [JSAccessorDescriptor.set] method.
extension type JSAccessorDescriptorSetterMethod<T extends JSObject>._(JSFunction _) implements JSFunction {
  /// Create new accessor descriptor set method from Dart function.
  factory JSAccessorDescriptorSetterMethod(Null Function(T context, JSAny? value) fn) =>
    fn.toJSCaptureThis as JSAccessorDescriptorSetterMethod<T>;

  /// Return result of calling this setter.
  @JS()
  // Strict interface
  // ignore: prefer_void_to_null
  external Null call(T context, JSAny? value);
}
