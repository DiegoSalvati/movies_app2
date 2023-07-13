import 'dart:io';

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies.bloc.dart';
import '../models/poster.dart';
import 'movie_detail.dart';
import '../blocs/movie_detail_bloc_provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<StatefulWidget> createState() =>
     MovieListState();
}



class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Movie>> snapshot) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait ? GridView.builder(
        itemCount: snapshot.data!.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              //        leading: new Image.memory(bytes),
              child: snapshot.data![index].poster!.path.length > 2 ? Image.network(
                'https://image.tmdb.org/t/p/w300/${snapshot.data![index].poster!.path}',
                fit: BoxFit.none,
              ): Image.file(
                File('/storage/emulated/0/Download/test.jpg'),
              ),
              onTap: () => openDetailPage(snapshot.data!, index),
            ),
          );
        }) : GridView.builder(
        itemCount: snapshot.data!.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: snapshot.data![index].poster!.path.length > 2 ? Image.network(
                'https://image.tmdb.org/t/p/w300/${snapshot.data![index].poster!.path}',
                fit: BoxFit.none,
              ): Image.file(
                File('/storage/emulated/0/Download/test.jpg'),
              ),
              onTap: () => openDetailPage(snapshot.data!, index),
            ),
          );
        });
  }

  openDetailPage(List<Movie> data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data[index].title,
        posterUrl: data[index].backdrop_path,
        description: data[index].overview,
        releaseDate: data[index].release_date,
        voteAverage: data[index].vote_average.toString(),
        movieId: int.parse(data[index].id),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }
}


