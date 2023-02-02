import '_js.dart';
import 'readable_stream.dart';


/// The [ReadableStreamDefaultController] interface of the Streams API
/// represents a controller allowing control of a [ReadableStream]'s state
/// and internal queue.
/// 
/// Default controllers are for streams that are not byte streams.
@JS()
class ReadableStreamDefaultController<T> {
  /// Returns the desired size required to fill the stream's internal queue.
  external final int desiredSize;
}

extension ReadableStreamDefaultControllerInstanceMembers<T> on ReadableStreamDefaultController<T> {
  /// Closes the associated stream.
  external void close();

  /// Enqueues a given [chunk] in the associated stream.
  external void enqueue(T chunk);

  /// Causes any future interactions with the associated stream to error.
  external void error(dynamic error);
}
