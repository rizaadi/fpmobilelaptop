import 'ads_stats.dart';
import 'damage_ranges.dart';

class WeaponStats {
  final double fireRate;
  final int magazineSize;
  final double runSpeedMultiplier;
  final double equipTimeSeconds;
  final double reloadTimeSeconds;
  final double firstBulletAccuracy;
  final int shotgunPelletCount;
  final List<DamageRanges> damageRanges;
  final AdsStats adsStats;

  WeaponStats(
      {required this.fireRate,
      required this.magazineSize,
      required this.runSpeedMultiplier,
      required this.equipTimeSeconds,
      required this.reloadTimeSeconds,
      required this.firstBulletAccuracy,
      required this.shotgunPelletCount,
      required this.damageRanges,
      required this.adsStats});

  factory WeaponStats.fromJSON(Map<String, dynamic> data) {
    return WeaponStats(
      fireRate: data['fireRate'],
      magazineSize: data['magazineSize'],
      runSpeedMultiplier: data['runSpeedMultiplier'],
      equipTimeSeconds: data['equipTimeSeconds'],
      reloadTimeSeconds: data['reloadTimeSeconds'],
      firstBulletAccuracy: data['firstBulletAccuracy'],
      shotgunPelletCount: data['shotgunPelletCount'],
      damageRanges: List<DamageRanges>.generate(data['damageRanges'].length,
          (index) => DamageRanges.fromJSON(data['damageRanges'][index])),
      adsStats: AdsStats.fromJSON(data['adsStats']),
    );
  }
}
