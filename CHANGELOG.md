## 1.0.0-dev.4

- Fixes for `js.Iterator` with Arrays. (Resolves issue with `Headers`).

## 1.0.0-dev.3

- **BREAKING**: Renamed extensions from `<Class>Extension` to `<Class>InstanceMembers`.
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
