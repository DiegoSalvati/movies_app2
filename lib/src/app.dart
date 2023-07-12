import 'package:flutter/material.dart';
import 'ui/movie_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}


bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromRGBO(7, 177, 188, 1),
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme  : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Tv Shows'),
          actions: [
            IconButton(onPressed: () {
              setState(() {
                _iconBool = !_iconBool;
              });
            }, icon: Icon(_iconBool ? _iconDark : _iconLight))
          ],
        ),
        body: const MovieList(),
      )
    );
  }
}

