import 'dart:typed_data';
import '_js.dart';
import 'readable_stream_default_reader.dart';


/// Describes chunk from [ReadableStreamDefaultReaderInstanceMembers.read].
/// 
/// If a chunk is available, then object will be of the form 
/// `{ value: theChunk, done: false }`.
/// 
/// If the stream becomes closed, the object will be of the form
/// `{ value: undefined, done: true }`.
@JS()
@anonymous
class ReadableStreamDefaultReaderChunk {
  external factory ReadableStreamDefaultReaderChunk({
    Uint8List? value,
    bool done,
  });

  /// Chunk of data.
  external Uint8List? value;
  /// Whether there are no more data will be available.
  external bool done;
}
