import 'dart:js_interop';


/// [JSString] and [JSSymbol] union type.
extension type const JSStringOrJSSymbol._(JSAny _) implements JSAny {
  /// Wrap [JSString] to [JSStringOrJSSymbol] union.
  const factory JSStringOrJSSymbol.fromJSString(JSString body) = _JSStringOrJSSymbolJSString;
  /// Wrap [JSSymbol] to [JSStringOrJSSymbol] union.
  const factory JSStringOrJSSymbol.fromJSSymbol(JSSymbol body) = _JSStringOrJSSymbolJSSymbol;
}

extension type const _JSStringOrJSSymbolJSString(JSString _) implements JSString, JSStringOrJSSymbol {}
extension type const _JSStringOrJSSymbolJSSymbol(JSSymbol _) implements JSSymbol, JSStringOrJSSymbol {}

/// Conversions from [JSString] to [JSStringOrJSSymbol].
extension JSStringToJSStringOrJSSymbol on JSString {
  /// Convert value to [JSStringOrJSSymbol].
  JSStringOrJSSymbol get toJSStringOrJSSymbol => _JSStringOrJSSymbolJSString(this);
}

/// Conversions from [JSSymbol] to [JSStringOrJSSymbol].
extension JSSymbolToJSStringOrJSSymbol on JSSymbol {
  /// Convert value to [JSStringOrJSSymbol].
  JSStringOrJSSymbol get toJSStringOrJSSymbol => _JSStringOrJSSymbolJSSymbol(this);
}

/// Conversions from [String] to [JSStringOrJSSymbol].
extension StringToJSStringOrJSSymbol on String {
  /// Convert value to [JSStringOrJSSymbol].
  JSStringOrJSSymbol get toJSStringOrJSSymbol => _JSStringOrJSSymbolJSString(toJS);
}
