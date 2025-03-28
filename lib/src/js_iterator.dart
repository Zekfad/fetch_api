import 'dart:js_interop';

import 'iterator/iterator.dart' as js;

export 'iterator/extensions.dart';
export 'iterator/iterator_result.dart';


/// Alias for [js.Iterator].
typedef JSIterator<T extends JSAny> = js.Iterator<T>;
