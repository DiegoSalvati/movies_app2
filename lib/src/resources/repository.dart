import 'package:async/async.dart';
import 'movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies () => moviesApiProvider.fetchMovieList();
}