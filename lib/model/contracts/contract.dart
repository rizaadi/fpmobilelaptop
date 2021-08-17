import 'content.dart';

class Contract {
  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final bool? shipIt;
  final String? freeRewardScheduleUuid;
  final ContractContent? content;
  final String? assetPath;

  Contract(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.shipIt,
      required this.freeRewardScheduleUuid,
      required this.content,
      required this.assetPath});

  factory Contract.fromJSON(Map<String, dynamic>? data) {
    return Contract(
        assetPath: data?['assetPath'],
        content: ContractContent.fromMap(data?['content']),
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        freeRewardScheduleUuid: data?['freeRewardScheduleUuid'],
        shipIt: data?['shipIt'],
        uuid: data?['uuid']);
  }
}
