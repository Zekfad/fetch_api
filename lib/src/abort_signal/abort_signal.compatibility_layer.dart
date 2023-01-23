part of 'abort_signal.dart';


/// Returns an [AbortSignal] instance that will automatically abort
/// after a specified [time].
AbortSignal createAbortSignalTimeout(Duration time)
  => AbortSignal._timeout(time.inMilliseconds);
