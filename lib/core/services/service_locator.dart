import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

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
    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(sl()),
    );
  }
}
