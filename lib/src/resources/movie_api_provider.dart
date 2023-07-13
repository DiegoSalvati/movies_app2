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
  Future<ItemModel> fetchMovieList() async {
    await openBox();
    Poster? poster;
    var url = Uri.parse('http://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb');
    final response = await client.get(url);

    ItemModel movies = ItemModel.fromJson(json.decode(response.body));
    print('entered');

    try {
      print(response.body.toString());
      List<Poster> result = List.empty(growable: true);
      if (response.statusCode == 200) {

        movies.results.forEach((element) async {

          var file = await client.get(Uri.parse(element.poster_path)); // <--2
          Poster poster = Poster(file.bodyBytes, '');
          result.add(poster);
          box!.add(poster);
        });
      } else {
        throw Exception('Failed to load post');
      }
    }
    catch(e) {
        return box!.get(poster!.id);
    }
    // storage.store(movies);
    return movies;
  }
}
