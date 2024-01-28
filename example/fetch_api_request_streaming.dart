import 'dart:typed_data';
import 'package:fetch_api/fetch_api.dart';


void main() async {
  // Stream request body
  final stream = (() async* {
    yield Uint8List.fromList(
      '''
      {
        "name": "My cool data",
        "data": {
          "data_part_1": "part_1",
      '''.codeUnits,
    );
    await Future<void>.delayed(const Duration(seconds: 1));
    yield Uint8List.fromList(
      '''
          "data_part_2": "part_2"
        }
      }
      '''.codeUnits,
    );
  })();

  final readableStream = ReadableStream.fromTypedDataStream(stream);

  final request = Request(
    'https://api.restful-api.dev/objects',
    RequestOptions(
      method: 'POST',
      body: RequestBody.fromReadableStream(readableStream),
      duplex: RequestDuplex.half,
      headers: Headers.fromMap({
        'content-type': 'application/json',
      }),
    ),
  );

  final response = await fetch(request);

  print(await response.text());
}
