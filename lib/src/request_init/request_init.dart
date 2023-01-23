import '../_js.dart';
import '../abort_signal.dart';
import '../headers.dart';

import 'request_cache.dart';
import 'request_credentials.dart';
import 'request_mode.dart';
import 'request_redirect.dart';
import 'request_referrer_policy.dart';


/// An object containing any custom settings that you want to apply to the
/// request.
@JS()
@anonymous
class RequestInit {
  factory RequestInit({
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
  }) => RequestInit._(
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

  external factory RequestInit._({
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
  });

  /// The request method, e.g., `GET`, POST.
  /// 
  /// Note that the `Origin` header is not set on Fetch requests with a method
  /// of `HEAD` or `GET`.
  external String method;

  /// Any headers you want to add to your request, contained within a [Headers]
  /// object or an object literal with [String] values.
  /// 
  /// Note that some names are forbidden.
  external Headers headers;

  /// Any body that you want to add to your request: this can be a Blob,
  /// an ArrayBuffer, a TypedArray, a DataView, a FormData, a URLSearchParams,
  /// string object or literal, or a ReadableStream object.
  /// This latest possibility is still experimental; check the compatibility
  /// information to verify you can use it.
  /// 
  /// Note that a request using the GET or HEAD method cannot have a body.
  external dynamic body;

  /// The mode you want to use for the request
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
  /// with a fetch request and abort it if desired via an `AbortController`.
  external AbortSignal? signal;
}

extension RequestInitInstanceMembers on RequestInit {
  /// The mode you want to use for the request
  RequestMode get requestMode => RequestMode.from(mode);
  set requestMode(RequestMode requestMode) =>
    mode = requestMode.toString();

  /// Controls what browsers do with credentials (cookies, HTTP authentication
  /// entries, and TLS client certificates).
  RequestCredentials get requestCredentials => RequestCredentials.from(credentials);
  set requestCredentials(RequestCredentials requestCredentials) =>
    credentials = requestCredentials.toString();

  /// A string indicating how the request will interact with the browser's
  /// HTTP cache.
  RequestCache get requestCache => RequestCache.from(cache);
  set requestCache(RequestCache requestCache) =>
    cache = requestCache.toString();

  /// How to handle a redirect response.
  RequestRedirect get requestRedirect => RequestRedirect.from(redirect);
  set requestRedirect(RequestRedirect requestRedirect) =>
    redirect = requestRedirect.toString();

  /// Specifies the referrer policy to use for the request.
  RequestReferrerPolicy get requestReferrerPolicy => RequestReferrerPolicy.from(referrerPolicy);
  set requestReferrerPolicy(RequestReferrerPolicy requestReferrerPolicy) =>
    referrerPolicy = requestReferrerPolicy.toString();
}
