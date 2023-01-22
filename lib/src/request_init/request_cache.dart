/// Mode indicating how the request will interact with the browser's HTTP
/// cache.
enum RequestCache {
  byDefault('default'),
  noStore('no-store'),
  reload('reload'),
  noCache('no-cache'),
  forceCache('force-cache'),
  onlyIfCached('only-if-cached');

  const RequestCache(this.value);

  factory RequestCache.from(String value) =>
    values.firstWhere((element) => element.value == value);

  final String value;

  @override
  String toString() => value;
}
