import 'dart:js_interop';

import 'dart:typed_data' show ByteBuffer, TypedData;
import 'package:web/web.dart' show Blob, FormData, URLSearchParams;

import '../readable_stream.dart' show ReadableStream;


extension type ResponseBody._(Object? _) {
  factory ResponseBody.fromBlob(Blob blob) = _ResponseBodyBlob;
  factory ResponseBody.fromFormData(FormData blob) = _ResponseBodyFormData;
  factory ResponseBody.fromURLSearchParams(URLSearchParams blob) = _ResponseBodyURLSearchParams;
  factory ResponseBody.fromByteBuffer(ByteBuffer blob) = _ResponseBodyByteBuffer;
  factory ResponseBody.fromTypedData(TypedData blob) = _ResponseBodyTypedData;
  factory ResponseBody.fromReadableStream(ReadableStream blob) = _ResponseBodyReadableStream;
  factory ResponseBody.fromString(String string) = _ResponseBodyString;

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

  JSAny get toJS => this as JSAny;
}

extension type _ResponseBodyBlob(Blob _) implements Blob, ResponseBody {}
extension type _ResponseBodyFormData(FormData _) implements FormData, ResponseBody {}
extension type _ResponseBodyURLSearchParams(URLSearchParams _) implements URLSearchParams, ResponseBody {}
extension type _ResponseBodyByteBuffer(ByteBuffer _) implements ByteBuffer, ResponseBody {}
extension type _ResponseBodyTypedData(TypedData _) implements TypedData, ResponseBody {}
extension type _ResponseBodyReadableStream(ReadableStream _) implements ReadableStream, ResponseBody {}
extension type _ResponseBodyString(String _) implements String, ResponseBody {}
