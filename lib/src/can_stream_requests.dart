import 'dart:js_interop';

import 'js_define_property.dart';
import 'readable_stream.dart';
import 'request.dart';
import 'request_options.dart';


/// Whether current Browser support request streaming.
/// This indicates only a capability, target server may or may not be supported
/// because streaming works only on HTTP/2 or HTTP/3.
/// See [Chrome Developers blog](https://developer.chrome.com/docs/capabilities/web-apis/fetch-streaming-requests#doesnt-work-on-http1x)
/// for more info.
bool canStreamRequests() {
  var duplexAccessed = false;
  final options = RequestOptions(
    method: 'POST',
    body: RequestBody.fromReadableStream(ReadableStream()),
  );
  defineProperty<RequestOptions>(
    options,
    'duplex'.toJSStringOrJSSymbol,
    JSAccessorDescriptor(
      get: (context) {
        duplexAccessed = true;
        return RequestDuplex.half.value.toJS;
      },
    ),
  );
  final hasContentType = Request('', options).headers.has('Content-Type');
  return duplexAccessed && !hasContentType;
}
