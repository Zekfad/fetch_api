part of 'headers.dart';


/// Creates [Headers] from [Map].
Headers createHeadersFromMap(Map<String, String> init) =>
  Headers._init(init.toJsObject());

/// Creates [Headers] from array of 2 items arrays. 
Headers createHeadersFromArray(List<List<String>> init) {
  final _init = JsArray<JsArray<dynamic>>();
  for (final header in init) {
    if (header.length != 2)
      throw Exception('Bad argument');

    _init.add(header.toJsArray());
  }
  return Headers._init(_init);
}
