/// Dart 2.19 compatibility layer.
/// 
/// Provides following compatibility functions:
/// * [createFetchOptions] in replacement of [FetchOptions.new]
/// * [createHeadersFromArray] in replacement of [Headers.fromArray]
/// * [createHeadersFromMap] in replacement of [Headers.fromMap]
/// * [createAbortSignalTimeout] in replacement of [AbortSignal.timeout]
/// * [createRequestOptions] in replacement of [RequestOptions.new]
/// * [createReadableStream] in replacement of [ReadableStream.new]
/// * [createReadableStreamSourceFromStream] in replacement of [ReadableStreamSource.fromStream]
library fetch_api.compatibility_layer;

import 'src/abort_signal/abort_signal.dart';
import 'src/fetch_options/fetch_options.dart';
import 'src/headers/headers.dart';
import 'src/readable_stream/readable_stream.dart';
import 'src/readable_stream_source/readable_stream_source.dart';
import 'src/request_options/request_options.dart';

export 'src/abort_signal/abort_signal.dart' show createAbortSignalTimeout;
export 'src/fetch_options/fetch_options.dart' show createFetchOptions;
export 'src/headers/headers.dart' show createHeadersFromArray, createHeadersFromMap;
export 'src/readable_stream/readable_stream.dart' show createReadableStream;
export 'src/readable_stream_source/readable_stream_source.dart' show createReadableStreamSourceFromStream;
export 'src/request_options/request_options.dart' show createRequestOptions;
