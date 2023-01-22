import '../_js.dart';
import '../headers.dart';


/// An object containing any custom settings that you want to apply to the
/// request.
@JS()
@anonymous
class ResponseOptions {
  external factory ResponseOptions({
    int? status,
    String? statusText,
    Headers? headers,
  });
  
  /// The status code for the response, e.g., `200`.
  external int? status;

  /// The status message associated with the status code, e.g., `OK`.
  external String? statusText;

  /// Any headers you want to add to your response, contained within a [Headers]
  /// object or object literal of [String] key/value pairs (see HTTP headers
  /// for a reference).
  external Headers? headers;
}
