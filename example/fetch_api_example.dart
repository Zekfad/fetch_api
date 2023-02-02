import 'package:fetch_api/fetch_api.dart';


void main() async {
  // Simple cors request
  final response = await fetch(
    'https://api.restful-api.dev/objects/1',
    FetchOptions(
      mode: RequestMode.cors,
    ),
  );

  print(await response.text());
}
