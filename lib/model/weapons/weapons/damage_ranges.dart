class DamageRanges {
  final num rangeStartMeters;
  final num rangeEndMeters;
  final num headDamage;
  final num bodyDamage;
  final num legDamage;

  DamageRanges(
      {required this.rangeStartMeters,
      required this.rangeEndMeters,
      required this.headDamage,
      required this.bodyDamage,
      required this.legDamage});

  factory DamageRanges.fromJSON(Map<String, dynamic> data) {
    return DamageRanges(
      rangeStartMeters: data['rangeStartMeters'],
      rangeEndMeters: data['rangeEndMeters'],
      headDamage: data['headDamage'],
      bodyDamage: data['bodyDamage'],
      legDamage: data['legDamage'],
    );
  }
}
