import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final List movies = [
  "Titanic",
  "Blade Runner",
  "Rambo",
  "The Avengers",
  "Avater",
  "AAA",
  "BBB",
];

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade400,
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                child: ListTile(title: Text(movies[index])),
              );
            }));
  }
}
