import 'dart:typed_data';

import '_js.dart';
import 'readable_stream.dart';
import 'readable_stream_default_reader_chunk.dart';


@JS()
@staticInterop
class ReadableStreamDefaultReader {
  /// Creates and returns a [ReadableStreamDefaultReader] object instance.
  external factory ReadableStreamDefaultReader(ReadableStream stream);
}

extension ReadableStreamDefaultReaderExtension on ReadableStreamDefaultReader {
  /// Returns a `Promise` that fulfills when the stream closes,
  /// or rejects if the stream throws an error or the reader's lock is released.
  /// This property enables you to write code that responds to an end to
  /// the streaming process.
  external final Promise<dynamic> closed;

  /// Returns a `Promise` that resolves when the stream is canceled.
  /// Calling this method signals a loss of interest in the stream by a consumer.
  /// The supplied [reason] argument will be given to the underlying source,
  /// which may or may not use it.
  @JS('cancel')
  external Promise<dynamic> _cancel([dynamic reason]);

  /// Returns a promise providing access to the next chunk in the stream's
  /// internal queue.
  @JS('read')
  external Promise<ReadableStreamDefaultReaderChunk> _read();

  /// Releases the reader's lock on the stream.
  external void releaseLock();

  /// Returns a [Future] that resolves when the stream is canceled.
  /// Calling this method signals a loss of interest in the stream by a consumer.
  /// The supplied [reason] argument will be given to the underlying source,
  /// which may or may not use it.
  Future<T?> cancel<T>([T? reason]) => promiseToFuture(_cancel(reason));

  /// Returns a [Future] providing access to the next chunk in the stream's
  /// internal queue.
  Future<ReadableStreamDefaultReaderChunk> read() => promiseToFuture(_read());

  /// Returns a [Future] that fulfills when the stream closes,
  /// or rejects if the stream throws an error or the reader's lock is released.
  /// This property enables you to write code that responds to an end to
  /// the streaming process.
  // ignore: unnecessary_this
  Future<dynamic> get readerClosed => promiseToFuture(this.closed);

  /// Reads stream via [read] and returns chunks as soon as they are available.
  Stream<Uint8List> readAsStream() async* {
    ReadableStreamDefaultReaderChunk chunk;
    do {
      chunk = await read();
      if (chunk.value != null)
        yield chunk.value!;
    } while (!chunk.done);
    return;
  }
}
