//import 'url_key_secret.dart';

class Url {
  //API key
  static const String apiKey = "b7d815ddcb2d35d01adeef4dbb0679d9";

  //Base URLs
  static String movieDbBaseUrl = 'api.themoviedb.org/3/';

  //Authentication URLs
  static const String sessionIdUrl =
      '/authentication/guest_session/new?api_key=$apiKey';
  static String? sessionId;

  //Logo & Background Images Path&Urls
  static const String appLogoUrl =
      "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png";
  static const String appLogoPath = "assets/icons/app_logo.png";
  static const String backgroundUrl = "";

  //Movies URLs
  static const String latestMovie = '/3/movie/latest?api_key=$apiKey';
  static const String nowPlayingMovies = '3/movie/now_playing';
  static const String popularMovies = '3/movie/popular';
  static const String topRatedMovies = '3/movie/top_rated';
  static const String upcomingMovies = '3/movie/upcoming';

  static String rateMovie(int movieId) =>
      '/movie/$movieId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //TVs URLs
  static const String latestTv = '/tv/latest?api_key=$apiKey';
  static const String airingTodayTv = '/tv/airing_today?api_key=$apiKey';
  static const String onTheAirTv = '3/tv/on_the_air';
  static const String popularTv = '3/tv/popular';
  static const String topRatedTv = '/tv/top_rated?api_key=$apiKey';

  static String rateTV(int tvId) =>
      '/tv/$tvId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //About Me&App
  static const String authorProfile = 'https://www.linkedin.com/in/hazarbelge/';
  static const String emailUrl =
      'mailto:hazarbelge@gmail.com?subject=About Flutter The Movie DB with GetX!';
  static const String appSource =
      'https://github.com/hazarbelge/Flutter-Bloc-TheMovieDB';
}
