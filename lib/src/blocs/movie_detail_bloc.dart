import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _movieId = PublishSubject<int>();


  dispose() async {
    _movieId.close();
  }
}

