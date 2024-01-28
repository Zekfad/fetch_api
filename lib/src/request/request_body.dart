import 'dart:js_interop';

import 'dart:typed_data' show ByteBuffer, TypedData;
import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../readable_stream.dart' show ReadableStream;
import 'request.dart';


/// [Request.body] union type.
extension type RequestBody._(Object? _) {
  /// Wrap [Blob] to [RequestBody] union.
  factory RequestBody.fromBlob(Blob blob) = _RequestBodyBlob;
  /// Wrap [FormData] to [RequestBody] union.
  factory RequestBody.fromFormData(FormData blob) = _RequestBodyFormData;
  /// Wrap [URLSearchParams] to [RequestBody] union.
  factory RequestBody.fromURLSearchParams(URLSearchParams blob) = _RequestBodyURLSearchParams;
  /// Wrap [ByteBuffer] to [RequestBody] union.
  factory RequestBody.fromByteBuffer(ByteBuffer blob) = _RequestBodyByteBuffer;
  /// Wrap [TypedData] to [RequestBody] union.
  factory RequestBody.fromTypedData(TypedData blob) = _RequestBodyTypedData;
  /// Wrap [ReadableStream] to [RequestBody] union.
  factory RequestBody.fromReadableStream(ReadableStream blob) = _RequestBodyReadableStream;
  /// Wrap [String] to [RequestBody] union.
  factory RequestBody.fromString(String string) = _RequestBodyString;

  /// Try to create [RequestBody] from JS value.
  factory RequestBody.fromJSAny(JSAny _body) => switch(_body) {
    final Blob body => RequestBody.fromBlob(body),
    final FormData body => RequestBody.fromFormData(body),
    final URLSearchParams body => RequestBody.fromURLSearchParams(body),
    // ignore: pattern_never_matches_value_type
    final ByteBuffer body => RequestBody.fromByteBuffer(body),
    // ignore: pattern_never_matches_value_type
    final TypedData body => RequestBody.fromTypedData(body),
    final ReadableStream body => RequestBody.fromReadableStream(body),
    // ignore: pattern_never_matches_value_type
    final String body => RequestBody.fromString(body),
    _ => throw StateError('Invalid state of body: unknown type: ${_body.runtimeType}'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this as JSAny;
}

extension type _RequestBodyBlob(Blob _) implements Blob, RequestBody {}
extension type _RequestBodyFormData(FormData _) implements FormData, RequestBody {}
extension type _RequestBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, RequestBody {}
extension type _RequestBodyByteBuffer(ByteBuffer _) implements ByteBuffer, RequestBody {}
extension type _RequestBodyTypedData(TypedData _) implements TypedData, RequestBody {}
extension type _RequestBodyReadableStream(ReadableStream _) implements ReadableStream, RequestBody {}
extension type _RequestBodyString(String _) implements String, RequestBody {}
