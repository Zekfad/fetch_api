import 'dart:js_interop';

import 'dart:typed_data' show ByteBuffer;
import 'package:web/web.dart' show Blob, FormData;

import '../headers.dart';
import '../readable_stream.dart' show ReadableStream;
import 'response_body.dart';
import 'response_options.dart';
import 'response_type.dart';

/// Workaround for not being able to have two different constructors with
/// same argument types.
@JS('Response.json')
external final JSFunction _jsonConstructor;

/// The [Response] interface of the Fetch API represents the response
/// to a request.
/// 
/// You can create a new [Response] object using the `Response()` constructor,
/// but you are more likely to encounter a [Response] object being returned
/// as the result of another API operation —for example, a service worker
/// `FetchEvent.respondWith`, or a simple `fetch()`.
@staticInterop
extension type Response._(JSObject _) implements JSObject {
  /// Creates a new [Response] object.
  factory Response([ ResponseBody? body, ResponseOptions? options, ]) =>
    Response._new(body?.toJS, options);

  /// Creates a new response with a different URL.
  factory Response.redirect(String url, [ int status = 302, ]) =>
    Response._redirect(url, status);

  /// Returns a new [Response] object associated with a network error.
  @JS()
  external factory Response.error();

  /// Returns a new [Response] object for returning the provided JSON encoded
  /// data.
  factory Response.json(Map<String, dynamic> data, [ ResponseOptions? options, ]) =>
    _jsonConstructor.callAsFunction(
      _jsonConstructor, data.jsify()! as JSObject,
      options,
    )! as Response;

  @JS('')
  external factory Response._new([ JSAny? body, ResponseOptions? options, ]); 

  @JS('redirect')
  external factory Response._redirect(String url, int status);

  /// A [ReadableStream] of the body contents.
  @JS()
  external final ReadableStream? body;

  /// Stores a boolean value that declares whether the body has been used in a
  /// response yet.
  @JS()
  external final bool bodyUsed;

  /// The Headers object associated with the response.
  @JS()
  external final Headers headers;

  /// A boolean indicating whether the response was successful (status
  /// in the range `200` –`299`) or not.
  @JS()
  external final bool ok;

  /// Indicates whether or not the response is the result of a redirect
  /// (that is, its URL list has more than one entry).
  @JS()
  external final bool redirected;

  /// The status code of the response. (This will be `200` for a success).
  @JS()
  external final int status;

  /// The status message corresponding to the status code. (e.g., `OK` for `200`).
  @JS()
  external final String statusText;

  /// The type of the response (e.g., basic, cors).
  @JS()
  external final String type;

  /// The URL of the response.
  @JS()
  external final String url;

  /// Returns a promise that resolves with an [ByteBuffer] representation of
  /// the response body.
  @JS('arrayBuffer')
  external JSPromise<JSArrayBuffer> _arrayBuffer();

  /// Returns a promise that resolves with a [Blob] representation of
  /// the response body.
  @JS('blob')
  external JSPromise<Blob> _blob();

  /// Creates a clone of a [Response] object.
  @JS()
  external Response clone();

  /// Returns a promise that resolves with a [FormData] representation of
  /// the response body.
  @JS('formData')
  external JSPromise<FormData> _formData();

  /// Returns a promise that resolves with the result of parsing the response
  /// body text as `JSON`.
  @JS('json')
  external JSPromise<JSObject> _json();

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  @JS('text')
  external JSPromise<JSString> _text();

  /// The type of the response (e.g., basic, cors).
  ResponseType get responseType =>
    ResponseType.from(type);

  /// Returns a [Future] that resolves with an [ByteBuffer] representation of
  /// the response body.
  Future<ByteBuffer> arrayBuffer() =>
    _arrayBuffer().toDart.then((value) => value.toDart);

  /// Returns a [Future] that resolves with a [Blob] representation of
  /// the response body.
  Future<Blob> blob() =>
    _blob().toDart;

  /// Returns a [Future] that resolves with a [FormData] representation of
  /// the response body.
  Future<FormData> formData() =>
    _formData().toDart;

  /// Returns a [Future] that resolves with the result of parsing the response
  /// body text as `JSON`.
  Future<Object?> json() =>
    _json().toDart.then((value) => value.dartify());

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  Future<String> text() =>
    _text().toDart.then((value) => value.toDart);
}
