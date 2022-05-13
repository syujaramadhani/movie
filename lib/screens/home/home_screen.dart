import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/controller.dart/movie_controller.dart';
import 'package:get/get.dart';
import 'package:movie/features/controller.dart/movie_controller.dart';
import 'package:movie/features/controller.dart/televisions_controller.dart';
import 'package:movie/models/tv_series.dart';
import 'package:movie/screens/home/detail_movie_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<void> refreshPage() async {}

  final MovieListController movieListController =
      Get.put(MovieListController());

  final TelevisionListController televisionListController =
      Get.put(TelevisionListController());

  late ResultTelevision dataTelevision;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Movie',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, right: 10.0, left: 10.0),
                      child: const Text(
                        "Now Playing",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GetBuilder<MovieListController>(
                        initState: (_) => Get.find<MovieListController>()
                            .fetchGetNowPlaying(),
                        builder: (val) => movieListController.isLoading1.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                      movieListController
                                          .movieModel.results.length, (index) {
                                    var dataMovie = movieListController
                                        .movieModel.results[index];
                                    var dataTv = televisionListController
                                        .televisionModel.results[index];
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen("1", dataMovie,
                                                        dataTv)),
                                          );
                                        },
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataMovie.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  dataMovie.overview,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                leading: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w185${dataMovie.posterPath}',
                                                  placeholder:
                                                      (BuildContext context,
                                                              String url) =>
                                                          Container(
                                                    width: 50,
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 30, right: 10.0, left: 10.0),
                      child: const Text(
                        "Up Coming",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GetBuilder<MovieListController>(
                        initState: (_) =>
                            Get.find<MovieListController>().fetchGetUpComing(),
                        builder: (val) => movieListController.isLoading2.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                      movieListController
                                          .movieModel.results.length, (index) {
                                    var dataMovie = movieListController
                                        .movieModel.results[index];
                                    var dataTv = televisionListController
                                        .televisionModel.results[index];
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen("1", dataMovie,
                                                        dataTv)),
                                          );
                                        },
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataMovie.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  dataMovie.overview,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                leading: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w185${dataMovie.posterPath}',
                                                  placeholder:
                                                      (BuildContext context,
                                                              String url) =>
                                                          Container(
                                                    width: 50,
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, right: 10.0, left: 10.0),
                      child: const Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GetBuilder<MovieListController>(
                        initState: (_) =>
                            Get.find<MovieListController>().fetchGetUpComing(),
                        builder: (val) => movieListController.isLoading2.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                      movieListController
                                          .movieModel.results.length, (index) {
                                    var dataMovie = movieListController
                                        .movieModel.results[index];
                                    var dataTv = televisionListController
                                        .televisionModel.results[index];

                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen("1", dataMovie,
                                                        dataTv)),
                                          );
                                        },
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataMovie.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  dataMovie.overview,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                leading: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w185${dataMovie.posterPath}',
                                                  placeholder:
                                                      (BuildContext context,
                                                              String url) =>
                                                          Container(
                                                    width: 50,
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // final MovieListController movieListController =
  //     Get.put(MovieListController());

}

// class HomeScreen extends GetView<NowPlayingMoviesController> {
//   const HomeScreen({Key? key}) : super(key: key);

//   Future<void> refreshPage() async {}

//   // final NowPlayingMoviesController communityListController =
//   //     Get.put(NowPlayingMoviesController());

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     return RefreshIndicator(
//       onRefresh: refreshPage,
//       child: SizedBox(
//         height: height,
//         width: double.infinity,
//         child: Center(
//           child: SingleChildScrollView(
//             physics: const AlwaysScrollableScrollPhysics(),
//             controller: controller.scrollController,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 controller.obx(
//                   (MovieWrapper? movieWrapper) {
//                     if (movieWrapper != null) {
//                       return ProductList(
//                         productList: movieWrapper.results,
//                         isMovie: true,
//                       );
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
