import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies.bloc.dart';
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
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait ? GridView.builder(
        itemCount: snapshot.data!.results.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              //        leading: new Image.memory(bytes),
              child: Image.network(
                'https://image.tmdb.org/t/p/w300/${snapshot.data!
                    .results[index].poster_path}',
                fit: BoxFit.none,
              ),
              onTap: () => openDetailPage(snapshot.data!, index),
            ),
          );
        }) : GridView.builder(
        itemCount: snapshot.data!.results.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185/${snapshot.data!
                    .results[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data!, index),
            ),
          );
        });
  }

  openDetailPage(ItemModel data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data.results[index].title,
        posterUrl: data.results[index].backdrop_path,
        description: data.results[index].overview,
        releaseDate: data.results[index].release_date,
        voteAverage: data.results[index].vote_average.toString(),
        movieId: data.results[index].id,
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


