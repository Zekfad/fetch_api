import '_js.dart';
import 'request_init.dart';
import 'response.dart';


@JS('fetch')
external Promise<Response> _fetch(dynamic resource, RequestInit? options);

Future<Response> fetch(dynamic resource, [RequestInit? options]) =>
  promiseToFuture(_fetch(resource, options));
