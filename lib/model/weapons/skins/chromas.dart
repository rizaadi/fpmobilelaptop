class Chromas {
  final String uuid;
  final String displayName;
  final String displayIcon;
  final String fullRender;
  final String swatch;
  final String streamedVideo;
  final String assetPath;

  Chromas(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.fullRender,
      required this.swatch,
      required this.streamedVideo,
      required this.assetPath});

  factory Chromas.fromJSON(Map<String, dynamic> data) {
    return Chromas(
        uuid: data['uuid'],
        displayName: data['displayName'],
        displayIcon: data['displayIcon'],
        fullRender: data['fullRender'],
        swatch: data['swatch'],
        streamedVideo: data['streamedVideo'],
        assetPath: data['assetPath'],
        );
  }
}
