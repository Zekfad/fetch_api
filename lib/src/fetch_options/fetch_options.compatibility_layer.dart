part of 'fetch_options.dart';


FetchOptions createFetchOptions({
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
