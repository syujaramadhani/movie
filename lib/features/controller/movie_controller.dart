import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:movie/features/services.dart/movie_services.dart';
import 'package:movie/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie/network/url.dart';

class MovieListController extends GetxController {
  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;

  late MovieModel movieModel;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    fetchGetNowPlaying();
    fetchGetUpComing();
    fetchGetPopular();
  }

  void fetchGetNowPlaying() async {
    isLoading1(true);
    try {
      var data = await MovieServices.fetchNowPlaying();
      print(data);
      movieModel = data;
      update();
      isLoading1(false);
    } finally {}
    update();
  }

  void fetchGetUpComing() async {
    isLoading2(true);
    try {
      var data = await MovieServices.fetchUpComing();
      print(data);
      movieModel = data;
      update();
      isLoading2(false);
    } finally {}
    update();
  }

  void fetchGetPopular() async {
    isLoading3(true);
    try {
      var data = await MovieServices.fetchPopular();
      print(data);
      movieModel = data;
      update();
      isLoading3(false);
    } finally {}
    update();
  }
}
