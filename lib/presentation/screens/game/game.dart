import 'package:flutter/material.dart';
import 'package:sensei_sauce/models/anime.dart';
import 'package:sensei_sauce/presentation/screens/game/helpers/my_dialog_helper.dart';
import 'package:sensei_sauce/presentation/screens/game/widget/title_chcker.dart';

class Game extends StatelessWidget {
  final Anime anime;

  Game({this.anime});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _imageSize = 250;

    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              // image UI
              Center(
                child: Container(
                  width: _imageSize,
                  height: _imageSize,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 0),
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(anime.images[0]),
                    ),
                  ),
                ),
              ),

              /// suggest the language of the title of the anime
              /// default: english
              (this.anime.isJapanese()
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFEEEEEE),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                      child: Text('JAPANESE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFAAAAAA),
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  : Container()),

              /// suggest the title of the anime with a set of underscores that
              /// represents the alphanumerical character of the title
              Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  anime.titleSuggestion(),
                  style: TextStyle(fontSize: 32, letterSpacing: 6),
                ),
              ),
              Expanded(child: Container()),

              TitleChecker(
                anime: anime,
                textEditingController: _textEditingController,
                onSubmitted: (string) {
                  if (_textEditingController.text
                          .replaceAll(RegExp('[^a-zA-z0-9]'), '')
                          .compareTo(anime.shrinkTitle()) ==
                      0) {
                    MyDialogHelper.dialog(context);
                  } else {
                    // TODO : fail
                  }
                },
              ),
            ],
          )),
    );
  }
}
