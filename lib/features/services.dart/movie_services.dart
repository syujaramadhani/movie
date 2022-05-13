import 'package:movie/models/movie.dart';
import 'package:movie/network/api_provider.dart';
import 'package:movie/network/url.dart';

class MovieServices {
  static final ApiProvider _provider = ApiProvider();
  static Future<MovieModel> fetchNowPlaying() async {
    Map<String, String> queryParams = {
      "api_key": Url.apiKey,
    };
    final response =
        await _provider.get(Url.nowPlayingMovies, params: queryParams);
    print(response);
    return MovieModel.fromJson(response);
  }

  static Future<MovieModel> fetchUpComing() async {
    Map<String, String> queryParams = {
      "api_key": Url.apiKey,
    };
    final response =
        await _provider.get(Url.upcomingMovies, params: queryParams);
    print(response);
    return MovieModel.fromJson(response);
  }

  static Future<MovieModel> fetchPopular() async {
    Map<String, String> queryParams = {
      "api_key": Url.apiKey,
    };
    final response =
        await _provider.get(Url.popularMovies, params: queryParams);
    print(response);
    return MovieModel.fromJson(response);
  }
}
