part of 'readable_stream.dart';


/// Creates and returns a readable stream object from the given handlers.
ReadableStream createReadableStream([
  ReadableStreamSource<dynamic>? underlyingSource,
  dynamic queuingStrategy,
]) {
  if (underlyingSource != null) {
    if (queuingStrategy != null)
      return ReadableStream._full(underlyingSource, queuingStrategy);
    else
      return ReadableStream._source(underlyingSource);
  } else
    return ReadableStream._();
}
