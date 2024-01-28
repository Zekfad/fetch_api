import 'dart:js_interop';
import 'dart:typed_data';

import 'readable_stream_default_reader.dart';


/// Describes chunk from [ReadableStreamDefaultReader.read].
/// 
/// If a chunk is available, then object will be of the form 
/// `{ value: theChunk, done: false }`.
/// 
/// If the stream becomes closed, the object will be of the form
/// `{ value: undefined, done: true }`.
extension type ReadableStreamDefaultReaderChunk._(JSObject _) implements JSObject {
  factory ReadableStreamDefaultReaderChunk({
    required bool done,
    Uint8List? value,
  }) => ReadableStreamDefaultReaderChunk._new(
    done: done,
    value: value as JSObject?,
  );
  
  @JS('')
  external factory ReadableStreamDefaultReaderChunk._new({
    required bool done,
    JSObject? value,
  });

  /// Chunk of data.
  @JS('value')
  external JSObject? _value;

  /// Chunk of data.
  Uint8List? get value => _value as Uint8List?;

  /// Whether there are no more data will be available.
  @JS()
  external bool done;
}
