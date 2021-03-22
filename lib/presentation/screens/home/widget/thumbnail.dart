import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensei_sauce/models/anime.dart';

class Thumbnail extends StatelessWidget {
  final Anime anime;
  final int position;

  Thumbnail({this.anime, this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(children: [
        RichText(
          text: TextSpan(
              text: 'You are blocked at ',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFA5A5A5),
              ),
              children: [
                TextSpan(
                  text: '#${anime.position}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF585858),
                  ),
                )
              ]),
        ),
        Container(
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(anime.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 18),
                child: FaIcon(
                  FontAwesomeIcons.share,
                  size: 18,
                  color: Color(0xFF585858),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress',
                      style: TextStyle(
                        color: Color(0xFF787878),
                      ),
                    ),
                    _progressBar(89, 329),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _progressBar(final int val, final int max) {
    const Color _bgColor = Color(0xFFE8E8E8);
    const Color _barColor = Color(0xFF3695EE);
    const double _maxWidth = 170;

    double _progressWidth = 170 * (val / max);

    return Container(
      height: 4,
      width: _maxWidth,
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _bgColor,
      ),
      child: Row(children: [
        Container(
          width: _progressWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _barColor,
          ),
        ),
        Expanded(child: Container())
      ]),
    );
  }
}
