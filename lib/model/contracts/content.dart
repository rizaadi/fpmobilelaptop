import 'chapter.dart';

class ContractContent {
  final String? relationType;
  final String? relationUuid;
  final List<ContentChapter>? chapters;
  final String? premiumRewardScheduleUuid;
  final int? premiumVPCost;

  ContractContent(
      {required this.relationType,
      required this.relationUuid,
      required this.chapters,
      required this.premiumRewardScheduleUuid,
      required this.premiumVPCost});

  factory ContractContent.fromMap(Map<String, dynamic>? data) {
    return ContractContent(
        premiumRewardScheduleUuid: data?['premiumRewardScheduleUuid'],
        premiumVPCost: data?['premiumVPCost'],
        relationType: data?['relationType'],
        relationUuid: data?['relationUuid'],
        chapters: List<ContentChapter>.generate(
            data?['chapters'].length, (index) => data?['chapters'][index]));
  }
}
