import 'dart:js_interop';

import '../abort_signal.dart';
import '../headers.dart';
import '../request.dart';
import 'request_init.dart';


/// An object containing any custom options that you want to apply to the fetch
/// request.
extension type FetchOptions<AbortType extends JSAny>._(RequestInit<AbortType> _) implements RequestInit<AbortType>  {
  factory FetchOptions({
    String method = 'GET',
    Headers? headers,
    RequestBody? body,
    RequestMode mode = RequestMode.noCors,
    RequestCredentials credentials = RequestCredentials.sameOrigin,
    RequestCache cache = RequestCache.byDefault,
    RequestRedirect redirect = RequestRedirect.follow,
    String referrer = '',
    RequestReferrerPolicy referrerPolicy = RequestReferrerPolicy.strictOriginWhenCrossOrigin,
    String integrity = '',
    bool keepalive = false,
    AbortSignal<AbortType>? signal,
    RequestDuplex? duplex,
  }) => RequestInit<AbortType>(
    method: method,
    headers: headers ?? Headers(),
    body: body,
    mode: mode,
    credentials: credentials,
    cache: cache,
    redirect: redirect,
    referrer: referrer,
    referrerPolicy: referrerPolicy,
    integrity: integrity,
    keepalive: keepalive,
    signal: signal,
    duplex: duplex,
  ) as FetchOptions<AbortType>;
}
