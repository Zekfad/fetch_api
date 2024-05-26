import 'request.dart' if (dart.library.io) '';


/// [Request] duplex mode.
enum RequestDuplex {
  /// Half-duplex mode.
  half('half'),
  /// In future browsers may support full-duplex.
  full('full');

  const RequestDuplex(this.value);

  factory RequestDuplex.from(String value) =>
    values.firstWhere((element) => element.value == value);

  final String value;

  @override
  String toString() => value;
}
