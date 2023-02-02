import '../_js.dart';
import '../readable_stream_default_reader.dart';
import '../readable_stream_source.dart';
import '../response.dart';

part 'readable_stream.compatibility_layer.dart';


/// The [ReadableStream] interface of the Streams API represents a readable
/// stream of byte data. The Fetch API offers a concrete instance of
/// a [ReadableStream] through the body property of a [Response] object.
@JS()
@staticInterop
class ReadableStream {
  /// Creates and returns a readable stream object from the given handlers.
  factory ReadableStream([
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

  /// Creates and returns a readable stream object.
  @JS('ReadableStream')
  external factory ReadableStream._();

  /// Creates and returns a readable stream object from given handlers.
  @JS('ReadableStream')
  external factory ReadableStream._source(
    ReadableStreamSource<dynamic>? underlyingSource,
  );

  /// Creates and returns a readable stream object from given handlers and
  /// queuing strategy.
  @JS('ReadableStream')
  external factory ReadableStream._full(
    ReadableStreamSource<dynamic>? underlyingSource,
    dynamic queuingStrategy,
  );
}

extension ReadableStreamInstanceMembers on ReadableStream {
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
  Future<T?> cancel<T>([T? reason]) =>
    promiseToFuture(_cancel(reason));

  /// The [tee] method tees this readable stream, returning a two-element
  /// array containing the two resulting branches as new [ReadableStream]
  /// instances. Each of those streams receives the same incoming data.
  List<ReadableStream> tee() => _tee().cast();
}
