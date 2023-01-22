import '_js.dart';
import 'readable_stream_default_reader.dart';


@JS()
@staticInterop
class ReadableStream {
  /// Creates and returns a readable stream object from the given handlers.
  external factory ReadableStream([
    dynamic underlyingSource,
    dynamic queuingStrategy,
  ]);
}

extension ReadableStreamExtension on ReadableStream {
  /// Returns a [bool] indicating whether or not the readable stream
  /// is locked to a reader.
  external final bool locked;

  /// Returns a `Promise` that resolves when the stream is canceled.
  /// Calling this method signals a loss of interest in the stream by a consumer.
  /// The supplied [reason] argument will be given to the underlying source,
  /// which may or may not use it.
  @JS('cancel')
  external Promise<dynamic> _cancel([dynamic reason]);

  // pipeThrough()
  // pipeTo()

  /// Creates a reader and locks the stream to it.
  /// While the stream is locked, no other reader can be acquired until this one
  /// is released.
  /// 
  /// Implementation note: BYOP reader is unsupported, and therefore
  /// no optional arguments provided.
  external ReadableStreamDefaultReader getReader();

  /// The [_tee] method tees this readable stream, returning a two-element
  /// array containing the two resulting branches as new [ReadableStream]
  /// instances. Each of those streams receives the same incoming data.
  @JS('tee')
  external List<dynamic> _tee();

  /// Returns a [Future] that resolves when the stream is canceled.
  /// Calling this method signals a loss of interest in the stream by a consumer.
  /// The supplied [reason] argument will be given to the underlying source,
  /// which may or may not use it.
  Future<T?> cancel<T>([T? reason]) => promiseToFuture(_cancel(reason));

  /// The [tee] method tees this readable stream, returning a two-element
  /// array containing the two resulting branches as new [ReadableStream]
  /// instances. Each of those streams receives the same incoming data.
  List<ReadableStream> tee() => _tee().cast();
}
