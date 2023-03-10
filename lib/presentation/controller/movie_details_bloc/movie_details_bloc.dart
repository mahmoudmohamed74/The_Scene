import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_scene/app/enums.dart';
import 'package:the_scene/domain/usecases/get_movie_details.dart';
import 'package:the_scene/domain/usecases/get_recommendation.dart';
import 'package:the_scene/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:the_scene/presentation/controller/movie_details_bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final results = await getMovieDetailsUseCase(
      MovieDetailsParameters(
        movieId: event.movieId,
      ),
    );
    results.fold((l) {
      emit(
        // to avoid infinity loading in one of the use cases
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessageError: l.message,
        ),
        // MoviesState(
        //   nowPlayingState: RequestState.error,
        //   nowPlayingMessage: l.message,
        // ),
      );
    }, (r) {
      emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
        // MoviesState(
        //   nowPlayingMovies: r,
        //   nowPlayingState: RequestState.loaded,
        // ),
      );
    });
  }

  FutureOr<void> _getRecommendation(
    GetMovieRecommendationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final results = await getRecommendationUseCase(
        RecommendationParameters(movieId: event.movieId));
    results.fold((l) {
      emit(
        // to avoid infinity loading in one of the use cases
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessageError: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          recommendationList: r,
          recommendationState: RequestState.loaded,
        ),
      );
    });
  }
}
