## 2.3.1

- Fix lint errors.
- Use `package:zekfad_lints/lib.yaml` which aligns with core lints.

## 2.3.0

> Requires Dart 3.6

- Use proper JS type checks.
- Add missing docs to public API.
- Add missing `File` and `JSDataView` to `RequestBody` union.
- Add missing `JSDataView` to `ResponseBody` union.
- Update license years.
- `ReadableStreamSourceCancelMethodFunction` returns `JSPromiseOr`, because this
  method can return synchronously.
- Fix `ReadableStreamSource.fromStream` cancel after error ([#6](https://github.com/Zekfad/fetch_api/issues/6))
- Add `canStreamRequests` function to check if streaming is supported in
  current browsers.

## 2.2.0

> Current usage is mostly limited to `package:fetch_client` and these changes
> restores WASM support, therefore no major version bump was made.

- **BREAKING** `ReadableStreamDefaultReader.readAsStream` is now generic as
  in actual stream.
- **BREAKING** `ReadableStream.fromTypedDataStream` now have 2 generic
  parameters `T extends TypedData` and `AbortType extends JSAny` instead of
  single `AbortType`.
  Method itself now always returns `ReadableStream<JSUint8Array, AbortType>`,
  this means that any `TypedData` is re-viewed to be `Uint8List`.
- **BREAKING** `RequestBody` and `ResponseBody` now constructible only from
  JS types:
  - Removed `fromByteBuffer` instead added `fromJSArrayBuffer`.
  - Removed `fromTypedData` instead added `fromJSTypedArray`.
  - Removed `fromString` instead added `fromJSString`.
  - `fromReadableStream` tightened type to `ReadableStream<JSUint8Array, JSAny>`
    because fetch supports only streams of `Uint8Array`s.
- **BREAKING** Fixed typo `RequestDestination.sharedworker` to
  `RequestDestination.sharedWorker`.
- Fixed `Response` and `Request` not working in WASM: this happened due to JS
  runtime being more lax in type assertions, namely `JSString` as `String` is
  ok in JS runtime, but fails in WASM.
- `Response` and `Request` now use precise type
  `ReadableStream<JSUint8Array, JSAny>`

## 2.1.0

- Add `package:fetch_api/enums.dart` `fetch_api.enums` package with enumerations
  available for all platforms (including VM).
- Use `DOMException` from `package:web` instead of alias to`JSObject`.
- Enumerations use `if (dart.library.io) ''` for documentation-only imports,
  this allows to use them in non-JS environments.

## 2.0.0

- **BREAKING**: migrate to `package:web` with WASM support. 
- Full rewrite to use `extension type`s - no more `InstanceMembers`.
- Internal JS Iterators are now fully covered with generics.
- JS Iterator is no longer exported via public API.
- `Headers` now use `(String, String)` in entries instead of `List<String>`.
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

- Downgraded `js` dependency to `^0.6.5` ([#2](https://github.com/Zekfad/fetch_api/issues/2).

## 1.0.0

- Public stable release.
- Bumped `js` dependency to `^0.6.7`.

## 1.0.0-dev.5

- **BREAKING**: Renamed `RequestInit` to `FetchOptions`.
  This is done to make emphatic, that `fetch` and `Request` have different
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
- Fixed dev dependency versions, to allow running on Dart 2.19.


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
