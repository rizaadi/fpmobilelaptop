import 'reward.dart';

class ChapterLevel {
  final int? vpCost;
  final int? xp;
  final LevelsReward? reward;
  final bool? isPurchasableWithVP;

  ChapterLevel(
      {required this.vpCost,
      required this.xp,
      required this.reward,
      required this.isPurchasableWithVP});

  factory ChapterLevel.fromJSON(Map<String, dynamic>? data) {
    return ChapterLevel(
      isPurchasableWithVP: data?['isPurchasableWithVP'],
      reward: LevelsReward.fromJSON(data?['reward']),
      vpCost: data?['vpCost'],
      xp: data?['xp'],
    );
  }
}
