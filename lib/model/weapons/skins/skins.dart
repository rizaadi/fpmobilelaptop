import 'chromas.dart';

class Skin {
  final String uuid;
  final String displayName;
  final String themeUuid;
  final String contentTierUuid;
  final String displayIcon;
  final String assetPath;
  final List<Chromas> chromas;

  Skin(
      {required this.uuid,
      required this.displayName,
      required this.themeUuid,
      required this.contentTierUuid,
      required this.displayIcon,
      required this.assetPath,
      required this.chromas});

  factory Skin.fromJSON(Map<String, dynamic> data) {
    return Skin(
      uuid: data['uuid'],
      displayName: data['displayName'],
      themeUuid: data['themeUuid'],
      contentTierUuid: data['contentTierUuid'],
      displayIcon: data['displayIcon'],
      assetPath: data['assetPath'],
      chromas: List<Chromas>.generate(data['chromas'].length,
          (index) => Chromas.fromJSON(data['chromas'][index])),
    );
  }
}
