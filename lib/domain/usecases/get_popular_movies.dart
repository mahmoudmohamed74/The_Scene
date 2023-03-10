import 'package:dartz/dartz.dart';
import 'package:the_scene/app/error/failure.dart';
import 'package:the_scene/app/usecase/base_usecase.dart';
import 'package:the_scene/domain/entities/movie.dart';
import 'package:the_scene/domain/repository/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
