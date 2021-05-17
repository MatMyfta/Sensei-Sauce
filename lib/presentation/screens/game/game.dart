import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sensei_sauce/models/anime.dart';
import 'package:sensei_sauce/presentation/screens/game/helpers/my_dialog_helper.dart';

/// This widget will produce the Game page.
/// Stores a reference to the [Anime] that contains relevant informations
/// about the anime that need to be printed.
class Game extends StatelessWidget {
  final Anime anime;
  final Difficulty difficulty;

  Game({required this.anime, required this.difficulty});

  final double _imageSize = 250;
  final double _hPadding = 24;

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: _hPadding,
                  ),

                  // TODO : remove solution
                  // This solution has been added only for debugging purpose
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                          text: 'Anime ',
                          style: TextStyle(
                            fontSize: 21,
                            color: Color(0xFFA5A5A5),
                          ),
                          children: [
                            TextSpan(
                                text: '#${anime.position}: ${anime.title}',
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Color(0xFF787878),
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    ),
                  ),
                ),

                // Image UI
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: _imageSize,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                    ),
                    items: anime.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: _imageSize,
                            height: _imageSize,
                            margin: EdgeInsets.only(
                                left: 0, right: 0, top: 12, bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                alignment: FractionalOffset.topCenter,
                                image: Image.network("${Anime.path}${i}").image,
                              ),
                            ),
                          );
                          ;
                        },
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: _hPadding,
                  ),
                  child: TitleChecker(
                    anime: anime,
                    textEditingController: _textEditingController,
                    onSubmitted: (string) {
                      if (_textEditingController.text
                              .replaceAll(RegExp('[^a-zA-z]'), '')
                              .compareTo(anime.shrinkTitle()) ==
                          0) {
                        MyDialogHelper.dialog(context);
                      } else {
                        // TODO : fail
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

/// This widget is an extension of the [TextField].
/// Checks if the submitted title is correct.
/// TODO : change the checker from edittext to custom form
class TitleChecker extends StatelessWidget {
  final Anime anime;
  final void Function(String) onSubmitted;
  final TextEditingController textEditingController;

  FocusNode _focusNode = FocusNode();

  TitleChecker(
      {required this.anime,
      required this.textEditingController,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: false,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Anime title",
        ),
        focusNode: _focusNode,
        maxLines: 1,
        onSubmitted: onSubmitted,
        style: TextStyle(),
      ),
    );
  }
}
