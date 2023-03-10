import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_scene/app/enums.dart';
import 'package:the_scene/app/usecase/base_usecase.dart';
import 'package:the_scene/domain/usecases/get_now_playing_movies.dart';
import 'package:the_scene/domain/usecases/get_popular_movies.dart';
import 'package:the_scene/domain/usecases/get_top_rated_movies.dart';
import 'package:the_scene/presentation/controller/movie_bloc/movies_events.dart';
import 'package:the_scene/presentation/controller/movie_bloc/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    // services locator injector
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final results = await getNowPlayingMoviesUseCase(const NoParameters());
    results.fold((l) {
      emit(
        // to avoid infinity loading in one of the use cases
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
        // MoviesState(
        //   nowPlayingState: RequestState.error,
        //   nowPlayingMessage: l.message,
        // ),
      );
    }, (r) {
      emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
        // MoviesState(
        //   nowPlayingMovies: r,
        //   nowPlayingState: RequestState.loaded,
        // ),
      );
    });
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final results = await getPopularMoviesUseCase(const NoParameters());
    results.fold((l) {
      emit(
        state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.loaded,
        ),
      );
    });
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final results = await getTopRatedMoviesUseCase(const NoParameters());
    results.fold((l) {
      emit(
        state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMoviesMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestState.loaded,
        ),
      );
    });
  }
}
