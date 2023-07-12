import 'package:hive_flutter/hive_flutter.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel {

@HiveField(0)
  int? _page;
@HiveField(1)
  int? _total_results;
@HiveField(2)
  int? _total_pages;
@HiveField(3)
  List<Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Result result = Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  ItemModel(_results);

  List<Result> get results => _results;

  int get total_pages => _total_pages!;

  int get total_results => _total_results!;

  int get page => _page!;
}


@HiveType(typeId: 1)
class Result {
  @HiveField(4)
  int? _vote_count;
  @HiveField(5)
  int? _id;
  @HiveField(6)
  bool? _video;
  @HiveField(7)
  String? _vote_average;
  @HiveField(8)
  String? _title;
  @HiveField(9)
  double? _popularity;
  @HiveField(10)
  String? _poster_path;
  @HiveField(11)
  String? _original_language;
  @HiveField(12)
  String? _original_title;
  @HiveField(13)
  List<int> _genre_ids = [];
  @HiveField(14)
  String? _backdrop_path;
  @HiveField(15)
  bool? _adult;
  @HiveField(16)
  String? _overview;
  @HiveField(17)
  String? _release_date;

  @override
  String toString() {
    return 'Movie: { title: $_title, poster_path: $_poster_path }'; // Update this with the desired representation
  }

  Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'].toString();
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];

    if (result['genre_ids'] != null) {
      for (int i = 0; i < result['genre_ids'].length; i++) {
        _genre_ids.add(result['genre_ids'][i]);
      }
    }

    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'vote_count': _vote_count,
      'id': _id,
      'video': _video,
      'vote_average': _vote_average,
      'title': _title,
      'popularity': _popularity,
      'poster_path': _poster_path,
      'original_language': _original_language,
      'original_title': _original_title,
      'genre_ids': _genre_ids,
      'backdrop_path': _backdrop_path,
      'adult': _adult,
      'overview': _overview,
      'release_date': _release_date,
    };
  }

  String get release_date => _release_date!;

  String get overview => _overview!;

  bool get adult => _adult!;

  String get backdrop_path => _backdrop_path!;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title!;

  String get original_language => _original_language!;

  String get poster_path => _poster_path!;

  double get popularity => _popularity!;

  String get title => _title!;

  String get vote_average => _vote_average!;

  bool get video => _video!;

  int get id => _id!;

  int get vote_count => _vote_count!;
}

