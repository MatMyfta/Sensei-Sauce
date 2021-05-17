import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensei_sauce/data/anime_repository.dart';
import 'package:sensei_sauce/models/anime.dart';
import 'package:sensei_sauce/presentation/screens/game/game.dart';
import 'package:sensei_sauce/presentation/screens/home/widget/thumbnail.dart';

/// This widget paints the initial page of the app.
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

/// The state is necessary in order to change the layout and the data
/// when the user changes the difficulty of the game.
class HomePageState extends State<HomePage> {
  /// Header Background for the easy difficulty
  final AssetImage _easyBackground = AssetImage("assets/wallpaper_ez.jpg");

  /// Header Background for the hard difficulty
  final AssetImage _hardBackground = AssetImage("assets/wallpaper_hc.jpg");

  /// Difficulty of the game, this object controls the painted layout
  /// and the given data.
  late Difficulty _difficulty;

  var _animeList;

  initState() {
    super.initState();
    _difficulty = Difficulty.EASY;
    _animeList = AnimeRepository.init();
  }

  @override
  Widget build(BuildContext context) {
    double _topHeight = 200;
    Radius _borderRadius = Radius.circular(25);

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: _topHeight,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: (_difficulty == Difficulty.EASY
                        ? _easyBackground
                        : _hardBackground),
                    fit: BoxFit.cover)),
            child: Container(),
          ),
        ),
        // TODO : change the thumbnail data snapshot, in particular the snapshot should be read from shared preferences (or Hive)
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: _borderRadius, topRight: _borderRadius),
              boxShadow: [BoxShadow(blurRadius: 20, color: Color(0x22000000))],
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top: (_topHeight - 25.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                FutureBuilder<List<Anime>>(
                    future: _animeList,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Anime>> snapshot) {
                      if (snapshot.hasData)
                        return Thumbnail(
                          anime: AnimeRepository.animeList[0],
                          position: 0,
                        );
                      else if (snapshot.hasError)
                        return Text('${snapshot.error}');
                      return CircularProgressIndicator();
                    }),
                Expanded(child: Container()),
                _startButton(),
                SizedBox(
                  height: 24,
                ),
                _discordLink(),
                SizedBox(
                  height: 36,
                )
              ],
            )),
      ]),
    );
  }

  Widget _startButton() {
    const double _borderRadius = 4;
    const double _verticalPadding = 12;
    const double _horizontalPadding = 45;
    const double _fontSize = 24;

    const Color _buttonColor = Color(0xFFFCD268);
    const EdgeInsets _padding = EdgeInsets.symmetric(
        vertical: _verticalPadding, horizontal: _horizontalPadding);

    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Game(
                      anime: AnimeRepository.animeList[0],
                      difficulty: Difficulty.EASY,
                    )));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius)),
      color: _buttonColor,
      padding: EdgeInsets.all(0),
      splashColor: _buttonColor,
      highlightColor: _buttonColor,
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        ),
        padding: _padding,
        child: Text(
          'Inizia',
          style: TextStyle(
            color: Colors.white,
            fontSize: _fontSize,
          ),
        ),
      ),
    );
  }

  Widget _discordLink() {
    const double _margin = 12;
    const double _iconSize = 26;
    const Color _fontColor = Color(0xFFA5A5A5);
    const Color _boldFontColor = Color(0xFF585858);

    return GestureDetector(
        onTap: () {
          // TODO : link to discord server
          print('discord button pressed');
        },
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: _margin),
              child: FaIcon(
                FontAwesomeIcons.discord,
                size: _iconSize,
                color: _boldFontColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reach us on',
                  style: TextStyle(color: _fontColor),
                ),
                Text('Discord',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: _boldFontColor))
              ],
            )
          ],
        )));
  }
}
