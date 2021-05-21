import 'package:sensei_sauce/models/anime.dart';

/// This class is a repository of all the anime retrieved from the
/// [AnimeProvider].
///
/// TODO: change the temporary data with an actual repository
class AnimeRepository {
  static List<Anime> animeList = [
    Anime(
      position: 1,
      difficulty: Difficulty.EASY,
      title: 'Dragon Ball',
      images: [
        'https://images6.alphacoders.com/418/thumb-1920-418342.jpg',
        'https://images.alphacoders.com/465/thumb-1920-465254.jpg',
        'https://images6.alphacoders.com/642/thumb-1920-642268.jpg',
        'https://images3.alphacoders.com/719/thumb-1920-719051.jpg',
      ],
      rows: [],
    ),
    Anime(
      position: 2,
      difficulty: Difficulty.EASY,
      title: 'Naruto',
      images: [
        'https://images5.alphacoders.com/532/thumb-1920-532559.jpg',
        'https://images4.alphacoders.com/128/thumb-1920-128706.png',
        'https://images4.alphacoders.com/727/thumb-1920-72706.jpg',
        'https://images8.alphacoders.com/703/thumb-1920-703728.png',
      ],
      rows: [],
    ),
    Anime(
      position: 3,
      difficulty: Difficulty.EASY,
      title: 'Bleach',
      images: [
        'https://images.alphacoders.com/238/thumb-1920-238761.png',
        'https://images6.alphacoders.com/727/thumb-1920-727838.png',
        'https://images5.alphacoders.com/759/thumb-1920-759145.jpg',
        'https://images.alphacoders.com/150/thumb-1920-150003.jpg',
      ],
      rows: [],
    ),
    Anime(
      position: 4,
      difficulty: Difficulty.EASY,
      title: 'Cowboy Bebop',
      images: [
        'https://images3.alphacoders.com/154/thumb-1920-15489.jpg',
        'https://images.alphacoders.com/267/thumb-1920-267361.jpg',
        'https://images.alphacoders.com/112/thumb-1920-1129281.png',
        'https://images3.alphacoders.com/165/thumb-1920-16537.jpg',
      ],
      rows: [],
    ),
    Anime(
      position: 5,
      difficulty: Difficulty.EASY,
      title: 'Attack on Titan',
      images: [
        'https://images8.alphacoders.com/505/thumb-1920-505616.png',
        'https://images7.alphacoders.com/418/thumb-1920-418724.png',
        'https://images2.alphacoders.com/582/thumb-1920-582804.png',
        'https://images5.alphacoders.com/508/thumb-1920-508247.jpg',
      ],
      rows: [],
    ),
  ];

  /// List of not guessed [Anime], that the user can still try to guess.
  static List<Anime> notGuessed = [];

  /// TODO : move this attribute to a business-logic class
  static int _index = 0;

  /// Initialization of the repository,
  /// [notGuessed] anime list is filled
  static void init() {
    notGuessed = _notGuessedAnime();
  }

  /// This method returns the next [Anime] to be guessed.
  /// TODO : when the user guesses the anime, it should be tagged as guessed.
  /// TODO : when the user guesses the anime, update the [notGuessed] [List].
  /// TODO : move this method to a business-logic class
  static Anime getAnime() => notGuessed[(++_index) % notGuessed.length];

  /// Initialize the [notGuessed] [List].
  static List<Anime> _notGuessedAnime() =>
      animeList.where((e) => !e.guessed).toList();
}
