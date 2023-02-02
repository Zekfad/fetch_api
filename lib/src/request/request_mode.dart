import '../request.dart';
import '../response.dart';


/// Mode is used to determine if cross-origin requests lead to valid responses,
/// and which properties of the response are readable.
/// 
/// ## Default mode
/// Requests can be initiated in a variety of ways, and the mode for
/// a request depends on the particular means by which it was initiated.
/// 
/// For example, when a [Request] object is created using the `Request()`
/// constructor, the value of the mode property for that [Request]
/// is set to [cors].
/// 
/// However, for requests created other than by the `Request()` constructor,
/// [noCors] is typically used as the mode; for example,
/// for embedded resources where the request is initiated from markup,
/// unless the `crossorigin` attribute is present, the request is in most cases
/// made using the [noCors] mode — that is, for the `<link>` or `<script>`
/// elements (except when used with modules), or `<img>`, `<audio>`, `<video>`,
/// `<object>`, `<embed>`, or `<iframe>` elements.
enum RequestMode {
  /// If a request is made to another origin with this mode set,
  /// the result is an error. You could use this to ensure that
  /// a request is always being made to your origin.
  sameOrigin('same-origin'),
  /// Prevents the method from being anything other than `HEAD`, `GET` or `POST`,
  /// and the headers from being anything other than simple headers.
  /// If any `ServiceWorkers` intercept these requests, they may not add
  /// or override any headers except for those that are simple headers.
  /// In addition, JavaScript may not access any properties of the resulting
  /// [Response]. This ensures that ServiceWorkers do not affect the semantics
  /// of the Web and prevents security and privacy issues arising from leaking
  /// data across domains.
  noCors('no-cors'),
  /// Allows cross-origin requests, for example to access various APIs
  /// offered by 3rd party vendors. These are expected to adhere to
  /// the CORS protocol. Only a limited set of headers are exposed
  /// in the [Response], but the body is readable.
  cors('cors'),
  /// A mode for supporting navigation. The navigate value is intended
  /// to be used only by HTML navigation. A navigate request
  /// is created only while navigating between documents.
  navigate('navigate'),
  /// A special mode used only when establishing a WebSocket connection.
  webSocket('websocket');

  const RequestMode(this.mode);

  factory RequestMode.from(String mode) =>
    values.firstWhere((element) => element.mode == mode);

  final String mode;

  @override
  String toString() => mode;
}
