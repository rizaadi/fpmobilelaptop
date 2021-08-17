import 'level.dart';

class ContentChapter {
  final bool? isEpilogue;
  final List<ChapterLevel>? levels;

  ContentChapter({required this.isEpilogue, required this.levels});

  factory ContentChapter.fromJSON(Map<String, dynamic>? data) {
    return ContentChapter(
        isEpilogue: data?['isEpilogue'],
        levels: List<ChapterLevel>.generate(data?['levels'].length,
            (index) => ChapterLevel.fromJSON(data?['levels'][index])));
  }
}
