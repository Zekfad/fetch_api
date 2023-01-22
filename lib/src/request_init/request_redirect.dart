/// How to handle a redirect response.
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

  final String value;

  @override
  String toString() => value;
}
