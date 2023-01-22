import 'dart:typed_data';
import '_js.dart';


@JS()
@anonymous
class ReadableStreamDefaultReaderChunk {
  external factory ReadableStreamDefaultReaderChunk({
    Uint8List? value,
    bool done,
  });

  external Uint8List? value;
  external bool done;
}
