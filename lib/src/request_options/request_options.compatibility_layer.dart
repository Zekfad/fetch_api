part of 'request_options.dart';


RequestOptions createRequestOptions({
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
