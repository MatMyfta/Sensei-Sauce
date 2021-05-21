import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensei_sauce/models/anime.dart';

/// This class paints the [Anime] thumbnail (first pic) in the [HomePage]
/// widget.
class Thumbnail extends StatelessWidget {
  final Anime anime;
  final int position;

  Thumbnail({required this.anime, required this.position});

  @override
  Widget build(BuildContext context) {
    final double _margin = 24;
    final double _marginRight = 18;
    final double _fontSize = 20;
    final double _imageBorderRadius = 15;
    final double _imageSize = 150;

    return Container(
      margin: EdgeInsets.all(_margin),
      child: Column(children: [
        RichText(
          text: TextSpan(
              text: 'You are blocked at ',
              style: TextStyle(
                fontSize: _fontSize,
                color: Color(0xFFA5A5A5),
              ),
              children: [
                TextSpan(
                  text: '#${anime.position}',
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: Color(0xFF585858),
                  ),
                )
              ]),
        ),
        Container(
          child: Container(
            width: _imageSize,
            height: _imageSize,
            margin: EdgeInsets.symmetric(vertical: _margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_imageBorderRadius),
              // image: DecorationImage(
              //   image: Image.network('${Anime.path}${anime.images[0]}').image,
              //   fit: BoxFit.cover,
              // ),
            ),
            child: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: '${anime.images[0]}',
                fit: BoxFit.cover),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(right: _marginRight),
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
          ]),
        ),
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
