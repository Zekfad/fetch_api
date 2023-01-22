import 'dart:js';
import 'dart:js_util';

export 'dart:js';
export 'dart:js_util';
export 'package:js/js.dart';


typedef Promise<T> = Object;

extension JsObjectMapExtension<K, V> on Map<K, V> {
  dynamic toJsObject() => jsify(this);
}

extension JsArrayListExtension<E> on List<E> {
  JsArray<dynamic> toJsArray() => JsArray.from(this);
}
