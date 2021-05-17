import 'package:sensei_sauce/data/anime_repository.dart';

import 'anime.dart';

/// This class contains all the information that need to be saved persistently,
/// and a static [UserProgress] object that can be used by other classes.
class UserProgress {
  /// [UserProgress] defaults
  static UserProgress progress = UserProgress(
    difficulty: Difficulty.EASY,
    nextAnime: AnimeRepository.animeList[0],
    guessedAnimeId: {},
  );

  Difficulty difficulty;
  Set<String> guessedAnimeId;
  Anime nextAnime;

  UserProgress(
      {required this.difficulty,
      required this.nextAnime,
      required this.guessedAnimeId});
}
