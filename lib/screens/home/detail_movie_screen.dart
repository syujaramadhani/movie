import 'package:flutter/material.dart';
import 'package:movie/features/widgets/detail_card/detail_header.dart';
import 'package:movie/features/widgets/detail_card/story_lines.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/tv_series.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.filmType, this.dataMovie, this.dataTelevision);
  late ResultMovie dataMovie;
  late ResultTelevision dataTelevision;
  final String filmType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailHeader(filmType, dataMovie, dataTelevision),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(dataMovie.overview),
            ),
          ],
        ),
      ),
    );
  }
}
