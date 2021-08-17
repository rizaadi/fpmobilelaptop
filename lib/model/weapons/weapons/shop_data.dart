class ShopData {
  final int cost;
  final String category;
  final String categoryText;
  final bool canBeTrashed;
  final String newImage;
  final String assetPath;

  ShopData(
      {required this.cost,
      required this.category,
      required this.categoryText,
      required this.canBeTrashed,
      required this.newImage,
      required this.assetPath});

  static ShopData? fromJSON(Map<String, dynamic>? data) {
    return ShopData(
        assetPath: data?['assetPath'],
        canBeTrashed: data?['canBeTrashed'],
        category: data?['category'],
        categoryText: data?['categoryText'],
        cost: data?['cost'],
        newImage: data?['newImage']);
  }
}
