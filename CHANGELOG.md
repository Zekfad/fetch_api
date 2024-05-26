## 2.1.0

- Add `package:fetch_api/enums.dart` `fetch_api.enums` package with enumerations
  available to all platforms (including VM).
- Use `DOMException` from `package:web` instead of alias to`JSObject`.
- Enumerations use `if (dart.library.io) ''` for documentation-only imports,
  this allows to use them in non-JS environments.

## 2.0.0

- **BREAKING**: migrate to `package:web` with WASM support. 
- Full rewrite to use `extension type`s - no more `InstanceMembers`.
- Internal JS Iterators are now fully covered with generics.
- JS Iterator is no longer exported via public API.
- `Headers` uses `(String, String)` in entries instead of `List<String>`.
- `FetchOptions` and `RequestOptions` are now inherited from `RequestInit`
  and interchangeable.
- `ReadableStreamSource` `start`, `pull` and `cancel` are now only callable
  via JS interop, as they require binding to parent object.

## 1.0.3

- Remove type from `IteratorInstanceMembers` to support old language
  version.
  Technically this is a breaking, and `IteratorResult` falls back to `dynamic`
  now, but it isn't exposed via public API and wrapper still works the same.

## 1.0.2

- Change `Iterator` to static interop.
  Workaround for [sdk#53532](https://github.com/dart-lang/sdk/issues/53532).

## 1.0.1

- Downgraded `js` dependency to `^0.6.5` (#2).

## 1.0.0

- Public stable release.
- Bumped `js` dependency to `^0.6.7`.

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
