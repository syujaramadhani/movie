import 'package:movie/models/tv_series.dart';
import 'package:movie/network/api_provider.dart';
import 'package:movie/network/url.dart';

class TelevisionsServices {
  static final ApiProvider _provider = ApiProvider();
  static Future<TelevisionModel> fetchOnTheAir() async {
    Map<String, String> queryParams = {
      "api_key": Url.apiKey,
    };
    final response = await _provider.get(Url.onTheAirTv, params: queryParams);
    print(response);
    return TelevisionModel.fromJson(response);
  }

  static Future<TelevisionModel> fetchPopular() async {
    Map<String, String> queryParams = {
      "api_key": Url.apiKey,
    };
    final response = await _provider.get(Url.popularTv, params: queryParams);
    print(response);
    return TelevisionModel.fromJson(response);
  }

  // static Future<MovieModel> fetchUpComing() async {
  //   Map<String, String> queryParams = {
  //     "api_key": Url.apiKey,
  //   };
  //   final response =
  //       await _provider.get(Url.upcomingMovies, params: queryParams);
  //   print(response);
  //   return MovieModel.fromJson(response);
  // }

  // static Future<MovieModel> fetchPopular() async {
  //   Map<String, String> queryParams = {
  //     "api_key": Url.apiKey,
  //   };
  //   final response =
  //       await _provider.get(Url.popularMovies, params: queryParams);
  //   print(response);
  //   return MovieModel.fromJson(response);
  // }
}
