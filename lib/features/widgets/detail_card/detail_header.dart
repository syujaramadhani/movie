import 'package:flutter/material.dart';
import 'package:movie/features/widgets/detail_card/arc_banner_image.dart';
import 'package:movie/features/widgets/detail_card/poster.dart';
import 'package:movie/features/widgets/detail_card/rating_infomation.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/tv_series.dart';

class DetailHeader extends StatelessWidget {
  DetailHeader(this.filmType, this.dataMovie, this.dataTelevision);
  late ResultMovie dataMovie;
  late ResultTelevision dataTelevision;
  final String filmType;

  // List<Widget> _buildCategoryChips(TextTheme textTheme) {
  //   return movie.categories!.map((category) {
  //     return Padding(
  //       padding: const EdgeInsets.only(right: 8.0),
  //       child: Chip(
  //         label: Text(category),
  //         labelStyle: textTheme.caption,
  //         backgroundColor: Colors.black12,
  //       ),
  //     );
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filmType == "1" ? dataMovie.title : dataTelevision.originalName,
          style: textTheme.headline6,
        ),
        const SizedBox(height: 8.0),
        RatingInformation(filmType, dataMovie, dataTelevision),
        const SizedBox(height: 12.0),
        // Row(children: _buildCategoryChips(textTheme)),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(filmType == "1"
              ? dataMovie.backdropPath
              : dataTelevision.backdropPath),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                filmType == "1"
                    ? dataMovie.posterPath
                    : dataTelevision.posterPath,
                height: 180.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
