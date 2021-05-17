import 'package:sensei_sauce/models/anime.dart';

import 'anime_provider.dart';

/// This class is a repository of all the anime retrieved from the
/// [AnimeProvider].
class AnimeRepository {
  static AnimeProvider _animeProvider = new AnimeProvider();
  static List<Anime> animeList = [];
  static List<Anime> notGuessed = [];

  static int index = 0;

  /// This method should be called at the beginning, in order to fill
  /// the whole list of [Anime].
  static Future<List<Anime>> init() async {
    AnimeRepository.animeList =
        await _animeProvider.getAnimeList().then((value) {
      value.sort(Anime.compare);
      return value;
    });
    notGuessed = _notGuessedAnime();
    return AnimeRepository.animeList;
  }

  /// This method returns the next [Anime] to be guessed.
  static Anime getAnime() => notGuessed[0];

  static List<Anime> _notGuessedAnime() =>
      animeList.where((e) => !e.guessed).toList();
}
