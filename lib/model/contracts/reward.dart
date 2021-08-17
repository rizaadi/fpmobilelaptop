class LevelsReward {
  final String type;
  final String uuid;
  final int amount;
  final bool isHighlighted;

  LevelsReward(
      {required this.type,
      required this.uuid,
      required this.amount,
      required this.isHighlighted});

  static LevelsReward fromJSON(Map<String, dynamic>? data) {
    return LevelsReward(
        amount: data?['amount'],
        type: data?['type'],
        isHighlighted: data?['isHighlighted'],
        uuid: data?['uuid']);
  }
}
