import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final List<int> genreIds;
  final double voteAverage;
  final int releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, backdropPath: $backdropPath, genreIds: $genreIds, voteAverage: $voteAverage releaseDate: $releaseDate)';
  }

  @override
  List<Object> get props => [
        id,
        title,
        overview,
        backdropPath,
        genreIds,
        voteAverage,
        releaseDate,
      ];
}
