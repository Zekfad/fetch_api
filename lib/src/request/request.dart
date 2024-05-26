import 'dart:js_interop';

import 'dart:typed_data' show ByteBuffer;
import 'package:web/web.dart' show Blob, FormData;

import '../abort_signal.dart';
import '../headers.dart';
import '../readable_stream.dart' show ReadableStream;
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
extension type Request<AbortType extends JSAny>._(JSObject _) implements JSObject {
  /// Creates a new [Request] object.
  /// 
  /// [input] is a string containing the URL of the resource you want to fetch.
  /// The URL may be relative to the base URL, which is the document's
  /// `baseURI` in a window context, or `WorkerGlobalScope.location`
  /// in a worker context.
  factory Request(String input, [ RequestInit<AbortType>? options, ])
    => Request._new(input.toJS, options);

  /// Creates a new [Request] object.
  /// 
  /// [input] is a [Request] object, effectively creating a copy.
  /// Note the following behavioral updates to retain security while making
  /// the constructor less likely to throw exceptions:
  /// * If this object exists on another origin to the constructor call,
  ///   the [Request.referrer] is stripped out.
  /// * If this object has a [Request.mode] of [RequestMode.navigate],
  ///   the mode value is converted to [RequestMode.sameOrigin].
  factory Request.fromRequest(Request input, [ RequestInit<AbortType>? options, ])
    => Request._new(input, options);

  /// Creates a new [Request] object.
  /// 
  /// [input] defines the resource that you wish to fetch. This can either be:
  /// * A string containing the URL of the resource you want to fetch.
  ///   The URL may be relative to the base URL, which is the document's
  ///   `baseURI` in a window context, or `WorkerGlobalScope.location`
  ///   in a worker context.
  /// * A [Request] object, effectively creating a copy.
  ///   Note the following behavioral updates to retain security while making
  ///   the constructor less likely to throw exceptions:
  ///   * If this object exists on another origin to the constructor call,
  ///     the [Request.referrer] is stripped out.
  ///   * If this object has a [Request.mode] of [RequestMode.navigate],
  ///     the mode value is converted to [RequestMode.sameOrigin].
  @JS('')
  external factory Request._new(JSAny input, [ RequestInit<AbortType>? options, ]);

  /// A [ReadableStream] of the body contents.
  @JS()
  external final ReadableStream? body;

  /// Stores `true` or `false` to indicate whether or not
  /// the body has been used in a request yet.
  @JS()
  external final bool bodyUsed;

  /// Contains the cache mode of the request (e.g., `default`, `reload`,
  /// `no-cache`).
  @JS()
  external final String cache;

  /// Contains the credentials of the request (e.g., `omit`, `same-origin`,
  /// `include`).
  /// 
  /// The default is `same-origin`.
  @JS()
  external final String credentials;

  /// Returns a string describing the request's destination.
  /// This is a string indicating the type of content being requested.
  @JS()
  external final String destination;

  /// Contains the associated [Headers] object of the request.
  @JS()
  external final Headers headers;

  /// Contains the subresource integrity value of the request
  /// (e.g.,`sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`)
  @JS()
  external final String integrity;

  /// Contains the request's method (`GET`, `POST`, etc.)
  @JS()
  external final String method;

  /// Contains the mode of the request (e.g., `cors`, `no-cors`, `same-origin`,
  /// `navigate`.)
  @JS()
  external final String mode;

  /// Contains the mode for how redirects are handled.
  /// It may be one of `follow`, `error`, or `manual`.
  @JS()
  external final String redirect;

  /// Contains the referrer of the request (e.g., `client`).
  @JS()
  external final String referrer;

  /// Contains the referrer policy of the request (e.g., `no-referrer`).
  @JS()
  external final String referrerPolicy;

  /// Returns the AbortSignal associated with the request;
  @JS()
  external final AbortSignal<AbortType> signal;

  /// Contains the URL of the request.
  @JS()
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
  external JSPromise<JSArrayBuffer> _arrayBuffer();

  /// Returns a promise that resolves with a [Blob] representation of
  /// the request body.
  @JS('blob')
  external JSPromise<Blob> _blob();

  /// Creates a clone of a [Request] object.
  @JS()
  external Request clone();

  /// Returns a promise that resolves with a [FormData] representation of
  /// the request body.
  @JS('formData')
  external JSPromise<FormData> _formData();

  /// Returns a promise that resolves with the result of parsing the request
  /// body as `JSON`.
  @JS('json')
  external JSPromise<JSObject> _json();

  /// Returns a promise that resolves with a text representation of
  /// the request body.
  @JS('text')
  external JSPromise<JSString> _text();

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
  /// body as `JSON`.
  Future<Object?> json() =>
    _json().toDart.then((value) => value.dartify());

  /// Returns a promise that resolves with a text representation of
  /// the response body.
  Future<String> text() =>
    _text().toDart.then((value) => value.toDart);
}
