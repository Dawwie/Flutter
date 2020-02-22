class Game {
  final int id;
  final String name;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final int ratingsCount;
  final List<Genre> genres;

  Game(
    this.id,
    this.name,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratingsCount,
    this.genres,
  );

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        backgroundImage = json['background_image'],
        rating = json['rating'],
        ratingTop = json['rating_top'],
        ratingsCount = json['ratings_count'],
        genres = (json['genres'] as List)
            .map((genreJson) => Genre.fromJson(genreJson))
            .toList();
}

class Genre {
  final int id;
  final String name;

  Genre(
    this.id,
    this.name,
  );

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class GamesResponse {
  final List<Game> results;

  GamesResponse(
    this.results,
  );

  GamesResponse.fromJson(Map<String, dynamic> json)
      : results = (json['results'] as List)
            .map((gameJson) => Game.fromJson(gameJson))
            .toList();
}
