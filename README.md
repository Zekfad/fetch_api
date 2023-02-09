# Fetch API.

> Some methods are working only with Dart 3.0, see
> [compatibility_layer](lib/compatibility_layer.dart) for more info.

This package provides JavaScript bindings to
[Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API).

## Features

* Full fetch options / request parameters coverage
* Cancel requests via `AbortController`.
* Read response
  * As text (`String`)
  * As `Blob`
  * As `Stream` of `Uint8List`
* Response streaming
* Request streaming (check [compatibility](https://developer.mozilla.org/en-US/docs/Web/API/Request#browser_compatibility))
* Get access to redirect status
* Support non-`200` responses

## Some notes about `fetch` and `Request`

`fetch` and `Request` have same options but different semantics, e.g. `fetch`'s
default mode is `no-cors` while `Request` is `cors`. Therefore options objects
for this function and constructor made as different classes.
For more info about that read [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API).
