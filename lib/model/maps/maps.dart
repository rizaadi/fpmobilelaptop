class Maps {
  final String? uuid;
  final String? displayName;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? splash;
  final String? assetPath;
  final String? mapUrl;
  final num? xMultiplier;
  final num? yMultiplier;
  final num? xScalarToAdd;
  final num? yScalarToAdd;

  Maps(
      {required this.uuid,
      required this.displayName,
      required this.coordinates,
      required this.displayIcon,
      required this.listViewIcon,
      required this.splash,
      required this.assetPath,
      required this.mapUrl,
      required this.xMultiplier,
      required this.yMultiplier,
      required this.xScalarToAdd,
      required this.yScalarToAdd});

  factory Maps.fromJSON(Map<String, dynamic>? data) {
    return Maps(
      assetPath: data?['assetPath'],
      coordinates: data?['coordinates'],
      displayIcon: data?['displayIcon'],
      displayName: data?['displayName'],
      listViewIcon: data?['listViewIcon'],
      mapUrl: data?['mapUrl'],
      splash: data?['splash'],
      uuid: data?['uuid'],
      xMultiplier: data?['xMultiplier'],
      xScalarToAdd: data?['xScalarToAdd'],
      yMultiplier: data?['yMultiplier'],
      yScalarToAdd: data?['yScalarToAdd'],
    );
  }
}
