import 'dart:js_interop';

import '../headers.dart';


/// An object containing any custom settings that you want to apply to the
/// request.
extension type ResponseOptions._(JSObject _) implements JSObject {
  factory ResponseOptions({
    int status = 200,
    String statusText = '',
    Headers? headers,
  }) => ResponseOptions._new(
    status: status,
    statusText: statusText,
    headers: headers,
  );

  @JS()
  external factory ResponseOptions._new({
    int status,
    String statusText,
    Headers? headers,
  });
  
  /// The status code for the response, e.g., `200`.
  @JS()
  external int? status;

  /// The status message associated with the status code, e.g., `OK`.
  @JS()
  external String? statusText;

  /// Any headers you want to add to your response, contained within a [Headers]
  /// object or object literal of [String] key/value pairs (see HTTP headers
  /// for a reference).
  @JS()
  external Headers? headers;
}
