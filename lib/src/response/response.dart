import 'dart:html' show Blob, FormData;
import 'dart:typed_data';

import '../_js.dart';
import '../headers.dart';
import '../readable_stream.dart';
import 'response_options.dart';
import 'response_type.dart';


@JS()
@staticInterop
class Response {
  external factory Response([dynamic body, ResponseOptions? options]);
  external static Response error();
  external static Response redirect(String url, [int status = 302]);
}

extension ResponseExtension on Response {
  /// A [ReadableStream] of the body contents.
  external final ReadableStream? body;

  /// Stores a boolean value that declares whether the body has been used in a
  /// response yet.
  external final bool bodyUsed;

  /// The Headers object associated with the response.
  external final Headers headers;

  /// A boolean indicating whether the response was successful (status
  /// in the range `200` –`299`) or not.
  external final bool ok;

  /// Indicates whether or not the response is the result of a redirect
  /// (that is, its URL list has more than one entry).
  external final bool redirected;

  /// The status code of the response. (This will be `200` for a success).
  external final int status;

  /// The status message corresponding to the status code. (e.g., `OK` for `200`).
  external final String statusText;

  /// A [Promise] resolving to a [Headers] object, associated with
  /// the response with [headers] for values of the HTTP Trailer header.
  external final Promise<Headers>? trailers;

  /// The type of the response (e.g., basic, cors).
  external final String type;

  /// The URL of the response.
  external final String url;

  /// Returns a promise that resolves with an [ByteBuffer] representation of
  /// the response body.
  @JS('arrayBuffer')
  external Promise<ByteBuffer> _arrayBuffer();

  /// Returns a promise that resolves with a [Blob] representation of
  /// the response body.
  @JS('blob')
  external Promise<Blob> _blob();

  /// Creates a clone of a [Response] object.
  external Response clone();

  /// Returns a promise that resolves with a [FormData] representation of
  /// the response body.
  @JS('formData')
  external Promise<Blob> _formData();

  /// Returns a promise that resolves with the result of parsing the response
  /// body text as JSON.
  @JS('json')
  external Promise<dynamic> _json();

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  @JS('text')
  external Promise<String> _text();

  /// [trailers] converted to Dart's [Future].
  Future<Headers>? responseTrailers() =>
    // ignore: unnecessary_this
    this.trailers == null ? null : promiseToFuture(this.trailers!);

  /// The type of the response (e.g., basic, cors).
  // ignore: unnecessary_this
  ResponseType get responseType => ResponseType.from(this.type);

  /// Returns a [Future] that resolves with an [ByteBuffer] representation of
  /// the response body.
  Future<ByteBuffer> arrayBuffer() => promiseToFuture(_arrayBuffer());

  /// Returns a [Future] that resolves with a [Blob] representation of
  /// the response body.
  Future<Blob> blob() => promiseToFuture(_blob());

  /// Returns a [Future] that resolves with a [FormData] representation of
  /// the response body.
  Future<Blob> formData() => promiseToFuture(_formData());

  /// Returns a [Future] that resolves with the result of parsing the response
  /// body text as JSON.
  Future<dynamic> json() =>
    promiseToFuture<dynamic>(_json()).then(dartify);

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  Future<String> text() => promiseToFuture(_text());
}
