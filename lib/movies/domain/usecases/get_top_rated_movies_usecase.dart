import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
