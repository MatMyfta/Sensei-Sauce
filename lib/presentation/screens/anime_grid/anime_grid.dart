import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensei_sauce/data/anime_repository.dart';
import 'package:sensei_sauce/models/anime.dart';

class AnimeGrid extends StatefulWidget {
  AnimeGrid();

  @override
  State<StatefulWidget> createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  _AnimeGridState();

  final ScrollController _scrollController = ScrollController();
  var animeList;

  @override
  void initState() {
    this.animeList = AnimeRepository.animeList;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // title
          _title(),
          Expanded(child: _animeGrid(context)),
          // grid view
        ],
      ),
    );
  }

  Widget _title() {
    const double _fontSize = 32;

    const FontWeight _fontWeight = FontWeight.w900;
    const Color _fontColor = Color(0xFF222222);

    return Container(
      margin: EdgeInsets.only(top: 32, bottom: 8),
      child: Text(
        'Anime List',
        style: TextStyle(
          fontSize: _fontSize,
          color: _fontColor,
          fontWeight: _fontWeight,
        ),
      ),
    );
  }

  Widget _animeGrid(var context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _animeCard(animeList[index]),
              childCount: animeList.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _animeCard(Anime anime) {
    const double radius = 6;
    const Color borderColor = Color(0xFF222222);

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: CachedNetworkImage(
            imageUrl: '${anime.images[0]}', fit: BoxFit.cover),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
