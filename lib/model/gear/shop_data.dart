class ShopData {
  final int cost;
  final String category;
  final String cateogryText;
  final String newImage;
  final String assetPath;

  ShopData(
      {required this.cost,
      required this.category,
      required this.cateogryText,
      required this.newImage,
      required this.assetPath});

  static ShopData fromJSON(Map<String, dynamic>? data) {
    return ShopData(
        assetPath: data?['assetPath'],
        category: data?['category'],
        cateogryText: data?['categoryText'],
        cost: data?['cost'],
        newImage: data?['newImage']);
  }
}
