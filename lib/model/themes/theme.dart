class Theme {
  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;

  Theme(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.assetPath});

  factory Theme.fromJSON(Map<String, dynamic>? data) {
    return Theme(
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        uuid: data?['uuid']);
  }
}
