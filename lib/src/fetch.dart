import '_js.dart';
import 'fetch_options.dart';
import 'response.dart';


@JS('fetch')
external Promise<Response> _fetch(dynamic resource, FetchOptions? options);

/// The global `fetch()` method starts the process of fetching a resource
/// from the network, returning a promise which is fulfilled once the response
/// is available.
/// 
/// The promise resolves to the [Response] object representing the response
/// to your request.
/// 
/// A `fetch()` promise only rejects when a network error is encountered
/// (which is usually when there's a permissions issue or similar).
/// A `fetch()` promise does not reject on HTTP errors (`404`, etc.).
/// Instead, a then() handler must check the [ResponseInstanceMembers.ok] and/or
/// [ResponseInstanceMembers.status] properties.
/// 
/// `WindowOrWorkerGlobalScope` is implemented by both `Window` and
/// `WorkerGlobalScope`, which means that the `fetch()` method is available
/// in pretty much any context in which you might want to fetch resources.
/// 
/// The `fetch()` method is controlled by the `connect-src` directive of
/// Content Security Policy rather than the directive of the resources
/// it's retrieving.
Future<Response> fetch(dynamic resource, [FetchOptions? options]) =>
  promiseToFuture(_fetch(resource, options));
