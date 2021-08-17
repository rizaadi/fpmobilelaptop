class Season {
  final String? uuid;
  final String? displayName;
  final String? type;
  final String? startTime;
  final String? endTime;
  final String? parentUuid;
  final String? assetPath;

  Season(
      {required this.uuid,
      required this.displayName,
      required this.type,
      required this.startTime,
      required this.endTime,
      required this.parentUuid,
      required this.assetPath});

  factory Season.fromJSON(Map<String, dynamic>? data) {
    return Season(
      assetPath: data?['assetPath'],
      displayName: data?['displayName'],
      endTime: data?['endTime'],
      parentUuid: data?['parentUuid'],
      startTime: data?['startTime'],
      type: data?['type'],
      uuid: data?['uuid'],
    );
  }
}
