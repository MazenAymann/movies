import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
            nowPlayingMoviesMsg: l.message,
            nowPlayingMoviesState: RequestState.error));
      }, (r) {
        emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingMoviesState: RequestState.success,
        ));
      });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
            popularMoviesMsg: l.message,
            popularMoviesState: RequestState.error));
      }, (r) {
        emit(state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.success,
        ));
      });
    });
  }
}
