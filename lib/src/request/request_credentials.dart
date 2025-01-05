import '../request_options.dart' if (dart.library.io) '';


/// Controls what browsers do with credentials (cookies, HTTP authentication
/// entries, and TLS client certificates).
enum RequestCredentials {
  /// Tells browsers to include credentials with requests to same-origin URLs,
  /// and use any credentials sent back in responses from same-origin URLs.
  sameOrigin('same-origin'),
  /// Tells browsers to exclude credentials from the request, and ignore
  /// any credentials sent back in the response (e.g., any Set-Cookie header).
  omit('omit'),
  /// Tells browsers to include credentials in both same- and cross-origin
  /// requests, and always use any credentials sent back in responses.
  cors('include');

  const RequestCredentials(this.value);

  factory RequestCredentials.from(String value) =>
    values.firstWhere((element) => element.value == value);

  /// Enum string value that can be used in raw [RequestInit].
  final String value;

  @override
  String toString() => value;
}
