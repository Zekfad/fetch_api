import 'dart:async';
import 'dart:typed_data';

import '../_js.dart';
import '../readable_stream.dart';
import '../readable_stream_default_controller.dart';
import '../readable_stream_default_reader.dart';
import '../request.dart';
import '../response.dart';

part 'readable_stream_source.compatibility_layer.dart';


/// An object containing methods and properties that define how the constructed
/// stream instance will behave.
/// 
/// Note: Use [Uint8List] if you want compatibility with [Response] or [Request].
@JS()
@anonymous
class ReadableStreamSource<T> {
  external factory ReadableStreamSource({
    PromiseOrVoid Function(ReadableStreamDefaultController<T> controller)? start,
    PromiseOrVoid Function(ReadableStreamDefaultController<T> controller)? pull,
    PromiseOrVoid Function(String reason)? cancel,
    String? type,
    int? autoAllocateChunkSize,
  });

  /// Create [ReadableStreamSource] from Dart [Stream].
  factory ReadableStreamSource.fromStream(Stream<T> stream) {
    late final StreamSubscription<T> subscription;
    return ReadableStreamSource(
      start: allowInterop((controller) {
        subscription = stream.listen(
          (event) {
            controller.enqueue(event);
          },
          onDone: () {
            controller.close();
          },
        );
      }),
      cancel: allowInterop(
        (reason) async => subscription.cancel(),
      ),
    );
  }

  /// This is a method, called immediately when the object is constructed.
  /// The contents of this method are defined by the developer,
  /// and should aim to get access to the stream source, and do anything else
  /// required to set up the stream functionality.
  /// 
  /// If this process is to be done asynchronously, it can return a promise
  /// to signal success or failure.
  /// 
  /// The controller parameter passed to this method is a
  /// [ReadableStreamDefaultController] or a `ReadableByteStreamController`,
  /// depending on the value of the type property.
  /// 
  /// This can be used by the developer to control the stream during set up.
  external PromiseOr<void> Function(ReadableStreamDefaultController<T> controller)? start;

  /// This method, also defined by the developer, will be called repeatedly
  /// when the stream's internal queue of chunks is not full, up until
  /// it reaches its high water mark.
  /// 
  /// If `pull()` returns a promise, then it won't be called again until that
  /// promise fulfills; if the promise rejects, the stream will become errored.
  /// 
  /// The controller parameter passed to this method is a
  /// [ReadableStreamDefaultController] or a `ReadableByteStreamController`,
  /// depending on the value of the type property.
  /// 
  /// This can be used by the developer to control the stream as more chunks
  /// are fetched.
  external PromiseOr<void> Function(ReadableStreamDefaultController<T> controller)? pull;

  /// This method, also defined by the developer, will be called if the app
  /// signals that the stream is to be cancelled
  /// (e.g. if [ReadableStreamInstanceMembers.cancel] is called).
  /// 
  /// The contents should do whatever is necessary to release access
  /// to the stream source. If this process is asynchronous, it can return
  /// a promise to signal success or failure.
  /// 
  /// The reason parameter contains a string describing why the stream
  /// was cancelled.
  external PromiseOr<void> Function(String reason)? cancel;

  /// This property controls what type of readable stream is being dealt with.
  /// If it is included with a value set to "bytes", the passed controller
  /// object will be a `ReadableByteStreamController` capable of handling a BYOB
  /// (bring your own buffer)/byte stream. If it is not included,
  /// the passed controller will be a [ReadableStreamDefaultController].
  external String? type;

  /// For byte streams, the developer can set the [autoAllocateChunkSize] with
  /// a positive integer value to turn on the stream's auto-allocation feature.
  /// With this is set, the stream implementation will automatically allocate
  /// a view buffer of the specified size in
  /// `ReadableByteStreamController.byobRequest` when required.
  /// 
  /// This must be set to enable zero-copy transfers to be used with
  /// a default [ReadableStreamDefaultReader]. If not set, a default reader
  /// will still stream data, but `ReadableByteStreamController.byobRequest`
  /// will always be `null` and transfers to the consumer must be via
  /// the stream's internal queues.
  external int? autoAllocateChunkSize;
}
