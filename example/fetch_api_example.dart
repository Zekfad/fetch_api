import 'package:fetch_api/fetch_api.dart';


void main() async {
  final response = await fetch('https://proxy.cors.sh/https://example.com', RequestInit(
    mode: RequestMode.cors,
  ),);

  print(await response.text());
}
