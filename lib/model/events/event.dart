class Events {
  final String? uuid;
  final String? displayName;
  final String? shortDisplayName;
  final String? startTime;
  final String? endTime;
  final String? assetPath;

  Events(
      {required this.uuid,
      required this.displayName,
      required this.shortDisplayName,
      required this.startTime,
      required this.endTime,
      required this.assetPath});

  factory Events.fromJSON(Map<String, dynamic>? data) {
    return Events(
        assetPath: data?['assetPath'],
        displayName: data?['displayName'],
        endTime: data?['endTime'],
        shortDisplayName: data?['shortDisplayName'],
        startTime: data?['startTime'],
        uuid: data?['uuid']);
  }
}
