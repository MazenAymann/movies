import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesMsg;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesMsg = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMoviesMsg,
      ];
}
