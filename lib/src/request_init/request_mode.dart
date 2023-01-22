/// The mode you want to use for the request
enum RequestMode {
  noCors('no-cors'),
  cors('cors'),
  sameOrigin('same-origin');

  const RequestMode(this.mode);

  factory RequestMode.from(String mode) =>
    values.firstWhere((element) => element.mode == mode);

  final String mode;

  @override
  String toString() => mode;
}
