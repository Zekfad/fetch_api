import 'response.dart' if (dart.library.io) '';


/// The type of the response.
enum ResponseType {
  /// Normal, same origin response, with all headers exposed except "Set-Cookie".
  basic('basic'),
  /// Response was received from a valid cross-origin request.
  /// Certain headers and the body may be accessed.
  cors('cors'),
  /// Network error. No useful information describing the error is available.
  /// The [Response]'s status is 0, headers are empty and immutable.
  /// This is the type for a [Response] obtained from [Response.error].
  error('error'),
  /// Response for "no-cors" request to cross-origin resource.
  /// Severely restricted.
  opaque('opaque'),
  /// The fetch request was made with `redirect: "manual"`.
  /// The [Response]'s status is `0`, headers are empty, body is `null` and
  /// trailer is empty.
  opaqueRedirect('opaqueredirect');

  const ResponseType(this.value);

  factory ResponseType.from(String value) =>
    values.firstWhere((element) => element.value == value);

  final String value;

  @override
  String toString() => value;
}
