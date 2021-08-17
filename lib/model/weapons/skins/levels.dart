class SkinLevel {
  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;
  final String? levelItem;
  final String? streamedVideo;

  SkinLevel(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.assetPath,
      required this.levelItem,
      required this.streamedVideo});

  factory SkinLevel.fromJSON(Map<String, dynamic>? data) {
    return SkinLevel(
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        levelItem: data?['levelItem'],
        streamedVideo: data?['streamedVideo'],
        uuid: data?['uuid'],
        displayName: data?['displayName']);
  }

  static fromMap(x) {}
}
