import 'dart:html' show Blob, FormData, UrlSearchParams;
import 'dart:typed_data' show ByteBuffer;

import '../_js.dart';
import '../headers.dart';
import '../readable_stream.dart';
import '../request_options.dart';
import 'request_cache.dart';
import 'request_credentials.dart';
import 'request_destination.dart';
import 'request_mode.dart';
import 'request_redirect.dart';
import 'request_referrer_policy.dart';


/// The [Request] interface of the Fetch API represents a resource request.
/// 
/// You can create a new [Request] object using the `Request()` constructor,
/// but you are more likely to encounter a [Request] object being returned as
/// the result of another API operation, such as a service worker
/// `FetchEvent.request`.
@JS()
@staticInterop
class Request {
  /// Creates a new [Request] object.
  /// 
  /// [body] is an object defining a body for the response.
  /// It can be `null` (which is the default value), or one of:
  /// [Blob], `ArrayBuffer` ([ByteBuffer]), `TypedArray`, `DataView`, [FormData],
  /// [ReadableStream], [UrlSearchParams], [String] or string literal.
  /// 
  /// [options] is an options object containing any custom settings that
  /// you want to apply to the response, or an empty object
  /// (which is the default value).
  external factory Request([dynamic body, RequestOptions? options]);
}

extension RequestInstanceMembers on Request {
  /// A [ReadableStream] of the body contents.
  external final ReadableStream? body;

  /// Stores `true` or `false` to indicate whether or not
  /// the body has been used in a request yet.
  external final bool bodyUsed;

  /// Contains the cache mode of the request (e.g., `default`, `reload`,
  /// `no-cache`).
  external final String cache;

  /// Contains the credentials of the request (e.g., `omit`, `same-origin`,
  /// `include`).
  /// 
  /// The default is `same-origin`.
  external final String credentials;

  /// Returns a string describing the request's destination.
  /// This is a string indicating the type of content being requested.
  external final String destination;

  /// Contains the associated [Headers] object of the request.
  external final Headers headers;

  /// Contains the subresource integrity value of the request
  /// (e.g.,`sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`)
  external final String integrity;

  /// Contains the request's method (`GET`, `POST`, etc.)
  external final String method;

  /// Contains the mode of the request (e.g., `cors`, `no-cors`, `same-origin`,
  /// `navigate`.)
  external final String mode;

  /// Contains the mode for how redirects are handled.
  /// It may be one of `follow`, `error`, or `manual`.
  external final String redirect;

  /// Contains the referrer of the request (e.g., `client`).
  external final String referrer;

  /// Contains the referrer policy of the request (e.g., `no-referrer`).
  external final String referrerPolicy;

  /// Contains the URL of the request.
  external final String url;

  /// Controls how the request will interact with the browser's HTTP cache.
  RequestCache get requestCache =>
    RequestCache.from(this.cache);

  /// Controls what browsers do with credentials (cookies, HTTP authentication
  /// entries, and TLS client certificates).
  RequestCredentials get requestCredentials =>
    RequestCredentials.from(this.credentials);

  /// This property is describing the request's destination.
  /// It is indicating the type of content being requested.
  RequestDestination get requestDestination =>
    RequestDestination.from(this.destination);

  /// Controls the mode you want to use for the request.
  RequestMode get requestMode =>
    RequestMode.from(this.mode);

  /// Controls how to handle a redirect response.
  RequestRedirect get requestRedirect =>
    RequestRedirect.from(this.redirect);

  /// Specifies the referrer policy to use for the request.
  RequestReferrerPolicy get requestReferrerPolicy =>
    RequestReferrerPolicy.from(this.referrerPolicy);

  /// Returns a promise that resolves with an [ByteBuffer] representation of
  /// the request body.
  @JS('arrayBuffer')
  external Promise<ByteBuffer> _arrayBuffer();

  /// Returns a promise that resolves with a [Blob] representation of
  /// the request body.
  @JS('blob')
  external Promise<Blob> _blob();

  /// Creates a clone of a [Request] object.
  external Request clone();

  /// Returns a promise that resolves with a [FormData] representation of
  /// the request body.
  @JS('formData')
  external Promise<FormData> _formData();

  /// Returns a promise that resolves with the result of parsing the request
  /// body as `JSON`.
  @JS('json')
  external Promise<dynamic> _json();

  /// Returns a promise that resolves with a text representation of
  /// the request body.
  @JS('text')
  external Promise<String> _text();

  /// Returns a [Future] that resolves with an [ByteBuffer] representation of
  /// the response body.
  Future<ByteBuffer> arrayBuffer() =>
    promiseToFuture(_arrayBuffer());

  /// Returns a [Future] that resolves with a [Blob] representation of
  /// the response body.
  Future<Blob> blob() =>
    promiseToFuture(_blob());

  /// Returns a [Future] that resolves with a [FormData] representation of
  /// the response body.
  Future<Blob> formData() =>
    promiseToFuture(_formData());

  /// Returns a [Future] that resolves with the result of parsing the response
  /// body as `JSON`.
  Future<dynamic> json() =>
    promiseToFuture<dynamic>(_json()).then(dartify);

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  Future<String> text() =>
    promiseToFuture(_text());
}
