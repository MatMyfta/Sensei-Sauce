import 'package:flutter/material.dart';
import 'package:sensei_sauce/providers/anime_provider.dart';

import '../game.dart';

class MyDialog extends StatelessWidget {
  /// TODO : graphic layout design
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 250,
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                  // TODO : dialog icon
                  ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Great!',
                style: TextStyle(),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'go on like this!',
                style: TextStyle(),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () {
                  /// hide dialog
                  Navigator.of(context).pop();

                  /// pop previous route
                  Navigator.of(context).pop();

                  /// push new route
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Game(
                              anime: AnimeProvider
                                  .animeList[AnimeProvider.next()])));
                },
                child: Text(
                  'Continua',
                  style: TextStyle(),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // TODO : icon style
          icon: Icon(Icons.clear),
        ),
      ]),
    );
  }
}
