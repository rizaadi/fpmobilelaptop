import 'level.dart';

class Buddy {
  final String? uuid;
  final String? displayName;
  final bool? isHiddenIfNotOwned;
  final String? themeUuid;
  final String? displayIcon;
  final String? assetPath;
  final BuddyLevel? level;

  Buddy(
      {required this.uuid,
      required this.displayName,
      required this.isHiddenIfNotOwned,
      required this.themeUuid,
      required this.displayIcon,
      required this.assetPath,
      required this.level});

  factory Buddy.fromJSON(Map<String, dynamic>? data) {
    return Buddy(
        assetPath: data?['assetPath'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        isHiddenIfNotOwned: data?['isHiddenIfNotOwned'],
        level: BuddyLevel.fromJSON(data?['BuddyLevel']),
        themeUuid: data?['themeUuid'],
        uuid: data?['uuid']);
  }
}
