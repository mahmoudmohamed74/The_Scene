// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:the_scene/app/enums.dart';
import 'package:the_scene/domain/entities/movie_details.dart';
import 'package:the_scene/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  // movie details
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessageError;
  // recommendation
  final List<Recommendation> recommendationList;
  final RequestState recommendationState;
  final String recommendationMessageError;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessageError = "error in state",
    this.recommendationList = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessageError = "error in state",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessageError,
    List<Recommendation>? recommendationList,
    RequestState? recommendationState,
    String? recommendationMessageError,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessageError:
          movieDetailsMessageError ?? this.movieDetailsMessageError,

      // recommendation
      recommendationList: recommendationList ?? this.recommendationList,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessageError:
          recommendationMessageError ?? this.recommendationMessageError,
    );
  }

  @override
  List<Object?> get props {
    return [
      movieDetails,
      movieDetailsState,
      movieDetailsMessageError,
      recommendationList,
      recommendationState,
      recommendationMessageError,
    ];
  }
}
