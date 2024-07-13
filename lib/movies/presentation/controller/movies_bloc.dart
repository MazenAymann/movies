import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesState(nowPlayingMoviesState: RequestState.success));

      result.fold((l) {
        emit(MoviesState(
            nowPlayingMoviesMsg: l.message,
            nowPlayingMoviesState: RequestState.error));
      }, (r) {
        emit(MoviesState(
          nowPlayingMovies: r,
          nowPlayingMoviesState: RequestState.success,
        ));
      });
    });
  }
}
