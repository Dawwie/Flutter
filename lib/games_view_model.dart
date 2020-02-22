import 'dart:convert';

import 'package:flutter_workshop_1/models.dart';
import 'package:http/http.dart';

class GameViewModel {
  static const GAMES_URL = "https://api.rawg.io/api/games?page_size=50";

  Future<List<Game>> fetchGames() async {
    final response = await get(GAMES_URL);
    if (response.statusCode == 200) {
      return GamesResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception("Failed to load games");
    }
  }
}
