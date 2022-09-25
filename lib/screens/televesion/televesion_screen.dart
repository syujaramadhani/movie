import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/features/controller/movie_controller.dart';
import 'package:movie/features/controller/televisions_controller.dart';
import 'package:movie/screens/home/detail_movie_screen.dart';

class TelevisionScreen extends StatelessWidget {
  TelevisionScreen({Key? key}) : super(key: key);

  Future<void> refreshPage() async {}

  final TelevisionListController televisionListController =
      Get.put(TelevisionListController());

  final MovieListController movieListController =
      Get.put(MovieListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Televisions',
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
                        "TV On The Air",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GetBuilder<TelevisionListController>(
                        initState: (_) => Get.find<TelevisionListController>()
                            .fetchOnTheAirTv(),
                        builder: (val) => televisionListController
                                .isLoading1.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                      televisionListController.televisionModel
                                          .results.length, (index) {
                                    var dataTv = televisionListController
                                        .televisionModel.results[index];

                                    var dataMovie = movieListController
                                        .movieModel.results[index];
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen("2", dataMovie,
                                                        dataTv)),
                                          );
                                        },
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataTv.originalName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  dataTv.overview,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                leading: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w185${dataTv.posterPath}',
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
                        "Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GetBuilder<TelevisionListController>(
                        initState: (_) => Get.find<TelevisionListController>()
                            .fetchPopularTv(),
                        builder: (val) => televisionListController
                                .isLoading2.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ...List.generate(
                                      televisionListController.televisionModel
                                          .results.length, (index) {
                                    var dataTv = televisionListController
                                        .televisionModel.results[index];

                                    var dataMovie = movieListController
                                        .movieModel.results[index];
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen("2", dataMovie,
                                                        dataTv)),
                                          );
                                        },
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataTv.originalName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  dataTv.overview,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                leading: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w185${dataTv.posterPath}',
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
}
