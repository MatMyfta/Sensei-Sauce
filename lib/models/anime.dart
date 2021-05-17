import 'row.dart';

enum Difficulty { EASY, HARD }
enum Language { ENGLISH, JAPANESE }

class Anime {
  static final String path = "https://mm268.altervista.org/senseisauce/";

  final int position;
  final Difficulty difficulty;
  final String title;
  final List<String> images;
  final List<Row> rows;

  /// Check whether the anime has been guessed
  bool guessed = false;

  Anime({
    required this.position,
    required this.difficulty,
    required this.title,
    required this.images,
    required this.rows,
  });

  /// This method parses the JSON input file and returns the corresponding
  /// [Anime] object.
  factory Anime.fromJson(dynamic json) {
    return Anime(
      position: int.parse("${json['position']}"),
      difficulty: Difficulty.EASY,
      title: "${json['title']}",
      images: [
        '${json['imageA']}',
        '${json['imageB']}',
        '${json['imageC']}',
        '${json['imageD']}'
      ],
      rows: [Row("")],
    );
  }

  /// This method writes this anime in JSON format.
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
  static int compare(Anime a, Anime b) {
    return a.position - b.position;
  }
}
