import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:movie/features/services.dart/movie_services.dart';
import 'package:movie/features/services.dart/television_services.dart';
import 'package:movie/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/tv_series.dart';
import 'package:movie/network/url.dart';

class TelevisionListController extends GetxController {
  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;

  late TelevisionModel televisionModel;

  void fetchOnTheAirTv() async {
    isLoading1(true);
    try {
      var data = await TelevisionsServices.fetchOnTheAir();
      televisionModel = data;
      update();
      isLoading1(false);
    } finally {}
    update();
  }

  void fetchPopularTv() async {
    isLoading2(true);
    try {
      var data = await TelevisionsServices.fetchPopular();
      televisionModel = data;
      update();
      isLoading2(false);
    } finally {}
    update();
  }
}
