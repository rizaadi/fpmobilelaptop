class Bundle {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? displayIcon2;
  final String? verticalPromoImage;
  final String? assetPath;
  final bool? useAdditionalContext;

  Bundle(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.displayIcon,
      required this.displayIcon2,
      required this.useAdditionalContext,
      required this.verticalPromoImage,
      required this.assetPath});

  factory Bundle.fromJSON(Map<String, dynamic>? data) {
    return Bundle(
        assetPath: data?['assetPath'],
        description: data?['description'],
        displayIcon2: data?['displayIcon2'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        uuid: data?['uuid'],
        useAdditionalContext: data?['useAdditionalContext'],
        verticalPromoImage: data?['verticalPromoImage']);
  }
}
