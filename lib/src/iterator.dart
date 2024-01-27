import 'dart:js_interop';

import 'iterator/iterator.dart' as js;

export 'iterator/extensions.dart';
export 'iterator/iterator_result.dart';
export 'iterator/iterator_symbol_method.dart';


/// Alias for [js.Iterator].
typedef JSIterator<T extends JSAny> = js.Iterator<T>;
