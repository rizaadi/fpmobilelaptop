class Role {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  Role(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.displayIcon});

  static Role? fromJSON(Map<String, dynamic>? data) {
    return Role(
        uuid: data?['uuid'],
        description: data?['description'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName']);
  }
}
