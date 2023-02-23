## 1.0.0

- Public stable release.
- Bumped `js` to 0.6.7.

## 1.0.0-dev.5

- **BREAKING**: Renamed `RequestInit` to `FetchOptions`.
  This is done to make emphasis, that `fetch` and `Request` have different
  (default) behaviors.
- Added `Request`.
- Added `RequestDuplex`. This adds support for request streaming in supported
  browsers.
- Added `ReadableStreamSource`. This allows you to create custom
  `ReadableStream`s, that is required for request streaming.
- Added `ReadableStreamDefaultController`.
- Added `ReadableStreamSource` class that helps you to create custom source
  for `ReadableStream`s. It can be created from Dart's `Stream`.
- Added `RequestCache`.
- Added `RequestDestination`.
- Added missing options to `RequestMode` and added docs.
- Added `FetchOptions` and `RequestOptions` with corresponding docs from MDN.
- Compatibility layer:
  - **BREAKING**: Renamed `createRequestInit` to `createFetchOptions`
  - Added `createRequestOptions`.
  - Added `createReadableStream`.
  - Added `createReadableStreamSourceFromStream`.
- Fixed dev dependencies versions, to allow running on Dart 2.19.


## 1.0.0-dev.4

- Fixes for `js.Iterator` with Arrays. (Resolves issue with `Headers`).

## 1.0.0-dev.3

- **BREAKING**: Renamed extensions from `<Class>Extension` to
  `<Class>InstanceMembers`.
- Added `fetch_api.compatibility_layer` library to support Dart 2.19.
  - Added `createHeadersFromMap`
  - Added `createHeadersFromArray` 
  - Added `createRequestInit`
  - Added `createAbortSignalTimeout`

- `AbortSignal`
  - Added `timeout` constructor-like method.
  - Added `abort` constructor-like method.
  - Added `aborted` property.
  - Added `reason` property.
  - Added `throwIfAborted` method.
- `AbortController`
  - Added docs.
- `fetch()` added docs.
- `Response`
  - Fixed internal definition for `_formData` method.
  - Added docs.
- `Headers`
  - Added docs.
- `Iterator` and `IteratorResult`
  - Added docs.
- `ReadableStreamDefaultReader` and `ReadableStreamDefaultReaderChunk`
  - Added docs.

## 1.0.0-dev.2

- Downgraded `js` dependency to `^0.6.5`.

## 1.0.0-dev.1

- Initial version.
