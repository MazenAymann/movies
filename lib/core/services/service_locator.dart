import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(
        baseMovieRemoteDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(sl()),
    );
  }
}
