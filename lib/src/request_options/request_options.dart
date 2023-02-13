import 'dart:html' show Blob, FormData, UrlSearchParams;
import 'dart:typed_data' show ByteBuffer;

import '../_js.dart';
import '../abort_signal.dart';
import '../headers.dart';
import '../readable_stream.dart';
import '../request.dart';

part 'request_options.compatibility_layer.dart';


/// An object containing `options` for [Request] constructor.
@JS()
@anonymous
class RequestOptions {
  factory RequestOptions({
    String method = 'GET',
    Headers? headers,
    dynamic body,
    RequestMode mode = RequestMode.cors,
    RequestCredentials credentials = RequestCredentials.sameOrigin,
    RequestCache cache = RequestCache.byDefault,
    RequestRedirect redirect = RequestRedirect.follow,
    String referrer = 'about:client',
    RequestReferrerPolicy referrerPolicy = RequestReferrerPolicy.strictOriginWhenCrossOrigin,
    String integrity = '',
    bool keepalive = false,
    AbortSignal? signal,
    RequestDuplex? duplex,
  }) {
    final options = RequestOptions._(
      method: method,
      headers: headers ?? Headers(),
      body: body,
      mode: mode.toString(),
      credentials: credentials.toString(),
      cache: cache.toString(),
      redirect: redirect.toString(),
      referrer: referrer,
      referrerPolicy: referrerPolicy.toString(),
      integrity: integrity,
      keepalive: keepalive,
      signal: signal,
    );
    if (duplex != null)
      options.requestDuplex = duplex;
    return options;
  }

  external factory RequestOptions._({
    String? method,
    Headers? headers,
    dynamic body,
    String? mode,
    String? credentials,
    String? cache,
    String? redirect,
    String? referrer,
    String? referrerPolicy,
    String? integrity,
    bool? keepalive,
    AbortSignal? signal,
    // ignore: unused_element
    String? duplex,
  });

  /// The request method, e.g., `GET`, `POST`.
  /// 
  /// The default is `GET`.
  external String method;

  /// Any headers you want to add to your request, contained within a [Headers]
  /// object or an object literal with [String] values.
  external Headers headers;

  /// Any body that you want to add to your request: this can be a [Blob],
  /// an `ArrayBuffer` ([ByteBuffer]), a `TypedArray`, a `DataView`,
  /// a [FormData], a [UrlSearchParams], [String] object or literal,
  /// or a [ReadableStream] object.
  /// 
  /// This latest possibility is still experimental; check the compatibility
  /// information to verify you can use it.
  /// 
  /// Note that a request using the `GET` or `HEAD` method cannot have a body.
  external dynamic body;

  /// The mode you want to use for the request, e.g., `cors`, `no-cors`,
  /// `same-origin`, or `navigate`.
  /// 
  /// The default is `cors`.
  external String mode;

  /// The request credentials you want to use for the request: `omit`,
  /// `same-origin`, or `include`.
  /// 
  /// The default is `same-origin`.
  external String credentials;

  /// The cache mode you want to use for the request.
  external String cache;

  /// The redirect mode to use: `follow`, `error`, or `manual`.
  /// 
  /// The default is `follow`.
  external String redirect;

  /// A string specifying `no-referrer`, `client`, or a URL.
  /// 
  /// The default is `about:client`.
  external String referrer;

  /// A string that changes how the referrer header is populated during
  /// certain actions (e.g., fetching subresources, prefetching,
  /// performing navigations).
  external String referrerPolicy;

  /// Contains the subresource integrity value of the request
  /// (e.g.,`sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`)
  external String integrity;

  /// A boolean that indicates whether to make a persistent connection
  /// for multiple requests/responses.
  external bool keepalive;

  /// An [AbortSignal] object which can be used to communicate with/abort
  /// a request.
  external AbortSignal? signal;

  /// Request duplex mode (if enabled).
  /// Required to use [ReadableStream] as body.
  external String? duplex;
}

extension RequestOptionsInstanceMembers on RequestOptions {
  /// Controls the mode you want to use for the request.
  RequestMode get requestMode =>
    RequestMode.from(this.mode);
  set requestMode(RequestMode requestMode) =>
    this.mode = requestMode.toString();

  /// Controls what browsers do with credentials (cookies, HTTP authentication
  /// entries, and TLS client certificates).
  RequestCredentials get requestCredentials =>
    RequestCredentials.from(this.credentials);
  set requestCredentials(RequestCredentials requestCredentials) =>
    this.credentials = requestCredentials.toString();

  /// Controls how the request will interact with the browser's HTTP cache.
  RequestCache get requestCache =>
    RequestCache.from(this.cache);
  set requestCache(RequestCache requestCache) =>
    this.cache = requestCache.toString();

  /// Controls how to handle a redirect response.
  RequestRedirect get requestRedirect =>
    RequestRedirect.from(this.redirect);
  set requestRedirect(RequestRedirect requestRedirect) =>
    this.redirect = requestRedirect.toString();

  /// Specifies the referrer policy to use for the request.
  RequestReferrerPolicy get requestReferrerPolicy =>
    RequestReferrerPolicy.from(this.referrerPolicy);
  set requestReferrerPolicy(RequestReferrerPolicy requestReferrerPolicy) =>
    this.referrerPolicy = requestReferrerPolicy.toString();

  /// Specifies the request duplex mode.
  RequestDuplex? get requestDuplex =>
    this.duplex == null ? null : RequestDuplex.from(this.duplex!);
  set requestDuplex(RequestDuplex? requestDuplex) =>
    this.duplex = requestDuplex?.toString();
}
