// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:the_scene/app/error/failure.dart';
import 'package:the_scene/app/usecase/base_usecase.dart';
import 'package:the_scene/domain/entities/movie_details.dart';
import 'package:the_scene/domain/repository/base_movie_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
