class GameMods {
  final String? uuid;
  final String? displayName;
  final String? duration;
  final bool? allowsMatchTimeouts;
  final bool? isTeamVoiceAllowed;
  final bool? isMinimapHidden;
  final int? orbCount;
  final String? displayIcon;
  final String? assetPath;

  GameMods(
      {required this.uuid,
      required this.displayName,
      required this.duration,
      required this.allowsMatchTimeouts,
      required this.isTeamVoiceAllowed,
      required this.isMinimapHidden,
      required this.orbCount,
      required this.displayIcon,
      required this.assetPath});

  factory GameMods.fromJSON(Map<String, dynamic>? data) {
    return GameMods(
      uuid: data?['uuid'],
      displayName: data?['displayName'],
      duration: data?['duration'],
      allowsMatchTimeouts: data?['allowsMatchTimeouts'],
      isTeamVoiceAllowed: data?['isTeamVoiceAllowed'],
      isMinimapHidden: data?['isMinimapHidden'],
      orbCount: data?['orbCount'],
      displayIcon: data?['displayIcon'],
      assetPath: data?['assetPath'],
    );
  }
}
