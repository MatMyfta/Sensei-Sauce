import 'row.dart';

/// The same anime can appear in more than one [Difficulty], namely it can
/// appear in [Difficulty.EASY] and [Difficulty.HARD].
enum Difficulty { EASY, HARD }

/// The [language] of the [Anime] suggests the language in which the user
/// should type the [title]. It could be either [Language.ENGLISH] or
/// [Language.JAPANESE].
enum Language { ENGLISH, JAPANESE }

/// [Anime] model
class Anime {
  /// The position of the [Anime] in the list.
  final int position;

  /// The same [Anime] can appear in [Difficulty.EASY] and [Difficulty.HARD] mode.
  final Difficulty difficulty;

  /// String representing the title of the [Anime].
  /// This is the [String] that should be guessed by the user.
  final String title;

  /// List of the images that will appear in the slider of the game.
  /// The list should contain the entire path for the network image.
  final List<String> images;

  /// List of [Row]s that represents the characters that helps the user to find
  /// the solution for the challenge.
  final List<Row> rows;

  /// Check whether the anime has been already guessed.
  ///
  /// This information can be used to collect all the guessed anime, and
  /// to represent them in a different way.
  bool guessed;

  Anime({
    required this.position,
    required this.difficulty,
    required this.title,
    required this.images,
    required this.rows,
    this.guessed = false,
  });

  /// This method writes this [Anime] model in JSON format. In particular
  /// stores information about the [position], [difficulty], [title], [images],
  /// [rows], and [guessed].
  Map toJson() => {
        'position': this.position,
        'difficulty': this.difficulty,
        'title': this.title,
        'images': this.images,
        'rows': this.rows,
        'guessed': this.guessed,
      };

  /// This method shrinks the title, leaving only alphabetical characters.
  String shrinkTitle() => this.title.replaceAll(RegExp('[^a-zA-z]'), '');

  /// This method returns the title suggestion, this means a new [String]
  /// that contains only underscores '_'.
  String titleSuggestion() => this.title.replaceAll(RegExp('[a-zA-Z]'), '_');

  /// This method compares two given anime.
  ///
  /// Comparison is made based on their position.
  static int compare(Anime a, Anime b) => a.position - b.position;
}
