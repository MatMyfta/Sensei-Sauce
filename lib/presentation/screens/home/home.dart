import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensei_sauce/presentation/screens/game/game.dart';
import 'package:sensei_sauce/presentation/screens/home/widget/thumbnail.dart';
import 'package:sensei_sauce/providers/anime_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final AssetImage easyBackground = AssetImage("assets/wallpaper_ez.jpg");
  final AssetImage hardBackground = AssetImage("assets/wallpaper_hc.jpg");

  bool easy;

  @override
  initState() {
    super.initState();

    easy = true;
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
                    image: (easy ? easyBackground : hardBackground),
                    fit: BoxFit.cover)),
            child: Container(),
          ),
        ),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    children: [
                      CupertinoSwitch(
                          value: easy,
                          onChanged: (value) {
                            easy = value;
                          }),
                      Expanded(child: Container()),
                      Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: Color(0xFF3695EE),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 6),
                                child: FaIcon(FontAwesomeIcons.lightbulb,
                                    size: 20, color: Color(0xFFFFFFFF))),
                            Text(
                              '${12}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Thumbnail(
                  anime: AnimeProvider.animeList[AnimeProvider.start()],
                  position: AnimeProvider.start(),
                ),
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
    const double _borderRadius = 8;
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 12, horizontal: 45);
    const Color _buttonColor = Color(0xFFFCD268);

    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Game(
                    anime: AnimeProvider.animeList[AnimeProvider.start()])));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius)),
      color: _buttonColor,
      padding: EdgeInsets.all(0),
      elevation: 0,
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
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _discordLink() {
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
              margin: EdgeInsets.only(right: 12),
              child: FaIcon(
                FontAwesomeIcons.discord,
                size: 26,
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
