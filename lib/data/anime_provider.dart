// class AnimeProvider {
//   final String uri =
//       'https://script.google.com/macros/s/AKfycbyCVxWyufx_DZekInz4zK0rb3mEU1RjMgA6JIiQJiYtNdUxAu__JGtRSErX5lfTrbcm/exec';
//
//   Future<List<Anime>> getAnimeList() async {
//     final response = await http.get(Uri.parse(uri));
//     var jsonFeedback = convert.jsonDecode(response.body) as List;
//     if (response.statusCode == 200)
//       return jsonFeedback.map((json) => Anime.fromJson(json)).toList();
//     else
//       throw Exception('Failed to load data.');
//   }
// }
