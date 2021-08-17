import 'package:fpmobilelaptop/model/gear/shop_data.dart';

class Gear {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;
  final ShopData? shopData;

  Gear(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.displayIcon,
      required this.assetPath,
      required this.shopData});

  factory Gear.fromJSON(Map<String, dynamic>? data) {
    return Gear(
        assetPath: data?['assetPath'],
        description: data?['description'],
        displayIcon: data?['displayIcon'],
        displayName: data?['displayName'],
        shopData: ShopData.fromJSON(data?['shopData']),
        uuid: data?['uuid']);
  }
}
