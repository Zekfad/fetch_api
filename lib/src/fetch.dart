import 'dart:js_interop';

import 'request_options.dart';
import 'response.dart';


@JS('fetch')
external JSPromise<Response> _fetch(JSAny resource, [ RequestInit? options, ]);

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
/// Instead, a then() handler must check the [Response.ok] and/or
/// [Response.status] properties.
/// 
/// `WindowOrWorkerGlobalScope` is implemented by both `Window` and
/// `WorkerGlobalScope`, which means that the `fetch()` method is available
/// in pretty much any context in which you might want to fetch resources.
/// 
/// The `fetch()` method is controlled by the `connect-src` directive of
/// Content Security Policy rather than the directive of the resources
/// it's retrieving.
Future<Response> fetch(Object resource, [ RequestInit? options, ]) =>
  _fetch(
    switch (resource) {
      String() => resource.toJS,
      Uri() => resource.toString().toJS,
      // Always matched due to JS type erasure
      JSObject() => resource,
      _ => throw StateError('Invalid resource type: ${resource.runtimeType}'),
    },
    options ?? FetchOptions(),
  ).toDart;
