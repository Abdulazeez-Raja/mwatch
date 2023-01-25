import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        posterPath,
        voteAverage,
        voteCount,
        releaseDate,
      ];

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'].toString(),
      posterPath: json['poster_path'],
      voteAverage: double.parse(json['vote_average'].toString()),
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
    );
  }
}
