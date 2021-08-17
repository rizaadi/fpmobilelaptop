class Currencies {
  final String? uuid;
  final String? displayName;
  final String? displayNameSingular;
  final String? displayIcon;
  final String? largeIcon;
  final String? assetPath;

  Currencies(
      {required this.uuid,
      required this.displayName,
      required this.displayNameSingular,
      required this.displayIcon,
      required this.largeIcon,
      required this.assetPath});

  factory Currencies.fromJSON(Map<String, dynamic>? data) {
    return Currencies(
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        displayNameSingular: data?['displayNameSingular'],
        largeIcon: data?['largeIcon'],
        uuid: data?['uuid']);
  }
}
