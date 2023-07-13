import 'package:rxdart/rxdart.dart';

import '../models/item_model.dart';
import '../models/poster.dart';
import '../resources/repository.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<Movie>>();

  Stream<List<Movie>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<Movie> movies = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(movies);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
