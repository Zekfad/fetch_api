import 'dart:js_interop';

import 'dart:typed_data' show ByteBuffer, TypedData;
import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../readable_stream.dart' show ReadableStream;
import 'response.dart';


/// [Response.body] union type.
extension type ResponseBody._(Object? _) {
  /// Wrap [Blob] to [ResponseBody] union.
  factory ResponseBody.fromBlob(Blob blob) = _ResponseBodyBlob;
  /// Wrap [FormData] to [ResponseBody] union.
  factory ResponseBody.fromFormData(FormData blob) = _ResponseBodyFormData;
  /// Wrap [URLSearchParams] to [ResponseBody] union.
  factory ResponseBody.fromURLSearchParams(URLSearchParams blob) = _ResponseBodyURLSearchParams;
  /// Wrap [ByteBuffer] to [ResponseBody] union.
  factory ResponseBody.fromByteBuffer(ByteBuffer blob) = _ResponseBodyByteBuffer;
  /// Wrap [TypedData] to [ResponseBody] union.
  factory ResponseBody.fromTypedData(TypedData blob) = _ResponseBodyTypedData;
  /// Wrap [ReadableStream] to [ResponseBody] union.
  factory ResponseBody.fromReadableStream(ReadableStream blob) = _ResponseBodyReadableStream;
  /// Wrap [String] to [ResponseBody] union.
  factory ResponseBody.fromString(String string) = _ResponseBodyString;

  /// Try to create [ResponseBody] from JS value.
  factory ResponseBody.fromJSAny(JSAny _body) => switch(_body) {
    final Blob body => ResponseBody.fromBlob(body),
    final FormData body => ResponseBody.fromFormData(body),
    final URLSearchParams body => ResponseBody.fromURLSearchParams(body),
    // ignore: pattern_never_matches_value_type
    final ByteBuffer body => ResponseBody.fromByteBuffer(body),
    // ignore: pattern_never_matches_value_type
    final TypedData body => ResponseBody.fromTypedData(body),
    final ReadableStream body => ResponseBody.fromReadableStream(body),
    // ignore: pattern_never_matches_value_type
    final String body => ResponseBody.fromString(body),
    _ => throw StateError('Invalid state of body: unknown type: ${_body.runtimeType}'),
  };

  /// Convert to target JS value.
  JSAny get toJS => this as JSAny;
}

extension type _ResponseBodyBlob(Blob _) implements Blob, ResponseBody {}
extension type _ResponseBodyFormData(FormData _) implements FormData, ResponseBody {}
extension type _ResponseBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, ResponseBody {}
extension type _ResponseBodyByteBuffer(ByteBuffer _) implements ByteBuffer, ResponseBody {}
extension type _ResponseBodyTypedData(TypedData _) implements TypedData, ResponseBody {}
extension type _ResponseBodyReadableStream(ReadableStream _) implements ReadableStream, ResponseBody {}
extension type _ResponseBodyString(String _) implements String, ResponseBody {}
