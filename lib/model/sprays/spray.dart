import 'level.dart';

class Spray {
  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final String? fullIcon;
  final String? fullTransparentIcon;
  final String? assetPath;
  final List<SprayLevel> levels;

  Spray(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.fullIcon,
      required this.fullTransparentIcon,
      required this.assetPath,
      required this.levels});

  factory Spray.fromJSON(Map<String, dynamic>? data) {
    return Spray(
        uuid: data?['uuid'],
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        fullIcon: data?['fullIcon'],
        fullTransparentIcon: data?['fullTransparentIcon'],
        levels: List<SprayLevel>.generate(data?['levels'].length,
            (index) => SprayLevel.fromJSON(data?['levels'][index])));
  }
}
