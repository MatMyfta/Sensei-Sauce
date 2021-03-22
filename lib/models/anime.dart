import 'difficulty.dart';
import 'language.dart';
import 'row.dart';

class Anime {
  final int key;
  final int position;
  final Difficulty difficulty;
  final String title;
  final Language language;
  final List<String> images;
  final List<Row> rows;

  Anime({
    this.key,
    this.position,
    this.difficulty,
    this.title,
    this.language = Language.ENGLISH,
    this.images,
    this.rows,
  });

  /// return the hidden title
  String shrinkTitle() => this.title.replaceAll(RegExp('[^a-zA-z]'), '');

  /// return the anime title suggestion
  String titleSuggestion() => this.title.replaceAll(RegExp('[a-zA-Z]'), '_');

  /// return true if the language is japanese
  bool isJapanese() => this.language == Language.JAPANESE;
}
