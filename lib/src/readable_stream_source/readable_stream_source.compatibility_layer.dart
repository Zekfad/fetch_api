part of 'readable_stream_source.dart';


/// Create [ReadableStreamSource] from Dart [Stream].
ReadableStreamSource<T> createReadableStreamSourceFromStream<T>(Stream<T> stream) {
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
