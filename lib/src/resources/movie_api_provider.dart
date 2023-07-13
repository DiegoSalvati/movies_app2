import 'package:async/async.dart';
import 'package:http/http.dart' show Client;
import 'package:movies_app/src/models/poster.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import '../models/item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'c6aeee577586ba38e487b74dfede5deb';
  Box? box;


  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('movies');
  }
  Future<List<Movie>> fetchMovieList() async {
    await openBox();
    var url = Uri.parse('http://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb');
    List<Movie> moviesResult = List.empty(growable: true);

    try {

      final response = await client.get(url);

      ItemModel movies = ItemModel.fromJson(json.decode(response.body));
      print('entered');

      print(response.body.toString());
      if (response.statusCode == 200) {

        movies.results.forEach((element) async {

          var file = await client.get(Uri.parse('https://image.tmdb.org/t/p/w300/'+element.poster_path)); // <--2

          Poster poster = Poster(file.bodyBytes, element.poster_path);
          Movie movie = Movie(poster, element.backdrop_path, element.overview, element.release_date,
              element.vote_average);
          moviesResult.add(movie);

          movie.poster!.path = ""; // set to emtpy string
          box!.add(movie);
        });
      } else {
        throw Exception('Failed to load post');
      }
    }
    catch(e) {
      return box!.values.map((element) {  return Movie(element.poster,
          element.backdrop_path, element.overview, element.release_date, element.vote_average); }).toList();
    }
    // storage.store(movies);
    return moviesResult;
  }
}
