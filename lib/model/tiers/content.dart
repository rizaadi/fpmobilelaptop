
class ContentTiers {
  final String? uuid;
  final String? devname;
  final String? highlightColor;
  final String? displayIcon;
  final String? assetPath;

  ContentTiers(
      {required this.uuid,
      required this.devname,
      required this.highlightColor,
      required this.displayIcon,
      required this.assetPath});

  factory ContentTiers.fromJSON(Map<String, dynamic>? data) {
    return ContentTiers(
        assetPath: data?['assetPath'],
        devname: data?['devName'],
        displayIcon: data?['displayIcon'],
        highlightColor: data?['highlightColor'],
        uuid: data?['uuid']);
  }
}
