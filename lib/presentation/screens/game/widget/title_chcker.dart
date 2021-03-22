import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/anime.dart';

class TitleChecker extends StatelessWidget {
  final Anime anime;
  final Function onSubmitted;
  final TextEditingController textEditingController;

  FocusNode _focusNode = FocusNode();

  TitleChecker({this.anime, this.textEditingController, this.onSubmitted});

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
