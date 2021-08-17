class PlayerCards {
  final String? uuid;
  final String? displayName;
  final bool? isHiddenIfNotOwned;
  final String? displayIcon;
  final String? smallArt;
  final String? wideArt;
  final String? largeArt;
  final String? assetPath;

  PlayerCards(
      {required this.uuid,
      required this.displayName,
      required this.isHiddenIfNotOwned,
      required this.displayIcon,
      required this.smallArt,
      required this.wideArt,
      required this.largeArt,
      required this.assetPath});

  factory PlayerCards.fromJSON(Map<String, dynamic>? data) {
    return PlayerCards(
      assetPath: data?['assetPath'],
      displayIcon: data?['displayIcon'],
      displayName: data?['displayName'],
      isHiddenIfNotOwned: data?['isHiddenIfNotOwned'],
      largeArt: data?['largeArt'],
      smallArt: data?['smallArt'],
      uuid: data?['uuid'],
      wideArt: data?['wideArt'],
    );
  }
}
