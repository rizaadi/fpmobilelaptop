class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability(
      {required this.slot,
      required this.displayName,
      required this.description,
      required this.displayIcon});

  factory Ability.fromMap(Map<String, dynamic> data) {
    return Ability(
        description: data['description'],
        displayIcon: data['displayIcon'],
        slot: data['slot'],
        displayName: data['displayName']);
  }
}
