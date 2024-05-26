import 'dart:js_interop';

import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../readable_stream.dart' show ReadableStream;
import 'response.dart';


/// [Response.body] union type.
extension type ResponseBody._(JSAny _) implements JSAny {
  /// Wrap [Blob] to [ResponseBody] union.
  factory ResponseBody.fromBlob(Blob body) = _ResponseBodyBlob;
  /// Wrap [FormData] to [ResponseBody] union.
  factory ResponseBody.fromFormData(FormData body) = _ResponseBodyFormData;
  /// Wrap [URLSearchParams] to [ResponseBody] union.
  factory ResponseBody.fromURLSearchParams(URLSearchParams body) = _ResponseBodyURLSearchParams;
  /// Wrap [JSArrayBuffer] to [ResponseBody] union.
  factory ResponseBody.fromJSArrayBuffer(JSArrayBuffer body) = _ResponseBodyJSArrayBuffer;
  /// Wrap [JSTypedArray] to [ResponseBody] union.
  factory ResponseBody.fromJSTypedArray(JSTypedArray body) = _ResponseBodyJSTypedArray;
  /// Wrap [ReadableStream] to [ResponseBody] union.
  factory ResponseBody.fromReadableStream(ReadableStream<JSUint8Array, JSAny> body) = _ResponseBodyReadableStream;
  /// Wrap [JSString] to [ResponseBody] union.
  factory ResponseBody.fromJSString(JSString body) = _ResponseBodyJSString;

  /// Try to create [ResponseBody] from JS value.
  factory ResponseBody.fromJSAny(JSAny _body) => switch(_body) {
    final Blob body => ResponseBody.fromBlob(body),
    // ignore: unreachable_switch_case
    final FormData body => ResponseBody.fromFormData(body),
    // ignore: unreachable_switch_case
    final URLSearchParams body => ResponseBody.fromURLSearchParams(body),
    // ignore: unreachable_switch_case
    final JSArrayBuffer body => ResponseBody.fromJSArrayBuffer(body),
    // ignore: unreachable_switch_case
    final JSTypedArray body => ResponseBody.fromJSTypedArray(body),
    // ignore: unreachable_switch_case
    final ReadableStream<JSUint8Array, JSAny> body => ResponseBody.fromReadableStream(body),
    final JSString body => ResponseBody.fromJSString(body),
    _ => throw StateError('Invalid state of body: unknown type: ${_body.runtimeType}'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this;
}

extension type _ResponseBodyBlob(Blob _) implements Blob, ResponseBody {}
extension type _ResponseBodyFormData(FormData _) implements FormData, ResponseBody {}
extension type _ResponseBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, ResponseBody {}
extension type _ResponseBodyJSArrayBuffer(JSArrayBuffer _) implements JSArrayBuffer, ResponseBody {}
extension type _ResponseBodyJSTypedArray(JSTypedArray _) implements JSTypedArray, ResponseBody {}
extension type _ResponseBodyReadableStream(ReadableStream<JSUint8Array, JSAny> _) implements ReadableStream, ResponseBody {}
extension type _ResponseBodyJSString(JSString _) implements JSString, ResponseBody {}
