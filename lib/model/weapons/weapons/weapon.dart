import '../../gear/shop_data.dart';
import '../skins/skins.dart';
// import 'weapon_stats.dart';

class Weapon {
  final String uuid;
  final String displayName;
  final String category;
  final String defaultSkinUuid;
  final String displayIcon;
  final String killStreamIcon;
  final String assetPath;
  // final WeaponStats weaponStats;
  final ShopData shopData;
  final List<Skin> skins;

  Weapon(
      {required this.uuid,
      required this.displayName,
      required this.category,
      required this.defaultSkinUuid,
      required this.displayIcon,
      required this.killStreamIcon,
      required this.assetPath,
      // required this.weaponStats,
      required this.shopData,
      required this.skins});

  factory Weapon.fromJSON(Map<String, dynamic> data) {
    return Weapon(
        uuid: data['uuid'],
        displayName: data['displayName'],
        category: data['category'],
        defaultSkinUuid: data['defaultSkinUuid'],
        displayIcon: data['displayIcon'],
        killStreamIcon: data['killStreamIcon'],
        assetPath: data['assetPath'],
        // weaponStats: WeaponStats.fromJSON(data['weaponStats']),
        shopData: ShopData.fromJSON(data['shopData']),
        skins: List<Skin>.generate(data['skins'].length,
            (index) => Skin.fromJSON(data['skins'][index])));
  }
}
