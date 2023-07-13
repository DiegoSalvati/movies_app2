import 'dart:typed_data';


class Movie {
  Poster? poster;
  String backdrop_path;
  String overview;
  String release_date;
  String vote_average;

  Movie(this.poster, this.backdrop_path, this.overview, this.release_date,
      this.vote_average);
}
class Poster {
  Uint8List? file;
  String path;
  // vedere se questo e supported da hive

  Poster(this.file, this.path);
}