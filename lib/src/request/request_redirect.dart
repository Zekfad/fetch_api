import '../request_options.dart' if (dart.library.io) '';


/// Specifies how to handle a redirect response.
enum RequestRedirect {
  /// Automatically follow redirects.
  follow('follow'),
  /// Abort with an error if a redirect occurs.
  error('error'),
  /// Caller intends to process the response in another context.
  manual('manual');

  const RequestRedirect(this.value);

  factory RequestRedirect.from(String value) =>
    values.firstWhere((element) => element.value == value);

  /// Enum string value that can be used in raw [RequestInit].
  final String value;

  @override
  String toString() => value;
}
