import 'dart:html' show Blob, FormData, UrlSearchParams;
import 'dart:typed_data' show ByteBuffer;

import '../_js.dart';
import '../abort_controller.dart';
import '../abort_signal.dart';
import '../headers.dart';
import '../readable_stream.dart';
import '../request.dart';

part 'fetch_options.compatibility_layer.dart';


/// An object containing any custom options that you want to apply to the fetch
/// request.
@JS()
@anonymous
class FetchOptions {
  factory FetchOptions({
    String method = 'GET',
    Headers? headers,
    dynamic body,
    RequestMode mode = RequestMode.noCors,
    RequestCredentials credentials = RequestCredentials.sameOrigin,
    RequestCache cache = RequestCache.byDefault,
    RequestRedirect redirect = RequestRedirect.follow,
    String referrer = '',
    RequestReferrerPolicy referrerPolicy = RequestReferrerPolicy.strictOriginWhenCrossOrigin,
    String integrity = '',
    bool keepalive = false,
    AbortSignal? signal,
    RequestDuplex? duplex,
  }) {
    final options = FetchOptions._(
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

  external factory FetchOptions._({
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
    String? duplex,
  });

  /// The request method, e.g., `GET`, `POST`.
  /// 
  /// Note that the `Origin` header is not set on Fetch requests with a method
  /// of `HEAD` or `GET`.
  external String method;

  /// Any headers you want to add to your request, contained within a [Headers]
  /// object or an object literal with [String] values.
  /// 
  /// Note that some names are forbidden.
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
  /// or `same-origin`.
  external String mode;

  /// Controls what browsers do with credentials (cookies, HTTP authentication
  /// entries, and TLS client certificates).
  external String credentials;

  /// A string indicating how the request will interact with the browser's
  /// HTTP cache.
  external String cache;

  /// How to handle a redirect response.
  external String redirect;

  /// A string specifying the referrer of the request.
  /// This can be a same-origin URL, `about:client`, or an empty string.
  external String referrer;

  /// Specifies the referrer policy to use for the request.
  external String referrerPolicy;

  /// Contains the subresource integrity value of the request
  /// (e.g.,`sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`)
  external String integrity;

  /// The `keepalive` option can be used to allow the request to outlive
  /// the page. Fetch with the `keepalive` flag is a replacement for the
  /// `Navigator.sendBeacon()` API.
  external bool keepalive;

  /// An [AbortSignal] object instance; allows you to communicate
  /// with a fetch request and abort it if desired via an [AbortController].
  external AbortSignal? signal;

  /// Request duplex mode (if enabled).
  /// Required to use [ReadableStream] as body.
  external String? duplex;
}

extension FetchOptionsInstanceMembers on FetchOptions {
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
