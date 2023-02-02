import 'package:fetch_api/fetch_api.dart';


void main() async {
  // Use Request object
  final request = Request(
    'https://api.restful-api.dev/objects/1',
    // Request are by default cors enabled
    RequestOptions(
      headers: Headers.fromMap({
        'accept': 'application/json',
      }),
    ),
  );

  final response = await fetch(request);

  print(await response.text());
}
