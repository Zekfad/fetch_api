import 'dart:js_interop';

import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../readable_stream.dart' show ReadableStream;
import 'request.dart';


/// [Request.body] union type.
extension type RequestBody._(JSAny _) implements JSAny {
  /// Wrap [Blob] to [RequestBody] union.
  factory RequestBody.fromBlob(Blob body) = _RequestBodyBlob;
  /// Wrap [FormData] to [RequestBody] union.
  factory RequestBody.fromFormData(FormData body) = _RequestBodyFormData;
  /// Wrap [URLSearchParams] to [RequestBody] union.
  factory RequestBody.fromURLSearchParams(URLSearchParams body) = _RequestBodyURLSearchParams;
  /// Wrap [JSArrayBuffer] to [RequestBody] union.
  factory RequestBody.fromJSArrayBuffer(JSArrayBuffer body) = _RequestBodyJSArrayBuffer;
  /// Wrap [JSTypedArray] to [RequestBody] union.
  factory RequestBody.fromJSTypedArray(JSTypedArray body) = _RequestBodyJSTypedArray;
  /// Wrap [ReadableStream] to [RequestBody] union.
  factory RequestBody.fromReadableStream(ReadableStream<JSUint8Array, JSAny> body) = _RequestBodyReadableStream;
  /// Wrap [JSString] to [RequestBody] union.
  factory RequestBody.fromJSString(JSString body) = _RequestBodyJSString;

  /// Try to create [RequestBody] from JS value.
  factory RequestBody.fromJSAny(JSAny _body) => switch(_body) {
    final Blob body when _body.isA<Blob>() => RequestBody.fromBlob(body),
    final FormData body when _body.isA<FormData>() => RequestBody.fromFormData(body),
    final URLSearchParams body when _body.isA<URLSearchParams>() => RequestBody.fromURLSearchParams(body),
    final JSArrayBuffer body when _body.isA<JSArrayBuffer>() => RequestBody.fromJSArrayBuffer(body),
    final JSTypedArray body when _body.isA<JSTypedArray>() => RequestBody.fromJSTypedArray(body),
    final ReadableStream<JSUint8Array, JSAny> body when _body.isA<ReadableStream<JSUint8Array, JSAny>>()  => RequestBody.fromReadableStream(body),
    final JSString body when _body.isA<JSString>() => RequestBody.fromJSString(body),
    _ => throw StateError('Invalid state of body: unknown type: ${_body.runtimeType}'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this;
}

extension type _RequestBodyBlob(Blob _) implements Blob, RequestBody {}
extension type _RequestBodyFormData(FormData _) implements FormData, RequestBody {}
extension type _RequestBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, RequestBody {}
extension type _RequestBodyJSArrayBuffer(JSArrayBuffer _) implements JSArrayBuffer, RequestBody {}
extension type _RequestBodyJSTypedArray(JSTypedArray _) implements JSTypedArray, RequestBody {}
extension type _RequestBodyReadableStream(ReadableStream<JSUint8Array, JSAny> _) implements ReadableStream, RequestBody {}
extension type _RequestBodyJSString(JSString _) implements JSString, RequestBody {}
