import 'package:fpmobilelaptop/model/agent/agent.dart';
import 'package:fpmobilelaptop/model/buddies/buddy.dart';
import 'package:fpmobilelaptop/model/buddies/level.dart';
import 'package:fpmobilelaptop/model/bundles/bundle.dart';
import 'package:fpmobilelaptop/model/contracts/contract.dart';
import 'package:fpmobilelaptop/model/currencies/currencies.dart';
import 'package:fpmobilelaptop/model/events/event.dart';
import 'package:fpmobilelaptop/model/gear/gear.dart';
import 'package:fpmobilelaptop/model/info/info.dart';
import 'package:fpmobilelaptop/model/maps/maps.dart';
import 'package:fpmobilelaptop/model/mods/gamemods.dart';
import 'package:fpmobilelaptop/model/playercards/playercards.dart';
import 'package:fpmobilelaptop/model/playertitles/playertitles.dart';
import 'package:fpmobilelaptop/model/seasons/season.dart';
import 'package:fpmobilelaptop/model/sprays/level.dart';
import 'package:fpmobilelaptop/model/sprays/spray.dart';
import 'package:fpmobilelaptop/model/themes/theme.dart';
import 'package:fpmobilelaptop/model/tiers/content.dart';
import 'package:fpmobilelaptop/model/weapons/skins/chromas.dart';
import 'package:fpmobilelaptop/model/weapons/skins/levels.dart';
import 'package:fpmobilelaptop/model/weapons/skins/skins.dart';
import 'package:fpmobilelaptop/model/weapons/weapons/weapon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fpmobilelaptop/utils/dir_constants.dart';

class ValorantAPI {
  Future<List<dynamic>> _getAllJSONData(String urlDirectory) async {
    String requestURL = DirConstants.baseURL + urlDirectory;
    http.Response res = await http.get(Uri.parse(requestURL));
    return jsonDecode(res.body)['data'];
  }

  Future<Map<String, dynamic>> _getJSONDataByUuid(
      String urlDirectory, String uuid) async {
    String requestURL = DirConstants.baseURL + urlDirectory + "/" + uuid;
    http.Response res = await http.get(Uri.parse(requestURL));
    return jsonDecode(res.body)['data'];
  }

