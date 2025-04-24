import 'dart:js_interop';

import 'package:web/web.dart' show Blob, File, FormData, URLSearchParams;

import '../abort_signal.dart';
import '../headers.dart';
import '../readable_stream.dart' show ReadableStream;
import '../request.dart';


/// An object containing `options` for [Request] constructor.
extension type RequestInit<AbortType extends JSAny>._(JSObject _) implements JSObject {
  /// Create new RequestInit object.
  factory RequestInit({
    required String method,
    required Headers? headers,
    required RequestBody? body,
    required RequestMode mode,
    required RequestCredentials credentials,
    required RequestCache cache,
    required RequestRedirect redirect,
    required String referrer,
    required RequestReferrerPolicy referrerPolicy,
    required String integrity,
    required bool keepalive,
    required AbortSignal<AbortType>? signal,
    required RequestDuplex? duplex,
  }) {
    final options = RequestInit<AbortType>._new(
      method: method,
      headers: headers ?? Headers(),
      body: body?.toJS,
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
    if (duplex != null) {
      options.requestDuplex = duplex;
    }
    return options;
  }

  @JS('')
  external factory RequestInit._new({
    String? method,
    Headers? headers,
    JSAny? body,
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
  /// The default is `GET`.
  @JS()
  external String method;

  /// Any headers you want to add to your request, contained within a [Headers]
  /// object or an object literal with [String] values.
  @JS()
  external Headers headers;

  /// Any body that you want to add to your request: this can be a [JSString],
  /// an [JSArrayBuffer], a [Blob], a [JSDataView], a [File], a [FormData],
  /// an [JSTypedArray], a [URLSearchParams] or a [ReadableStream].
  /// 
  /// This latest possibility is still experimental; check the compatibility
  /// information to verify you can use it.
  /// 
  /// Note that a request using the `GET` or `HEAD` method cannot have a body.
  RequestBody get body => RequestBody.fromJSAny(_body);
  set body(RequestBody body) => _body = body.toJS;

  @JS('body')
  external JSAny _body;

  /// The mode you want to use for the request, e.g., `cors`, `no-cors`,
  /// `same-origin`, or `navigate`.
  /// 
  /// The default is `cors`.
  @JS()
  external String mode;

  /// The request credentials you want to use for the request: `omit`,
  /// `same-origin`, or `include`.
  /// 
  /// The default is `same-origin`.
  @JS()
  external String credentials;

  /// The cache mode you want to use for the request.
  @JS()
  external String cache;

  /// The redirect mode to use: `follow`, `error`, or `manual`.
  /// 
  /// The default is `follow`.
  @JS()
  external String redirect;

  /// A string specifying `no-referrer`, `client`, or a URL.
  /// 
  /// The default is `about:client`.
  @JS()
  external String referrer;

  /// A string that changes how the referrer header is populated during
  /// certain actions (e.g., fetching subresources, prefetching,
  /// performing navigations).
  @JS()
  external String referrerPolicy;

  /// Contains the subresource integrity value of the request
  /// (e.g.,`sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`)
  @JS()
  external String integrity;

  /// A boolean that indicates whether to make a persistent connection
  /// for multiple requests/responses.
  @JS()
  external bool keepalive;

  /// An [AbortSignal] object which can be used to communicate with/abort
  /// a request.
  @JS()
  external AbortSignal<AbortType>? signal;

  /// Request duplex mode (if enabled).
  /// Required to use [ReadableStream] as body.
  @JS()
  external String? duplex;

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
