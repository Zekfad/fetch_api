/// Dart 1.19 compatibility layer.
/// 
/// Provides [createHeadersFromArray], [createHeadersFromMap],
/// [createAbortSignalTimeout] and [createRequestInit] functions, in replacement
/// of unsupported [Headers.fromArray], [Headers.fromMap], [AbortSignal.timeout]
/// and [RequestInit] respectively.
library fetch_api.compatibility_layer;

import 'src/abort_signal/abort_signal.dart';
import 'src/headers/headers.dart';
import 'src/request_init/request_init.dart';

export 'src/abort_signal/abort_signal.dart' show createAbortSignalTimeout;
export 'src/headers/headers.dart' show createHeadersFromArray, createHeadersFromMap;
export 'src/request_init/request_init.dart' show createRequestInit;
