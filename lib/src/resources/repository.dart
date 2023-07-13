import 'package:async/async.dart';
import '../models/poster.dart';
import 'movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<List<Movie>> fetchAllMovies () => moviesApiProvider.fetchMovieList();
}