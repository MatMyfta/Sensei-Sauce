import 'package:sensei_sauce/models/anime.dart';
import 'package:sensei_sauce/models/difficulty.dart';

class UserProgress {
  static int hints = 0;
  static Difficulty difficulty = Difficulty.EASY;
  static Map<Set<String>, Difficulty> guessedAnimeById = {};
  static int guessedAnimeCount = 0;
  static Map<Anime, Difficulty> nextAnime = {};
}
