class BuddyLevel {
  final String? uuid;
  final int? charmLevel;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;

  BuddyLevel(
      {required this.uuid,
      required this.charmLevel,
      required this.displayName,
      required this.displayIcon,
      required this.assetPath});

  factory BuddyLevel.fromJSON(Map<String, dynamic>? data) {
    return BuddyLevel(
      uuid: data?['uuid'],
      assetPath: data?['assetPath'],
      charmLevel: data?['charmLevel'],
      displayIcon: data?['displayIcon'],
      displayName: data?['displayName'],
    );
  }
}
