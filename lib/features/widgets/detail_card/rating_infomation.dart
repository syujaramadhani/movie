import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/tv_series.dart';

class RatingInformation extends StatelessWidget {
  RatingInformation(this.filmType, this.dataMovie, this.dataTelevision);
  late ResultMovie dataMovie;
  late ResultTelevision dataTelevision;
  final String filmType;

  Widget _buildRatingBarMovie(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color =
          i <= dataMovie.voteAverage ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  Widget _buildRatingBarTv(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color =
          i <= dataTelevision.voteAverage ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption!.copyWith(color: Colors.black45);

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          filmType == "1"
              ? dataMovie.voteAverage.toString()
              : dataTelevision.voteAverage.toString(),
          style: textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        filmType == "1"
            ? _buildRatingBarMovie(theme)
            : _buildRatingBarTv(theme),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Grade now',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numericRating,
        const SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}
