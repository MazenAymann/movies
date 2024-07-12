class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'api_key=55c70a0a7163ab560a64a7325ee899c6';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?$apiKey';

  static const String popularMoviesPath = '$baseUrl/movie/popular?$apiKey';

  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?$apiKey';
}
