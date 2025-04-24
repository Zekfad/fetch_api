import 'dart:js_interop';

import 'package:web/web.dart' show Blob, File, FormData, URLSearchParams;

import '../js_type_error.dart';
import '../readable_stream.dart' show ReadableStream;
import '../request_options.dart';


// Ordered as in RequestInit.body docs.

/// [RequestInit.body] union type.
extension type const RequestBody._(JSAny _) implements JSAny {
  /// Wrap [JSString] to [RequestBody] union.
  const factory RequestBody.fromJSString(JSString body) = _RequestBodyJSString;

  /// Wrap [JSArrayBuffer] to [RequestBody] union.
  const factory RequestBody.fromJSArrayBuffer(JSArrayBuffer body) = _RequestBodyJSArrayBuffer;

  /// Wrap [Blob] to [RequestBody] union.
  const factory RequestBody.fromBlob(Blob body) = _RequestBodyBlob;

  /// Wrap [JSDataView] to [RequestBody] union.
  const factory RequestBody.fromJSDataView(JSDataView body) = _RequestBodyJSDataView;

  /// Wrap [File] to [RequestBody] union.
  const factory RequestBody.fromFile(File body) = _RequestBodyFile;

  /// Wrap [FormData] to [RequestBody] union.
  const factory RequestBody.fromFormData(FormData body) = _RequestBodyFormData;

  /// Wrap [JSTypedArray] to [RequestBody] union.
  const factory RequestBody.fromJSTypedArray(JSTypedArray body) = _RequestBodyJSTypedArray;

  /// Wrap [URLSearchParams] to [RequestBody] union.
  const factory RequestBody.fromURLSearchParams(URLSearchParams body) = _RequestBodyURLSearchParams;

  /// Wrap [ReadableStream] to [RequestBody] union.
  const factory RequestBody.fromReadableStream(ReadableStream<JSUint8Array, JSAny> body) = _RequestBodyReadableStream;

  /// Try to create [RequestBody] from JS value.
  factory RequestBody.fromJSAny(JSAny body) => switch(body) {
    final JSString body when body.isA<JSString>() => RequestBody.fromJSString(body),
    final JSArrayBuffer body when body.isA<JSArrayBuffer>() => RequestBody.fromJSArrayBuffer(body),
    final Blob body when body.isA<Blob>() => RequestBody.fromBlob(body),
    final JSDataView body when body.isA<JSDataView>() => RequestBody.fromJSDataView(body),
    final File body when body.isA<File>() => RequestBody.fromFile(body),
    final FormData body when body.isA<FormData>() => RequestBody.fromFormData(body),
    final JSTypedArray body when body.isA<JSTypedArray>() => RequestBody.fromJSTypedArray(body),
    final URLSearchParams body when body.isA<URLSearchParams>() => RequestBody.fromURLSearchParams(body),
    final ReadableStream<JSUint8Array, JSAny> body when body.isA<ReadableStream<JSUint8Array, JSAny>>()  => RequestBody.fromReadableStream(body),
    _ => throw JSTypeError('${body.runtimeType} is not a valid RequestBody'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this;
}

extension type const _RequestBodyJSString(JSString _) implements JSString, RequestBody {}
extension type const _RequestBodyJSArrayBuffer(JSArrayBuffer _) implements JSArrayBuffer, RequestBody {}
extension type const _RequestBodyBlob(Blob _) implements Blob, RequestBody {}
extension type const _RequestBodyJSDataView(JSDataView _) implements JSDataView, RequestBody {}
extension type const _RequestBodyFile(File _) implements File, RequestBody {}
extension type const _RequestBodyFormData(FormData _) implements FormData, RequestBody {}
extension type const _RequestBodyJSTypedArray(JSTypedArray _) implements JSTypedArray, RequestBody {}
extension type const _RequestBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, RequestBody {}
extension type const _RequestBodyReadableStream(ReadableStream<JSUint8Array, JSAny> _) implements ReadableStream, RequestBody {}
