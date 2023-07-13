import 'dart:typed_data';


class Movie {
  Poster? poster;
  String title;
  String backdrop_path;
  String overview;
  String release_date;
  String vote_average;
  String id;

  Movie(this.poster, this.title, this.backdrop_path, this.overview, this.release_date,
      this.vote_average, this.id);
}
class Poster {
  Uint8List? file;
  String path;
  // vedere se questo e supported da hive

  Poster(this.file, this.path);
}