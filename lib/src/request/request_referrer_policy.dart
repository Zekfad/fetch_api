/// Specifies the referrer policy to use for the request.
enum RequestReferrerPolicy {
  strictOriginWhenCrossOrigin('strict-origin-when-cross-origin'),
  noReferrer('no-referrer'),
  noReferrerWhenDowngrade('no-referrer-when-downgrade'),
  sameOrigin('same-origin'),
  origin('origin'),
  strictOrigin('strict-origin'),
  originWhenCrossOrigin('origin-when-cross-origin'),
  unsafeUrl('unsafe-url');

  const RequestReferrerPolicy(this.value);

  factory RequestReferrerPolicy.from(String value) =>
    values.firstWhere((element) => element.value == value);

  final String value;

  @override
  String toString() => value;
}
