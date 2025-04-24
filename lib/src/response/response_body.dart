import 'dart:js_interop';

import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../js_type_error.dart';
import '../readable_stream.dart' show ReadableStream;
import 'response.dart';


// Ordered as in Response body parameter docs.
// Notice that File is not present in union.

/// [Response] constructor body parameter union type.
extension type const ResponseBody._(JSAny _) implements JSAny {
  /// Wrap [Blob] to [ResponseBody] union.
  const factory ResponseBody.fromBlob(Blob body) = _ResponseBodyBlob;

  /// Wrap [JSArrayBuffer] to [ResponseBody] union.
  const factory ResponseBody.fromJSArrayBuffer(JSArrayBuffer body) = _ResponseBodyJSArrayBuffer;

  /// Wrap [JSTypedArray] to [ResponseBody] union.
  const factory ResponseBody.fromJSTypedArray(JSTypedArray body) = _ResponseBodyJSTypedArray;

  /// Wrap [JSDataView] to [ResponseBody] union.
  const factory ResponseBody.fromJSDataView(JSDataView body) = _ResponseBodyJSDataView;

  /// Wrap [FormData] to [ResponseBody] union.
  const factory ResponseBody.fromFormData(FormData body) = _ResponseBodyFormData;
  /// Wrap [URLSearchParams] to [ResponseBody] union.

  const factory ResponseBody.fromReadableStream(ReadableStream<JSUint8Array, JSAny> body) = _ResponseBodyReadableStream;
  /// Wrap [JSString] to [ResponseBody] union.

  const factory ResponseBody.fromURLSearchParams(URLSearchParams body) = _ResponseBodyURLSearchParams;

  /// Wrap [ReadableStream] to [ResponseBody] union.
  const factory ResponseBody.fromJSString(JSString body) = _ResponseBodyJSString;

  /// Try to create [ResponseBody] from JS value.
  factory ResponseBody.fromJSAny(JSAny body) => switch(body) {
    final Blob body when body.isA<Blob>() => ResponseBody.fromBlob(body),
    final JSTypedArray body when body.isA<JSTypedArray>() => ResponseBody.fromJSTypedArray(body),
    final JSArrayBuffer body when body.isA<JSArrayBuffer>() => ResponseBody.fromJSArrayBuffer(body),
    final JSDataView body when body.isA<JSDataView>() => ResponseBody.fromJSDataView(body),
    final FormData body when body.isA<FormData>() => ResponseBody.fromFormData(body),
    final ReadableStream<JSUint8Array, JSAny> body when body.isA<ReadableStream<JSUint8Array, JSAny>>()  => ResponseBody.fromReadableStream(body),
    final URLSearchParams body when body.isA<URLSearchParams>() => ResponseBody.fromURLSearchParams(body),
    final JSString body when body.isA<JSString>() => ResponseBody.fromJSString(body),
    _ => throw JSTypeError('${body.runtimeType} is not a valid ResponseBody'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this;
}

extension type const _ResponseBodyBlob(Blob _) implements Blob, ResponseBody {}
extension type const _ResponseBodyJSArrayBuffer(JSArrayBuffer _) implements JSArrayBuffer, ResponseBody {}
extension type const _ResponseBodyJSTypedArray(JSTypedArray _) implements JSTypedArray, ResponseBody {}
extension type const _ResponseBodyJSDataView(JSDataView _) implements JSDataView, ResponseBody {}
extension type const _ResponseBodyFormData(FormData _) implements FormData, ResponseBody {}
extension type const _ResponseBodyReadableStream(ReadableStream<JSUint8Array, JSAny> _) implements ReadableStream, ResponseBody {}
extension type const _ResponseBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, ResponseBody {}
extension type const _ResponseBodyJSString(JSString _) implements JSString, ResponseBody {}