  Future<List<Agent>> getAllAgents() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.agentsDir);
    return List<Agent>.generate(
        data.length, (index) => Agent.fromJSON(data[index]));
  }

  Future<Agent> getAgentByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.agentsDir, uuid);

    return Agent.fromJSON(data);
  }

  Future<List<Buddy>> getAllBuddies() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.buddiesDir);
    return List<Buddy>.generate(
        data.length, (index) => Buddy.fromJSON(data[index]));
  }

  Future<Buddy> getBuddyByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.buddiesDir, uuid);

    return Buddy.fromJSON(data);
  }

  Future<List<BuddyLevel>> getAllBuddyLevels() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.buddiesDir);
    return List<BuddyLevel>.generate(
        data.length, (index) => BuddyLevel.fromJSON(data[index]));
  }

  Future<BuddyLevel> getBuddyLevelByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.buddyLevelDir, uuid);

    return BuddyLevel.fromJSON(data);
  }

  Future<List<Bundle>> getAllBundles() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.bundlesDir);
    return List<Bundle>.generate(
        data.length, (index) => Bundle.fromJSON(data[index]));
  }

  Future<Bundle> getBundleByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.bundlesDir, uuid);

    return Bundle.fromJSON(data);
  }

  Future<List<ContentTiers>> getAllContentTiers() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.contentTiersDir);
    return List<ContentTiers>.generate(
        data.length, (index) => ContentTiers.fromJSON(data[index]));
  }

  Future<ContentTiers> getContentTierByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.contentTiersDir, uuid);

    return ContentTiers.fromJSON(data);
  }

  Future<List<Contract?>> getAllContracts() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.contractsDir);
    return List<Contract?>.generate(
        data.length, (index) => Contract.fromJSON(data[index]));
  }

  Future<Contract> getContractByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.contractsDir, uuid);

    return Contract.fromJSON(data);
  }

  Future<List<Currencies>> getAllCurrencies() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.currenciesDir);
    return List<Currencies>.generate(
        data.length, (index) => Currencies.fromJSON(data[index]));
  }

  Future<Currencies> getCurrenciesByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.currenciesDir, uuid);

    return Currencies.fromJSON(data);
  }

  Future<List<Events>> getAllEvents() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.eventsDir);
    return List<Events>.generate(
        data.length, (index) => Events.fromJSON(data[index]));
  }

  Future<Events> getEventByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.eventsDir, uuid);

    return Events.fromJSON(data);
  }

  Future<List<GameMods>> getAllGamemodes() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.gamemodesDir);
    return List<GameMods>.generate(
        data.length, (index) => GameMods.fromJSON(data[index]));
  }

  Future<GameMods> getGamemodeByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.gamemodesDir, uuid);

    return GameMods.fromJSON(data);
  }

  Future<List<Gear>> getAllGear() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.gearDir);
    return List<Gear>.generate(
        data.length, (index) => Gear.fromJSON(data[index]));
  }

  Future<Gear> getGearByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.gearDir, uuid);

    return Gear.fromJSON(data);
  }

  Future<List<Maps>> getAllMaps() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.mapsDir);
    return List<Maps>.generate(
        data.length, (index) => Maps.fromJSON(data[index]));
  }

  Future<Maps> getMapByUuid(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.mapsDir, uuid);

    return Maps.fromJSON(data);
  }

  Future<List<PlayerCards>> getAllPlayerCards() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.playercardsDir);
    return List<PlayerCards>.generate(
        data.length, (index) => PlayerCards.fromJSON(data[index]));
  }

  Future<PlayerCards> getPlayerCard(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.playercardsDir, uuid);

    return PlayerCards.fromJSON(data);
  }

  Future<List<PlayerTitles>> getAllPlayerTitles() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.playertitlesDir);
    return List<PlayerTitles>.generate(
        data.length, (index) => PlayerTitles.fromJSON(data[index]));
  }

  Future<PlayerTitles> getPlayerTitle(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.playertitlesDir, uuid);

    return PlayerTitles.fromJSON(data);
  }

  Future<List<Season>> getAllSeasons() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.seasonsDir);
    return List<Season>.generate(
        data.length, (index) => Season.fromJSON(data[index]));
  }

  Future<Season> getSeason(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.seasonsDir, uuid);

    return Season.fromJSON(data);
  }

  Future<List<Spray>> getAllSprays() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.spraysDir);
    return List<Spray>.generate(
        data.length, (index) => Spray.fromJSON(data[index]));
  }

  Future<Spray> getSpray(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.spraysDir, uuid);

    return Spray.fromJSON(data);
  }

  Future<List<SprayLevel>> getAllSprayLevels() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.spraysLevelDir);
    return List<SprayLevel>.generate(
        data.length, (index) => SprayLevel.fromJSON(data[index]));
  }

  Future<SprayLevel> getSprayLevel(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.spraysLevelDir, uuid);

    return SprayLevel.fromJSON(data);
  }

  Future<List<Theme>> getAllThemes() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.themesDir);
    return List<Theme>.generate(
        data.length, (index) => Theme.fromJSON(data[index]));
  }

  Future<Theme> getTheme(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.themesDir, uuid);

    return Theme.fromJSON(data);
  }

  Future<List<Weapon>> getAllWeapons() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.weaponsDir);
    return List<Weapon>.generate(
        data.length, (index) => Weapon.fromJSON(data[index]));
  }

  Future<Weapon> getWeapon(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.weaponsDir, uuid);

    return Weapon.fromJSON(data);
  }

  Future<List<Skin>> getAllWeaponSkins() async {
    List<dynamic> data = await _getAllJSONData(DirConstants.weaponsSkinsDir);
    return List<Skin>.generate(
        data.length, (index) => Skin.fromJSON(data[index]));
  }

  Future<Skin> getWeaponSkin(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.weaponsSkinsDir, uuid);

    return Skin.fromJSON(data);
  }

  Future<List<Chromas>> getAllWeaponSkinChromas() async {
    List<dynamic> data =
        await _getAllJSONData(DirConstants.weaponSkinChromasDir);
    return List<Chromas>.generate(
        data.length, (index) => Chromas.fromJSON(data[index]));
  }

  Future<Chromas> getWeaponSkinChromas(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.weaponSkinChromasDir, uuid);

    return Chromas.fromJSON(data);
  }

  Future<List<SkinLevel>> getAllWeaponSkinLevels() async {
    List<dynamic> data =
        await _getAllJSONData(DirConstants.weaponSkinLevelsDir);
    return List<SkinLevel>.generate(
        data.length, (index) => SkinLevel.fromJSON(data[index]));
  }

  Future<SkinLevel> getWeaponSkinLevel(String uuid) async {
    Map<String, dynamic> data =
        await _getJSONDataByUuid(DirConstants.weaponSkinLevelsDir, uuid);

    return SkinLevel.fromJSON(data);
  }

  Future<List<dynamic>> _getAllJSONData2(String urlDirectory) async {
    String requestURL = DirConstants.secondURL + urlDirectory;
    http.Response res = await http.get(Uri.parse(requestURL));
    return jsonDecode(res.body)['data'];
  }

  Future<Map<String, dynamic>> _getJSONDataByUuid2(
      String urlDirectory, String uuid) async {
    String requestURL = DirConstants.secondURL + urlDirectory + "/" + uuid;
    http.Response res = await http.get(Uri.parse(requestURL));
    return jsonDecode(res.body)['data'];
  }

  Future<List<Info>> getWebsiteArticles() async {
    List<dynamic> data = await _getAllJSONData2(DirConstants.infoDir);
    return List<Info>.generate(
        data.length, (index) => Info.fromJSON(data[index]));
  }
}
