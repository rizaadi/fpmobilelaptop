import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  // String currenttier;
  // String currenttierpatched;
  // String ranking_in_tier;
  // String mmr_change_to_last_game;
  // String elo;
  final String name;
  String tag;

  User(
      {
      //   required this.currenttier,
      // required this.currenttierpatched,
      // required this.ranking_in_tier,
      // required this.mmr_change_to_last_game,
      // required this.elo,
      required this.name,
      required this.tag});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      // currenttier: data['currenttier'],
      // currenttierpatched: data['currenttierpatched'],
      // ranking_in_tier: data['ranking_in_tier'],
      // mmr_change_to_last_game: data['mmr_change_to_last_game'],
      // elo: data['elo'],
      name: data['name'],
      tag: data['tag'],
    );
  }
  static Future<User> getmmrUser(String username, String tagline) async {
    var apiURL = Uri.parse("https://api.henrikdev.xyz/valorant/v1/mmr/ap/" +username+"/"+tagline);
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var dataob = (jsonObject as Map<String, dynamic>)['data'];

    // Map<String, dynamic> data = await _getJSONDataUser("https://api.henrikdev.xyz/valorant/v1/mmr/ap",username,tagline);
    return User.fromJSON(dataob);
  }
}
