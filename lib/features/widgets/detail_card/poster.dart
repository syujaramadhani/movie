import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  // ignore: constant_identifier_names
  static const POSTER_RATIO = 0.7;

  Poster(
    this.posterUrl, {
    this.height = 100.0,
  });

  final String? posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Material(
      borderRadius: BorderRadius.circular(4.0),
      elevation: 2.0,
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/w185${posterUrl}",
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
      // child: Image.asset(
      //   posterUrl!,
      //   fit: BoxFit.cover,
      //   width: width,
      //   height: height,
      // ),
    );
  }
}
