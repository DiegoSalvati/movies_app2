import 'dart:typed_data';

class Poster {
  Uint8List? file;
  String id;
  // vedere se questo e supported da hive

  Poster(this.file, this.id);
}