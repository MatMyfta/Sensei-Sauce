import 'package:sensei_sauce/models/anime.dart';
import 'package:sensei_sauce/models/difficulty.dart';
import 'package:sensei_sauce/models/row.dart' as row;

class AnimeProvider {
  static int _iterator = 0;
  static int start() => _iterator;
  static int next() => (++_iterator) % animeList.length;

  static List<Anime> animeList = [
    Anime(
        key: 0001,
        position: 0,
        difficulty: Difficulty.EASY,
        title: "one piece",
        images: ['http://mm268.altervista.org/senseisauce/H0000Aop.jpg'],
        rows: [row.Row("oegcpbdp"), row.Row("afecnize")]),
    Anime(
        key: 0002,
        position: 1,
        difficulty: Difficulty.EASY,
        title: "full metal alchemist",
        images: ["http://mm268.altervista.org/senseisauce/N0001Afab.jpg"],
        rows: [row.Row("oegcpbdp"), row.Row("afecnize")]),
  ];
}
