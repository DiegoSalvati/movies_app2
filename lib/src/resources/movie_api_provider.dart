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
  // init offline_storage.dart
  // OfflineStorage storage = OfflineStorage();

  Future<ItemModel> fetchMovieList() async {
    Poster poster = Poster(file.bodyBytes);
    ItemModel movies = ItemModel.fromJson(json.decode(response.body));
    print('entered');
    var url = Uri.parse('http://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb');

    try {
      final response = await client.get(url);



      print(response.body.toString());
      List<Poster> result = List.empty(growable: true);
      if (response.statusCode == 200) {


        movies.results.forEach((element) async {
          var file = await client.get(Uri.parse(element.poster_path)); // <--2


// qui realmente posso utilizzare anche hive
          result.add(poster);
          box!.add(poster);
        });
      } else {
        throw Exception('Failed to load post');
      }
    }
    catch(e) {
        return box!.get(poster);
    }
    // storage.store(movies);
    return movies;
  }
}
