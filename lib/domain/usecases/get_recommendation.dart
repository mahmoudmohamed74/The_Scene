// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:the_scene/app/error/failure.dart';
import 'package:the_scene/app/usecase/base_usecase.dart';
import 'package:the_scene/domain/entities/recommendation.dart';
import 'package:the_scene/domain/repository/base_movie_repo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameters parameters,
  ) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
