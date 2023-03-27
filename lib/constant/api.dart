class MyApi {
  static const apiKey = '';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String nowPlaying = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static String imageUrl(String path) => 'https://image.tmdb.org/t/p/w500$path';
  static String movieId(String id) => '$baseUrl/movie/$id?api_key=$apiKey';
}
