import 'request.dart' if (dart.library.io) '';


/// The destination `read-only` property of the [Request] interface
/// returns a string describing the type of content being requested.
/// 
/// The `destination` is used by the user agent to, for example,
/// help determine which set of rules to follow for CORS purposes,
/// or how to navigate any complicated code paths that affect
/// how specific types of request get handled.
enum RequestDestination {
  /// The default value of `destination` is used for destinations that
  /// do not have their own value. `navigator.sendBeacon()`, `EventSource`,
  /// `<a ping>`, `<area ping>`, `fetch()`, `XMLHttpRequest`, `WebSocket`,
  /// `Cache` and more.
  byDefault(''),
  /// The target is audio data.
  audio('audio'),
  /// The target is data being fetched for use by an audio worklet.
  audioWorklet('audioworklet'),
  /// The target is a document (`HTML` or `XML`).
  document('document'),
  /// The target is embedded content.
  embed('embed'),
  /// The target is a font.
  font('font'),
  /// The target is an image.
  image('image'),
  /// The target is a manifest.
  manifest('manifest'),
  /// The target is an object.
  object('object'),
  /// The target is a paint worklet.
  paintWorklet('paintworklet'),
  /// The target is a report.
  report('report'),
  /// The target is a script.
  script('script'),
  /// The target is a service worker.
  serviceWorker('serviceworker'),
  /// The target is a shared worker.
  sharedworker('sharedworker'),
  /// The target is a style
  style('style'),
  /// The target is an HTML `<track>`.
  track('track'),
  /// The target is video data.
  video('video'),
  /// The target is a worker.
  worker('worker'),
  /// The target is an `XSLT` transform.
  xslt('xslt');

  const RequestDestination(this.value);

  factory RequestDestination.from(String value) =>
    values.firstWhere((element) => element.value == value);

  /// A string which indicates the type of content the request is asking for.
  /// This type is much broader than the usual document type values
  /// (such as `"document"` or `"manifest"`), and may include contextual cues
  /// such as `"image"` or `"worker"` or `"audioworklet"`.
  final String value;

  @override
  String toString() => value;
}
