class PlayerTitles {
  final String? uuid;
  final String? displayName;
  final String? titleText;
  final bool? isHiddenIfNotOwned;
  final String? assetPath;

  PlayerTitles(
      {required this.uuid,
      required this.displayName,
      required this.titleText,
      required this.isHiddenIfNotOwned,
      required this.assetPath});

  factory PlayerTitles.fromJSON(Map<String, dynamic>? data) {
    return PlayerTitles(
      assetPath: data?['assetPath'],
      displayName: data?['displayName'],
      isHiddenIfNotOwned: data?['isHiddenIfNotOwned'],
      titleText: data?['titleText'],
      uuid: data?['uuid'],
    );
  }
}
