# Fetch API

[![pub package](https://img.shields.io/pub/v/fetch_api.svg)](https://pub.dev/packages/fetch_api)
[![package publisher](https://img.shields.io/pub/publisher/fetch_api.svg)](https://pub.dev/packages/fetch_api/publisher)

This package provides WASM-ready Dart bindings to JavaScript 
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
default mode is `no-cors` while `Request`'s `cors`. Therefore, options objects
of `fetch` function and `Request` constructor made as different extension
types, although they are interchangeable and both inherited from `RequestInit`.

For more info about that, read [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API).
