class SprayLevel {
  final String? uuid;
  final int? sprayLevel;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;

  SprayLevel(
      {required this.uuid,
      required this.sprayLevel,
      required this.displayName,
      required this.displayIcon,
      required this.assetPath});

  factory SprayLevel.fromJSON(Map<String, dynamic>? data) {
    return SprayLevel(
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        sprayLevel: data?['sprayLevel'],
        uuid: data?['uuid']);
  }
}
