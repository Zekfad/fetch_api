import 'request.dart' if (dart.library.io) '';
import 'request_mode.dart';
import 'request_redirect.dart';


/// The cache read-only property of the [Request] interface contains
/// the cache mode of the request. It controls how the request will interact
/// with the browser's HTTP cache.
enum RequestCache {
  /// The browser looks for a matching request in its HTTP cache.
  /// 
  /// * If there is a match and it is fresh, it will be returned from the cache.
  /// * If there is a match but it is stale, the browser will make
  ///   a conditional request to the remote server. If the server indicates
  ///   that the resource has not changed, it will be returned from the cache.
  ///   Otherwise the resource will be downloaded from the server and
  ///   the cache will be updated.
  /// * If there is no match, the browser will make a normal request,
  ///   and will update the cache with the downloaded resource.
  byDefault('default'),
  /// The browser fetches the resource from the remote server
  /// without first looking in the cache, and will not update the cache
  /// with the downloaded resource.
  noStore('no-store'),
  /// The browser fetches the resource from the remote server
  /// without first looking in the cache, but then will update the cache
  /// with the downloaded resource.
  reload('reload'),
  /// The browser looks for a matching request in its HTTP cache.
  /// 
  /// * If there is a match, fresh or stale, the browser will make
  ///   a conditional request to the remote server. If the server indicates
  ///   that the resource has not changed, it will be returned from the cache.
  ///   Otherwise the resource will be downloaded from the server and
  ///   the cache will be updated.
  /// * If there is no match, the browser will make a normal request,
  ///   and will update the cache with the downloaded resource.
  noCache('no-cache'),
  /// The browser looks for a matching request in its HTTP cache.
  /// 
  /// * If there is a match, fresh or stale, it will be returned from the cache.
  /// * If there is no match, the browser will make a normal request,
  ///   and will update the cache with the downloaded resource.
  forceCache('force-cache'),
  /// The browser looks for a matching request in its HTTP cache.
  /// 
  /// * If there is a match, fresh or stale, it will be returned from the cache.
  /// * If there is no match, the browser will respond
  ///   with a 504 Gateway timeout status.
  /// 
  /// The [onlyIfCached] mode can only be used if the request's mode
  /// is [RequestMode.sameOrigin]. Cached redirects will be followed
  /// if the request's redirect property is [RequestRedirect.follow]
  /// and the redirects do not violate the [RequestMode.sameOrigin] mode.
  onlyIfCached('only-if-cached');

  const RequestCache(this.value);

  factory RequestCache.from(String value) =>
    values.firstWhere((element) => element.value == value);

  final String value;

  @override
  String toString() => value;
}
