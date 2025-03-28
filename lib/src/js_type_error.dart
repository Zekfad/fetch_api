/// Internal subclass of [TypeError] exposing additional details.
class JSTypeError extends TypeError {
  /// Create new [JSTypeError] instance.
  JSTypeError(this.message);

  /// Message describing the type error.
  final Object? message;

  @override
  String toString() {
    if (message != null) {
      return 'TypeError: ${Error.safeToString(message)}';
    }
    return 'TypeError';
  }
}
