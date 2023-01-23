## 1.0.0-dev.3
- **BREAKING**: Renamed extensions from `<Class>Extension` to `<Class>InstanceMembers`.
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
  - Add methods `headersFromMap` and `headersFromArray` to support Dart 2.19.
- `Iterator` and `IteratorResult`
  - Added docs.
- `ReadableStreamDefaultReader` and `ReadableStreamDefaultReaderChunk`
  - Added docs.

## 1.0.0-dev.2

- Downgraded `js` dependency to `^0.6.5`.

## 1.0.0-dev.1

- Initial version.
